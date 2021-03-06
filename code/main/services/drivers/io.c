#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"


#define GPIO_OUTPUT_PIN_SEL (0)
#define GPIO_INPUT_IO_0     4
#define GPIO_INPUT_IO_1     4
#define GPIO_INPUT_PIN_SEL  ((1ULL<<GPIO_INPUT_IO_0) | (1ULL<<GPIO_INPUT_IO_1))
#define ESP_INTR_FLAG_DEFAULT 0

static xQueueHandle gpio_evt_queue = NULL;

static void IRAM_ATTR gpio_isr_handler(void* arg)
{
    uint32_t gpio_num = (uint32_t) arg;
    xQueueSendFromISR(gpio_evt_queue, &gpio_num, NULL);
}

static void gpio_task(void* arg)
{
    uint32_t io_num;
    int cnt = 0;
    for(;;) {
        if(xQueueReceive(gpio_evt_queue, &io_num, portMAX_DELAY)) {
            // printf("GPIO[%d] intr, val: %d\n", io_num, gpio_get_level(io_num));
            int val = gpio_get_level(io_num);

            // if (io_num == PIR_IO) {
            //   if (val) {
            //     printf("Motion Started %d\n", motion_debounce_time);
            //     if (exit_timer_expired) setPower(true);
            //     start_led_off_timer(false);
            //   } else {
            //     start_led_off_timer(true);
            //     printf("Motion Stopped\n");
            //   }
            // }
						//
            // if (io_num == ROT_ENC_SW_GPIO) {
						//
            //     if (switch_debounce_state) {
            //       // continue;
            //     } else debounce_switch();
						//
            //     if (val) {
            //       if (!select_mode_enabled) {
            //         if (getPower()) {
            //             start_exit_timer(true);
            //             setPower(false);
            //         } else {
            //             setPower(true);
            //             start_led_off_timer(true);
            //         }
            //       }
            //       start_hold_count(false);
            //     } else {
            //       if (select_mode_enabled) select_mode_enabled = false;
            //       start_hold_count(true);
            //     }
						//
            // }
        }
    }
}

static void
io_task(void *pvParameter)
{
    gpio_config_t io_conf;
    io_conf.intr_type = GPIO_PIN_INTR_DISABLE;
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pin_bit_mask = GPIO_OUTPUT_PIN_SEL;
    io_conf.pull_down_en = 0;
    io_conf.pull_up_en = 0;
    gpio_config(&io_conf);

    //interrupt of rising edge
    io_conf.intr_type = GPIO_PIN_INTR_POSEDGE;
    //bit mask of the pins, use GPIO4/5 here
    io_conf.pin_bit_mask = GPIO_INPUT_PIN_SEL;
    //set as input mode
    io_conf.mode = GPIO_MODE_INPUT;
    //enable pull-up mode
    io_conf.pull_up_en = 1;
    gpio_config(&io_conf);

    //change gpio intrrupt type for one pin
    // gpio_set_intr_type(GPIO_INPUT_IO_0, GPIO_INTR_ANYEDGE);

    //create a queue to handle gpio event from isr
    gpio_evt_queue = xQueueCreate(10, sizeof(uint32_t));
    //start gpio task
    xTaskCreate(gpio_task, "gpio_task", 2048, NULL, 10, NULL);

    gpio_install_isr_service(ESP_INTR_FLAG_DEFAULT);
    gpio_isr_handler_add(GPIO_INPUT_IO_0, gpio_isr_handler, (void*) GPIO_INPUT_IO_0);
    gpio_isr_handler_add(GPIO_INPUT_IO_1, gpio_isr_handler, (void*) GPIO_INPUT_IO_1);

    int cnt = 0;
    while(1) {
        // printf("cnt: %d\n", cnt++);
        // gpio_set_level(CONTROL_NEG_IO, cnt % 2);
        // gpio_set_level(CONTROL_POS_IO, cnt % 2);
        vTaskDelay(1000 / portTICK_RATE_MS);
    }
}
