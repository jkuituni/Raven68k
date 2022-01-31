EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 5
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
L Interface:68681 U?
U 1 1 60A4B8A2
P 3500 2400
F 0 "U?" H 2950 3950 50  0000 C CNN
F 1 "68681" H 3000 3850 50  0000 C CNN
F 2 "" H 3500 2400 50  0001 C CNN
F 3 "" H 3500 2400 50  0001 C CNN
	1    3500 2400
	1    0    0    -1  
$EndComp
$Comp
L custom:CP2102_Breakout U?
U 1 1 60A4DBBB
P 8450 1100
F 0 "U?" H 8778 1138 50  0000 L CNN
F 1 "CONSOLE" H 8778 1047 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x06_P1.00mm_Vertical" H 8450 1100 50  0001 C CNN
F 3 "" H 8450 1100 50  0001 C CNN
	1    8450 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1500 2350 1500
Wire Wire Line
	2500 1600 2350 1600
Wire Wire Line
	2500 1700 2350 1700
Wire Wire Line
	2500 1800 2350 1800
Wire Wire Line
	2500 1900 2350 1900
Wire Wire Line
	2500 2000 2350 2000
Wire Wire Line
	2500 2100 2350 2100
Wire Wire Line
	2500 2200 2350 2200
Wire Wire Line
	2500 2400 2350 2400
Wire Wire Line
	2500 2500 2350 2500
Wire Wire Line
	2500 2600 2350 2600
Wire Wire Line
	2500 2700 2350 2700
Entry Wire Line
	2350 1500 2250 1600
Entry Wire Line
	2350 1600 2250 1700
Entry Wire Line
	2350 1700 2250 1800
Entry Wire Line
	2350 1800 2250 1900
Entry Wire Line
	2350 1900 2250 2000
Entry Wire Line
	2350 2000 2250 2100
Entry Wire Line
	2350 2100 2250 2200
Entry Wire Line
	2350 2200 2250 2300
Entry Wire Line
	2350 2400 2250 2500
Entry Wire Line
	2350 2500 2250 2600
Entry Wire Line
	2350 2600 2250 2700
Entry Wire Line
	2350 2700 2250 2800
Wire Bus Line
	2250 1500 2150 1500
Wire Bus Line
	2250 2400 2150 2400
Text HLabel 2150 1500 0    50   BiDi ~ 0
D[0..15]
Text HLabel 2150 2400 0    50   Input ~ 0
A[1..23]
Text Label 2450 2400 0    50   ~ 0
A1
Text Label 2450 2500 0    50   ~ 0
A2
Text Label 2450 2600 0    50   ~ 0
A3
Text Label 2450 2700 0    50   ~ 0
A4
Text Label 2400 1500 0    50   ~ 0
D0
Text Label 2400 1600 0    50   ~ 0
D1
Text Label 2400 1700 0    50   ~ 0
D2
Text Label 2400 1800 0    50   ~ 0
D3
Text Label 2400 1900 0    50   ~ 0
D4
Text Label 2400 2000 0    50   ~ 0
D5
Text Label 2400 2100 0    50   ~ 0
D6
Text Label 2400 2200 0    50   ~ 0
D7
NoConn ~ 8150 1350
NoConn ~ 8650 1350
Wire Wire Line
	8250 1350 8250 1600
Wire Wire Line
	8250 1600 8150 1600
Wire Wire Line
	8350 1350 8350 1700
Wire Wire Line
	8350 1700 8150 1700
Wire Wire Line
	8450 1350 8450 1800
Wire Wire Line
	8450 1800 8150 1800
$Comp
L Oscillator:CXO_DIP14 X?
U 1 1 60A58E96
P 1200 1200
F 0 "X?" H 1544 1246 50  0000 L CNN
F 1 "CXO_DIP14" H 1544 1155 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 1650 850 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 1100 1200 50  0001 C CNN
	1    1200 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1200 2500 1200
