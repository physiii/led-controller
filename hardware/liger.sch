EESchema Schematic File Version 4
LIBS:liger-cache
EELAYER 29 0
EELAYER END
$Descr USLedger 17000 11000
encoding utf-8
Sheet 1 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3300 4800 2850 2200
U 59096487
F0 "Microcontroller" 60
F1 "microcontroller.sch" 60
F2 "3V3" I L 3300 5900 60 
F3 "T_LEFT" I R 6150 5050 60 
F4 "T_RIGHT" I R 6150 5150 60 
F5 "I2S_DATA_OUT" I R 6150 5250 60 
F6 "I2S_BCLK" I R 6150 5375 60 
F7 "T_UP" I R 6150 5475 60 
F8 "FACTORY_RST" I R 6150 5600 60 
F9 "T_DOWN" I R 6150 5725 60 
F10 "PIR" I R 6150 5825 60 
F11 "PROG" I R 6150 6025 60 
F12 "IR_RX" I R 6150 6225 60 
F13 "BUTTON_LED" O R 6150 6550 60 
F14 "SDA" B R 6150 6675 60 
F15 "SCL" O R 6150 6775 60 
F16 "I2S_DATA_IN" I L 3300 4950 60 
F17 "I2S_WS" I L 3300 5075 60 
F18 "RXD" I L 3300 5225 60 
F19 "TXD" I L 3300 5350 60 
F20 "IR_TX" O R 6150 6125 60 
F21 "ZERO_DETECT" I L 3300 5500 60 
F22 "EN" I L 3300 6000 60 
F23 "RELAY_2" I L 3300 6350 60 
F24 "RELAY_1" I L 3300 6250 60 
F25 "RELAY_3" I L 3300 6450 60 
F26 "RELAY_4" I L 3300 6550 60 
$EndSheet
$Sheet
S 8050 6200 1950 1350
U 590982C4
F0 "InfraRed" 60
F1 "InfraRed.sch" 60
F2 "3V3" I L 8050 6600 60 
F3 "IR_RX" I L 8050 6350 60 
F4 "IR_TX" I L 8050 6450 60 
$EndSheet
$Sheet
S 8000 2550 1950 1350
U 5909A781
F0 "Audio" 60
F1 "audio.sch" 60
F2 "I2S_DATA_IN" I L 8000 2925 60 
F3 "V_IN" I R 9950 2900 60 
F4 "I2S_WS" I L 8000 2800 60 
F5 "I2S_BCLK" I L 8000 2675 60 
F6 "I2S_DATA_OUT" I L 8000 3050 60 
F7 "3V3" I R 9950 2750 60 
$EndSheet
$Sheet
S 3700 2500 1950 1350
U 5909D8E3
F0 "Power" 60
F1 "power.sch" 60
F2 "V_BAT" I R 5650 3025 60 
F3 "V_USB" I R 5650 3175 60 
F4 "V_IN" I R 5650 2875 60 
F5 "3V3" O R 5650 3325 60 
$EndSheet
$Sheet
S 12000 5400 1450 1350
U 590D271B
F0 "Enviroment" 60
F1 "enviroment.sch" 60
F2 "SCL" I L 12000 5550 60 
F3 "SDA" I L 12000 5675 60 
F4 "3V3" I L 12000 5800 60 
$EndSheet
$Sheet
S 12250 2700 1000 850 
U 59B5F4CB
F0 "PIR" 60
F1 "PIR.sch" 60
F2 "3V3" I L 12250 2800 60 
F3 "PIR" I L 12250 2925 60 
$EndSheet
Wire Bus Line
	14025 7875 14000 7875
Wire Wire Line
	9950 5700 10025 5700
Wire Wire Line
	9950 5600 10025 5600
Wire Wire Line
	9950 5500 10025 5500
Wire Wire Line
	9950 5400 10025 5400
Wire Wire Line
	9950 4875 10025 4875
Wire Wire Line
	6150 6775 6225 6775
Wire Wire Line
	6150 6675 6225 6675
Wire Wire Line
	6150 6225 6225 6225
Wire Wire Line
	6150 6550 6225 6550
Wire Wire Line
	6150 6125 6225 6125
Wire Wire Line
	6150 6025 6225 6025
Wire Wire Line
	6150 5825 6225 5825
Wire Wire Line
	6150 5725 6225 5725
Wire Wire Line
	6150 5600 6225 5600
Wire Wire Line
	6150 5475 6225 5475
Wire Wire Line
	6150 5375 6225 5375
Wire Wire Line
	6150 5250 6225 5250
