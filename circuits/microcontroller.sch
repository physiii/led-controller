EESchema Schematic File Version 4
LIBS:led-controller-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 4200 1025 0    197  ~ 0
Microcontroller
Text Label 8225 3675 0    60   ~ 0
Temp-Humidty
Wire Wire Line
	7650 4000 7650 4050
Text HLabel 1600 1050 0    60   Input ~ 0
3V3
Text Label 1650 1050 0    50   ~ 0
3V3
Wire Wire Line
	1650 1050 1600 1050
Text Label 4550 3150 2    50   ~ 0
3V3
Wire Wire Line
	4550 3150 4600 3150
Wire Wire Line
	4550 3000 4550 3050
Wire Wire Line
	4550 3050 4600 3050
Text Label 4550 3250 2    50   ~ 0
EN
Wire Wire Line
	4550 3250 4600 3250
Text Label 2050 3950 2    50   ~ 0
EN
Wire Wire Line
	2050 4650 2050 4600
Wire Wire Line
	2050 3900 2050 4000
Text Label 2050 3100 2    50   ~ 0
3V3
Wire Wire Line
	2050 3100 2050 3150
Wire Wire Line
	2050 3500 2050 3450
Text Label 2650 3950 2    50   ~ 0
PROG
Wire Wire Line
	2650 4650 2650 4600
Wire Wire Line
	2650 3900 2650 4000
Text Label 2650 3100 2    50   ~ 0
3V3
Wire Wire Line
	2650 3100 2650 3150
Text Label 3200 3950 2    50   ~ 0
FACT
Wire Wire Line
	3200 4650 3200 4600
Wire Wire Line
	3200 3900 3200 4000
Text Label 3200 3100 2    50   ~ 0
3V3
Wire Wire Line
	3200 3100 3200 3150
Wire Wire Line
	3200 3500 3200 3450
Text Label 6400 4350 0    50   ~ 0
PROG
Wire Wire Line
	6400 4350 6350 4350
Text Label 4550 4350 2    50   ~ 0
FACT
Wire Wire Line
	4550 4350 4600 4350
Text Label 6400 3750 0    50   ~ 0
SDA
Text Label 6400 3650 0    50   ~ 0
SCL
Wire Wire Line
	6400 3650 6350 3650
Wire Wire Line
	6400 3750 6350 3750
Text Label 6400 3300 0    50   ~ 0
RXD
Wire Wire Line
	6400 3300 6350 3300
Text Label 6400 3200 0    50   ~ 0
TXD
Wire Wire Line
	6400 3200 6350 3200
Text Label 4550 1950 0    50   ~ 0
SDA
Wire Wire Line
	4550 1950 4500 1950
Text Label 4550 1800 0    50   ~ 0
SCL
Text Label 3400 1600 0    50   ~ 0
3V3
Text Label 4050 1800 2    50   ~ 0
3V3
Wire Wire Line
	4550 1800 4500 1800
Wire Wire Line
	4050 1800 4100 1800
Wire Wire Line
	4050 1950 4100 1950
Text Label 3100 1600 2    50   ~ 0
3V3
Wire Wire Line
	3100 2000 3100 1950
Wire Wire Line
	3100 1650 3100 1600
Wire Wire Line
	3400 1600 3400 1650
Wire Wire Line
	3400 1950 3400 2000
Text Label 4050 1950 2    50   ~ 0
3V3
Text Label 9050 4000 0    50   ~ 0
SDA
Wire Wire Line
	9050 4000 9000 4000
Text Label 9050 3900 0    50   ~ 0
SCL
Wire Wire Line
	9050 3900 9000 3900
Wire Wire Line
	8100 4050 8100 4000
Wire Wire Line
	8100 4000 8150 4000
Text Label 7650 3650 2    50   ~ 0
3V3
Wire Wire Line
	7650 3650 7650 3700
Text Label 8100 3900 2    50   ~ 0
3V3
Wire Wire Line
	8100 3900 8150 3900