NoConn ~ 2500 1300
Text GLabel 4500 1300 2    50   Input ~ 0
RxDA
Text GLabel 8150 1800 0    50   Output ~ 0
RxDA
NoConn ~ 8550 1350
Text GLabel 8150 1700 0    50   Input ~ 0
TxDA
Text GLabel 4500 1200 2    50   Output ~ 0
TxDA
Text GLabel 4500 1500 2    50   Output ~ 0
TxDB
Text GLabel 4500 1600 2    50   Input ~ 0
RxDB
Wire Wire Line
	3500 900  3500 800 
Wire Wire Line
	3600 800  3500 800 
Text HLabel 2500 2900 0    50   Input ~ 0
~DUART_CS
Text HLabel 2500 3000 0    50   Input ~ 0
R~W
Text HLabel 2500 3100 0    50   Input ~ 0
~DUART_IACK
Text HLabel 2500 3200 0    50   Input ~ 0
~RESET
Text HLabel 1700 3400 0    50   Output ~ 0
~DUART_DTACK
Text HLabel 2500 3500 0    50   Output ~ 0
~DUART_IRQ
Wire Wire Line
	4500 1800 4650 1800
Wire Wire Line
	4500 1900 4650 1900
Wire Wire Line
	4500 2000 4650 2000
Wire Wire Line
	4500 2100 4650 2100
Wire Wire Line
	4500 2200 4650 2200
Wire Wire Line
	4500 2300 4650 2300
Wire Wire Line
	4500 2400 4650 2400
Wire Wire Line
	4500 2500 4650 2500
Entry Wire Line
	4650 1800 4750 1900
Entry Wire Line
	4650 1900 4750 2000
Entry Wire Line
	4650 2000 4750 2100
Entry Wire Line
	4650 2100 4750 2200
Entry Wire Line
	4650 2200 4750 2300
Entry Wire Line
	4650 2300 4750 2400
Entry Wire Line
	4650 2400 4750 2500
Entry Wire Line
	4650 2500 4750 2600
Wire Wire Line
	4500 2700 4650 2700
Wire Wire Line
	4500 2800 4650 2800
Wire Wire Line
	4500 2900 4650 2900
Wire Wire Line
	4500 3000 4650 3000
Wire Wire Line
	4500 3100 4650 3100
Wire Wire Line
	4500 3200 4650 3200
Entry Wire Line
	4650 2700 4750 2800
Entry Wire Line
	4650 2800 4750 2900
Entry Wire Line
	4650 2900 4750 3000
Entry Wire Line
	4650 3000 4750 3100
Entry Wire Line
	4650 3100 4750 3200
Entry Wire Line
	4650 3200 4750 3300
Wire Bus Line
	4750 1800 4850 1800
Wire Bus Line
	4750 2750 4850 2750
Text GLabel 4850 1800 2    50   Output ~ 0
OP[0..7]
Text GLabel 4850 2750 2    50   Input ~ 0
IP[0..5]
Text Label 4500 1800 0    50   ~ 0
OP0
Text Label 4500 1900 0    50   ~ 0
OP1
Text Label 4500 2000 0    50   ~ 0
OP2
Text Label 4500 2100 0    50   ~ 0
OP3
Text Label 4500 2200 0    50   ~ 0
OP4
Text Label 4500 2300 0    50   ~ 0
OP5
Text Label 4500 2400 0    50   ~ 0
OP6
Text Label 4500 2500 0    50   ~ 0
OP7
Text Label 4500 2700 0    50   ~ 0
IP0
Text Label 4500 2800 0    50   ~ 0
IP1
Text Label 4500 2900 0    50   ~ 0
IP2
Text Label 4500 3000 0    50   ~ 0
IP3
Text Label 4500 3100 0    50   ~ 0
IP4
Text Label 4500 3200 0    50   ~ 0
IP5
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J?
U 1 1 60F280FC
P 6500 1300
F 0 "J?" H 6550 1817 50  0000 C CNN
F 1 "DUART_IO" H 6550 1726 50  0000 C CNN
F 2 "" H 6500 1300 50  0001 C CNN
F 3 "~" H 6500 1300 50  0001 C CNN
	1    6500 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1000 6150 1000