Wire Wire Line
	6150 5150 6225 5150
Wire Wire Line
	6150 5050 6225 5050
Wire Wire Line
	9950 5000 10025 5000
Wire Wire Line
	9950 4675 10025 4675
Wire Wire Line
	9950 4575 10025 4575
Wire Wire Line
	9950 4475 10025 4475
Wire Wire Line
	9950 2900 10025 2900
Wire Wire Line
	9950 2750 10025 2750
Text Label 12075 2800 0    60   ~ 0
3V3
Wire Wire Line
	12075 2800 12250 2800
Text Label 12075 2925 0    60   ~ 0
PIR
Wire Wire Line
	12075 2925 12250 2925
Text Label 11825 5550 0    60   ~ 0
SCL
Text Label 11825 5675 0    60   ~ 0
SDA
Text Label 11800 5800 0    60   ~ 0
3V3
Text Label 7850 6600 0    60   ~ 0
3V3
Text Label 7800 6450 0    60   ~ 0
IR_TX
Text Label 7800 6350 0    60   ~ 0
IR_RX
Text Label 7800 5600 0    60   ~ 0
SCL
Text Label 7800 5500 0    60   ~ 0
SDA
Text Label 7800 5400 0    60   ~ 0
RXD
Text Label 7825 5300 0    60   ~ 0
TXD
Text Label 7825 5150 0    60   ~ 0
3V3
Text Label 7725 5050 0    60   ~ 0
V_BAT
Text Label 7725 4950 0    60   ~ 0
V_USB
Text Label 7675 4700 0    60   ~ 0
I2S_WS
Text Label 7575 4800 0    60   ~ 0
I2S_BCLK
Text Label 7475 4600 0    60   ~ 0
IS2_DATA_IN
Text Label 7375 4500 0    60   ~ 0
I2S_DATA_OUT
Text Label 10025 4475 0    60   ~ 0
FACTORY_RST
Text Label 10025 4575 0    60   ~ 0
PROG
Text Label 10025 4675 0    60   ~ 0
EN
Text Label 10025 4775 0    60   ~ 0
ZERO_DETECT
Text Label 10025 4875 0    60   ~ 0
BUTTON_LED
Text Label 10025 5400 0    60   ~ 0
T_LEFT
Text Label 10025 5500 0    60   ~ 0
T_UP
Text Label 10025 5600 0    60   ~ 0
T_RIGHT
Text Label 10025 5700 0    60   ~ 0
T_DOWN
Text Label 10025 2750 0    60   ~ 0
3V3
Text Label 10025 2900 0    60   ~ 0
V_IN
Text Label 7675 2800 0    60   ~ 0
I2S_WS
Text Label 7450 2925 0    60   ~ 0
I2S_DATA_IN
Text Label 7575 2675 0    60   ~ 0
I2S_BCLK
Text Label 7375 3050 0    60   ~ 0
I2S_DATA_OUT
Text Label 3250 5900 2    60   ~ 0
3V3
Text Label 6225 5050 0    60   ~ 0
T_LEFT
Text Label 6225 5150 0    60   ~ 0
T_RIGHT
Text Label 6225 5250 0    60   ~ 0
I2S_DATA_OUT
Text Label 6225 5375 0    60   ~ 0
I2S_BCLK
Text Label 6225 5475 0    60   ~ 0
T_UP
Text Label 6225 5600 0    60   ~ 0
FACTORY_RST
Text Label 6225 5725 0    60   ~ 0
T_DOWN
Text Label 6225 5825 0    60   ~ 0
PIR
Text Label 6225 6025 0    60   ~ 0
PROG
Text Label 6225 6125 0    60   ~ 0
IR_TX
Text Label 6225 6225 0    60   ~ 0
IR_RX
Text Label 6225 6550 0    60   ~ 0
BUTTON_LED
Text Label 6225 6675 0    60   ~ 0
SDA
Text Label 6225 6775 0    60   ~ 0
SCL
Text Label 2750 4950 0    60   ~ 0
I2S_DATA_IN
Text Label 2975 5075 0    60   ~ 0
I2S_WS
Text Label 3100 5225 0    60   ~ 0
RXD
Text Label 3125 5350 0    60   ~ 0
TXD
Wire Wire Line
	11825 5550 12000 5550
Wire Wire Line
	11825 5675 12000 5675
Wire Wire Line
	11800 5800 12000 5800
Wire Wire Line
	7850 6600 8050 6600
Wire Wire Line
	7800 6450 8050 6450
Wire Wire Line
	7800 6350 8050 6350