$Comp
L led-controller-rescue:GND-open-automation #PWR011
U 1 1 5CC8CF13
P 3100 2000
F 0 "#PWR011" H 3100 1750 50  0001 C CNN
F 1 "GND" H 3100 1850 50  0000 C CNN
F 2 "" H 3100 2000 50  0000 C CNN
F 3 "" H 3100 2000 50  0000 C CNN
	1    3100 2000
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR013
U 1 1 5CC8C67A
P 3400 2000
F 0 "#PWR013" H 3400 1750 50  0001 C CNN
F 1 "GND" H 3400 1850 50  0000 C CNN
F 2 "" H 3400 2000 50  0000 C CNN
F 3 "" H 3400 2000 50  0000 C CNN
	1    3400 2000
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR014
U 1 1 59097974
P 4550 3000
F 0 "#PWR014" H 4550 2750 50  0001 C CNN
F 1 "GND" H 4550 2850 50  0000 C CNN
F 2 "" H 4550 3000 50  0000 C CNN
F 3 "" H 4550 3000 50  0000 C CNN
	1    4550 3000
	-1   0    0    1   
$EndComp
$Comp
L led-controller-rescue:ESP-WROOM-32-open-automation U3
U 1 1 5AFA4EFB
P 5500 3700
F 0 "U3" H 6100 2650 60  0000 C CNN
F 1 "ESP-WROOM-32" H 5500 4500 60  0000 C CNN
F 2 "open-automation:ESP-WROOM-32" H 5150 4300 60  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp_wroom_32_datasheet_en.pdf" H 5150 4300 60  0001 C CNN
F 4 "ESP-WROOM-32" H 0   0   50  0001 C CNN "Part Number"
	1    5500 3700
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR012
U 1 1 5CC69861
P 3200 4650
F 0 "#PWR012" H 3200 4400 50  0001 C CNN
F 1 "GND" H 3200 4500 50  0000 C CNN
F 2 "" H 3200 4650 50  0000 C CNN
F 3 "" H 3200 4650 50  0000 C CNN
	1    3200 4650
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:SW_PUSH-open-automation SW?
U 1 1 5CC69855
P 3200 4300
AR Path="/5ABD187E/5CC69855" Ref="SW?"  Part="1" 
AR Path="/5A7BADDB/5CC69855" Ref="SW?"  Part="1" 
AR Path="/5D2CEC1B/5CC69855" Ref="FACT1"  Part="1" 
F 0 "FACT1" H 3200 4475 50  0000 C CNN
F 1 "SW_PUSH" H 3175 4200 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_CK_KMR2" H 3200 4300 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1479/kmr2.pdf" H 3200 4300 50  0001 C CNN
F 4 "KMR211NG LFS" H 3200 4300 60  0001 C CNN "Part Number"
F 5 "https://www.digikey.com/product-detail/en/c-k/KMR211NG-LFS/CKN10243CT-ND/2176494" H 0   0   50  0001 C CNN "Website"
	1    3200 4300
	0    1    1    0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR010
U 1 1 5CC68123
P 2650 4650
F 0 "#PWR010" H 2650 4400 50  0001 C CNN
F 1 "GND" H 2650 4500 50  0000 C CNN
F 2 "" H 2650 4650 50  0000 C CNN
F 3 "" H 2650 4650 50  0000 C CNN
	1    2650 4650
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:SW_PUSH-open-automation SW?
U 1 1 5CC68117
P 2650 4300
AR Path="/5ABD187E/5CC68117" Ref="SW?"  Part="1" 
AR Path="/5A7BADDB/5CC68117" Ref="SW?"  Part="1" 
AR Path="/5D2CEC1B/5CC68117" Ref="PROG1"  Part="1" 
F 0 "PROG1" H 2650 4475 50  0000 C CNN
F 1 "SW_PUSH" H 2625 4200 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_CK_KMR2" H 2650 4300 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1479/kmr2.pdf" H 2650 4300 50  0001 C CNN
F 4 "KMR211NG LFS" H 2650 4300 60  0001 C CNN "Part Number"
F 5 "https://www.digikey.com/product-detail/en/c-k/KMR211NG-LFS/CKN10243CT-ND/2176494" H 0   0   50  0001 C CNN "Website"
	1    2650 4300
	0    1    1    0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR09
