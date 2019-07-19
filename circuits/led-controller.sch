EESchema Schematic File Version 4
LIBS:led-controller-cache
EELAYER 29 0
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
L open-automation:PIR-DIGITAL U2
U 1 1 5D35548F
P 11200 4400
F 0 "U2" H 11250 4697 60  0000 C CNN
F 1 "PIR-DIGITAL" H 11250 4591 60  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-5-3" H 11250 3950 60  0001 C CNN
F 3 "" H 11300 4050 60  0001 C CNN
F 4 "PYQ2898" H 11200 3850 60  0001 C CNN "Part Number"
	1    11200 4400
	1    0    0    -1  
$EndComp
Text Label 10900 4350 2    60   ~ 0
3V3
$Comp
L open-automation:GND #PWR?
U 1 1 5D357B3F
P 10900 4750
AR Path="/5D2CEC1B/5D357B3F" Ref="#PWR?"  Part="1" 
AR Path="/5D357B3F" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 10900 4500 50  0001 C CNN
F 1 "GND" H 10900 4600 50  0000 C CNN
F 2 "" H 10900 4750 50  0000 C CNN
F 3 "" H 10900 4750 50  0000 C CNN
	1    10900 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 4550 10950 4550
Text Label 11600 4450 0    60   ~ 0
PIR_IO
Wire Wire Line
	11600 4450 11550 4450
Text Label 7700 5150 2    60   ~ 0
PIR_IO
Wire Wire Line
	7700 5150 7750 5150
Text Label 7700 5050 2    60   ~ 0
LED_IO
Wire Wire Line
	7700 5050 7750 5050
Text Label 7700 4850 2    60   ~ 0
DT_IO
Text Label 7700 4750 2    60   ~ 0
CLK_IO
Wire Wire Line
	7700 4850 7750 4850
Wire Wire Line
	7750 4750 7700 4750
Text Label 7700 4650 2    60   ~ 0
SW_IO
Wire Wire Line
	7750 4650 7700 4650
Text Label 7700 4400 2    60   ~ 0
3V3
Wire Wire Line
	7700 4400 7750 4400
$Sheet
S 7750 4300 1300 1250
U 5D2CEC1B
F0 "microcontroller" 60
F1 "microcontroller.sch" 60
F2 "3V3" I L 7750 4400 60 
F3 "IO27" I L 7750 5150 60 
F4 "IO4" I L 7750 4750 60 
F5 "IO5" I L 7750 4850 60 
F6 "IO18" I L 7750 5050 60 
F7 "IO16" I L 7750 4650 60 
F8 "TXD" I R 9050 4900 60 
F9 "RXD" I R 9050 5000 60 
$EndSheet
$Comp
L open-automation:C_1uF C2
U 1 1 5B1EEF77
P 6000 5000
F 0 "C2" H 6100 5000 50  0000 L CNN
F 1 "C_1uF" H 6000 4900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6100 5300 50  0001 C CNN
F 3 "https://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c03e.ashx?la=en-us" H 6000 4750 50  0001 C CNN
F 4 "GCM188R71C105KA64D" H 6125 5200 60  0001 C CNN "Part Number"
F 5 "https://www.digikey.com/product-detail/en/murata-electronics-north-america/GCM188R71C105KA64D/490-5241-1-ND/1979252" H 150 -1350 50  0001 C CNN "Website"
	1    6000 5000
	1    0    0    -1  
$EndComp
$Comp
L open-automation:AP2112 U1
U 1 1 5D397C31
P 5400 4900
F 0 "U1" H 5400 5222 60  0000 C CNN
F 1 "AP2112" H 5400 5116 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 5400 4575 60  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 5400 4475 60  0001 C CNN
F 4 "AP2112" H 5400 5200 60  0001 C CNN "Part Number"
F 5 "https://www.mouser.com/ProductDetail/Diodes-Incorporated/AP2112K-33TRG1?qs=sGAEpiMZZMutXGli8Ay4kHLcTT0Hm1i8diVkxn%252BkiH0%3D" H 5400 4900 50  0001 C CNN "Website"
	1    5400 4900
	1    0    0    -1  
$EndComp
$Comp
L open-automation:GND #PWR?
U 1 1 5D39D6A8
P 6000 5200
AR Path="/5D2CEC1B/5D39D6A8" Ref="#PWR?"  Part="1" 
AR Path="/5D39D6A8" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 6000 4950 50  0001 C CNN
F 1 "GND" H 6000 5050 50  0000 C CNN
F 2 "" H 6000 5200 50  0000 C CNN
F 3 "" H 6000 5200 50  0000 C CNN
	1    6000 5200
	1    0    0    -1  