Wire Wire Line
	6300 1100 6150 1100
Wire Wire Line
	6300 1200 6150 1200
Wire Wire Line
	6300 1300 6150 1300
Wire Wire Line
	6300 1400 6150 1400
Wire Wire Line
	6300 1500 6150 1500
Wire Wire Line
	6300 1600 6150 1600
Wire Wire Line
	6300 1700 6150 1700
Wire Wire Line
	6800 1000 6950 1000
Wire Wire Line
	6800 1100 6950 1100
Wire Wire Line
	6800 1200 6950 1200
Wire Wire Line
	6800 1300 6950 1300
Wire Wire Line
	6800 1400 6950 1400
Wire Wire Line
	6800 1500 6950 1500
Wire Wire Line
	6800 1600 6950 1600
Wire Wire Line
	6800 1700 6950 1700
Entry Wire Line
	6150 1000 6050 1100
Entry Wire Line
	6150 1100 6050 1200
Entry Wire Line
	6150 1200 6050 1300
Entry Wire Line
	6150 1300 6050 1400
Entry Wire Line
	6150 1400 6050 1500
Entry Wire Line
	6150 1500 6050 1600
Entry Wire Line
	6150 1600 6050 1700
Entry Wire Line
	6150 1700 6050 1800
Entry Wire Line
	6950 1200 7050 1300
Entry Wire Line
	6950 1300 7050 1400
Entry Wire Line
	6950 1400 7050 1500
Entry Wire Line
	6950 1500 7050 1600
Entry Wire Line
	6950 1600 7050 1700
Entry Wire Line
	6950 1700 7050 1800
Text GLabel 6950 1000 2    50   Input ~ 0
TxDB
Text GLabel 6950 1100 2    50   Output ~ 0
RxDB
Wire Bus Line
	6050 1000 5950 1000
Text GLabel 5950 1000 0    50   Input ~ 0
OP[0..7]
Wire Bus Line
	7050 1200 7200 1200
Text GLabel 7200 1200 2    50   Output ~ 0
IP[0..5]
Wire Wire Line
	2100 6250 2400 6250
$Comp
L Device:C C?
U 1 1 61FF1760
P 2700 6450
AR Path="/610A1F9D/61FF1760" Ref="C?"  Part="1" 
AR Path="/60A4B12C/61FF1760" Ref="C?"  Part="1" 
F 0 "C?" H 2815 6496 50  0000 L CNN
F 1 "0.1uF" H 2815 6405 50  0000 L CNN
F 2 "" H 2738 6300 50  0001 C CNN
F 3 "~" H 2700 6450 50  0001 C CNN
	1    2700 6450
	1    0    0    -1  
$EndComp
Text GLabel 3950 6250 2    50   Output ~ 0
+5V
Wire Wire Line
	2100 6700 2400 6700
Text GLabel 3950 6700 2    50   Output ~ 0
GND
$Comp
L power:GND #PWR?
U 1 1 61FF176F
P 2100 6850
AR Path="/610A1F9D/61FF176F" Ref="#PWR?"  Part="1" 
AR Path="/60A4B12C/61FF176F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2100 6600 50  0001 C CNN
F 1 "GND" H 2105 6677 50  0000 C CNN
F 2 "" H 2100 6850 50  0001 C CNN
F 3 "" H 2100 6850 50  0001 C CNN
	1    2100 6850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61FF1775
P 2100 6100
AR Path="/610A1F9D/61FF1775" Ref="#PWR?"  Part="1" 
AR Path="/60A4B12C/61FF1775" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2100 5950 50  0001 C CNN
F 1 "+5V" H 2115 6273 50  0000 C CNN
F 2 "" H 2100 6100 50  0001 C CNN
F 3 "" H 2100 6100 50  0001 C CNN
	1    2100 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 6100 2100 6250