U 1 1 5CC89C27
P 2050 4650
F 0 "#PWR09" H 2050 4400 50  0001 C CNN
F 1 "GND" H 2050 4500 50  0000 C CNN
F 2 "" H 2050 4650 50  0000 C CNN
F 3 "" H 2050 4650 50  0000 C CNN
	1    2050 4650
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:SW_PUSH-open-automation SW?
U 1 1 5CC89C1F
P 2050 4300
AR Path="/5ABD187E/5CC89C1F" Ref="SW?"  Part="1" 
AR Path="/5A7BADDB/5CC89C1F" Ref="SW?"  Part="1" 
AR Path="/5D2CEC1B/5CC89C1F" Ref="RESET1"  Part="1" 
F 0 "RESET1" H 2050 4475 50  0000 C CNN
F 1 "SW_PUSH" H 2025 4200 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_CK_KMR2" H 2050 4300 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1479/kmr2.pdf" H 2050 4300 50  0001 C CNN
F 4 "KMR211NG LFS" H 2050 4300 60  0001 C CNN "Part Number"
F 5 "https://www.digikey.com/product-detail/en/c-k/KMR211NG-LFS/CKN10243CT-ND/2176494" H 0   0   50  0001 C CNN "Website"
	1    2050 4300
	0    1    1    0   
$EndComp
$Comp
L led-controller-rescue:C_0.1uF-open-automation C?
U 1 1 5CC805AD
P 7650 3850
AR Path="/5A8CA1FA/5CC805AD" Ref="C?"  Part="1" 
AR Path="/5A7BADDB/5CC805AD" Ref="C?"  Part="1" 
AR Path="/5D2CEC1B/5CC805AD" Ref="C6"  Part="1" 
F 0 "C6" H 7400 3850 50  0000 L CNN
F 1 "C_0.1uF" H 7350 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7750 4150 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/tdk-corporation/C1608X8R1H104K080AB/445-8818-1-ND/3248223" H 7650 3600 50  0001 C CNN
F 4 "C1608X8R1H104K080AB" H 7775 4050 60  0001 C CNN "Part Number"
	1    7650 3850
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:SI7020-A20-open-automation U?
U 1 1 5CC80592
P 8600 4000
AR Path="/5A8CA1FA/5CC80592" Ref="U?"  Part="1" 
AR Path="/5A7BADDB/5CC80592" Ref="U?"  Part="1" 
AR Path="/5D2CEC1B/5CC80592" Ref="U4"  Part="1" 
F 0 "U4" H 8800 3900 60  0000 C CNN
F 1 "SI7020-A20" H 8600 4200 60  0000 C CNN
F 2 "open-automation:SI7020-A20" H 8600 3700 60  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/silicon-labs/SI7020-A20-GM1R/336-3596-1-ND/5823452" H 8600 3800 60  0001 C CNN
F 4 "SI7020-A20-GM1R" H 8700 3800 60  0001 C CNN "Part Number"
	1    8600 4000
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5CC80583
P 8100 4050
AR Path="/5A8CA1FA/5CC80583" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5CC80583" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5CC80583" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 8100 3800 50  0001 C CNN
F 1 "GND" H 8100 3900 50  0000 C CNN
F 2 "" H 8100 4050 50  0000 C CNN
F 3 "" H 8100 4050 50  0000 C CNN
	1    8100 4050
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:C_1uF-open-automation C5
U 1 1 5B2CA474
P 3400 1800
F 0 "C5" H 3500 1800 50  0000 L CNN
F 1 "C_1uF" H 3400 1700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3500 2100 50  0001 C CNN
F 3 "https://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c03e.ashx?la=en-us" H 3400 1550 50  0001 C CNN
F 4 "GCM188R71C105KA64D" H 3525 2000 60  0001 C CNN "Part Number"
F 5 "https://www.digikey.com/product-detail/en/murata-electronics-north-america/GCM188R71C105KA64D/490-5241-1-ND/1979252" H 0   0   50  0001 C CNN "Website"
	1    3400 1800
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:C_10uF-open-automation C4
U 1 1 5B2706A8
P 3100 1800
F 0 "C4" H 2850 1800 50  0000 L CNN
F 1 "C_10uF" H 2800 1700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3200 2100 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/281/murata_03052018_GRM_Series_1-1310166.pdf" H 3100 1550 50  0001 C CNN
F 4 "GRM188R61E106KA73D" H 3225 2000 60  0001 C CNN "Part Number"
F 5 "https://www.mouser.com/ProductDetail/Murata-Electronics/GRM188R61E106KA73D?qs=sGAEpiMZZMs0AnBnWHyRQN7%2FAA2D2lPPadjwaUSKtHX%252BeURw46TYGA%3D%3D" H 0   0   50  0001 C CNN "Website"
	1    3100 1800
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:R_10K-open-automation R8
U 1 1 5CC267DD
P 4300 1950
F 0 "R8" V 4300 1950 50  0000 C CNN
F 1 "R_10K" V 4400 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4230 1950 50  0001 C CNN
F 3 "" V 4380 1950 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 4480 2050 60  0001 C CNN "Part Number"
	1    4300 1950
	0    1    1    0   
