EESchema Schematic File Version 4
LIBS:liger-cache
EELAYER 29 0
EELAYER END
$Descr USLedger 17000 11000
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Bus Line
	14025 7875 14000 7875
$Comp
L power:GND #PWR?
U 1 1 5D23A3B7
P 7200 2700
AR Path="/59096487/5D23A3B7" Ref="#PWR?"  Part="1" 
AR Path="/5D23A3B7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7200 2450 50  0001 C CNN
F 1 "GND" H 7200 2550 50  0000 C CNN
F 2 "" H 7200 2700 50  0000 C CNN
F 3 "" H 7200 2700 50  0000 C CNN
	1    7200 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	7150 4050 7250 4050
Wire Wire Line
	9000 3550 9100 3550
Wire Wire Line
	8450 4600 8450 4700
Wire Wire Line
	9100 3000 9000 3000
Wire Wire Line
	9000 2900 9100 2900
Wire Wire Line
	9000 4050 9100 4050
Wire Wire Line
	7200 2750 7250 2750
Wire Wire Line
	7200 2700 7200 2750
$Comp
L power:GND #PWR?
U 1 1 5D23A3C5
P 4850 3825
AR Path="/59096487/5D23A3C5" Ref="#PWR?"  Part="1" 
AR Path="/5D23A3C5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4850 3575 50  0001 C CNN
F 1 "GND" H 4850 3675 50  0000 C CNN
F 2 "" H 4850 3825 50  0000 C CNN
F 3 "" H 4850 3825 50  0000 C CNN
	1    4850 3825
	1    0    0    -1  
$EndComp
Text Notes 4575 4175 0    60   ~ 0
ByPass CAPs
Connection ~ 4850 3800
Wire Wire Line
	4850 3825 4850 3800
Wire Wire Line
	5075 3800 4850 3800
Wire Wire Line
	5075 3725 5075 3800
Wire Wire Line
	4675 3800 4675 3725
Wire Wire Line
	5075 3425 5075 3350
Wire Wire Line
	5075 3350 4875 3350
Wire Wire Line
	4675 3350 4675 3425
Wire Wire Line
	4875 3275 4875 3350
Connection ~ 4875 3350
Wire Notes Line
	5350 4225 4350 4225
Wire Notes Line
	4350 4225 4350 3025
Wire Notes Line
	4350 3025 5350 3025
Wire Notes Line
	5350 3025 5350 4225
Wire Wire Line
	4850 3800 4675 3800
Wire Wire Line
	4875 3350 4675 3350
Text HLabel 7150 2850 0    60   Input ~ 0
3V3
Text HLabel 7150 4050 0    60   Input ~ 0
FACTORY_RST
Text HLabel 8450 4700 3    60   Input ~ 0
PIR
Text HLabel 9100 4050 2    60   Input ~ 0
PROG
Text HLabel 9100 3000 2    60   Input ~ 0
RXD
Text HLabel 9100 2900 2    60   Input ~ 0
TXD
Text HLabel 4875 3275 1    60   Input ~ 0
3V3
$Comp
L open-automation:C_1uF C?
U 1 1 5D23A3E4
P 5075 3575
AR Path="/59096487/5D23A3E4" Ref="C?"  Part="1" 
AR Path="/5D23A3E4" Ref="C?"  Part="1" 
F 0 "C?" H 5100 3650 50  0000 L CNN
F 1 "C_1uF" H 5100 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5175 3875 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/tdk-corporation/CGA3E1X7R1C105M080AC/445-12540-1-ND/3954206" H 5075 3325 50  0001 C CNN
F 4 "CL10B105KP8NNNC" H 5200 3775 60  0001 C CNN "Part Number"
	1    5075 3575
	1    0    0    -1  
