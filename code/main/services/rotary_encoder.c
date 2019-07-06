#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"

#define CW    0
#define CCW   1
#define ESP_INTR_FLAG_DEFAULT 0

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
struct rotary_encoder rcB;

static void IRAM_ATTR gpio_isr_handler(void* arg)
{
    uint32_t gpio_num = (uint32_t) arg;
    xQueueSendFromISR(gpio_evt_queue, &gpio_num, NULL);
}


static void rotary_encoder_task(void* arg)
{
    uint32_t io_num;
    struct timeval tv;

    for(;;) {
        if(xQueueReceive(gpio_evt_queue, &io_num, portMAX_DELAY)) {
            // printf("GPIO[%d] intr, val: %d\n", io_num, gpio_get_level(io_num));
            cJSON *level_json = NULL;

            // Event from Encoder A
            if (io_num == rcA.SW_IO) {
              rcA.pressed = gpio_get_level(rcA.SW_IO);
              if (rcA.pressed) continue;
              gettimeofday(&tv, NULL);
              if (tv.tv_sec - rcA.debounce > 0) {
                LED_payload = cJSON_CreateObject();
                level_json = cJSON_CreateBool(true);
                cJSON_AddItemToObject(LED_payload, "toggle", level_json);
                printf("Rotary A: Toggle\n");
              }
              rcA.debounce = tv.tv_sec;
            }
            if (io_num == rcA.DT_IO) {
              rcA.clk_value = gpio_get_level(rcA.CLK_IO);
              rcA.dt_value = gpio_get_level(rcA.DT_IO);

              if (!rcA.dt_value && rcA.prev_dt_value) {
                if (rcA.clk_value) {
                  LED_payload = cJSON_CreateObject();
                  level_json = cJSON_CreateNumber(12);
                  cJSON_AddItemToObject(LED_payload, "incBrightness", level_json);
                  printf("Rotary A: CW\n");
                } else {
                  LED_payload = cJSON_CreateObject();
                  level_json = cJSON_CreateNumber(12);
                  cJSON_AddItemToObject(LED_payload, "decBrightness", level_json);
                  printf("Rotary A: CCW\n");
                }
              }
              rcA.prev_dt_value = rcA.dt_value;
            }

            // Event from Encoder B
            if (io_num == rcB.SW_IO) {
              rcB.pressed = gpio_get_level(rcB.SW_IO);
              if (rcB.pressed) continue;
              gettimeofday(&tv, NULL);
              if (tv.tv_sec - rcB.debounce > 0) {
                LED_payload = cJSON_CreateObject();
                level_json = cJSON_CreateBool(true);
                cJSON_AddItemToObject(LED_payload, "nextMode", level_json);
                printf("Rotary B: Toggle\n");
              }
              rcB.debounce = tv.tv_sec;
            }
            if (io_num == rcB.DT_IO) {
              rcB.clk_value = gpio_get_level(rcB.CLK_IO);
              rcB.dt_value = gpio_get_level(rcB.DT_IO);

              if (!rcB.dt_value && rcB.prev_dt_value) {
                if (rcB.clk_value) {
                  LED_payload = cJSON_CreateObject();
                  if (PIXEL_COUNT < 1000) {
                    PIXEL_COUNT+=8;
                  }
                  level_json = cJSON_CreateNumber(PIXEL_COUNT);
                  cJSON_AddItemToObject(LED_payload, "setPixelCount", level_json);
                  // cJSON_AddItemToObject(LED_payload, "nextMode", level_json);
                  printf("Rotary B: CW (%d)\n", PIXEL_COUNT);
                } else {
                  LED_payload = cJSON_CreateObject();
                  if (PIXEL_COUNT > 8) {
                    PIXEL_COUNT-=8;
                  } else {
                    PIXEL_COUNT = 0;
                  }
                  level_json = cJSON_CreateNumber(PIXEL_COUNT);
                  cJSON_AddItemToObject(LED_payload, "setPixelCount", level_json);
                  printf("Rotary B: CCW (%d)\n", PIXEL_COUNT);
                }
              }
              rcB.prev_dt_value = rcB.dt_value;
            }
        }
    }
}

void rotary_encoder_main()
{

    rcA.SW_IO = 15;
    rcA.CLK_IO = 4;
    rcA.DT_IO = 5;

    rcB.SW_IO = 21;
    rcB.CLK_IO = 22;
    rcB.DT_IO = 23;

    // #define GPIO_INPUT_PIN_SEL  ((1ULL<<SW_A_IO) | (1ULL<<CLK_A_IO) | (1ULL<<DT_A_IO) | (1ULL<<SW_B_IO) | (1ULL<<CLK_B_IO) | (1ULL<<DT_B_IO))
    unsigned long long GPIO_INPUT_PIN_SEL =
      (1ULL<<rcA.SW_IO)
      | (1ULL<<rcA.CLK_IO)
      | (1ULL<<rcA.DT_IO)
      | (1ULL<<rcB.SW_IO)
      | (1ULL<<rcB.CLK_IO)
      | (1ULL<<rcB.DT_IO);

    gpio_config_t io_conf;
    io_conf.intr_type = GPIO_PIN_INTR_ANYEDGE;
    io_conf.pin_bit_mask = GPIO_INPUT_PIN_SEL;
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pull_up_en = 1;
    gpio_config(&io_conf);

    gpio_evt_queue = xQueueCreate(10, sizeof(uint32_t));
    xTaskCreate(rotary_encoder_task, "rotary_encoder_task", 2048, NULL, 10, NULL);

    gpio_install_isr_service(ESP_INTR_FLAG_DEFAULT);

    gpio_isr_handler_add(rcA.SW_IO, gpio_isr_handler, (void*) rcA.SW_IO);
    gpio_isr_handler_add(rcA.CLK_IO, gpio_isr_handler, (void*) rcA.CLK_IO);
    gpio_isr_handler_add(rcA.DT_IO, gpio_isr_handler, (void*) rcA.DT_IO);

    gpio_isr_handler_add(rcB.SW_IO, gpio_isr_handler, (void*) rcB.SW_IO);
    gpio_isr_handler_add(rcB.CLK_IO, gpio_isr_handler, (void*) rcB.CLK_IO);
    gpio_isr_handler_add(rcB.DT_IO, gpio_isr_handler, (void*) rcB.DT_IO);
}