$EndComp
$Comp
L led-controller-rescue:R_10K-open-automation R7
U 1 1 5CC28727
P 4300 1800
F 0 "R7" V 4300 1800 50  0000 C CNN
F 1 "R_10K" V 4184 1800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4230 1800 50  0001 C CNN
F 3 "" V 4380 1800 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 4480 1900 60  0001 C CNN "Part Number"
	1    4300 1800
	0    1    1    0   
$EndComp
$Comp
L led-controller-rescue:R_10K-open-automation R6
U 1 1 5CC2B523
P 3200 3700
F 0 "R6" V 2993 3700 50  0000 C CNN
F 1 "R_10K" V 3084 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3130 3700 50  0001 C CNN
F 3 "" V 3280 3700 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 3380 3800 60  0001 C CNN "Part Number"
	1    3200 3700
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:R_10K-open-automation R5
U 1 1 5CC2D1AD
P 2650 3700
F 0 "R5" V 2443 3700 50  0000 C CNN
F 1 "R_10K" V 2534 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2580 3700 50  0001 C CNN
F 3 "" V 2730 3700 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 2830 3800 60  0001 C CNN "Part Number"
	1    2650 3700
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:R_10K-open-automation R4
U 1 1 5CC2EC19
P 2050 3700
F 0 "R4" V 1843 3700 50  0000 C CNN
F 1 "R_10K" V 1934 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1980 3700 50  0001 C CNN
F 3 "" V 2130 3700 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 2230 3800 60  0001 C CNN "Part Number"
	1    2050 3700
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:LED_G-open-automation D1
U 1 1 5CC255BE
P 2050 3300
F 0 "D1" V 2089 3183 50  0000 R CNN
F 1 "LED_G" V 1998 3183 50  0000 R CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2050 3300 50  0001 C CNN
F 3 "https://katalog.we-online.de/led/datasheet/150060VS75000.pdf" H 2050 3300 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/150060VS75000/732-4980-1-ND/4489904" H 2050 3300 50  0001 C CNN "Website"
F 5 " 150060VS75000" H 2050 3300 50  0001 C CNN "Part Number"
	1    2050 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 3450 2650 3500
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5CCAE63E
P 7650 4050
AR Path="/5A8CA1FA/5CCAE63E" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5CCAE63E" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5CCAE63E" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 7650 3800 50  0001 C CNN
F 1 "GND" H 7650 3900 50  0000 C CNN
F 2 "" H 7650 4050 50  0000 C CNN
F 3 "" H 7650 4050 50  0000 C CNN
	1    7650 4050
	1    0    0    -1  