Wire Wire Line
	2100 6700 2100 6850
Connection ~ 2400 6250
$Comp
L power:PWR_FLAG #FLG?
U 1 1 61FF177F
P 2400 6250
AR Path="/610A1F9D/61FF177F" Ref="#FLG?"  Part="1" 
AR Path="/60A4B12C/61FF177F" Ref="#FLG?"  Part="1" 
F 0 "#FLG?" H 2400 6325 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 6423 50  0000 C CNN
F 2 "" H 2400 6250 50  0001 C CNN
F 3 "~" H 2400 6250 50  0001 C CNN
	1    2400 6250
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 61FF1785
P 2400 6700
AR Path="/610A1F9D/61FF1785" Ref="#FLG?"  Part="1" 
AR Path="/60A4B12C/61FF1785" Ref="#FLG?"  Part="1" 
F 0 "#FLG?" H 2400 6775 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 6873 50  0000 C CNN
F 2 "" H 2400 6700 50  0001 C CNN
F 3 "~" H 2400 6700 50  0001 C CNN
	1    2400 6700
	-1   0    0    1   
$EndComp
Connection ~ 2400 6700
Text GLabel 3600 3850 2    50   Input ~ 0
GND
Text GLabel 3600 800  2    50   Input ~ 0
+5V
Wire Wire Line
	3500 3800 3500 3850
Wire Wire Line
	3500 3850 3600 3850
Text GLabel 8150 1600 0    50   Input ~ 0
GND
$Comp
L Device:R_Small R?
U 1 1 620010FC
P 1950 3400
F 0 "R?" V 1754 3400 50  0000 C CNN
F 1 "4.7k" V 1845 3400 50  0000 C CNN
F 2 "" H 1950 3400 50  0001 C CNN
F 3 "~" H 1950 3400 50  0001 C CNN
	1    1950 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 3400 1800 3400
Wire Wire Line
	2050 3400 2500 3400
Text GLabel 1750 3250 0    50   Input ~ 0
+5V
Wire Wire Line
	1750 3250 1800 3250
Wire Wire Line
	1800 3250 1800 3400
Connection ~ 1800 3400
Wire Wire Line
	1800 3400 1700 3400
Text GLabel 1250 1600 2    50   Input ~ 0
GND
Text GLabel 1300 850  2    50   Input ~ 0
+5V
Wire Wire Line
	1200 900  1200 850 
Wire Wire Line
	1200 850  1300 850 
Wire Wire Line
	1200 1500 1200 1600
Wire Wire Line
	1200 1600 1250 1600
NoConn ~ 900  1200
$Comp
L custom:DS12887+ U?
U 1 1 620D50DB
P 9150 4650
F 0 "U?" H 9150 5581 50  0000 C CNN
F 1 "DS12887+" H 9150 5490 50  0000 C CNN
F 2 "" H 8800 5650 50  0001 C CNN
F 3 "" H 8800 5650 50  0001 C CNN
	1    9150 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS373 U?
U 1 1 620C2D34
P 6400 4650
F 0 "U?" H 6400 5631 50  0000 C CNN
F 1 "74LS373" H 6400 5540 50  0000 C CNN
F 2 "" H 6400 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS373" H 6400 4650 50  0001 C CNN
	1    6400 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 620DE222
P 3150 6450
AR Path="/610A1F9D/620DE222" Ref="C?"  Part="1" 
AR Path="/60A4B12C/620DE222" Ref="C?"  Part="1" 
F 0 "C?" H 3265 6496 50  0000 L CNN
F 1 "0.1uF" H 3265 6405 50  0000 L CNN
F 2 "" H 3188 6300 50  0001 C CNN
F 3 "~" H 3150 6450 50  0001 C CNN
	1    3150 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 620DE68D
