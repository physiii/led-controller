#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "driver/rmt.h"
#include "led_strip.h"

#define RMT_TX_CHANNEL RMT_CHANNEL_0
#define LED_IO CONFIG_LED_IO
#define PIXEL_COUNT DEFAULT_PIXEL_COUNT
#define EXAMPLE_CHASE_SPEED_MS (10)

#define WHITE 0
#define WARM  1
#define RED   2
#define GREEN 3
#define BLUE  4

#define DEFAULT_PIXEL_COUNT CONFIG_DEFAULT_PIXEL_COUNT
#define LED_OFF_TIME CONFIG_LED_OFF_TIME

cJSON *led_payload = NULL;
cJSON *led_state = NULL;

char LED_service_message[2000];
char LED_service_message_in[2000];
char led_state_str[2000];
int pwm_factor = 2;
int MAX_BRIGHTNESS = 255;
int current_mode = 0;
int number_of_modes = 4;
int current_LED_level = 0;
bool led_off_timer_expired = true;
int led_off_count = 0;

uint16_t hue = 0;
uint16_t start_rgb = 0;

struct pixel
{
  uint32_t r;
  uint32_t g;
  uint32_t b;
  int brightness;
  bool power;
};

struct fade_props
{
  struct pixel stop_color;
  int steps_left;
};

struct pixel pixels;
struct pixel pixels_temp;
struct fade_props fade;

void setPower(bool);

void store_led_state(cJSON * state)
{
  char *state_str = cJSON_PrintUnformatted(state);
  store_char("led_state", state_str);
  free(state_str);

  send_state(state);
}

static void led_fade_task(void *pvParameter)
{
  while (1) {
    if (fade.steps_left > 0) {
      // pixels.r = pixels.r + (pixels.r - fade.stop_color.r) / fade.steps_left;
      fade.steps_left-=1;
      pixels = fade.stop_color;
    } else {
      pixels = fade.stop_color;
    }
    vTaskDelay(10 / portTICK_PERIOD_MS);
  }
}

void start_led_off_timer(bool val)
{
  if (val) {
    led_off_timer_expired = false;
    led_off_count = 0;
  } else {
    led_off_timer_expired = true;
  }
}

static void led_off_timer(void *pvParameter)
{
  while (1) {
    if (led_off_count > LED_OFF_TIME && !led_off_timer_expired) {
      led_off_timer_expired = true;
      setPower(false);
    } else led_off_count++;
    vTaskDelay(60 * 1000 / portTICK_PERIOD_MS);
  }
}

void setBrightness(int val)
{
  pixels.brightness = val;
  cJSON* brightness = cJSON_CreateNumber(val);
  cJSON_ReplaceItemInObjectCaseSensitive(led_state, "brightness", brightness);
  store_led_state(led_state);
}

int incBrightness(int val)
{
  pixels.brightness+=val;
  printf("LED: increasing brightness to (%d)\n",
    pixels.brightness);
  return 0;
}

int decBrightness(int val)
{
  pixels.brightness-=val;
  printf("LED: decreasing brightness to (%d)\n",
    pixels.brightness);
  return 0;
}

int getBrightness()
{
  return pixels.brightness;
}

int fadeLED(int steps, struct pixel stop_color)
{
  fade.stop_color = stop_color;
  fade.steps_left = steps;
  return 0;
}

void setPower (bool val)
{
  pixels.power = val;
  cJSON* power = cJSON_CreateBool(val);
  cJSON_ReplaceItemInObjectCaseSensitive(led_state, "power", power);
  store_led_state(led_state);
}

bool getPower ()
{
  return pixels.power;
}

void toggleLED()
{
  pixels.power = !pixels.power;
  printf("LED: Toggle %d\n", pixels.power);
}

void setTheme(int num)
{
    cJSON *themes = cJSON_GetObjectItem(led_state,"themes");
    cJSON *theme =  NULL;
    int i = 0;

    cJSON_ArrayForEach(theme, themes) {
      if (i == num) {
        pixels.r = cJSON_GetObjectItem(theme,"r")->valueint;
        pixels.g = cJSON_GetObjectItem(theme,"g")->valueint;
        pixels.b = cJSON_GetObjectItem(theme,"b")->valueint;
      }

      i++;
    }
}

void modifyTheme(int num, cJSON* theme)
{
    cJSON *themes = cJSON_GetObjectItem(led_state,"themes");
    cJSON_ReplaceItemInArray(themes, num, theme);

    printf("modified theme: %s\n", cJSON_PrintUnformatted(themes));
    setTheme(num);

    cJSON_ReplaceItemInObjectCaseSensitive(led_state, "themes", themes);
    store_led_state(led_state);
}

