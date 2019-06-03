#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"

#define SW_A_IO      15
#define CLK_A_IO     4
#define DT_A_IO      5

#define SW_B_IO      21
#define CLK_B_IO     22
#define DT_B_IO      23

#define GPIO_INPUT_PIN_SEL  ((1ULL<<SW_A_IO) | (1ULL<<CLK_A_IO) | (1ULL<<DT_A_IO) | (1ULL<<SW_B_IO) | (1ULL<<CLK_B_IO) | (1ULL<<DT_B_IO))
#define ESP_INTR_FLAG_DEFAULT 0

static xQueueHandle gpio_evt_queue = NULL;

static void IRAM_ATTR gpio_isr_handler(void* arg)
{
    uint32_t gpio_num = (uint32_t) arg;
    xQueueSendFromISR(gpio_evt_queue, &gpio_num, NULL);
}

static void rotary_encoder_task(void* arg)
{
    uint32_t io_num;
    for(;;) {
        if(xQueueReceive(gpio_evt_queue, &io_num, portMAX_DELAY)) {
            printf("GPIO[%d] intr, val: %d\n", io_num, gpio_get_level(io_num));
        }
    }
}

void rotary_encoder_main()
{
    gpio_config_t io_conf;
    io_conf.intr_type = GPIO_PIN_INTR_ANYEDGE;
    io_conf.pin_bit_mask = GPIO_INPUT_PIN_SEL;
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pull_up_en = 1;
    gpio_config(&io_conf);

    gpio_evt_queue = xQueueCreate(10, sizeof(uint32_t));
    xTaskCreate(rotary_encoder_task, "rotary_encoder_task", 2048, NULL, 10, NULL);

    gpio_install_isr_service(ESP_INTR_FLAG_DEFAULT);
    
    gpio_isr_handler_add(SW_A_IO, gpio_isr_handler, (void*) SW_A_IO);
    gpio_isr_handler_add(CLK_A_IO, gpio_isr_handler, (void*) CLK_A_IO);
    gpio_isr_handler_add(DT_A_IO, gpio_isr_handler, (void*) DT_A_IO);

    gpio_isr_handler_add(SW_B_IO, gpio_isr_handler, (void*) SW_B_IO);
    gpio_isr_handler_add(CLK_B_IO, gpio_isr_handler, (void*) CLK_B_IO);
    gpio_isr_handler_add(DT_B_IO, gpio_isr_handler, (void*) DT_B_IO);
}
