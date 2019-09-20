#include "drivers/ws2812b.c"
#define WHITE 0
#define RED   1
#define GREEN 2
#define BLUE  3
#define WARM  4

char LED_service_message[2000];
char LED_service_message_in[2000];
int pwm_factor = 2;
int MAX_BRIGHTNESS = 255;
int current_mode = 0;
int number_of_modes = 4;
int current_LED_level = 0;

struct color {
  int r;
  int g;
  int b;
  int brightness;
};

struct color pixels;

int setPixels() {
  if (pixels.r < 0) pixels.r = 0;
  if (pixels.g < 0) pixels.g = 0;
  if (pixels.b < 0) pixels.b = 0;

  if (pixels.r > 255) pixels.r = 255;
  if (pixels.g > 255) pixels.g = 255;
  if (pixels.b > 255) pixels.b = 255;

  if (pixels.brightness > MAX_BRIGHTNESS) pixels.brightness = MAX_BRIGHTNESS;
  if (pixels.brightness < 0)   pixels.brightness = 0;

  setColor(
    pixels.r * pixels.brightness / 255,
    pixels.g * pixels.brightness / 255,
    pixels.b * pixels.brightness / 255
  );

  return 0;
}

int incBrightness(int val) {
  pixels.brightness+=val;
  setPixels();
  lwsl_notice("LED: increasing brightness to (%d)\n",
    pixels.brightness);
  return 0;
}

int decBrightness(int val) {
  pixels.brightness-=val;
  setPixels();
  lwsl_notice("LED: decreasing brightness to (%d)\n",
    pixels.brightness);
  return 0;
}

int setMode(int mode) {

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
  lwsl_notice("LED: setPixels to (%d,%d,%d, B:%d)\n",
    pixels.r, pixels.g, pixels.b, pixels.brightness);
  return 0;
}

int setPixelCount(int num) {
  PIXEL_COUNT = num;
  // reset_pixels();
  setPixels();
  lwsl_notice("LED: Pixel count (%d)\n", PIXEL_COUNT);
  return 0;
}

int nextMode() {
  if (current_mode < number_of_modes) {
    current_mode++;
  } else {
    current_mode = 0;
  }
  setMode(current_mode);
  lwsl_notice("LED: nextMode %d\n", current_LED_level);
  return 0;
}

int prevMode() {
  if (current_mode > 0) {
    current_mode--;
  } else {
    current_mode = number_of_modes;
  }
  setMode(current_mode);
  lwsl_notice("LED: nextMode %d\n", current_LED_level);
  return 0;
}

int toggleLED() {
  if (pixels.brightness > 25) {
    pixels.brightness = 0;
  } else {
    pixels.brightness = MAX_BRIGHTNESS;
  }

  lwsl_notice("LED: toggle brightness %d\n",pixels.brightness);
  setPixels();
  return 0;
}

int fadeLED(int start, int stop, int duration) {
  return 0;
}

static void LED_service(void *pvParameter) {

  pixels.r = MAX_BRIGHTNESS;
  pixels.g = MAX_BRIGHTNESS;
  pixels.b = MAX_BRIGHTNESS;
  pixels.brightness = MAX_BRIGHTNESS;

  while (1) {

    //incoming messages from other services
    if (LED_payload) {

      if (cJSON_GetObjectItem(LED_payload,"level")) {
        int level = cJSON_GetObjectItem(LED_payload,"level")->valueint;
        setPixels();
        lwsl_notice("[LED_service] level %d\n",level);
      }

      if (cJSON_GetObjectItem(LED_payload,"toggle")) {
        toggleLED();
        lwsl_notice("[LED_service] toggle %d\n",current_LED_level);
      }

      if (cJSON_GetObjectItem(LED_payload,"incBrightness")) {
        int val = cJSON_GetObjectItem(LED_payload,"incBrightness")->valueint;

        incBrightness(val);
        lwsl_notice("[LED_service] increment %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"setPixelCount")) {
        int val = cJSON_GetObjectItem(LED_payload,"setPixelCount")->valueint;
        // reset_pixels();
        setPixelCount(val);
        lwsl_notice("[LED_service] setPixelCount %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"decBrightness")) {
        int val = cJSON_GetObjectItem(LED_payload,"decBrightness")->valueint;
        decBrightness(val);
        lwsl_notice("[LED_service] decrement %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"nextMode")) {
        int val = cJSON_GetObjectItem(LED_payload,"nextMode")->valueint;
        nextMode();
        lwsl_notice("[LED_service] nextMode %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"prevMode")) {
        int val = cJSON_GetObjectItem(LED_payload,"prevMode")->valueint;
        prevMode();
        lwsl_notice("[LED_service] prevMode %d\n",val);
      }

      if (cJSON_GetObjectItem(LED_payload,"fade")) {
        int fade = cJSON_GetObjectItem(LED_payload,"fade")->valueint;
        fadeLED(0,fade,0);
        lwsl_notice("[LED_service] level %d\n",fade);
      }

      if (cJSON_GetObjectItem(LED_payload,"fade")) {
        /*int fade = cJSON_GetObjectItem(LED_payload,"fade")->valueint;
        fadeLED(0,fade,0);
        lwsl_notice("[LED_service] fade %d\n",fade);*/
      }

      LED_payload = NULL;
    }

    vTaskDelay(20 / portTICK_PERIOD_MS);
  }
}

int LED_main() {
  ws2812b_main();
  printf("starting LED service\n");
  xTaskCreate(&LED_service, "LED_service_task", 5000, NULL, 5, NULL);
  return 0;
}