$EndComp
Text Label 4550 3650 2    50   ~ 0
IO34
Wire Wire Line
	4550 3650 4600 3650
Text Label 4550 3750 2    50   ~ 0
IO35
Wire Wire Line
	4550 3750 4600 3750
Text Label 4550 3850 2    50   ~ 0
IO32
Wire Wire Line
	4550 3850 4600 3850
Text Label 4550 3950 2    50   ~ 0
IO33
Wire Wire Line
	4550 3950 4600 3950
Text Label 4550 4050 2    50   ~ 0
IO25
Wire Wire Line
	4550 4050 4600 4050
Text Label 4550 4150 2    50   ~ 0
IO26
Wire Wire Line
	4550 4150 4600 4150
Text Label 4550 4250 2    50   ~ 0
IO27
Wire Wire Line
	4550 4250 4600 4250
Text Label 6400 3550 0    50   ~ 0
IO22
Wire Wire Line
	6400 3550 6350 3550
Text Label 6400 3450 0    50   ~ 0
IO23
Wire Wire Line
	6400 3450 6350 3450
Text Label 6400 3850 0    50   ~ 0
IO18
Wire Wire Line
	6400 3850 6350 3850
Text Label 6400 4050 0    50   ~ 0
IO17
Wire Wire Line
	6400 4050 6350 4050
Text Label 6400 3950 0    50   ~ 0
IO5
Wire Wire Line
	6400 3950 6350 3950
Text Label 6400 4150 0    50   ~ 0
IO16
Wire Wire Line
	6400 4150 6350 4150
Text Label 6400 4250 0    50   ~ 0
IO4
Wire Wire Line
	6400 4250 6350 4250
Text Label 1650 1750 0    50   ~ 0
IO27
Wire Wire Line
	1650 1750 1600 1750
Text HLabel 1600 1750 0    60   Input ~ 0
IO27
Text Label 1650 1450 0    50   ~ 0
IO5
Wire Wire Line
	1650 1450 1600 1450
Text Label 1650 1350 0    50   ~ 0
IO4
Wire Wire Line
	1650 1350 1600 1350
Text HLabel 1600 1350 0    60   Input ~ 0
IO4
Text HLabel 1600 1450 0    60   Input ~ 0
IO5
Wire Wire Line
	1600 1550 1650 1550
Text HLabel 1600 1550 0    60   Input ~ 0
IO16
Text Label 1650 1550 0    50   ~ 0
IO16
Wire Wire Line
	1600 1650 1650 1650
Text HLabel 1600 1650 0    60   Input ~ 0
IO18
Text Label 1650 1650 0    50   ~ 0
IO18
Wire Wire Line
	1650 1150 1600 1150
Text Label 1650 1150 0    50   ~ 0
TXD
Wire Wire Line
	1650 1250 1600 1250
Text Label 1650 1250 0    50   ~ 0
RXD
Text HLabel 1600 1150 0    60   Input ~ 0
TXD
Text HLabel 1600 1250 0    60   Input ~ 0
RXD
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5D440C8C
P 6150 2450
AR Path="/5A8CA1FA/5D440C8C" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5D440C8C" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5D440C8C" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 6150 2200 50  0001 C CNN
F 1 "GND" H 6150 2300 50  0000 C CNN
F 2 "" H 6150 2450 50  0000 C CNN
F 3 "" H 6150 2450 50  0000 C CNN
	1    6150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2450 6150 2400
Wire Wire Line
	6150 2400 6200 2400
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5D4425CC
P 6750 2450
AR Path="/5A8CA1FA/5D4425CC" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5D4425CC" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5D4425CC" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 6750 2200 50  0001 C CNN
F 1 "GND" H 6750 2300 50  0000 C CNN
F 2 "" H 6750 2450 50  0000 C CNN
F 3 "" H 6750 2450 50  0000 C CNN
	1    6750 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2450 6750 2400
