EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
$Comp
L Interface:68681 U?
U 1 1 60A4B8A2
P 4300 3900
F 0 "U?" H 3750 5450 50  0000 C CNN
F 1 "68681" H 3800 5350 50  0000 C CNN
F 2 "" H 4300 3900 50  0001 C CNN
F 3 "" H 4300 3900 50  0001 C CNN
	1    4300 3900
	1    0    0    -1  
$EndComp
$Comp
L custom:CP2102_Breakout U?
U 1 1 60A4DBBB
P 8700 4900
F 0 "U?" H 9028 4938 50  0000 L CNN
F 1 "CONSOLE" H 9028 4847 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x06_P1.00mm_Vertical" H 8700 4900 50  0001 C CNN
F 3 "" H 8700 4900 50  0001 C CNN
	1    8700 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3000 3150 3000
Wire Wire Line
	3300 3100 3150 3100
Wire Wire Line
	3300 3200 3150 3200
Wire Wire Line
	3300 3300 3150 3300
Wire Wire Line
	3300 3400 3150 3400
Wire Wire Line
	3300 3500 3150 3500
Wire Wire Line
	3300 3600 3150 3600
Wire Wire Line
	3300 3700 3150 3700
Wire Wire Line
	3300 3900 3150 3900
Wire Wire Line
	3300 4000 3150 4000
Wire Wire Line
	3300 4100 3150 4100
Wire Wire Line
	3300 4200 3150 4200
Entry Wire Line
	3150 3000 3050 3100
Entry Wire Line
	3150 3100 3050 3200
Entry Wire Line
	3150 3200 3050 3300
Entry Wire Line
	3150 3300 3050 3400
Entry Wire Line
	3150 3400 3050 3500
Entry Wire Line
	3150 3500 3050 3600
Entry Wire Line
	3150 3600 3050 3700
Entry Wire Line
	3150 3700 3050 3800
Entry Wire Line
	3150 3900 3050 4000
Entry Wire Line
	3150 4000 3050 4100
Entry Wire Line
	3150 4100 3050 4200
Entry Wire Line
	3150 4200 3050 4300
Wire Bus Line
	3050 3000 2950 3000
Wire Bus Line
	3050 3900 2950 3900
Text HLabel 2950 3000 0    50   BiDi ~ 0
D[0..15]
Text HLabel 2950 3900 0    50   BiDi ~ 0
A[1..4]
Text Label 3250 3900 0    50   ~ 0
A1
Text Label 3250 4000 0    50   ~ 0
A2
Text Label 3250 4100 0    50   ~ 0
A3
Text Label 3250 4200 0    50   ~ 0
A4
Text Label 3200 3000 0    50   ~ 0
D0
Text Label 3200 3100 0    50   ~ 0
D1
Text Label 3200 3200 0    50   ~ 0
D2
Text Label 3200 3300 0    50   ~ 0
D3
Text Label 3200 3400 0    50   ~ 0
D4
Text Label 3200 3500 0    50   ~ 0
D5
Text Label 3200 3600 0    50   ~ 0
D6
Text Label 3200 3700 0    50   ~ 0
D7
NoConn ~ 8400 5150
NoConn ~ 8900 5150
Wire Wire Line
	8500 5150 8500 5400
Wire Wire Line
	8500 5400 8400 5400
Wire Wire Line
	8600 5150 8600 5500
Wire Wire Line
	8600 5500 8400 5500
Wire Wire Line
	8700 5150 8700 5600
Wire Wire Line
	8700 5600 8400 5600
$Comp
L Oscillator:CXO_DIP14 X?
U 1 1 60A58E96
P 2000 2700
F 0 "X?" H 2344 2746 50  0000 L CNN
F 1 "CXO_DIP14" H 2344 2655 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 2450 2350 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 1900 2700 50  0001 C CNN
	1    2000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2700 3300 2700
NoConn ~ 3300 2800
Text GLabel 5300 2800 2    50   Input ~ 0
RxDA
Text GLabel 8400 5600 0    50   Output ~ 0
RxDA
NoConn ~ 8800 5150
Text GLabel 8400 5500 0    50   Input ~ 0
TxDA
Text GLabel 5300 2700 2    50   Output ~ 0
TxDA
Text GLabel 5300 3000 2    50   Output ~ 0
TxDB
Text GLabel 5300 3100 2    50   Input ~ 0
RxDB
$Comp
L Device:C_Small C?
U 1 1 60E91E12
P 4500 2300
F 0 "C?" V 4271 2300 50  0000 C CNN
F 1 "0.1uF" V 4362 2300 50  0000 C CNN
F 2 "" H 4500 2300 50  0001 C CNN
F 3 "~" H 4500 2300 50  0001 C CNN
	1    4500 2300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60E93F00
P 4300 2250
F 0 "#PWR?" H 4300 2100 50  0001 C CNN
F 1 "+5V" H 4315 2423 50  0000 C CNN
F 2 "" H 4300 2250 50  0001 C CNN
F 3 "" H 4300 2250 50  0001 C CNN
	1    4300 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60E94957
P 4700 2300
F 0 "#PWR?" H 4700 2050 50  0001 C CNN
F 1 "GND" H 4705 2127 50  0000 C CNN
F 2 "" H 4700 2300 50  0001 C CNN
F 3 "" H 4700 2300 50  0001 C CNN
	1    4700 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2400 4300 2300
Wire Wire Line
	4400 2300 4300 2300
Connection ~ 4300 2300
Wire Wire Line
	4300 2300 4300 2250
Wire Wire Line
	4600 2300 4700 2300