$EndComp
$Comp
L open-automation:C_10uF C?
U 1 1 5D23A3EB
P 4675 3575
AR Path="/59096487/5D23A3EB" Ref="C?"  Part="1" 
AR Path="/5D23A3EB" Ref="C?"  Part="1" 
F 0 "C?" H 4550 3650 50  0000 L CNN
F 1 "C_10uF" H 4400 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4775 3875 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL10A106MP8NNNC/1276-1871-1-ND/3889957" H 4675 3325 50  0001 C CNN
F 4 "CL10A106MP8NNNC" H 4800 3775 60  0001 C CNN "Part Number"
	1    4675 3575
	1    0    0    -1  
$EndComp
$Comp
L liger-rescue:ESP-WROOM-32 U?
U 1 1 5D23A3F1
P 8150 3400
AR Path="/59096487/5D23A3F1" Ref="U?"  Part="1" 
AR Path="/5D23A3F1" Ref="U?"  Part="1" 
F 0 "U?" H 8700 2300 60  0000 C CNN
F 1 "ESP-WROOM-32" H 8150 4200 60  0000 C CNN
F 2 "open-automation:ESP-WROOM-32" H 7800 4000 60  0001 C CNN
F 3 "http://espressif.com/sites/default/files/documentation/esp-wroom-32_datasheet_en.pdf" H 7800 4000 60  0001 C CNN
	1    8150 3400
	1    0    0    -1  
$EndComp
Text HLabel 7150 2950 0    60   Input ~ 0
EN
Wire Wire Line
	7150 2850 7250 2850
Wire Wire Line
	7150 2950 7250 2950
Wire Wire Line
	9025 3650 9000 3650
Wire Wire Line
	9025 3750 9000 3750
Text HLabel 9100 3550 2    60   Output ~ 0
BUTTON_LED
$Comp
L liger-rescue:SW_PUSH REBOOT?
U 1 1 5D252D11
P 7975 7250
AR Path="/59092AD4/5D252D11" Ref="REBOOT?"  Part="1" 
AR Path="/5D252D11" Ref="REBOOT?"  Part="1" 
F 0 "REBOOT?" V 8200 7425 50  0000 C CNN
F 1 "SW_PUSH" H 7975 7170 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_KMR2" H 7975 7250 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/60/KMR2_9aug12-25127.pdf" H 7975 7250 50  0001 C CNN
F 4 "KMR211NG LFS" H 7975 7250 60  0001 C CNN "Part Number"
	1    7975 7250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D252D17
P 7975 7625
AR Path="/59092AD4/5D252D17" Ref="#PWR?"  Part="1" 
AR Path="/5D252D17" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7975 7375 50  0001 C CNN
F 1 "GND" H 7975 7475 50  0000 C CNN
F 2 "" H 7975 7625 50  0000 C CNN
F 3 "" H 7975 7625 50  0000 C CNN
	1    7975 7625
	1    0    0    -1  
$EndComp
$Comp
L liger-rescue:soft-button-4x U?
U 1 1 5D252D1D
P 10275 6675
AR Path="/59092AD4/5D252D1D" Ref="U?"  Part="1" 
AR Path="/5D252D1D" Ref="U?"  Part="1" 
F 0 "U?" H 10625 6925 60  0000 C CNN
F 1 "soft-button-4x" H 10725 6225 60  0000 C CNN
F 2 "open-automation:soft-button-4" H 10275 6675 60  0001 C CNN
F 3 "" H 10275 6675 60  0001 C CNN
	1    10275 6675
	1    0    0    -1  
$EndComp
Wire Wire Line
	7975 5850 7975 6000
Connection ~ 7975 6850
Wire Wire Line
	7975 6750 7975 6850
Wire Wire Line
	7975 6300 7975 6450
Wire Wire Line
	10375 6225 10375 6275
Wire Wire Line
	9825 6775 9875 6775
Wire Wire Line
	10375 7275 10375 7325
Wire Wire Line
	10925 6775 10875 6775
Wire Wire Line
	8225 6850 7975 6850