Wire Wire Line
	7800 5600 8000 5600
Wire Wire Line
	7800 5500 8000 5500
Wire Wire Line
	7800 5400 8000 5400
Wire Wire Line
	7825 5300 8000 5300
Wire Wire Line
	7825 5150 8000 5150
Wire Wire Line
	7725 4950 8000 4950
Wire Wire Line
	7575 4800 8000 4800
Wire Wire Line
	7675 4700 8000 4700
Wire Wire Line
	7475 4600 8000 4600
Wire Wire Line
	7375 4500 8000 4500
Wire Wire Line
	7375 3050 8000 3050
Wire Wire Line
	7450 2925 8000 2925
Wire Wire Line
	7675 2800 8000 2800
Wire Wire Line
	7575 2675 8000 2675
Wire Wire Line
	2750 4950 3300 4950
Wire Wire Line
	2975 5075 3300 5075
Wire Wire Line
	3100 5225 3300 5225
Wire Wire Line
	3125 5350 3300 5350
$Sheet
S 8000 4400 1950 1350
U 59092AD4
F0 "Interface" 60
F1 "Interface.sch" 60
F2 "V_BAT" I L 8000 5050 60 
F3 "3V3" I L 8000 5150 60 
F4 "SCL" I L 8000 5600 60 
F5 "I2S_WS" I L 8000 4700 60 
F6 "I2S_BCLK" I L 8000 4800 60 
F7 "PROG" I R 9950 4575 60 
F8 "V_USB" I L 8000 4950 60 
F9 "RXD" I L 8000 5400 60 
F10 "SDA" I L 8000 5500 60 
F11 "I2S_DATA_IN" I L 8000 4600 60 
F12 "I2S_DATA_OUT" I L 8000 4500 60 
F13 "BUTTON_LED" I R 9950 4875 60 
F14 "T_LEFT" I R 9950 5400 60 
F15 "T_UP" I R 9950 5500 60 
F16 "T_RIGHT" I R 9950 5600 60 
F17 "T_DOWN" I R 9950 5700 60 
F18 "EN" I R 9950 4675 60 
F19 "FACTORY_RST" I R 9950 4475 60 
F20 "ZERO_DETECT" I R 9950 4775 60 
F21 "V_IN" I L 8000 5700 60 
F22 "RELAY_2" O R 9950 5100 60 
F23 "RELAY_3" O R 9950 5200 60 
F24 "RELAY_1" O R 9950 5000 60 
F25 "RELAY_4" O R 9950 5300 60 
F26 "TXD" O L 8000 5300 60 
$EndSheet
Wire Wire Line
	5650 2875 5725 2875
Wire Wire Line
	5650 3025 5725 3025
Wire Wire Line
	5650 3175 5725 3175
Wire Wire Line
	5650 3325 5725 3325
Text Label 5725 2875 0    60   ~ 0
V_IN
Text Label 5725 3025 0    60   ~ 0
V_BAT
Wire Wire Line
	7725 5050 8000 5050
Text Label 5725 3175 0    60   ~ 0
V_USB
Text Label 5725 3325 0    60   ~ 0
3V3
Text Label 3250 5500 2    60   ~ 0
ZERO_DETECT
Wire Wire Line
	3250 5500 3300 5500
Text Label 10025 5000 0    60   ~ 0
RELAY_1
Wire Wire Line
	10025 4775 9950 4775
Wire Wire Line
	3250 5900 3300 5900
Text Label 3250 6000 2    60   ~ 0
EN
Wire Wire Line
	3250 6000 3300 6000
Text Label 7975 5700 2    60   ~ 0
V_IN
Wire Wire Line
	7975 5700 8000 5700
Text Label 3275 6350 2    60   ~ 0
RELAY_2
Wire Wire Line
	3275 6350 3300 6350
Text Label 3275 6250 2    60   ~ 0
RELAY_1
Wire Wire Line
	3275 6250 3300 6250
Text Label 3275 6450 2    60   ~ 0
RELAY_3
Wire Wire Line
	3275 6450 3300 6450
Text Label 3275 6550 2    60   ~ 0
RELAY_4
Wire Wire Line
	3275 6550 3300 6550
Wire Wire Line
	9950 5100 10025 5100
Text Label 10025 5100 0    60   ~ 0
RELAY_2
Wire Wire Line
	9950 5200 10025 5200
Text Label 10025 5200 0    60   ~ 0
RELAY_3
Wire Wire Line
	9950 5300 10025 5300
Text Label 10025 5300 0    60   ~ 0
RELAY_4
$EndSCHEMATC