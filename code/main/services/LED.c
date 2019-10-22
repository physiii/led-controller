#include "drivers/ws2812b.c"
#define WHITE 0
#define RED   1
#define GREEN 2
#define BLUE  3
#define WARM  4

#define DEFAULT_PIXEL_COUNT CONFIG_DEFAULT_PIXEL_COUNT
#define LED_OFF_TIME CONFIG_LED_OFF_TIME

cJSON *LED_payload = NULL;

char LED_service_message[2000];
char LED_service_message_in[2000];
int pwm_factor = 2;
int MAX_BRIGHTNESS = 255;
int current_mode = 0;
int number_of_modes = 4;
int current_LED_level = 0;
bool led_off_timer_expired = true;

struct color
{
  int r;
  int g;
  int b;
  int brightness;
  bool power;
};

struct color pixels;

void setPower(bool);

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

void storePixels ()
{
  store_u32("r", pixels.r);
  store_u32("g", pixels.g);
  store_u32("b", pixels.b);
  store_u32("brightness", pixels.brightness);
  store_u32("power", pixels.power);
}

int setPixels()
{
  if (pixels.r < 0) pixels.r = 0;
  if (pixels.g < 0) pixels.g = 0;
  if (pixels.b < 0) pixels.b = 0;

  if (pixels.r > 255) pixels.r = 255;
  if (pixels.g > 255) pixels.g = 255;
  if (pixels.b > 255) pixels.b = 255;

  if (pixels.brightness > MAX_BRIGHTNESS) pixels.brightness = MAX_BRIGHTNESS;
  if (pixels.brightness < 0)   pixels.brightness = 0;

  setColor(
    pixels.r * pixels.power * pixels.brightness / 255,
    pixels.g * pixels.power * pixels.brightness / 255,
    pixels.b * pixels.power * pixels.brightness / 255
  );

  storePixels();

  return 0;
}

int setBrightness(int val)
{
  pixels.brightness=val;
  setPixels();
  printf("LED: set brightness to (%d)\n",
    pixels.brightness);
  return 0;
}

int incBrightness(int val)
{
  pixels.brightness+=val;
  setPixels();
  printf("LED: increasing brightness to (%d)\n",
    pixels.brightness);
  return 0;
}

int decBrightness(int val)
{
  pixels.brightness-=val;
  setPixels();
  printf("LED: decreasing brightness to (%d)\n",
    pixels.brightness);
  return 0;
}

int getBrightness()
{
  return pixels.brightness;
}

void setPower (bool val)
{
  pixels.power = val;
  setPixels();
  printf("LED: Power %d\n", pixels.power);
}

bool getPower ()
{
  return pixels.power;
}

void toggleLED()
{
  pixels.power = !pixels.power;
  setPixels();
  printf("LED: Toggle %d\n", pixels.power);
}

int fadeLED(int start, int stop, int duration)
{
  return 0;
}

int setMode(int mode)
{

  if (mode == WHITE) {
    pixels.r = 255;
    pixels.g = 255;
    pixels.b = 255;
  }

  if (mode == WARM) {
    pixels.r = 255;
    pixels.g = 75;
    pixels.b = 40;
    pixels.brightness = 75;
  }

  if (mode == RED) {
    pixels.r = 255;
    pixels.g = 0;
    pixels.b = 0;
  }

  if (mode == GREEN) {
    pixels.r = 0;
    pixels.g = 255;
    pixels.b = 0;
  }

  if (mode == BLUE) {
    pixels.r = 0;
    pixels.g = 0;
    pixels.b = 255;
  }

  setPixels();
  printf("LED: setPixels to (%d,%d,%d, B:%d)\n",
    pixels.r, pixels.g, pixels.b, pixels.brightness);
  return 0;
}

int setPixelCount(int num)
{
  PIXEL_COUNT = num;
  // reset_pixels();
  // setPixels();
  printf("LED: Pixel count (%d)\n", PIXEL_COUNT);
  return 0;
}

int nextMode()
{
  if (current_mode < number_of_modes) {
    current_mode++;
  } else {
    current_mode = 0;
  }
  setMode(current_mode);
  printf("LED: nextMode %d\n", current_LED_level);
  return 0;
}

int prevMode()
{
  if (current_mode > 0) {
    current_mode--;
  } else {
    current_mode = number_of_modes;
  }
  setMode(current_mode);
  printf("LED: nextMode %d\n", current_LED_level);
  return 0;
}

static void LED_service(void *pvParameter)
{

  pixels.r = get_u32("r", pixels.r);
  pixels.g = get_u32("g", pixels.g);
  pixels.b = get_u32("b", pixels.b);
  pixels.brightness = get_u32("brightness", pixels.brightness);
  if (get_u32("power", pixels.power)) {
    pixels.power=true;
  } else pixels.power = false;
  setPixels();

  while (1) {

    //incoming messages from other services
    if (LED_payload) {

      if (cJSON_GetObjectItem(LED_payload,"level")) {
        int level = cJSON_GetObjectItem(LED_payload,"level")->valueint;
        setPixels();
        printf("[LED_service] level %d\n",level);
      }

      if (cJSON_GetObjectItem(LED_payload,"toggle")) {
        toggleLED();
        printf("[LED_service] toggle %d\n",current_LED_level);
      }

      if (cJSON_GetObjectItem(LED_payload,"incBrightness")) {
        int val = cJSON_GetObjectItem(LED_payload,"incBrightness")->valueint;

        incBrightness(val);
        printf("[LED_service] increment %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"setPixelCount")) {
        int val = cJSON_GetObjectItem(LED_payload,"setPixelCount")->valueint;
        // reset_pixels();
        setPixelCount(val);
        printf("[LED_service] setPixelCount %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"decBrightness")) {
        int val = cJSON_GetObjectItem(LED_payload,"decBrightness")->valueint;
        decBrightness(val);
        printf("[LED_service] decrement %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"nextMode")) {
        int val = cJSON_GetObjectItem(LED_payload,"nextMode")->valueint;
        nextMode();
        printf("[LED_service] nextMode %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"prevMode")) {
        int val = cJSON_GetObjectItem(LED_payload,"prevMode")->valueint;
        prevMode();
        printf("[LED_service] prevMode %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"fade")) {
        int fade = cJSON_GetObjectItem(LED_payload,"fade")->valueint;
        fadeLED(0,fade,0);
        printf("[LED_service] level %d\n",fade);
      }

      if (cJSON_GetObjectItem(LED_payload,"fade")) {
        /*int fade = cJSON_GetObjectItem(LED_payload,"fade")->valueint;
        fadeLED(0,fade,0);
        printf("[LED_service] fade %d\n",fade);*/
      }

      LED_payload = NULL;
    }

    vTaskDelay(20 / portTICK_PERIOD_MS);
  }
}

int LED_main()
{
  ws2812b_main();
  printf("starting LED service\n");
  setPixelCount(DEFAULT_PIXEL_COUNT);
  xTaskCreate(&LED_service, "LED_service_task", 5000, NULL, 5, NULL);
  return 0;
}