P 3600 6450
AR Path="/610A1F9D/620DE68D" Ref="C?"  Part="1" 
AR Path="/60A4B12C/620DE68D" Ref="C?"  Part="1" 
F 0 "C?" H 3715 6496 50  0000 L CNN
F 1 "0.1uF" H 3715 6405 50  0000 L CNN
F 2 "" H 3638 6300 50  0001 C CNN
F 3 "~" H 3600 6450 50  0001 C CNN
	1    3600 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6700 2700 6700
Wire Wire Line
	2400 6250 2700 6250
Wire Wire Line
	3600 6300 3600 6250
Connection ~ 3600 6250
Wire Wire Line
	3600 6250 3950 6250
Wire Wire Line
	3150 6300 3150 6250
Connection ~ 3150 6250
Wire Wire Line
	3150 6250 3600 6250
Wire Wire Line
	2700 6300 2700 6250
Connection ~ 2700 6250
Wire Wire Line
	2700 6250 3150 6250
Wire Wire Line
	2700 6600 2700 6700
Connection ~ 2700 6700
Wire Wire Line
	2700 6700 3150 6700
Wire Wire Line
	3150 6600 3150 6700
Connection ~ 3150 6700
Wire Wire Line
	3150 6700 3600 6700
Wire Wire Line
	3600 6600 3600 6700
Connection ~ 3600 6700
Wire Wire Line
	3600 6700 3950 6700
Wire Wire Line
	5900 4150 5800 4150
Wire Wire Line
	5900 4250 5800 4250
Wire Wire Line
	5900 4350 5800 4350
Wire Wire Line
	5900 4450 5800 4450
Wire Wire Line
	5900 4550 5800 4550
Wire Wire Line
	5900 4650 5800 4650
Wire Wire Line
	5900 4750 5800 4750
Wire Wire Line
	5900 4850 5800 4850
Wire Wire Line
	6900 4150 7950 4150
Wire Wire Line
	6900 4250 7850 4250
Wire Wire Line
	6900 4350 7750 4350
Wire Wire Line
	6900 4450 7650 4450
Text GLabel 6500 5450 2    50   Input ~ 0
GND
Text GLabel 6550 3850 2    50   Input ~ 0
+5V
Wire Wire Line
	6550 3850 6400 3850
Wire Wire Line
	6400 5450 6500 5450
Text GLabel 9250 5400 2    50   Input ~ 0
GND
Text GLabel 9300 3900 2    50   Input ~ 0
+5V
Text GLabel 8550 5050 0    50   Input ~ 0
+5V
Wire Wire Line
	8550 5050 8650 5050
Wire Wire Line
	9250 5400 9150 5400
Wire Wire Line
	9150 5400 9150 5350
Wire Wire Line
	9300 3900 9150 3900
Wire Bus Line
	8100 5700 8100 5800
Wire Bus Line
	8100 5800 8150 5800
Text HLabel 8150 5800 2    50   BiDi ~ 0
D[0..15]
Entry Wire Line
	7150 5700 7250 5600
Entry Wire Line
	7250 5700 7350 5600
Entry Wire Line
	7350 5700 7450 5600
Entry Wire Line
	7450 5700 7550 5600
Entry Wire Line
	7550 5700 7650 5600
Entry Wire Line
	7650 5700 7750 5600
Entry Wire Line
	7750 5700 7850 5600
Wire Wire Line
	6900 4550 7550 4550
Wire Wire Line
	6900 4650 7450 4650
Wire Wire Line
	6900 4750 7350 4750
Wire Wire Line
	6900 4850 7250 4850
Entry Wire Line
	7850 5700 7950 5600
Wire Wire Line
	7250 5600 7250 4850
Connection ~ 7250 4850
Wire Wire Line
	7250 4850 8650 4850
Wire Wire Line
	7350 5600 7350 4750
Connection ~ 7350 4750
Wire Wire Line
	7350 4750 8650 4750
Wire Wire Line
	7450 5600 7450 4650
Connection ~ 7450 4650
Wire Wire Line
	7450 4650 8650 4650
