EESchema Schematic File Version 4
LIBS:liger-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR012
U 1 1 5909DD67
P 6375 3125
F 0 "#PWR012" H 6375 2875 50  0001 C CNN
F 1 "GND" H 6375 2975 50  0000 C CNN
F 2 "" H 6375 3125 50  0000 C CNN
F 3 "" H 6375 3125 50  0000 C CNN
	1    6375 3125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 59A4BAA9
P 4750 3100
F 0 "#PWR013" H 4750 2850 50  0001 C CNN
F 1 "GND" H 4750 2950 50  0000 C CNN
F 2 "" H 4750 3100 50  0000 C CNN
F 3 "" H 4750 3100 50  0000 C CNN
	1    4750 3100
	1    0    0    -1  
$EndComp
Text Label 4750 1400 0    394  ~ 0
Power
Connection ~ 4750 2700
Wire Wire Line
	4750 3100 4750 3050
Wire Wire Line
	4600 2700 4750 2700
Wire Wire Line
	6375 3125 6375 3075
$Comp
L liger-rescue:AP2112 U9
U 1 1 5A164E45
P 5600 2775
F 0 "U9" H 5775 2600 60  0000 C CNN
F 1 "AP2112" H 5600 2975 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 5600 2450 60  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/diodes-incorporated/AP2112K-3.3TRG1/AP2112K-3.3TRG1DICT-ND/4505257" H 5600 2350 60  0001 C CNN
F 4 "AP2112K-3.3TRG1" H 5600 3075 60  0001 C CNN "Part Number"
	1    5600 2775
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5A1650D9
P 6100 2900
F 0 "#PWR018" H 6100 2650 50  0001 C CNN
F 1 "GND" H 6100 2750 50  0000 C CNN
F 2 "" H 6100 2900 50  0000 C CNN
F 3 "" H 6100 2900 50  0000 C CNN
	1    6100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2850 6100 2850
Wire Wire Line
	6100 2850 6100 2900
Wire Wire Line
	6375 2700 6375 2775
Wire Wire Line
	6050 2700 6375 2700
Wire Wire Line
	5100 2850 5150 2850
Connection ~ 5100 2700
Connection ~ 6375 2700
Wire Wire Line
	4750 2700 5100 2700
Wire Wire Line
	4750 2700 4750 2750
Wire Wire Line
	5100 2700 5100 2850
Wire Wire Line
	5100 2700 5150 2700
Wire Wire Line
	6375 2700 6500 2700
Text HLabel 4600 2700 0    60   Input ~ 0
V_USB
Text HLabel 6500 2700 2    60   Output ~ 0
3V3
$Comp
L open-automation:C_1uF C8
U 1 1 5B1EEF77
P 6375 2925
F 0 "C8" H 6490 2971 50  0000 L CNN
F 1 "C_1uF" H 6490 2880 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6475 3225 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/tdk-corporation/CGA3E1X7R1C105M080AC/445-12540-1-ND/3954206" H 6375 2675 50  0001 C CNN
F 4 "CL10B105KP8NNNC" H 6500 3125 60  0001 C CNN "Part Number"
	1    6375 2925
	1    0    0    -1  
$EndComp
$Comp
L open-automation:C_1uF C7
U 1 1 5B1EF368
P 4750 2900
F 0 "C7" H 4865 2946 50  0000 L CNN
F 1 "C_1uF" H 4865 2855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4850 3200 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/tdk-corporation/CGA3E1X7R1C105M080AC/445-12540-1-ND/3954206" H 4750 2650 50  0001 C CNN
F 4 "CL10B105KP8NNNC" H 4875 3100 60  0001 C CNN "Part Number"
	1    4750 2900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
