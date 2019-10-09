EESchema Schematic File Version 4
LIBS:led-controller-cache
EELAYER 30 0
EELAYER END
$Descr USLedger 17000 11000
encoding utf-8
Sheet 1 2
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
L led-controller-rescue:PIR-DIGITAL-open-automation U2
U 1 1 5D35548F
P 11200 4750
F 0 "U2" H 11250 5047 60  0000 C CNN
F 1 "PIR-DIGITAL" H 11250 4941 60  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-5-3" H 11250 4300 60  0001 C CNN
F 3 "" H 11300 4400 60  0001 C CNN
F 4 "PYQ2898" H 11200 4200 60  0001 C CNN "Part Number"
	1    11200 4750
	1    0    0    -1  
$EndComp
Text Label 10900 4700 2    60   ~ 0
3V3
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5D357B3F
P 10900 5100
AR Path="/5D2CEC1B/5D357B3F" Ref="#PWR?"  Part="1" 
AR Path="/5D357B3F" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 10900 4850 50  0001 C CNN
F 1 "GND" H 10900 4950 50  0000 C CNN
F 2 "" H 10900 5100 50  0000 C CNN
F 3 "" H 10900 5100 50  0000 C CNN
	1    10900 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 4900 10950 4900
Text Label 11600 4800 0    60   ~ 0
PIR_IO
Wire Wire Line
	11600 4800 11550 4800
Text Label 7700 5500 2    60   ~ 0
PIR_IO
Wire Wire Line
	7700 5500 7750 5500
Text Label 7700 5400 2    60   ~ 0
LED_IO
Wire Wire Line
	7700 5400 7750 5400
Text Label 7700 5200 2    60   ~ 0
DT_IO
Text Label 7700 5100 2    60   ~ 0
CLK_IO
Wire Wire Line
	7700 5200 7750 5200
Wire Wire Line
	7750 5100 7700 5100
Text Label 7700 5000 2    60   ~ 0
SW_IO
Wire Wire Line
	7750 5000 7700 5000
Text Label 7700 4750 2    60   ~ 0
3V3
Wire Wire Line
	7700 4750 7750 4750
$Sheet
S 7750 4650 1300 1250
U 5D2CEC1B
F0 "microcontroller" 60
F1 "microcontroller.sch" 60
F2 "3V3" I L 7750 4750 60 
F3 "IO27" I L 7750 5500 60 
F4 "IO4" I L 7750 5100 60 
F5 "IO5" I L 7750 5200 60 
F6 "IO18" I L 7750 5400 60 
F7 "IO16" I L 7750 5000 60 
F8 "TXD" I R 9050 4850 60 
F9 "RXD" I R 9050 4950 60 
F10 "IO23" I R 9050 5250 60 
F11 "IO25" I R 9050 5350 60 
F12 "IO26" I R 9050 5450 60 
F13 "IO22" I R 9050 5150 60 
F14 "5V" I L 7750 4850 60 
$EndSheet
$Comp
L led-controller-rescue:C_1uF-open-automation C2
U 1 1 5B1EEF77
P 6000 5500
F 0 "C2" H 6100 5500 50  0000 L CNN
F 1 "C_1uF" H 6000 5400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6100 5800 50  0001 C CNN
F 3 "https://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c03e.ashx?la=en-us" H 6000 5250 50  0001 C CNN
F 4 "GCM188R71C105KA64D" H 6125 5700 60  0001 C CNN "Part Number"
F 5 "https://www.digikey.com/product-detail/en/murata-electronics-north-america/GCM188R71C105KA64D/490-5241-1-ND/1979252" H 150 -850 50  0001 C CNN "Website"
	1    6000 5500
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5D39D6A8
P 6000 5700
AR Path="/5D2CEC1B/5D39D6A8" Ref="#PWR?"  Part="1" 
AR Path="/5D39D6A8" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 6000 5450 50  0001 C CNN
F 1 "GND" H 6000 5550 50  0000 C CNN
F 2 "" H 6000 5700 50  0000 C CNN
F 3 "" H 6000 5700 50  0000 C CNN
	1    6000 5700
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5D39DD6C
P 5050 5600
AR Path="/5D2CEC1B/5D39DD6C" Ref="#PWR?"  Part="1" 
AR Path="/5D39DD6C" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 5050 5350 50  0001 C CNN
F 1 "GND" H 5050 5450 50  0000 C CNN
F 2 "" H 5050 5600 50  0000 C CNN
F 3 "" H 5050 5600 50  0000 C CNN
	1    5050 5600
	1    0    0    -1  
$EndComp
Text Label 6000 5300 0    60   ~ 0
3V3
Text Label 5100 5200 2    60   ~ 0
5V
$Comp
L led-controller-rescue:C_1uF-open-automation C1
U 1 1 5D3A2FC3
P 4900 5350
F 0 "C1" H 4700 5350 50  0000 L CNN
F 1 "C_1uF" H 4650 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5000 5650 50  0001 C CNN
F 3 "https://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c03e.ashx?la=en-us" H 4900 5100 50  0001 C CNN
F 4 "GCM188R71C105KA64D" H 5025 5550 60  0001 C CNN "Part Number"
F 5 "https://www.digikey.com/product-detail/en/murata-electronics-north-america/GCM188R71C105KA64D/490-5241-1-ND/1979252" H 200 -1000 50  0001 C CNN "Website"
	1    4900 5350
	1    0    0    -1  