Wire Wire Line
	7550 5600 7550 4550
Connection ~ 7550 4550
Wire Wire Line
	7550 4550 8650 4550
Wire Wire Line
	7650 5600 7650 4450
Connection ~ 7650 4450
Wire Wire Line
	7650 4450 8650 4450
Wire Wire Line
	7750 5600 7750 4350
Connection ~ 7750 4350
Wire Wire Line
	7750 4350 8650 4350
Wire Wire Line
	7850 5600 7850 4250
Connection ~ 7850 4250
Wire Wire Line
	7850 4250 8650 4250
Wire Wire Line
	7950 5600 7950 4150
Connection ~ 7950 4150
Wire Wire Line
	7950 4150 8650 4150
Text Label 7950 5550 1    50   ~ 0
D0
Text Label 7850 5550 1    50   ~ 0
D1
Text Label 7750 5550 1    50   ~ 0
D2
Text Label 7650 5550 1    50   ~ 0
D3
Text Label 7550 5550 1    50   ~ 0
D4
Text Label 7450 5550 1    50   ~ 0
D5
Text Label 7350 5550 1    50   ~ 0
D6
Text Label 7250 5550 1    50   ~ 0
D7
Text HLabel 9750 5050 2    50   Output ~ 0
~RTC_IRQ
Text HLabel 9750 4850 2    50   Output ~ 0
SQW
Text HLabel 9750 4150 2    50   Input ~ 0
R~W
Text HLabel 9750 4350 2    50   Input ~ 0
~RTC_CS
Text HLabel 9750 4250 2    50   Input ~ 0
NOT_AS
Text HLabel 9750 4650 2    50   Input ~ 0
NOT_DS
Wire Wire Line
	9750 4150 9650 4150
Wire Wire Line
	9750 4250 9650 4250
Wire Wire Line
	9750 4350 9650 4350
Wire Wire Line
	9750 4550 9650 4550
Wire Wire Line
	9750 4650 9650 4650
Wire Wire Line
	9750 4850 9650 4850
Wire Wire Line
	9750 5050 9650 5050
Entry Wire Line
	5800 4150 5700 4250
Entry Wire Line
	5800 4250 5700 4350
Entry Wire Line
	5800 4350 5700 4450
Entry Wire Line
	5800 4450 5700 4550
Entry Wire Line
	5800 4550 5700 4650
Entry Wire Line
	5800 4650 5700 4750
Entry Wire Line
	5800 4750 5700 4850
Entry Wire Line
	5800 4850 5700 4950
Wire Bus Line
	5700 4150 5650 4150
Text HLabel 5650 4150 0    50   Input ~ 0
A[1..23]
Text Label 5850 4150 0    50   ~ 0
A1
Text Label 5850 4250 0    50   ~ 0
A2
Text Label 5850 4350 0    50   ~ 0
A3
Text Label 5850 4450 0    50   ~ 0
A4
Text Label 5850 4550 0    50   ~ 0
A5
Text Label 5850 4650 0    50   ~ 0
A6
Text Label 5850 4750 0    50   ~ 0
A7
Text Label 5850 4850 0    50   ~ 0
A8
Text GLabel 9750 4550 2    50   Input ~ 0
+5V
Text GLabel 5800 5150 0    50   Input ~ 0
GND
Wire Wire Line
	5800 5150 5900 5150
Text HLabel 5800 5050 0    50   Input ~ 0
NOT_AS
Wire Wire Line
	5800 5050 5900 5050
Wire Bus Line
	2250 2400 2250 2800
Wire Bus Line
	4750 2750 4750 3300
Wire Bus Line
	7050 1200 7050 1800
Wire Bus Line
	5700 4150 5700 4950
Wire Bus Line
	7100 5700 8100 5700
Wire Bus Line
	6050 1000 6050 1800
Wire Bus Line
	4750 1800 4750 2600
Wire Bus Line
	2250 1500 2250 2300
$EndSCHEMATC