$Comp
L liger-rescue:SW_PUSH PROG?
U 1 1 5D252D2D
P 7075 7250
AR Path="/59092AD4/5D252D2D" Ref="PROG?"  Part="1" 
AR Path="/5D252D2D" Ref="PROG?"  Part="1" 
F 0 "PROG?" V 7300 7450 50  0000 C CNN
F 1 "SW_PUSH" H 7075 7170 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_KMR2" H 7075 7250 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/60/KMR2_9aug12-25127.pdf" H 7075 7250 50  0001 C CNN
F 4 "KMR211NG LFS" H 7075 7250 60  0001 C CNN "Part Number"
	1    7075 7250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D252D33
P 7075 7625
AR Path="/59092AD4/5D252D33" Ref="#PWR?"  Part="1" 
AR Path="/5D252D33" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7075 7375 50  0001 C CNN
F 1 "GND" H 7075 7475 50  0000 C CNN
F 2 "" H 7075 7625 50  0000 C CNN
F 3 "" H 7075 7625 50  0000 C CNN
	1    7075 7625
	1    0    0    -1  
$EndComp
Wire Wire Line
	7075 5850 7075 6000
Connection ~ 7075 6850
Wire Wire Line
	7075 6750 7075 6850
Wire Wire Line
	7075 6300 7075 6450
Wire Wire Line
	7325 6850 7075 6850
Wire Wire Line
	7075 7550 7075 7625
Wire Wire Line
	7975 7550 7975 7625
$Comp
L liger-rescue:SW_PUSH FACTORY?
U 1 1 5D252D41
P 6025 7250
AR Path="/59092AD4/5D252D41" Ref="FACTORY?"  Part="1" 
AR Path="/5D252D41" Ref="FACTORY?"  Part="1" 
F 0 "FACTORY?" V 6250 7450 50  0000 C CNN
F 1 "SW_PUSH" H 6025 7170 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_KMR2" H 6025 7250 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/60/KMR2_9aug12-25127.pdf" H 6025 7250 50  0001 C CNN
F 4 "KMR211NG LFS" H 6025 7250 60  0001 C CNN "Part Number"
	1    6025 7250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D252D47
P 6025 7625
AR Path="/59092AD4/5D252D47" Ref="#PWR?"  Part="1" 
AR Path="/5D252D47" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6025 7375 50  0001 C CNN
F 1 "GND" H 6025 7475 50  0000 C CNN
F 2 "" H 6025 7625 50  0000 C CNN
F 3 "" H 6025 7625 50  0000 C CNN
	1    6025 7625
	1    0    0    -1  
$EndComp
Wire Wire Line
	6025 5850 6025 6000
Connection ~ 6025 6850
Wire Wire Line
	6025 6750 6025 6850
Wire Wire Line
	6025 6300 6025 6450
Wire Wire Line
	6275 6850 6025 6850
Wire Wire Line
	6025 7550 6025 7625
$Comp
L power:GND #PWR?
U 1 1 5D252D53
P 6500 8550
AR Path="/59092AD4/5D252D53" Ref="#PWR?"  Part="1" 
AR Path="/5D252D53" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6500 8300 50  0001 C CNN
F 1 "GND" H 6500 8400 50  0000 C CNN
F 2 "" H 6500 8550 50  0000 C CNN
F 3 "" H 6500 8550 50  0000 C CNN
	1    6500 8550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D252D59
P 7100 8550
AR Path="/59092AD4/5D252D59" Ref="#PWR?"  Part="1" 
AR Path="/5D252D59" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7100 8300 50  0001 C CNN
F 1 "GND" H 7100 8400 50  0000 C CNN
F 2 "" H 7100 8550 50  0000 C CNN
F 3 "" H 7100 8550 50  0000 C CNN
	1    7100 8550
	-1   0    0    1   
$EndComp
$Comp
L liger-rescue:Conn_02x08_Odd_Even J?
U 1 1 5D252D5F
P 6750 8900
AR Path="/59092AD4/5D252D5F" Ref="J?"  Part="1" 
AR Path="/5D252D5F" Ref="J?"  Part="1" 
F 0 "J?" H 6800 9300 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 6800 8400 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 6750 8900 50  0001 C CNN
F 3 "" H 6750 8900 50  0001 C CNN
	1    6750 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 8550 6500 8600