$EndComp
$Comp
L led-controller-rescue:Rotary_Encoder_Switch-open-automation SW1
U 1 1 5D3AB626
P 11650 5900
F 0 "SW1" H 11650 6200 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 11650 6300 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC11E-Switch_Vertical_H20mm" H 11500 6060 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/15/EC11-1370822.pdf" H 11650 6160 50  0001 C CNN
F 4 "EC11" H 11650 5900 50  0001 C CNN "Part Number"
	1    11650 5900
	1    0    0    -1  
$EndComp
Text Label 12000 5800 0    60   ~ 0
SW_IO
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5D3B219A
P 12000 6050
AR Path="/5D2CEC1B/5D3B219A" Ref="#PWR?"  Part="1" 
AR Path="/5D3B219A" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 12000 5800 50  0001 C CNN
F 1 "GND" H 12000 5900 50  0000 C CNN
F 2 "" H 12000 6050 50  0000 C CNN
F 3 "" H 12000 6050 50  0000 C CNN
	1    12000 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 6050 12000 6000
Wire Wire Line
	12000 6000 11950 6000
$Comp
L led-controller-rescue:R_10K-open-automation R2
U 1 1 5D3B3314
P 10850 6100
F 0 "R2" V 10850 6150 50  0000 R CNN
F 1 "R_10K" V 10750 6200 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10780 6100 50  0001 C CNN
F 3 "" V 10930 6100 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 11030 6200 60  0001 C CNN "Part Number"
	1    10850 6100
	0    -1   -1   0   
$EndComp
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5D3B572C
P 11300 5900
AR Path="/5D2CEC1B/5D3B572C" Ref="#PWR?"  Part="1" 
AR Path="/5D3B572C" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 11300 5650 50  0001 C CNN
F 1 "GND" V 11300 5700 50  0000 C CNN
F 2 "" H 11300 5900 50  0000 C CNN
F 3 "" H 11300 5900 50  0000 C CNN
	1    11300 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	11300 5900 11350 5900
$Comp
L led-controller-rescue:R_10K-open-automation R1
U 1 1 5D3BB07F
P 10850 5750
F 0 "R1" V 10850 5800 50  0000 R CNN
F 1 "R_10K" V 10950 5900 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10780 5750 50  0001 C CNN
F 3 "" V 10930 5750 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 11030 5850 60  0001 C CNN "Part Number"
	1    10850 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11250 5750 11250 5800
Wire Wire Line
	10600 5750 10650 5750
Wire Wire Line
	10600 6100 10650 6100
Wire Wire Line
	11350 6100 11350 6000
Wire Wire Line
	11250 5800 11350 5800
Wire Wire Line
	11050 6100 11350 6100
Text Label 11050 6100 0    60   ~ 0
DT_IO
Wire Wire Line
	11050 5750 11250 5750
Text Label 11050 5750 0    60   ~ 0
CLK_IO
Wire Wire Line
	10600 6100 10600 5750
Text Label 10600 5750 2    60   ~ 0
3V3
Text Label 8600 3950 0    50   ~ 0
TXD
Wire Wire Line
	8600 4050 8550 4050
Text Label 8600 4050 0    50   ~ 0
RXD
Wire Wire Line
	8600 3950 8550 3950
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5D403114
P 8000 4100
AR Path="/5D2CEC1B/5D403114" Ref="#PWR?"  Part="1" 
AR Path="/5D403114" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 8000 3850 50  0001 C CNN
F 1 "GND" H 8000 3950 50  0000 C CNN
F 2 "" H 8000 4100 50  0000 C CNN
F 3 "" H 8000 4100 50  0000 C CNN
	1    8000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4050 8050 4050
Text Label 8000 3950 2    60   ~ 0
POWER_IN
Wire Wire Line
	8000 3950 8050 3950
Text Label 9100 4850 0    50   ~ 0
TXD
Wire Wire Line
	9100 4850 9050 4850
Text Label 9100 4950 0    50   ~ 0
RXD
Wire Wire Line
	9100 4950 9050 4950
$Comp
L led-controller-rescue:CONN_01X03-open-automation P1
U 1 1 5D433FCB
P 3800 5400
F 0 "P1" H 3750 5200 50  0000 L CNN
F 1 "CONN_01X03" H 3600 5650 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3800 5400 50  0001 C CNN
F 3 "" H 3800 5400 50  0000 C CNN
	1    3800 5400
	1    0    0    -1  
$EndComp
Text Label 3550 5300 2    60   ~ 0
5V
Wire Wire Line
	3550 5300 3600 5300
