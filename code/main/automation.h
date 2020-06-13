#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "esp_system.h"
#include "esp_log.h"
#include "cJSON.h"

cJSON *payload = NULL;
cJSON *utility_payload = NULL;
cJSON *dimmer_payload = NULL;
cJSON *button_payload = NULL;
cJSON *schedule_payload = NULL;
cJSON *alarm_payload = NULL;
cJSON *motion_payload = NULL;
cJSON *microphone_payload = NULL;
cJSON *nfc_payload = NULL;
cJSON *lock_payload = NULL;
cJSON *log_payload = NULL;

bool isLockArmed = false;
void arm_lock(int,bool);
int set_switch(int);
int set_brightness(int);
void debounce_pir();
bool isArmed();
void createAlarmServiceMessage();
void send_state(cJSON*);

int seconds_in_minute = 60;
int minutes_in_hour = 60;
int hours_in_day = 24;
int central_time_hours = -6;

bool ENABLE_MOTION = false;
bool dimmer_enabled =  true;

bool transmit_uid = true;
bool got_ip = false;

long int current_time = 0;
long int start_time = 0;
long int cycletime = 0;

struct access_log {
	char log_id[25];
  char date[25];
  char key_id[25];
  char name[50];
  bool registered;
  bool granted;
};

uint8_t keypad_code[4];
int code_size = 4;
bool connected_to_server = false;
static char* TAG = "open-automation";

#include "services/store.c"
#include "services/led.c"
#include "services/drivers/io.c"
// #include "services/rotary_encoder.c"
// #include "services/motion.c"
#include "services/websocket.c"
#include "services/station.c"