Wire Wire Line
	6500 8600 6550 8600
Wire Wire Line
	7050 8600 7100 8600
Wire Wire Line
	7100 8600 7100 8550
Wire Wire Line
	7975 6850 7975 6950
Wire Wire Line
	7075 6850 7075 6950
Wire Wire Line
	6025 6850 6025 6950
Text HLabel 6500 8800 0    60   Input ~ 0
V_BAT
Text HLabel 6500 8900 0    60   Input ~ 0
3V3
Text HLabel 6500 9000 0    60   Input ~ 0
ZERO_DETECT
Text HLabel 7100 9200 2    60   Output ~ 0
RELAY_2
Text HLabel 6500 9300 0    60   Input ~ 0
PROG
Text HLabel 7100 8700 2    60   Input ~ 0
V_USB
Text HLabel 7100 8800 2    60   Output ~ 0
TXD
Text HLabel 7100 8900 2    60   Input ~ 0
RXD
Text HLabel 7100 9100 2    60   Output ~ 0
RELAY_3
Text HLabel 7100 9300 2    60   Output ~ 0
RELAY_1
Text HLabel 9225 8825 0    60   Input ~ 0
BUTTON_LED
Text HLabel 6025 5850 1    60   Input ~ 0
3V3
Text HLabel 7075 5850 1    60   Input ~ 0
3V3
Text HLabel 7975 5850 1    60   Input ~ 0
3V3
Text HLabel 9825 6775 0    60   Input ~ 0
T_LEFT
Text HLabel 10375 6225 1    60   Input ~ 0
T_UP
Text HLabel 10925 6775 2    60   Input ~ 0
T_RIGHT
Text HLabel 10375 7325 3    60   Input ~ 0
T_DOWN
Text HLabel 7325 6850 2    60   Input ~ 0
PROG
Text HLabel 6275 6850 2    60   Input ~ 0
FACTORY_RST
Text HLabel 8225 6850 2    60   Input ~ 0
EN
Wire Wire Line
	9225 8825 9425 8825
Wire Wire Line
	9725 9125 9725 9225
$Comp
L open-automation:GND #PWR?
U 1 1 5D252D83
P 9725 9225
AR Path="/59092AD4/5D252D83" Ref="#PWR?"  Part="1" 
AR Path="/5D252D83" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9725 8975 50  0001 C CNN
F 1 "GND" H 9730 9052 50  0000 C CNN
F 2 "" H 9725 9225 50  0000 C CNN
F 3 "" H 9725 9225 50  0000 C CNN
	1    9725 9225
	1    0    0    -1  
$EndComp
Text HLabel 9725 8325 1    60   Input ~ 0
V_IN
$Comp
L open-automation:GND #PWR?
U 1 1 5D252D8A
P 10150 8450
AR Path="/59092AD4/5D252D8A" Ref="#PWR?"  Part="1" 
AR Path="/5D252D8A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10150 8200 50  0001 C CNN
F 1 "GND" V 10100 8300 50  0000 C CNN
F 2 "" H 10150 8450 50  0000 C CNN
F 3 "" H 10150 8450 50  0000 C CNN
	1    10150 8450
	0    -1   -1   0   
$EndComp
$Comp
L open-automation:C_1uF C?
U 1 1 5D252D91
P 9900 8450
AR Path="/59092AD4/5D252D91" Ref="C?"  Part="1" 
AR Path="/5D252D91" Ref="C?"  Part="1" 
F 0 "C?" V 9950 8575 50  0000 C CNN
F 1 "C_1uF" V 9850 8600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10000 8750 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/tdk-corporation/CGA3E1X7R1C105M080AC/445-12540-1-ND/3954206" H 9900 8200 50  0001 C CNN
F 4 "CL10B105KP8NNNC" H 10025 8650 60  0001 C CNN "Part Number"
	1    9900 8450
	0    1    1    0   
