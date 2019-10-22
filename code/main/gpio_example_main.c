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

int sw_debounce = 1;
int switch_debounce_count = 0;
int switch_debounce_tresh = 2;
int hold_thresh = 2;
int hold_cnt = 0;

int motion_delay_thresh = 10;
int motion_debounce_time = 0;
int motion_progam = 4;
bool motion_enabled = true;
bool debounce_motion = false;
bool switch_debounce_state = false;

int motion_off_delay = 0;
bool debounce_motion_off_active = false;

int exit_time = 20;
int exit_count = 0;
bool exit_timer_expired = true;

bool start_hold_cnt = false;
bool select_mode_enabled = false;

static xQueueHandle gpio_evt_queue = NULL;

static void IRAM_ATTR gpio_isr_handler(void* arg)
{
    uint32_t gpio_num = (uint32_t) arg;
    xQueueSendFromISR(gpio_evt_queue, &gpio_num, NULL);
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

void start_hold_count(bool val)
{
  start_hold_cnt = val;
}

static void hold_task(void *pvParameter)
{
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

void start_exit_timer(bool val)
{
  if (val) {
    exit_timer_expired = false;
    exit_count = 0;
  } else {
    exit_timer_expired = true;
  }
}

static void exit_timer(void *pvParameter)
{
  while (1) {
    if (exit_count > exit_time) {
      exit_timer_expired = true;
    } else exit_count++;
    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }
}

void debounce_switch()
{
  switch_debounce_count = 0;
}

static void switch_debounce_task(void *pvParameter)
{
  while (1) {
    if (switch_debounce_count > switch_debounce_tresh) {
      switch_debounce_state = false;
      switch_debounce_count = 0;
    } else {
      switch_debounce_state = true;
    }
    switch_debounce_count++;
    vTaskDelay(10 / portTICK_PERIOD_MS);
  }
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
                printf("Motion Started %d\n", motion_debounce_time);
                if (exit_timer_expired) setPower(true);
                start_led_off_timer(false);
              } else {
                start_led_off_timer(true);
                printf("Motion Stopped\n");
              }
            }

            if (io_num == ROT_ENC_SW_GPIO) {

                if (switch_debounce_state) {
                  // continue;
                } else debounce_switch();

                if (val) {
                  if (!select_mode_enabled) {
                    if (getPower()) {
                        start_exit_timer(true);
                        setPower(false);
                    } else {
                        setPower(true);
                        start_led_off_timer(true);
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

void app_main()
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
  xTaskCreate(switch_debounce_task, "switch_debounce_task", 2048, NULL, 10, NULL);
  xTaskCreate(hold_task, "hold_task", 2048, NULL, 10, NULL);
  xTaskCreate(led_off_timer, "led_off_timer", 2048, NULL, 10, NULL);
  xTaskCreate(exit_timer, "exit_timer", 2048, NULL, 10, NULL);

  gpio_install_isr_service(0);

  gpio_isr_handler_add(ROT_ENC_SW_GPIO, gpio_isr_handler, (void*) ROT_ENC_SW_GPIO);
  gpio_isr_handler_add(PIR_IO, gpio_isr_handler, (void*) PIR_IO);

    // esp32-rotary-encoder requires that the GPIO ISR service is installed before calling rotary_encoder_register()

    storage_init();
    LED_main();

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
              setPower(true);
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
            // ESP_LOGI(TAG, "Poll: position %d, direction %s", state.position,
            //          state.direction ? (state.direction == ROTARY_ENCODER_DIRECTION_CLOCKWISE ? "CW" : "CCW") : "NOT_SET");

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
