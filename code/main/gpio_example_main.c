#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"
#include "esp_system.h"
#include "esp_log.h"

#include "cJSON.h"
#include "services/storage.c"
#include "services/LED.c"
// #include "services/rotary_encoder.c"
#include "rotary_encoder.h"

#define TAG "app"

#define ROT_ENC_A_GPIO    4
#define ROT_ENC_B_GPIO    5
#define ROT_ENC_SW_GPIO   16
#define PIR_IO            27

#define ENABLE_HALF_STEPS false  // Set to true to enable tracking of rotary encoder at half step resolution
#define RESET_AT          0      // Set to a positive non-zero number to reset the position if this value is exceeded
#define FLIP_DIRECTION    false  // Set to true to reverse the clockwise/counterclockwise sense

int debounce_count = 0;
int hold_thresh = 2;
int hold_cnt = 0;

int motion_delay_thresh = 10;
int motion_delay = 0;
int motion_progam = 4;
bool start_motion_delay = false;
bool motion_enabled = true;

int motion_off_delay_thresh = 20;
int motion_off_delay = 0;
bool start_motion_off_delay = false;

bool start_hold_cnt = false;
bool select_mode_enabled = false;


static xQueueHandle gpio_evt_queue = NULL;

static void IRAM_ATTR gpio_isr_handler(void* arg)
{
    uint32_t gpio_num = (uint32_t) arg;
    xQueueSendFromISR(gpio_evt_queue, &gpio_num, NULL);
}


void start_hold_count(bool val)
{
  start_hold_cnt = val;
}

void enter_scene_select_mode(bool mode)
{
  select_mode_enabled = mode;
  if (mode) {
    setPower(false);
    vTaskDelay(100 / portTICK_PERIOD_MS);
    setPower(true);
  }
  printf("Scene select mode. %d\n", select_mode_enabled);
}

static void gpio_task(void* arg)
{
    uint32_t io_num;
    int cnt = 0;
    for(;;) {
        if(xQueueReceive(gpio_evt_queue, &io_num, portMAX_DELAY)) {
            // printf("GPIO[%d] intr, val: %d\n", io_num, gpio_get_level(io_num));
            int val = gpio_get_level(io_num);

            if (io_num == PIR_IO) {
              if (val) {
                printf("Motion Started %d\n", motion_delay);
                if (motion_delay > motion_delay_thresh) {
                  setPower(true);
                  start_motion_off_delay = false;
                }
              } else {
                printf("Motion Stopped\n");
                start_motion_off_delay = true;
                start_motion_delay = true;
              }
            }

            if (io_num == ROT_ENC_SW_GPIO) {
                if (val) {
                  if (!select_mode_enabled) {
                    if (getPower()) {
                      start_motion_off_delay = true;
                      start_motion_delay = false;
                      setPower(false);
                    } else {
                      start_motion_delay = true;
                      start_motion_off_delay = false;
                      setPower(true);
                    }
                  }
                  start_hold_count(false);
                } else {
                  if (select_mode_enabled) select_mode_enabled = false;
                  start_hold_count(true);
                }
              }
        }
    }
}

static void debounce_task(void *pvParameter) {
  while (1) {
    debounce_count++;
    vTaskDelay(10 / portTICK_PERIOD_MS);
  }
}

static void motion_delay_task(void *pvParameter) {
  while (1) {
    if (start_motion_delay) {
      motion_delay++;
    } else motion_delay=0;
    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }
}

static void motion_off_delay_task(void *pvParameter) {
  while (1) {
    if (start_motion_off_delay) {
      motion_off_delay++;
    } else motion_off_delay=0;

    if (motion_off_delay > motion_off_delay_thresh) {
      setPower(false);
      start_motion_off_delay = false;
    } else {
      start_motion_off_delay = true;
    }

    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }
}

static void hold_task(void *pvParameter) {
  while (1) {
    if (start_hold_cnt) {
      hold_cnt++;
    } else hold_cnt=0;

    if (hold_cnt > hold_thresh && !select_mode_enabled) {
      enter_scene_select_mode(true);
    }

    if (hold_cnt > motion_progam) {
      enter_scene_select_mode(false);
      if (motion_enabled) {
        setPower(false);
        vTaskDelay(100 / portTICK_PERIOD_MS);
        setPower(true);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
      } else {
        setPower(false);
        vTaskDelay(100 / portTICK_PERIOD_MS);
        setPower(true);
        vTaskDelay(100 / portTICK_PERIOD_MS);
        setPower(false);
        vTaskDelay(100 / portTICK_PERIOD_MS);
        setPower(true);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
      }
      motion_enabled = !motion_enabled;
    }

    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }
}