$EndComp
$Comp
L open-automation:R_1k R?
U 1 1 5D252D98
P 7075 6600
AR Path="/59092AD4/5D252D98" Ref="R?"  Part="1" 
AR Path="/5D252D98" Ref="R?"  Part="1" 
F 0 "R?" H 7145 6646 50  0000 L CNN
F 1 "R_1k" H 7145 6555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7005 6600 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEYJ102V/P1.0KGDKR-ND/577615" V 7155 6600 50  0001 C CNN
F 4 "ESR03EZPJ102" V 7255 6700 60  0001 C CNN "Part Number"
	1    7075 6600
	1    0    0    -1  
$EndComp
$Comp
L open-automation:R_1k R?
U 1 1 5D252D9F
P 7975 6600
AR Path="/59092AD4/5D252D9F" Ref="R?"  Part="1" 
AR Path="/5D252D9F" Ref="R?"  Part="1" 
F 0 "R?" H 8045 6646 50  0000 L CNN
F 1 "R_1k" H 8045 6555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7905 6600 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEYJ102V/P1.0KGDKR-ND/577615" V 8055 6600 50  0001 C CNN
F 4 "ESR03EZPJ102" V 8155 6700 60  0001 C CNN "Part Number"
	1    7975 6600
	1    0    0    -1  
$EndComp
$Comp
L open-automation:R_1k R?
U 1 1 5D252DA6
P 6025 6600
AR Path="/59092AD4/5D252DA6" Ref="R?"  Part="1" 
AR Path="/5D252DA6" Ref="R?"  Part="1" 
F 0 "R?" H 6095 6646 50  0000 L CNN
F 1 "R_1k" H 6095 6555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5955 6600 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-3GEYJ102V/P1.0KGDKR-ND/577615" V 6105 6600 50  0001 C CNN
F 4 "ESR03EZPJ102" V 6205 6700 60  0001 C CNN "Part Number"
	1    6025 6600
	1    0    0    -1  
$EndComp
$Comp
L open-automation:LED-0603-G D?
U 1 1 5D252DAD
P 6025 6150
AR Path="/59092AD4/5D252DAD" Ref="D?"  Part="1" 
AR Path="/5D252DAD" Ref="D?"  Part="1" 
F 0 "D?" V 6063 6033 50  0000 R CNN
F 1 "LED-0603-G" V 5972 6033 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5925 6150 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/rohm-semiconductor/SML-D12M8WT86/511-1578-1-ND/1641810" H 6025 6250 50  0001 C CNN
F 4 "SML-D12M8WT86" H 6125 6350 50  0001 C CNN "Part Number"
	1    6025 6150
	0    -1   -1   0   
$EndComp
$Comp
L open-automation:LED-0603-G D?
U 1 1 5D252DB4
P 7075 6150
AR Path="/59092AD4/5D252DB4" Ref="D?"  Part="1" 
AR Path="/5D252DB4" Ref="D?"  Part="1" 
F 0 "D?" V 7113 6033 50  0000 R CNN
F 1 "LED-0603-G" V 7022 6033 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6975 6150 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/rohm-semiconductor/SML-D12M8WT86/511-1578-1-ND/1641810" H 7075 6250 50  0001 C CNN
F 4 "SML-D12M8WT86" H 7175 6350 50  0001 C CNN "Part Number"
	1    7075 6150
	0    -1   -1   0   
$EndComp
$Comp
L open-automation:LED-0603-G D?
U 1 1 5D252DBB
P 7975 6150
AR Path="/59092AD4/5D252DBB" Ref="D?"  Part="1" 
AR Path="/5D252DBB" Ref="D?"  Part="1" 
F 0 "D?" V 8013 6033 50  0000 R CNN
F 1 "LED-0603-G" V 7922 6033 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7875 6150 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/rohm-semiconductor/SML-D12M8WT86/511-1578-1-ND/1641810" H 7975 6250 50  0001 C CNN
F 4 "SML-D12M8WT86" H 8075 6350 50  0001 C CNN "Part Number"
	1    7975 6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9725 8450 9725 8525