Wire Wire Line
	6750 2400 6700 2400
Text Label 6750 2100 0    50   ~ 0
SCL
Text Label 6750 2200 0    50   ~ 0
SDA
Wire Wire Line
	6750 2200 6700 2200
Wire Wire Line
	6700 2100 6750 2100
Text Label 6150 2300 2    50   ~ 0
3V3
Wire Wire Line
	6150 1800 6200 1800
Text Label 6150 2100 2    50   ~ 0
IO23
Text Label 6150 2200 2    50   ~ 0
IO22
Text Label 6750 2000 0    50   ~ 0
IO26
Wire Wire Line
	6750 2000 6700 2000
Wire Wire Line
	6200 2100 6150 2100
Wire Wire Line
	6150 2200 6200 2200
Text Label 6750 1900 0    50   ~ 0
IO25
Wire Wire Line
	6750 1800 6700 1800
Wire Wire Line
	6700 1900 6750 1900
Text Label 4550 4450 2    50   ~ 0
IO12
Wire Wire Line
	4550 4450 4600 4450
Text Label 5100 4950 3    50   ~ 0
IO13
Wire Wire Line
	5100 4950 5100 4900
Text Label 6150 1900 2    50   ~ 0
IO13
Text Label 6150 1800 2    50   ~ 0
IO12
Wire Wire Line
	6150 1900 6200 1900
Wire Wire Line
	6200 2000 6150 2000
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J2
U 1 1 5D48F3AA
P 6400 2100
F 0 "J2" H 6450 2617 50  0000 C CNN
F 1 "Conn_02x07_Odd_Even" H 6450 2526 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x07_P2.54mm_Vertical_SMD" H 6400 2100 50  0001 C CNN
F 3 "~" H 6400 2100 50  0001 C CNN
	1    6400 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2300 6200 2300
Text Label 6150 2000 2    50   ~ 0
FACT
Text Label 6750 1800 0    50   ~ 0
IO33
Text Label 1650 2000 0    50   ~ 0
IO23
Wire Wire Line
	1650 2000 1600 2000
Text HLabel 1600 2000 0    60   Input ~ 0
IO23
Wire Wire Line
	1600 2100 1650 2100
Text HLabel 1600 2100 0    60   Input ~ 0
IO25
Text Label 1650 2100 0    50   ~ 0
IO25
Wire Wire Line
	1600 2200 1650 2200
Text HLabel 1600 2200 0    60   Input ~ 0
IO26
Text Label 1650 2200 0    50   ~ 0
IO26
Text Label 1650 1900 0    50   ~ 0
IO22
Wire Wire Line
	1650 1900 1600 1900
Text HLabel 1600 1900 0    60   Input ~ 0
IO22
Text Label 6750 2300 0    50   ~ 0
IO2
Wire Wire Line
	6750 2300 6700 2300
Text Label 7400 1550 2    50   ~ 0
IO12
Text Label 7400 1750 2    50   ~ 0
IO13
Text Label 7400 1950 2    50   ~ 0
IO23
Text Label 7400 2150 2    50   ~ 0
IO22
Text Label 7400 2750 2    50   ~ 0
IO26
Text Label 7400 2550 2    50   ~ 0
IO25
Text Label 7400 2350 2    50   ~ 0
IO33
Text Label 7400 2950 2    50   ~ 0
IO2
$Comp
L led-controller-rescue:R_10K-open-automation R25
U 1 1 5DA78726
P 7650 2950
F 0 "R25" V 7650 2950 50  0000 C CNN
F 1 "R_10K" V 7550 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 2950 50  0001 C CNN
F 3 "" V 7730 2950 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 7830 3050 60  0001 C CNN "Part Number"
	1    7650 2950
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5DA79EC4
P 7900 2950
AR Path="/5A8CA1FA/5DA79EC4" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5DA79EC4" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5DA79EC4" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 7900 2700 50  0001 C CNN
F 1 "GND" V 7800 2900 50  0000 C CNN
F 2 "" H 7900 2950 50  0000 C CNN
F 3 "" H 7900 2950 50  0000 C CNN
	1    7900 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 2950 7850 2950