void rotary_encoder_main()
{

    // #define GPIO_INPUT_PIN_SEL  ((1ULL<<SW_A_IO) | (1ULL<<CLK_A_IO) | (1ULL<<DT_A_IO) | (1ULL<<SW_B_IO) | (1ULL<<CLK_B_IO) | (1ULL<<DT_B_IO))
    unsigned long long GPIO_INPUT_PIN = (1ULL<<ROT_ENC_SW_GPIO) | (1ULL<<PIR_IO);

    gpio_config_t io_conf;
    io_conf.intr_type = GPIO_PIN_INTR_ANYEDGE;
    io_conf.pin_bit_mask = GPIO_INPUT_PIN;
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pull_up_en = 1;
    gpio_config(&io_conf);

    gpio_evt_queue = xQueueCreate(10, sizeof(uint32_t));
    xTaskCreate(gpio_task, "gpio_task", 2048, NULL, 10, NULL);
    xTaskCreate(debounce_task, "debounce_task", 2048, NULL, 10, NULL);
    xTaskCreate(hold_task, "hold_task", 2048, NULL, 10, NULL);
    xTaskCreate(motion_delay_task, "motion_delay_task", 2048, NULL, 10, NULL);
    xTaskCreate(motion_off_delay_task, "motion_off_delay_task", 2048, NULL, 10, NULL);

    gpio_install_isr_service(0);

    gpio_isr_handler_add(ROT_ENC_SW_GPIO, gpio_isr_handler, (void*) ROT_ENC_SW_GPIO);
    gpio_isr_handler_add(PIR_IO, gpio_isr_handler, (void*) PIR_IO);
}

void app_main()
{
    rotary_encoder_main();

    // esp32-rotary-encoder requires that the GPIO ISR service is installed before calling rotary_encoder_register()

    LED_main();
    setPixelCount(300);

    // Initialise the rotary encoder device with the GPIOs for A and B signals
    rotary_encoder_info_t info = { 0 };
    ESP_ERROR_CHECK(rotary_encoder_init(&info, ROT_ENC_A_GPIO, ROT_ENC_B_GPIO));
    ESP_ERROR_CHECK(rotary_encoder_enable_half_steps(&info, ENABLE_HALF_STEPS));
#ifdef FLIP_DIRECTION
    ESP_ERROR_CHECK(rotary_encoder_flip_direction(&info));
#endif

    // Create a queue for events from the rotary encoder driver.
    // Tasks can read from this queue to receive up to date position information.
    QueueHandle_t event_queue = rotary_encoder_create_queue();
    ESP_ERROR_CHECK(rotary_encoder_set_queue(&info, event_queue));

    while (1)
    {
        // Wait for incoming events on the event queue.

        rotary_encoder_event_t event = { 0 };
        if (xQueueReceive(event_queue, &event, 1000 / portTICK_PERIOD_MS) == pdTRUE)
        {
            if (select_mode_enabled) {
              event.state.direction == ROTARY_ENCODER_DIRECTION_CLOCKWISE ? nextMode() : prevMode();
            } else {
              event.state.direction == ROTARY_ENCODER_DIRECTION_CLOCKWISE ? setBrightness(2 * getBrightness()+1) : setBrightness(0.4 * getBrightness());
            }

            ESP_LOGI(TAG, "Event: position %d, direction %s", event.state.position,
                     event.state.direction ? (event.state.direction == ROTARY_ENCODER_DIRECTION_CLOCKWISE ? "CW" : "CCW") : "NOT_SET");
        }
        else
        {
            // Poll current position and direction
            rotary_encoder_state_t state = { 0 };
            ESP_ERROR_CHECK(rotary_encoder_get_state(&info, &state));
            ESP_LOGI(TAG, "Poll: position %d, direction %s", state.position,
                     state.direction ? (state.direction == ROTARY_ENCODER_DIRECTION_CLOCKWISE ? "CW" : "CCW") : "NOT_SET");

            // Reset the device
            if (RESET_AT && (state.position >= RESET_AT || state.position <= -RESET_AT))
            {
                ESP_LOGI(TAG, "Reset");
                ESP_ERROR_CHECK(rotary_encoder_reset(&info));
            }
        }
    }
    ESP_LOGE(TAG, "queue receive failed");

    ESP_ERROR_CHECK(rotary_encoder_uninit(&info));
}