Connection ~ 9725 8450
Wire Wire Line
	9750 8450 9725 8450
Wire Wire Line
	10050 8450 10150 8450
$Comp
L LED:WS2812B D?
U 1 1 5D252DC5
P 9725 8825
AR Path="/59092AD4/5D252DC5" Ref="D?"  Part="1" 
AR Path="/5D252DC5" Ref="D?"  Part="1" 
F 0 "D?" H 10066 8871 50  0000 L CNN
F 1 "WS2812B" H 10066 8780 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 9775 8525 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 9825 8450 50  0001 L TNN
	1    9725 8825
	1    0    0    -1  
$EndComp
Wire Wire Line
	9725 8325 9725 8450
$Comp
L liger-rescue:housing-mounts-open-automation U?
U 1 1 5D252DCC
P 11725 5800
AR Path="/59092AD4/5D252DCC" Ref="U?"  Part="1" 
AR Path="/5D252DCC" Ref="U?"  Part="1" 
F 0 "U?" H 12003 5853 60  0000 L CNN
F 1 "housing-mounts" H 12003 5747 60  0000 L CNN
F 2 "open-automation:generic-housing-mounts-md" H 11925 5600 60  0001 C CNN
F 3 "" H 11725 5850 60  0001 C CNN
	1    11725 5800
	1    0    0    -1  
$EndComp
$Comp
L open-automation:GND #PWR?
U 1 1 5D252DD2
P 11350 5825
AR Path="/59092AD4/5D252DD2" Ref="#PWR?"  Part="1" 
AR Path="/5D252DD2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 11350 5575 50  0001 C CNN
F 1 "GND" H 11355 5652 50  0000 C CNN
F 2 "" H 11350 5825 50  0000 C CNN
F 3 "" H 11350 5825 50  0000 C CNN
	1    11350 5825
	1    0    0    -1  
$EndComp
Wire Wire Line
	11350 5825 11350 5800
Wire Wire Line
	11350 5800 11375 5800
Text HLabel 7100 9000 2    60   Output ~ 0
RELAY_4
Wire Wire Line
	7100 9000 7050 9000
Wire Wire Line
	7100 8900 7050 8900
Wire Wire Line
	7050 8800 7100 8800
Wire Wire Line
	7100 8700 7050 8700
Wire Wire Line
	7050 9100 7100 9100
Wire Wire Line
	7100 9200 7050 9200
Wire Wire Line
	7050 9300 7100 9300
Wire Wire Line
	6550 8700 6500 8700
Wire Wire Line
	6500 8700 6500 8600
Connection ~ 6500 8600
Wire Wire Line
	6500 8800 6550 8800
Wire Wire Line
	6550 8900 6500 8900
Wire Wire Line
	6500 9000 6550 9000
Wire Wire Line
	6550 9100 6500 9100
Wire Wire Line
	6500 9200 6550 9200
Wire Wire Line
	6550 9300 6500 9300
Text HLabel 6500 9200 0    60   Input ~ 0
I2S_BCLK
Text HLabel 6500 9100 0    60   Input ~ 0
I2S_WS
$Comp
L power:GND #PWR?
U 1 1 5D25DC6E
P 11650 3200
AR Path="/59B5F4CB/5D25DC6E" Ref="#PWR?"  Part="1" 
AR Path="/5D25DC6E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 11650 2950 50  0001 C CNN
F 1 "GND" H 11650 3050 50  0000 C CNN
F 2 "" H 11650 3200 50  0000 C CNN
F 3 "" H 11650 3200 50  0000 C CNN
	1    11650 3200
	1    0    0    -1  