Wire Wire Line
	7450 2950 7400 2950
$Comp
L led-controller-rescue:R_10K-open-automation R24
U 1 1 5DA834CC
P 7650 2750
F 0 "R24" V 7650 2750 50  0000 C CNN
F 1 "R_10K" V 7550 2750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 2750 50  0001 C CNN
F 3 "" V 7730 2750 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 7830 2850 60  0001 C CNN "Part Number"
	1    7650 2750
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5DA834D6
P 7900 2750
AR Path="/5A8CA1FA/5DA834D6" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5DA834D6" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5DA834D6" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 7900 2500 50  0001 C CNN
F 1 "GND" V 7800 2700 50  0000 C CNN
F 2 "" H 7900 2750 50  0000 C CNN
F 3 "" H 7900 2750 50  0000 C CNN
	1    7900 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 2750 7850 2750
$Comp
L led-controller-rescue:R_10K-open-automation R23
U 1 1 5DA88B6F
P 7650 2550
F 0 "R23" V 7650 2550 50  0000 C CNN
F 1 "R_10K" V 7550 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 2550 50  0001 C CNN
F 3 "" V 7730 2550 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 7830 2650 60  0001 C CNN "Part Number"
	1    7650 2550
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5DA88B79
P 7900 2550
AR Path="/5A8CA1FA/5DA88B79" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5DA88B79" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5DA88B79" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 7900 2300 50  0001 C CNN
F 1 "GND" V 7800 2500 50  0000 C CNN
F 2 "" H 7900 2550 50  0000 C CNN
F 3 "" H 7900 2550 50  0000 C CNN
	1    7900 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 2550 7850 2550
$Comp
L led-controller-rescue:R_10K-open-automation R21
U 1 1 5DA88B85
P 7650 2350
F 0 "R21" V 7650 2350 50  0000 C CNN
F 1 "R_10K" V 7550 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 2350 50  0001 C CNN
F 3 "" V 7730 2350 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 7830 2450 60  0001 C CNN "Part Number"
	1    7650 2350
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5DA88B8F
P 7900 2350
AR Path="/5A8CA1FA/5DA88B8F" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5DA88B8F" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5DA88B8F" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 7900 2100 50  0001 C CNN
F 1 "GND" V 7800 2300 50  0000 C CNN
F 2 "" H 7900 2350 50  0000 C CNN
F 3 "" H 7900 2350 50  0000 C CNN
	1    7900 2350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 2350 7850 2350
Wire Wire Line
	7400 2750 7450 2750
Wire Wire Line
	7400 2550 7450 2550
Wire Wire Line
	7450 2350 7400 2350
$Comp
L led-controller-rescue:R_10K-open-automation R20
U 1 1 5DAA1192
P 7650 2150
F 0 "R20" V 7650 2150 50  0000 C CNN
F 1 "R_10K" V 7550 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 2150 50  0001 C CNN
F 3 "" V 7730 2150 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 7830 2250 60  0001 C CNN "Part Number"
	1    7650 2150
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5DAA119C
P 7900 2150
AR Path="/5A8CA1FA/5DAA119C" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5DAA119C" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5DAA119C" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 7900 1900 50  0001 C CNN
F 1 "GND" V 7800 2100 50  0000 C CNN
F 2 "" H 7900 2150 50  0000 C CNN
F 3 "" H 7900 2150 50  0000 C CNN
	1    7900 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 2150 7850 2150
Wire Wire Line
	7450 2150 7400 2150