Text HLabel 3300 4400 0    50   Input ~ 0
~DUART_CS
Text HLabel 3300 4500 0    50   Input ~ 0
R~W
Text HLabel 3300 4600 0    50   Input ~ 0
~DUART_IACK
Text HLabel 3300 4700 0    50   Input ~ 0
~RESET
Text HLabel 3300 4900 0    50   Output ~ 0
~DUART_DTACK
Text HLabel 3300 5000 0    50   Output ~ 0
~DUART_IRQ
Wire Wire Line
	5300 3300 5450 3300
Wire Wire Line
	5300 3400 5450 3400
Wire Wire Line
	5300 3500 5450 3500
Wire Wire Line
	5300 3600 5450 3600
Wire Wire Line
	5300 3700 5450 3700
Wire Wire Line
	5300 3800 5450 3800
Wire Wire Line
	5300 3900 5450 3900
Wire Wire Line
	5300 4000 5450 4000
Entry Wire Line
	5450 3300 5550 3400
Entry Wire Line
	5450 3400 5550 3500
Entry Wire Line
	5450 3500 5550 3600
Entry Wire Line
	5450 3600 5550 3700
Entry Wire Line
	5450 3700 5550 3800
Entry Wire Line
	5450 3800 5550 3900
Entry Wire Line
	5450 3900 5550 4000
Entry Wire Line
	5450 4000 5550 4100
Wire Wire Line
	5300 4200 5450 4200
Wire Wire Line
	5300 4300 5450 4300
Wire Wire Line
	5300 4400 5450 4400
Wire Wire Line
	5300 4500 5450 4500
Wire Wire Line
	5300 4600 5450 4600
Wire Wire Line
	5300 4700 5450 4700
Entry Wire Line
	5450 4200 5550 4300
Entry Wire Line
	5450 4300 5550 4400
Entry Wire Line
	5450 4400 5550 4500
Entry Wire Line
	5450 4500 5550 4600
Entry Wire Line
	5450 4600 5550 4700
Entry Wire Line
	5450 4700 5550 4800
Wire Bus Line
	5550 3300 5650 3300
Wire Bus Line
	5550 4250 5650 4250
Text GLabel 5650 3300 2    50   Output ~ 0
OP[0..7]
Text GLabel 5650 4250 2    50   Input ~ 0
IP[0..5]
Text Label 5300 3300 0    50   ~ 0
OP0
Text Label 5300 3400 0    50   ~ 0
OP1
Text Label 5300 3500 0    50   ~ 0
OP2
Text Label 5300 3600 0    50   ~ 0
OP3
Text Label 5300 3700 0    50   ~ 0
OP4
Text Label 5300 3800 0    50   ~ 0
OP5
Text Label 5300 3900 0    50   ~ 0
OP6
Text Label 5300 4000 0    50   ~ 0
OP7
Text Label 5300 4200 0    50   ~ 0
IP0
Text Label 5300 4300 0    50   ~ 0
IP1
Text Label 5300 4400 0    50   ~ 0
IP2
Text Label 5300 4500 0    50   ~ 0
IP3
Text Label 5300 4600 0    50   ~ 0
IP4
Text Label 5300 4700 0    50   ~ 0
IP5
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J?
U 1 1 60F280FC
P 8550 3150
F 0 "J?" H 8600 3667 50  0000 C CNN
F 1 "DUART_IO" H 8600 3576 50  0000 C CNN
F 2 "" H 8550 3150 50  0001 C CNN
F 3 "~" H 8550 3150 50  0001 C CNN
	1    8550 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2850 8200 2850
Wire Wire Line
	8350 2950 8200 2950
Wire Wire Line
	8350 3050 8200 3050
Wire Wire Line
	8350 3150 8200 3150
Wire Wire Line
	8350 3250 8200 3250
Wire Wire Line
	8350 3350 8200 3350
Wire Wire Line
	8350 3450 8200 3450
Wire Wire Line
	8350 3550 8200 3550
Wire Wire Line
	8850 2850 9000 2850
Wire Wire Line
	8850 2950 9000 2950
Wire Wire Line
	8850 3050 9000 3050
Wire Wire Line
	8850 3150 9000 3150
Wire Wire Line
	8850 3250 9000 3250
Wire Wire Line
	8850 3350 9000 3350
Wire Wire Line
	8850 3450 9000 3450
Wire Wire Line
	8850 3550 9000 3550
Entry Wire Line
	8200 2850 8100 2950
Entry Wire Line
	8200 2950 8100 3050
Entry Wire Line
	8200 3050 8100 3150
Entry Wire Line
	8200 3150 8100 3250
Entry Wire Line
	8200 3250 8100 3350
Entry Wire Line
	8200 3350 8100 3450
Entry Wire Line
	8200 3450 8100 3550
Entry Wire Line
	8200 3550 8100 3650
Entry Wire Line
	9000 3050 9100 3150
Entry Wire Line
	9000 3150 9100 3250
Entry Wire Line
	9000 3250 9100 3350
Entry Wire Line
	9000 3350 9100 3450
Entry Wire Line
	9000 3450 9100 3550
Entry Wire Line
	9000 3550 9100 3650
Text GLabel 9000 2850 2    50   Input ~ 0
TxDB
Text GLabel 9000 2950 2    50   Output ~ 0
RxDB
Wire Bus Line
	8100 2850 8000 2850
Text GLabel 8000 2850 0    50   Input ~ 0
OP[0..7]
Wire Bus Line
	9100 3050 9250 3050
Text GLabel 9250 3050 2    50   Output ~ 0
IP[0..5]
Wire Bus Line
	3050 3900 3050 4300
Wire Bus Line
	5550 4250 5550 4800
Wire Bus Line
	9100 3050 9100 3650
Wire Bus Line
	5550 3300 5550 4100
Wire Bus Line
	3050 3000 3050 3800
Wire Bus Line
	8100 2850 8100 3650
$EndSCHEMATC