$EndComp
$Comp
L liger-rescue:R_100k R?
U 1 1 5D25DC75
P 13000 3100
AR Path="/59B5F4CB/5D25DC75" Ref="R?"  Part="1" 
AR Path="/5D25DC75" Ref="R?"  Part="1" 
F 0 "R?" V 13000 3100 50  0000 C CNN
F 1 "R_100k" V 12900 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 12930 3100 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0603JR-07100KL/311-100KGRCT-ND/729645" V 13080 3100 50  0001 C CNN
F 4 "ERA-3AEB104V" V 13180 3200 60  0001 C CNN "Part Number"
	1    13000 3100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D25DC7B
P 13000 3300
AR Path="/59B5F4CB/5D25DC7B" Ref="#PWR?"  Part="1" 
AR Path="/5D25DC7B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 13000 3050 50  0001 C CNN
F 1 "GND" H 13000 3150 50  0000 C CNN
F 2 "" H 13000 3300 50  0000 C CNN
F 3 "" H 13000 3300 50  0000 C CNN
	1    13000 3300
	1    0    0    -1  
$EndComp
Text HLabel 11400 2800 0    60   Input ~ 0
3V3
Text HLabel 13150 2900 2    60   Input ~ 0
PIR
Wire Wire Line
	13000 2950 13000 2900
Wire Wire Line
	13000 2900 13150 2900
Wire Wire Line
	13000 3300 13000 3250
$Comp
L open-automation:C_0.1uF C?
U 1 1 5D25DC87
P 11550 3000
AR Path="/59B5F4CB/5D25DC87" Ref="C?"  Part="1" 
AR Path="/5D25DC87" Ref="C?"  Part="1" 
F 0 "C?" H 11450 3100 50  0000 L CNN
F 1 "C_0.1uF" H 11250 2900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 11650 3300 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/tdk-corporation/C1608X8R1H104K080AB/445-8818-1-ND/3248223" H 11550 2750 50  0001 C CNN
F 4 "CL10F104ZO8NNNC" H 11675 3200 60  0001 C CNN "Part Number"
	1    11550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 2800 11550 2800
Wire Wire Line
	11550 2850 11550 2800
Connection ~ 11550 2800
Wire Wire Line
	11550 2800 11750 2800
Wire Wire Line
	11550 3150 11650 3150
Wire Wire Line
	11650 3200 11650 3150
Connection ~ 11650 3150
Wire Wire Line
	11650 3150 11750 3150
$Comp
L open-automation:C_100pF C?
U 1 1 5D25DC96
P 12450 3150
AR Path="/59B5F4CB/5D25DC96" Ref="C?"  Part="1" 
AR Path="/5D25DC96" Ref="C?"  Part="1" 
F 0 "C?" H 12500 3250 50  0000 L CNN
F 1 "C_100pF" H 12500 3050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 12550 3450 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/avx-corporation/06035A101FAT2A/478-6202-1-ND/2391401" H 12450 2900 50  0001 C CNN
F 4 "06035A101FAT2A" H 12575 3350 60  0001 C CNN "Part Number"
	1    12450 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	12350 2900 12450 2900
Wire Wire Line
	12450 3000 12450 2900
$Comp
L power:GND #PWR?
U 1 1 5D25DC9E
P 12450 3350
AR Path="/59B5F4CB/5D25DC9E" Ref="#PWR?"  Part="1" 
AR Path="/5D25DC9E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 12450 3100 50  0001 C CNN
F 1 "GND" H 12450 3200 50  0000 C CNN
F 2 "" H 12450 3350 50  0000 C CNN
F 3 "" H 12450 3350 50  0000 C CNN
	1    12450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	12450 3300 12450 3350
Wire Wire Line
	11750 3150 11750 3000
$Comp
L open-automation:PYQ2898 U?
U 1 1 5D25DCA7
P 12000 2850
AR Path="/5D25DCA7" Ref="U?"  Part="1" 
AR Path="/59B5F4CB/5D25DCA7" Ref="U?"  Part="1" 
F 0 "U?" H 12200 2600 60  0000 C CNN
F 1 "PYQ2898" H 12050 3000 60  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-5-3" H 12000 2850 60  0001 C CNN
F 3 "" H 12000 2850 60  0001 C CNN
F 4 "PYQ2898" H 12000 2850 50  0001 C CNN "Part Number"
	1    12000 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13000 2900 12450 2900
