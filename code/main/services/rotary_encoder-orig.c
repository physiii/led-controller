#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"

#define NR    0 // not rotating
#define CW    1 // clock-wise rotation
#define CCW   2 // counter-clock-wise rotation
#define ESP_INTR_FLAG_DEFAULT 0

int debounce_count = 0;
int hold_thresh = 10;
int hold_cnt = 0;
int rotary_state = 0;
int prev_rotary_state = 0;
bool start_hold_cnt = false;
bool select_mode_enabled = false;

static xQueueHandle gpio_evt_queue = NULL;

struct rotary_encoder {
  int SW;
  int CLK;
  int DT;
  int SW_IO;
  int CLK_IO;
  int DT_IO;
  int rotated;
  int pressed;
  int dt_value;
  int clk_value;
  int prev_dt_value;
  long int debounce;
};

struct rotary_encoder rcA;

static void IRAM_ATTR gpio_isr_handler(void* arg)
{
    uint32_t gpio_num = (uint32_t) arg;
    // xQueueSendFromISR(gpio_evt_queue, &gpio_num, NULL);
    // Rotation event
    if (gpio_num == rcA.DT_IO) {
      rcA.clk_value = gpio_get_level(rcA.CLK_IO);
      rcA.dt_value = gpio_get_level(rcA.DT_IO);
      if (!rcA.dt_value && rcA.prev_dt_value) {
        if (rcA.clk_value) {
          rotary_state = CCW;
        } else {
          rotary_state = CW;
        }
      }
      rcA.prev_dt_value = rcA.dt_value;
    }
}

void reset_hold_count() {
  hold_cnt = 0;
}

void toggle_hold_count() {
  if (start_hold_cnt) {
    printf("double click delay: %d\n", hold_cnt);
  } else {
    hold_cnt = 0;
  }

  start_hold_cnt = !start_hold_cnt;
}

void start_hold_count()
{
  start_hold_cnt = true;
}

void stop_hold_count()
{
  start_hold_cnt = false;
}

int get_click_delay()
{
  int ret = hold_cnt;
  hold_cnt = 0;
  return ret;
}

void enter_scene_select_mode(bool mode)
{
  select_mode_enabled = mode;
  printf("Scene select mode. %d\n", select_mode_enabled);
}

static void rotary_encoder_task(void *pvParameter) {
  while (1) {

    if (rotary_state == CCW) {
      // if (prev_rotary_state != rotary_state) printf("Rotating CCW.\n");
      printf("Rotating CCW.\n");
    }

    if (rotary_state == CW) {
      // if (prev_rotary_state != rotary_state) printf("Rotating CW.\n");
      // nextMode();
      printf("Rotating CW.\n");
    }
    // prev_rotary_state = rotary_state;
    // rcA.prev_dt_value = rcA.dt_value;

    rotary_state = NR;
    vTaskDelay(10 / portTICK_PERIOD_MS);
  }
}

static void rotary_encoder_task_old(void* arg)
{
    uint32_t io_num;
    int cnt = 0;
    for(;;) {
        if(xQueueReceive(gpio_evt_queue, &io_num, portMAX_DELAY)) {
            // printf("GPIO[%d] intr, val: %d\n", io_num, gpio_get_level(io_num));
            cJSON *level_json = NULL;

            // Switch event
            if (io_num == rcA.SW_IO) {
              rcA.pressed = !gpio_get_level(rcA.SW_IO);
              if (!rcA.pressed) continue;
              if (debounce_count - rcA.debounce > 0) {
                LED_payload = cJSON_CreateObject();
                level_json = cJSON_CreateBool(true);
                cJSON_AddItemToObject(LED_payload, "toggle", level_json);
                int delay = get_click_delay();
                printf("Toggle (%d)\n", delay);
                if (delay < 5) {
                  enter_scene_select_mode(true);
                } else {
                  enter_scene_select_mode(false);
                }
                debounce_count = 0;
              }
            }

            // Rotation event
            if (io_num == rcA.DT_IO) {
              rcA.clk_value = gpio_get_level(rcA.CLK_IO);
              rcA.dt_value = gpio_get_level(rcA.DT_IO);

              if (!rcA.dt_value && rcA.prev_dt_value) {
                if (rcA.clk_value) {
                  LED_payload = cJSON_CreateObject();
                  level_json = cJSON_CreateNumber(12);
                  if (select_mode_enabled) {
                    nextMode();
                  } else {
                    cJSON_AddItemToObject(LED_payload, "decBrightness", level_json);
                  }

                  printf("CCW\n");
                } else {
                  LED_payload = cJSON_CreateObject();
                  level_json = cJSON_CreateNumber(12);
                  if (select_mode_enabled) {
                    prevMode();
                  } else {
                    cJSON_AddItemToObject(LED_payload, "incBrightness", level_json);
                  }
                  printf("CW\n");
                }
              }
              rcA.prev_dt_value = rcA.dt_value;
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

static void hold_task(void *pvParameter) {
  while (1) {
    hold_cnt++;
    vTaskDelay(100 / portTICK_PERIOD_MS);
  }
}

void rotary_encoder_main()
{

    rcA.SW_IO = 16;
    rcA.CLK_IO = 4;
    rcA.DT_IO = 5;


    // #define GPIO_INPUT_PIN_SEL  ((1ULL<<SW_A_IO) | (1ULL<<CLK_A_IO) | (1ULL<<DT_A_IO) | (1ULL<<SW_B_IO) | (1ULL<<CLK_B_IO) | (1ULL<<DT_B_IO))
    unsigned long long GPIO_INPUT_PIN_SEL =
      (1ULL<<rcA.SW_IO)
      | (1ULL<<rcA.CLK_IO)
      | (1ULL<<rcA.DT_IO);

    gpio_config_t io_conf;
    io_conf.intr_type = GPIO_PIN_INTR_ANYEDGE;
    io_conf.pin_bit_mask = GPIO_INPUT_PIN_SEL;
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pull_up_en = 1;
    gpio_config(&io_conf);

    gpio_evt_queue = xQueueCreate(10, sizeof(uint32_t));
    xTaskCreate(rotary_encoder_task, "rotary_encoder_task", 2048, NULL, 10, NULL);
    xTaskCreate(debounce_task, "debounce_task", 2048, NULL, 10, NULL);
    xTaskCreate(hold_task, "hold_task", 2048, NULL, 10, NULL);

    gpio_install_isr_service(ESP_INTR_FLAG_DEFAULT);

    gpio_isr_handler_add(rcA.SW_IO, gpio_isr_handler, (void*) rcA.SW_IO);
    gpio_isr_handler_add(rcA.CLK_IO, gpio_isr_handler, (void*) rcA.CLK_IO);
    gpio_isr_handler_add(rcA.DT_IO, gpio_isr_handler, (void*) rcA.DT_IO);
}