void restore_led_state()
{
  strcpy(led_state_str, get_char("led_state"));

  if (strcmp(led_state_str,"")==0) {
    printf("LED state not found, initializing...\n");

    snprintf(led_state_str,sizeof(led_state_str),""
    "{\"power\":1, \"brightness\":100, ""\"theme\":0, "
    "\"themes\":[{\"r\":255, \"g\":255, \"b\":255}, {\"r\":255, \"g\":0, \"b\":0}, {\"r\":0, \"g\":255, \"b\":0}, {\"r\":0, \"g\":0, \"b\":255}]}");

    led_state = cJSON_Parse(led_state_str);
    store_led_state(led_state);
  } else {
      printf("Restored LED state: %s\n", led_state_str);
      led_state = cJSON_Parse(led_state_str);
  }

  if (cJSON_IsTrue(cJSON_GetObjectItem(led_state,"power"))) {
    setPower(true);
    // printf("[LED_service] setPower on\n");
  } else {
    setPower(false);
    // printf("[LED_service] setPower off\n");
  }

  int brightness = cJSON_GetObjectItem(led_state,"brightness")->valueint;
  setBrightness(brightness);

  int theme = cJSON_GetObjectItem(led_state,"theme")->valueint;
  setTheme(theme);
}

static void LED_service(void *pvParameter)
{
  pixels_temp = pixels;
  fade.steps_left = 0;
  fade.stop_color = pixels_temp;

  while (1) {

    // incoming messages from other services
    if (led_payload) {

      if (cJSON_GetObjectItem(led_payload,"setTheme")) {
        cJSON* theme_obj = cJSON_GetObjectItem(led_payload,"setTheme");
        int theme_num = cJSON_GetObjectItem(theme_obj,"theme")->valueint;
        cJSON* color_obj = cJSON_GetObjectItem(theme_obj,"color");

        setPower(true);
        modifyTheme(theme_num, color_obj);
        // printf("[LED_service] setTheme: %d\n", theme_num);
      }

      if (cJSON_GetObjectItem(led_payload,"theme")) {
        int theme = cJSON_GetObjectItem(led_payload,"theme")->valueint;
        setPower(true);
        setTheme(theme);
      }

      if (cJSON_GetObjectItem(led_payload,"setBrightness")) {
        setPower(true);
        int level = cJSON_GetObjectItem(led_payload,"setBrightness")->valueint;
        setBrightness(level);
      }

      if (cJSON_GetObjectItem(led_payload,"setPower")) {
        if (cJSON_IsTrue(cJSON_GetObjectItem(led_payload,"setPower"))) {
          setPower(true);
        } else {
          setPower(false);
        }
      }

      if (cJSON_GetObjectItem(led_payload,"toggle")) {
        toggleLED();
      }

      if (cJSON_GetObjectItem(led_payload,"incBrightness")) {
        int val = cJSON_GetObjectItem(led_payload,"incBrightness")->valueint;

        incBrightness(val);
      }

      if (cJSON_GetObjectItem(led_payload,"decBrightness")) {
        int val = cJSON_GetObjectItem(led_payload,"decBrightness")->valueint;
        decBrightness(val);
      }

      if (cJSON_GetObjectItem(led_payload,"fade")) {
        int fade = cJSON_GetObjectItem(led_payload,"fade")->valueint;
        // fadeLED(0,fade,0);
      }

      led_payload = NULL;
    }

    vTaskDelay(50 / portTICK_PERIOD_MS);
  }
}

static void led_loop(void *pvParameter)
{
    rmt_config_t config = RMT_DEFAULT_CONFIG_TX(LED_IO, RMT_TX_CHANNEL);
    // set counter clock to 40MHz
    config.clk_div = 2;

    ESP_ERROR_CHECK(rmt_config(&config));
    ESP_ERROR_CHECK(rmt_driver_install(config.channel, 0, 0));

    // install ws2812 driver
    led_strip_config_t strip_config = LED_STRIP_DEFAULT_CONFIG(PIXEL_COUNT, (led_strip_dev_t)config.channel);
    led_strip_t *strip = led_strip_new_rmt_ws2812(&strip_config);

    if (!strip) {
        ESP_LOGE(TAG, "install WS2812 driver failed");
    }
    ESP_ERROR_CHECK(strip->clear(strip, 100));
    while (true) {
      for (int i = 0; i < PIXEL_COUNT; i++) {
          if (pixels.power) {
            ESP_ERROR_CHECK(strip->set_pixel(strip, i,
              pixels.r * pixels.brightness / 100,
              pixels.g * pixels.brightness / 100,
              pixels.b * pixels.brightness / 100
            ));
          } else {
            strip->clear(strip, 50);
          }
      }
      // Flush RGB values to LEDs
      ESP_ERROR_CHECK(strip->refresh(strip, 100));
      vTaskDelay(pdMS_TO_TICKS(10));
    }
}

int led_main()
{
  restore_led_state();
  printf("starting LED service\n");
  xTaskCreate(&LED_service, "LED_service_task", 5000, NULL, 5, NULL);
  xTaskCreate(&led_loop, "led_loop", 5000, NULL, 5, NULL);
  // xTaskCreate(&led_fade_task, "led_fade_task", 5000, NULL, 5, NULL);
  return 0;
}