$EndComp
$Comp
L open-automation:GND #PWR?
U 1 1 5D39DD6C
P 5800 5000
AR Path="/5D2CEC1B/5D39DD6C" Ref="#PWR?"  Part="1" 
AR Path="/5D39DD6C" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 5800 4750 50  0001 C CNN
F 1 "GND" H 5800 4850 50  0000 C CNN
F 2 "" H 5800 5000 50  0000 C CNN
F 3 "" H 5800 5000 50  0000 C CNN
	1    5800 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 5000 5800 4950
Wire Wire Line
	5800 4950 5750 4950
Wire Wire Line
	6000 5200 6000 5150
Text Label 5800 4850 0    60   ~ 0
3V3
Text Label 4950 4850 2    60   ~ 0
5V
Wire Wire Line
	5000 4850 5050 4850
Wire Wire Line
	5050 4950 5000 4950
Wire Wire Line
	5750 4850 6000 4850
$Comp
L open-automation:C_1uF C1
U 1 1 5D3A2FC3
P 4850 5000
F 0 "C1" H 4650 5000 50  0000 L CNN
F 1 "C_1uF" H 4600 4900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4950 5300 50  0001 C CNN
F 3 "https://www.murata.com/~/media/webrenewal/support/library/catalog/products/capacitor/mlcc/c03e.ashx?la=en-us" H 4850 4750 50  0001 C CNN
F 4 "GCM188R71C105KA64D" H 4975 5200 60  0001 C CNN "Part Number"
F 5 "https://www.digikey.com/product-detail/en/murata-electronics-north-america/GCM188R71C105KA64D/490-5241-1-ND/1979252" H 150 -1350 50  0001 C CNN "Website"
	1    4850 5000
	1    0    0    -1  
$EndComp
$Comp
L open-automation:GND #PWR?
U 1 1 5D3A462C
P 4850 5200
AR Path="/5D2CEC1B/5D3A462C" Ref="#PWR?"  Part="1" 
AR Path="/5D3A462C" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 4850 4950 50  0001 C CNN
F 1 "GND" H 4850 5050 50  0000 C CNN
F 2 "" H 4850 5200 50  0000 C CNN
F 3 "" H 4850 5200 50  0000 C CNN
	1    4850 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 5200 4850 5150
Wire Wire Line
	5000 4850 5000 4950
Wire Wire Line
	4850 4850 5000 4850
Connection ~ 5000 4850
$Comp
L open-automation:Rotary_Encoder_Switch SW1
U 1 1 5D3AB626
P 11650 5550
F 0 "SW1" H 11650 5850 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 11650 5950 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC11E-Switch_Vertical_H20mm" H 11500 5710 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/15/EC11-1370822.pdf" H 11650 5810 50  0001 C CNN
F 4 "EC11" H 11650 5550 50  0001 C CNN "Part Number"
	1    11650 5550
	1    0    0    -1  
$EndComp
Text Label 12000 5450 0    60   ~ 0
SW_IO
$Comp
L open-automation:GND #PWR?
U 1 1 5D3B219A
P 12000 5700
AR Path="/5D2CEC1B/5D3B219A" Ref="#PWR?"  Part="1" 
AR Path="/5D3B219A" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 12000 5450 50  0001 C CNN
F 1 "GND" H 12000 5550 50  0000 C CNN
F 2 "" H 12000 5700 50  0000 C CNN
F 3 "" H 12000 5700 50  0000 C CNN
	1    12000 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 5700 12000 5650
Wire Wire Line
	12000 5650 11950 5650
$Comp
L open-automation:R_10K R2
U 1 1 5D3B3314
P 10850 5750
F 0 "R2" V 10850 5800 50  0000 R CNN
F 1 "R_10K" V 10750 5850 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10780 5750 50  0001 C CNN
F 3 "" V 10930 5750 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 11030 5850 60  0001 C CNN "Part Number"
	1    10850 5750
	0    -1   -1   0   
$EndComp
$Comp
L open-automation:GND #PWR?
U 1 1 5D3B572C
P 11300 5550
AR Path="/5D2CEC1B/5D3B572C" Ref="#PWR?"  Part="1" 
AR Path="/5D3B572C" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 11300 5300 50  0001 C CNN
F 1 "GND" V 11300 5350 50  0000 C CNN
F 2 "" H 11300 5550 50  0000 C CNN
F 3 "" H 11300 5550 50  0000 C CNN
	1    11300 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	11300 5550 11350 5550
$Comp
L open-automation:R_10K R1
U 1 1 5D3BB07F
P 10850 5400
F 0 "R1" V 10850 5450 50  0000 R CNN
F 1 "R_10K" V 10950 5550 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10780 5400 50  0001 C CNN
F 3 "" V 10930 5400 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 11030 5500 60  0001 C CNN "Part Number"
	1    10850 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11250 5400 11250 5450