$Comp
L led-controller-rescue:R_10K-open-automation R18
U 1 1 5DAA11A9
P 7650 1950
F 0 "R18" V 7650 1950 50  0000 C CNN
F 1 "R_10K" V 7550 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 1950 50  0001 C CNN
F 3 "" V 7730 1950 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 7830 2050 60  0001 C CNN "Part Number"
	1    7650 1950
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5DAA11B3
P 7900 1950
AR Path="/5A8CA1FA/5DAA11B3" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5DAA11B3" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5DAA11B3" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 7900 1700 50  0001 C CNN
F 1 "GND" V 7800 1900 50  0000 C CNN
F 2 "" H 7900 1950 50  0000 C CNN
F 3 "" H 7900 1950 50  0000 C CNN
	1    7900 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 1950 7850 1950
$Comp
L led-controller-rescue:R_10K-open-automation R17
U 1 1 5DAA11BF
P 7650 1750
F 0 "R17" V 7650 1750 50  0000 C CNN
F 1 "R_10K" V 7550 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 1750 50  0001 C CNN
F 3 "" V 7730 1750 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 7830 1850 60  0001 C CNN "Part Number"
	1    7650 1750
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5DAA11C9
P 7900 1750
AR Path="/5A8CA1FA/5DAA11C9" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5DAA11C9" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5DAA11C9" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 7900 1500 50  0001 C CNN
F 1 "GND" V 7800 1700 50  0000 C CNN
F 2 "" H 7900 1750 50  0000 C CNN
F 3 "" H 7900 1750 50  0000 C CNN
	1    7900 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 1750 7850 1750
$Comp
L led-controller-rescue:R_10K-open-automation R16
U 1 1 5DAA11D5
P 7650 1550
F 0 "R16" V 7650 1550 50  0000 C CNN
F 1 "R_10K" V 7550 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 1550 50  0001 C CNN
F 3 "" V 7730 1550 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 7830 1650 60  0001 C CNN "Part Number"
	1    7650 1550
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5DAA11DF
P 7900 1550
AR Path="/5A8CA1FA/5DAA11DF" Ref="#PWR?"  Part="1" 
AR Path="/5A7BADDB/5DAA11DF" Ref="#PWR?"  Part="1" 
AR Path="/5D2CEC1B/5DAA11DF" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 7900 1300 50  0001 C CNN
F 1 "GND" V 7800 1500 50  0000 C CNN
F 2 "" H 7900 1550 50  0000 C CNN
F 3 "" H 7900 1550 50  0000 C CNN
	1    7900 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 1550 7850 1550
Wire Wire Line
	7400 1950 7450 1950
Wire Wire Line
	7400 1750 7450 1750
Wire Wire Line
	7450 1550 7400 1550
$Comp
L led-controller-rescue:LED_G-open-automation D2
U 1 1 5CC26ACF
P 2650 3300
F 0 "D2" V 2689 3183 50  0000 R CNN
F 1 "LED_G" V 2598 3183 50  0000 R CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2650 3300 50  0001 C CNN
F 3 "https://katalog.we-online.de/led/datasheet/150060VS75000.pdf" H 2650 3300 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/150060VS75000/732-4980-1-ND/4489904" H 2650 3300 50  0001 C CNN "Website"
F 5 " 150060VS75000" H 2650 3300 50  0001 C CNN "Part Number"
	1    2650 3300
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:LED_G-open-automation D3
U 1 1 5CC27619
P 3200 3300
F 0 "D3" V 3239 3183 50  0000 R CNN
F 1 "LED_G" V 3148 3183 50  0000 R CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3200 3300 50  0001 C CNN
F 3 "https://katalog.we-online.de/led/datasheet/150060VS75000.pdf" H 3200 3300 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/wurth-electronics-inc/150060VS75000/732-4980-1-ND/4489904" H 3200 3300 50  0001 C CNN "Website"
F 5 " 150060VS75000" H 3200 3300 50  0001 C CNN "Part Number"
	1    3200 3300
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