Connection ~ 13000 2900
Connection ~ 12450 2900
$Comp
L power:GND #PWR?
U 1 1 5D26FE24
P 3975 2175
F 0 "#PWR?" H 3975 1925 50  0001 C CNN
F 1 "GND" H 3975 2025 50  0000 C CNN
F 2 "" H 3975 2175 50  0000 C CNN
F 3 "" H 3975 2175 50  0000 C CNN
	1    3975 2175
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D26FE2A
P 2350 2150
F 0 "#PWR?" H 2350 1900 50  0001 C CNN
F 1 "GND" H 2350 2000 50  0000 C CNN
F 2 "" H 2350 2150 50  0000 C CNN
F 3 "" H 2350 2150 50  0000 C CNN
	1    2350 2150
	1    0    0    -1  
$EndComp
Connection ~ 2350 1750
Wire Wire Line
	2350 2150 2350 2100
Wire Wire Line
	2200 1750 2350 1750
Wire Wire Line
	3975 2175 3975 2125
$Comp
L liger-rescue:AP2112 U?
U 1 1 5D26FE35
P 3200 1825
F 0 "U?" H 3375 1650 60  0000 C CNN
F 1 "AP2112" H 3200 2025 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 3200 1500 60  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/diodes-incorporated/AP2112K-3.3TRG1/AP2112K-3.3TRG1DICT-ND/4505257" H 3200 1400 60  0001 C CNN
F 4 "AP2112K-3.3TRG1" H 3200 2125 60  0001 C CNN "Part Number"
	1    3200 1825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D26FE3B
P 3700 1950
F 0 "#PWR?" H 3700 1700 50  0001 C CNN
F 1 "GND" H 3700 1800 50  0000 C CNN
F 2 "" H 3700 1950 50  0000 C CNN
F 3 "" H 3700 1950 50  0000 C CNN
	1    3700 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1900 3700 1900
Wire Wire Line
	3700 1900 3700 1950
Wire Wire Line
	3975 1750 3975 1825
Wire Wire Line
	3650 1750 3975 1750
Wire Wire Line
	2700 1900 2750 1900
Connection ~ 2700 1750
Connection ~ 3975 1750
Wire Wire Line
	2350 1750 2700 1750
Wire Wire Line
	2350 1750 2350 1800
Wire Wire Line
	2700 1750 2700 1900
Wire Wire Line
	2700 1750 2750 1750
Wire Wire Line
	3975 1750 4100 1750
Text HLabel 2200 1750 0    60   Input ~ 0
V_USB
Text HLabel 4100 1750 2    60   Output ~ 0
3V3
$Comp
L open-automation:C_1uF C?
U 1 1 5D26FE50
P 3975 1975
F 0 "C?" H 4090 2021 50  0000 L CNN
F 1 "C_1uF" H 4090 1930 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4075 2275 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/tdk-corporation/CGA3E1X7R1C105M080AC/445-12540-1-ND/3954206" H 3975 1725 50  0001 C CNN
F 4 "CL10B105KP8NNNC" H 4100 2175 60  0001 C CNN "Part Number"
	1    3975 1975
	1    0    0    -1  
$EndComp
$Comp
L open-automation:C_1uF C?
U 1 1 5D26FE57
P 2350 1950
F 0 "C?" H 2465 1996 50  0000 L CNN
F 1 "C_1uF" H 2465 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2450 2250 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/tdk-corporation/CGA3E1X7R1C105M080AC/445-12540-1-ND/3954206" H 2350 1700 50  0001 C CNN
F 4 "CL10B105KP8NNNC" H 2475 2150 60  0001 C CNN "Part Number"
	1    2350 1950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