Wire Wire Line
	10600 5400 10650 5400
Wire Wire Line
	10600 5750 10650 5750
Wire Wire Line
	11350 5750 11350 5650
Wire Wire Line
	11250 5450 11350 5450
Wire Wire Line
	11050 5750 11350 5750
Text Label 11050 5750 0    60   ~ 0
DT_IO
Wire Wire Line
	11050 5400 11250 5400
Text Label 11050 5400 0    60   ~ 0
CLK_IO
Wire Wire Line
	10600 5750 10600 5400
Text Label 10600 5400 2    60   ~ 0
3V3
Text Label 8600 3600 0    50   ~ 0
TXD
Wire Wire Line
	8600 3700 8550 3700
Text Label 8600 3700 0    50   ~ 0
RXD
Wire Wire Line
	8600 3600 8550 3600
$Comp
L open-automation:GND #PWR?
U 1 1 5D403114
P 8000 3750
AR Path="/5D2CEC1B/5D403114" Ref="#PWR?"  Part="1" 
AR Path="/5D403114" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 8000 3500 50  0001 C CNN
F 1 "GND" H 8000 3600 50  0000 C CNN
F 2 "" H 8000 3750 50  0000 C CNN
F 3 "" H 8000 3750 50  0000 C CNN
	1    8000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3700 8050 3700
Text Label 8000 3600 2    60   ~ 0
5V
Wire Wire Line
	8000 3600 8050 3600
Text Label 9100 4900 0    50   ~ 0
TXD
Wire Wire Line
	9100 4900 9050 4900
Text Label 9100 5000 0    50   ~ 0
RXD
Wire Wire Line
	9100 5000 9050 5000
$Comp
L open-automation:CONN_01X03 P1
U 1 1 5D433FCB
P 3800 5050
F 0 "P1" H 3750 4850 50  0000 L CNN
F 1 "CONN_01X03" H 3600 5300 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3800 5050 50  0001 C CNN
F 3 "" H 3800 5050 50  0000 C CNN
	1    3800 5050
	1    0    0    -1  
$EndComp
Text Label 3550 4950 2    60   ~ 0
5V
Wire Wire Line
	3550 4950 3600 4950
$Comp
L open-automation:GND #PWR?
U 1 1 5D435E4D
P 3550 5200
AR Path="/5D2CEC1B/5D435E4D" Ref="#PWR?"  Part="1" 
AR Path="/5D435E4D" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 3550 4950 50  0001 C CNN
F 1 "GND" H 3550 5050 50  0000 C CNN
F 2 "" H 3550 5200 50  0000 C CNN
F 3 "" H 3550 5200 50  0000 C CNN
	1    3550 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5200 3550 5150
Wire Wire Line
	3550 5150 3600 5150
Text Label 3550 5050 2    60   ~ 0
LED_IO
Wire Wire Line
	3550 5050 3600 5050
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J1
U 1 1 5D47A9C9
P 8250 3600
F 0 "J1" H 8300 3550 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 8300 3800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical_SMD" H 8250 3600 50  0001 C CNN
F 3 "~" H 8250 3600 50  0001 C CNN
	1    8250 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3750 8000 3700
$Comp
L open-automation:C_0.1uF C3
U 1 1 5D4AE951
P 10750 4550
F 0 "C3" H 10550 4550 50  0000 L CNN
F 1 "C_0.1uF" H 10450 4450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10850 4850 50  0001 C CNN
F 3 "" H 10750 4300 50  0001 C CNN
F 4 "C1608X8R1H104K080AB" H 10875 4750 60  0001 C CNN "Part Number"
	1    10750 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 4400 10750 4350
Wire Wire Line
	10900 4550 10900 4700
Wire Wire Line
	10750 4350 10950 4350
Wire Wire Line
	10750 4700 10900 4700
Connection ~ 10900 4700
Wire Wire Line
	10900 4700 10900 4750
$Comp
L open-automation:R_10K R3
U 1 1 5D4DAB06
P 12400 5450
F 0 "R3" V 12400 5500 50  0000 R CNN
F 1 "R_10K" V 12500 5600 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 12330 5450 50  0001 C CNN
F 3 "" V 12480 5450 50  0001 C CNN
F 4 "RC0603JR-0710KL" V 12580 5550 60  0001 C CNN "Part Number"
	1    12400 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	11950 5450 12200 5450
Text Label 12650 5450 0    60   ~ 0
3V3
Wire Wire Line
	12650 5450 12600 5450
$EndSCHEMATC
