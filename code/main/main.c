#include "automation.h"

void app_main()
{
		store_main();
		led_main();
		// rotary_encoder_main();
		// motion_main();
		station_main();
		websocket_main();

    while (1) {
			vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}
