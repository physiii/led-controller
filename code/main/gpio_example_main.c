#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"

#include "cJSON.h"
#include "services/storage.c"
#include "services/LED.c"
#include "services/rotary_encoder.c"

struct rotary_encoder_info_t rc;

void app_main(void)
{
    LED_main();
    rotary_encoder_init(rc, 4, 5);
    int cnt = 0;
    setPixelCount(300);
    while(1) {
        // printf("cnt: %d\n", cnt++);
        vTaskDelay(1000 / portTICK_RATE_MS);
    }
}