$Comp
L led-controller-rescue:GND-open-automation #PWR?
U 1 1 5D435E4D
P 3550 5550
AR Path="/5D2CEC1B/5D435E4D" Ref="#PWR?"  Part="1" 
AR Path="/5D435E4D" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 3550 5300 50  0001 C CNN
F 1 "GND" H 3550 5400 50  0000 C CNN
F 2 "" H 3550 5550 50  0000 C CNN
F 3 "" H 3550 5550 50  0000 C CNN
	1    3550 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5550 3550 5500
Wire Wire Line
	3550 5500 3600 5500
Text Label 3550 5400 2    60   ~ 0
LED_IO
Wire Wire Line
	3550 5400 3600 5400
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J1
U 1 1 5D47A9C9
P 8250 3950
F 0 "J1" H 8300 3900 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 8300 4150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical_SMD" H 8250 3950 50  0001 C CNN
F 3 "~" H 8250 3950 50  0001 C CNN
	1    8250 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4100 8000 4050
$Comp
L led-controller-rescue:C_0.1uF-open-automation C3
U 1 1 5D4AE951
P 10750 4900
F 0 "C3" H 10550 4900 50  0000 L CNN
F 1 "C_0.1uF" H 10450 4800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10850 5200 50  0001 C CNN
F 3 "" H 10750 4650 50  0001 C CNN
F 4 "C1608X8R1H104K080AB" H 10875 5100 60  0001 C CNN "Part Number"
	1    10750 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 4750 10750 4700
Wire Wire Line
	10900 4900 10900 5050
Wire Wire Line
	10750 4700 10950 4700
Wire Wire Line
	10750 5050 10900 5050
Connection ~ 10900 5050
Wire Wire Line
	10900 5050 10900 5100
$Comp
L led-controller-rescue:R_10K-open-automation R3
U 1 1 5D4DAB06
P 12400 5800
F 0 "R3" V 12400 5850 50  0000 R CNN
F 1 "R_10K" V 12500 5950 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 12330 5800 50  0001 C CNN
F 3 "" V 12480 5800 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 12580 5900 60  0001 C CNN "Part Number"
	1    12400 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	11950 5800 12200 5800
Text Label 12650 5800 0    60   ~ 0
3V3
Wire Wire Line
	12650 5800 12600 5800
$Comp
L open-automation:REG-3.3v U1?
U 1 1 5D9E3F24
P 5600 5300
F 0 "U1?" H 5575 5625 50  0000 C CNN
F 1 "REG-3.3v" H 5575 5534 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 5550 5025 50  0001 C CIN
F 3 "https://www.digikey.com/product-detail/en/on-semiconductor/NCP1117DT33T5G/NCP1117DT33T5GOSCT-ND/2121236" H 5575 4950 50  0001 C CNN
F 4 "NCP1117DT33T5G" H 5625 5625 60  0001 C CNN "Part Number"
	1    5600 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5200 5200 5200
Wire Wire Line
	5200 5400 5200 5500
Wire Wire Line
	5200 5500 5050 5500
Wire Wire Line
	5050 5600 5050 5500
Connection ~ 5050 5500
Wire Wire Line
	5050 5500 4900 5500
Wire Wire Line
	6000 5300 5950 5300
Wire Wire Line
	6000 5350 6000 5300
Wire Wire Line
	6000 5650 6000 5700
Text Label 9100 5150 0    50   ~ 0
IO22
Wire Wire Line
	9100 5150 9050 5150
Text Label 9100 5250 0    50   ~ 0
IO23
Wire Wire Line
	9100 5250 9050 5250
Text Label 9100 5350 0    50   ~ 0
IO25
Wire Wire Line
	9100 5350 9050 5350
Text Label 9100 5450 0    50   ~ 0
IO26
Wire Wire Line
	9100 5450 9050 5450
Text Label 7700 4850 2    60   ~ 0
POWER_IN
Wire Wire Line
	7700 4850 7750 4850
$Comp
L open-automation:SPH0645LM4H-B U?
U 1 1 5DA4A88D
P 6750 7350
F 0 "U?" H 6750 7647 60  0000 C CNN
F 1 "SPH0645LM4H-B" H 6750 7541 60  0000 C CNN
F 2 "open-automation:SPH0645LM4H-B" H 6750 6950 60  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/knowles/SPH0645LM4H-B/423-1405-6-ND/5332436" H 6700 6850 60  0001 C CNN
F 4 "SPH0645LM4H-B" H 6750 7650 60  0001 C CNN "Part Number"
	1    6750 7350
	1    0    0    -1  
$EndComp
$Comp
L open-automation:MAX98357AETE+T U?
U 1 1 5DA4EBE7
P 8900 7350
F 0 "U?" H 9100 7828 60  0000 C CNN
F 1 "MAX98357AETE+T" H 9100 7722 60  0000 C CNN
F 2 "open-automation:MAX98357A" H 9250 6900 60  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/maxim-integrated/MAX98357AETE-T/MAX98357AETE-TCT-ND/7603777" H 9075 6925 60  0001 C CNN
F 4 "MAX98357AETE+T" H 9100 7616 60  0000 C CNN "Part Number"
	1    8900 7350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
