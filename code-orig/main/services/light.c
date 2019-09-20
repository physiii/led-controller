#include "drivers/ws2812b.c"

char light_service_message[2000];
char light_service_message_in[2000];
int current_light_level = 0;
int pwm_factor = 2;

int setlight(int r, int g, int b) {
  // lwsl_notice("set light [%d,%d,%d]\n",r,g,b);
  set_pixel_by_index(0, r, g, b, 1);
  return 0;
}

int togglelight() {
  int new_light_level;
  if (current_light_level > 25) {
    new_light_level = 0;
  } else {
    new_light_level = 100;
  }

  lwsl_notice("toggle light from %d to %d\n",current_light_level,new_light_level);
  setlight(new_light_level,new_light_level,new_light_level);
  current_light_level = new_light_level;
  return current_light_level;
}

int fadelight(int start, int stop, int duration) {
  uint32_t angle, count;
  /*for (count = start; count < stop; count++) {
      angle = servo_per_degree_init(count);
      printf("Angle: %d | pulse width: %dus\n", count, angle);
      setlight(angle);
      vTaskDelay(10);     //Add delay, since it takes time for servo to rotate, generally 100ms/60degree rotation at 5V
  }*/
  return 0;
}

static void light_service(void *pvParameter) {

  while (1) {

    //incoming messages from other services
    if (light_payload) {

      if (cJSON_GetObjectItem(light_payload,"level")) {
        int level = cJSON_GetObjectItem(light_payload,"level")->valueint;
        setlight(level,level,level);
        lwsl_notice("[light_service] level %d\n",level);
      }

      if (cJSON_GetObjectItem(light_payload,"toggle")) {
        togglelight();
        lwsl_notice("[light_service] toggle %d\n",current_light_level);
      }

      if (cJSON_GetObjectItem(light_payload,"increment")) {
        int increment = cJSON_GetObjectItem(light_payload,"increment")->valueint;
        //inclight(increment);
        lwsl_notice("[light_service] increment %d\n",increment);
      }

      if (cJSON_GetObjectItem(light_payload,"decrement")) {
        int decrement = cJSON_GetObjectItem(light_payload,"decrement")->valueint;
        //declight(decrement);
        lwsl_notice("[light_service] decrement %d\n",decrement);
      }

      if (cJSON_GetObjectItem(light_payload,"fade")) {
        int fade = cJSON_GetObjectItem(light_payload,"fade")->valueint;
        fadelight(0,fade,0);
        lwsl_notice("[light_service] level %d\n",fade);
      }

      if (cJSON_GetObjectItem(light_payload,"fade")) {
        /*int fade = cJSON_GetObjectItem(light_payload,"fade")->valueint;
        fadelight(0,fade,0);
        lwsl_notice("[light_service] fade %d\n",fade);*/
      }

      light_payload = NULL;
    }

    vTaskDelay(200 / portTICK_PERIOD_MS);
  }
}

int light_main() {
  ws2812b_main();
  printf("starting light service\n");
  xTaskCreate(&light_service, "light_service_task", 5000, NULL, 5, NULL);
  return 0;
}
