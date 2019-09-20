#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include <stdio.h>
#include "nvs.h"
#include "nvs_flash.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "driver/rmt.h"

// Number of lights message sender expects
// #define VIRTUAL_LIGHT_COUNT (600)
// Physical length of LED strip
// #define PIXEL_COUNT (600)
#define RMT_TX_CHANNEL RMT_CHANNEL_0
#define RMT_TX_GPIO 18

// RMT_BASECLK_APB is not defined anywhere I can see, assuming default 80MHz
#define MY_RMT_BASECLK_APB (80)
#define RMT_CLK_DIV 1

// From WS2812 datasheet
#define PULSE_T0H_US (0.4)
#define PULSE_T1H_US (0.8)
#define PULSE_T0L_US (0.85)
#define PULSE_T1L_US (0.45)
#define PULSE_RES_US (60)
#define T0H_TICKS ((int)(MY_RMT_BASECLK_APB * PULSE_T0H_US))
#define T1H_TICKS ((int)(MY_RMT_BASECLK_APB * PULSE_T1H_US))
#define T0L_TICKS ((int)(MY_RMT_BASECLK_APB * PULSE_T0L_US))
#define T1L_TICKS ((int)(MY_RMT_BASECLK_APB * PULSE_T1L_US))
#define RES_TICKS ((int)(MY_RMT_BASECLK_APB * PULSE_RES_US))

#define MAX_PIXEL_COUNT 1000
rmt_item32_t rmt_pixel[MAX_PIXEL_COUNT][3][8] = {0};
// Arbitrary upper limit on message size
#define MSGLEN (50)

int PIXEL_COUNT = 1;

struct __attribute__((__packed__)) rgb_t {
  unsigned char r, g, b;
};

void set_pixel_channel(rmt_item32_t * item, int state) {
  item->level0 = 1;
  item->level1 = 0;
  // printf("T0H_TICKS %d\n", T0H_TICKS);
  if (0 == state) {
    item->duration0 = T0H_TICKS;
    item->duration1 = T0L_TICKS;
  } else {
    item->duration0 = T1H_TICKS;
    item->duration1 = T1L_TICKS;
  }
}

void write_pixels() {
  int structs = sizeof(rmt_pixel) / sizeof(rmt_pixel[0][0][0]);
  ESP_ERROR_CHECK(rmt_write_items(RMT_TX_CHANNEL, rmt_pixel, structs, true));
}

unsigned char reverseBits(unsigned char num)
{
    unsigned int  NO_OF_BITS = sizeof(num) * 8;
    unsigned char reverse_num = 0;
    int i;
    for (i = 0; i < NO_OF_BITS; i++)
    {
        if((num & (1 << i)))
           reverse_num |= 1 << ((NO_OF_BITS - 1) - i);
   }
    return reverse_num;
}

// Copy rgb_t pixel data into rmt_pixel data
void set_pixel(int index, unsigned char r, unsigned char g, unsigned char b) {
  int bit;

  r = reverseBits(r);
  g = reverseBits(g);
  b = reverseBits(b);

  for (bit = 7; bit >= 0; bit -= 1) {
    set_pixel_channel(&(rmt_pixel[index][0][bit]), g & (1 << bit));
    set_pixel_channel(&(rmt_pixel[index][1][bit]), r & (1 << bit));
    set_pixel_channel(&(rmt_pixel[index][2][bit]), b & (1 << bit));
  }

  // if (index >= 0 && index < MAX_PIXEL_COUNT) {
  //   for (bit = 7; bit >= 0; bit -= 1) {
  //     set_pixel_channel(&(rmt_pixel[index][0][bit]), g & (1 << bit));
  //     set_pixel_channel(&(rmt_pixel[index][1][bit]), r & (1 << bit));
  //     set_pixel_channel(&(rmt_pixel[index][2][bit]), b & (1 << bit));
  //   }
  // } else {
  //   printf("Pixel index %d out of bounds.", index);
  // }
}

void setColor(unsigned char r, unsigned char g, unsigned char b) {
  int index;

  for (index = 0; index < MAX_PIXEL_COUNT; index += 1) {
    if (index < PIXEL_COUNT) {
      set_pixel(index, r, g, b);
    } else {
      set_pixel(index, 0, 0, 0);
    }
  }
  write_pixels();
}

// void reset_pixels() {
//   int index;
//   for (index = 0; index < MAX_PIXEL_COUNT; index += 1) {
//     set_pixel(index, 0, 0, 0);
//   }
//   write_pixels();
// }

static void ws2812_rmt_tx_init() {
    rmt_config_t config = {};

    config.rmt_mode = RMT_MODE_TX;
    config.channel = RMT_TX_CHANNEL;
    config.clk_div = RMT_CLK_DIV;
    config.gpio_num = RMT_TX_GPIO;
    config.mem_block_num = 1; // don't know what this does but it needs to be so

    config.tx_config.loop_en = 0;
    config.tx_config.carrier_en = 0;
    config.tx_config.idle_output_en = 0;
    config.tx_config.idle_level = 0;

    ESP_ERROR_CHECK(rmt_config(&config));
    ESP_ERROR_CHECK(rmt_driver_install(config.channel, 0, 0));
}

// void set_pixel_range(int low, int high) {
//   // per documentation the LOW light is NOT lit but ones afterward are
//   // just set them green for now
//   reset_pixels();
//   int real_low, real_high;
//
//   real_low = PIXEL_COUNT;
//   real_high = PIXEL_COUNT;
//
//   // real_low = PIXEL_COUNT * (1.0 * low / VIRTUAL_LIGHT_COUNT);
//   // real_high = PIXEL_COUNT * (1.0 * high / VIRTUAL_LIGHT_COUNT);
//
//   // printf("mapping virtual light range (%d,%d] to real light range (%d, %d]", low, high, real_low, real_high);
//
//   if (real_high > 0) {
//     int i;
//     for (i = real_low + 1; i < real_high; i += 1) {
//       set_pixel(i, 0, 255, 0, 0);
//     }
//
//     set_pixel(i, 0, 255, 0, 1);
//   }
// }

void ws2812b_main() {
  esp_err_t ret = nvs_flash_init();
  if (ret == ESP_ERR_NVS_NO_FREE_PAGES) {
    ESP_ERROR_CHECK(nvs_flash_erase());
    ret = nvs_flash_init();
  }
  ESP_ERROR_CHECK( ret );

  ws2812_rmt_tx_init();

  // 3 channels (RGB), 8 bits each

  // rmt_item32_t rmt_pixel[PIXEL_COUNT][3][8] = {0};
  // reset_pixels();


  // struct rgb_t pixel[PIXEL_COUNT] = {0};

}
