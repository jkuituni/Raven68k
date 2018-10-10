EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr USLegal 14000 8500
encoding utf-8
Sheet 1 2
Title "Raven68k - Minimum System"
Date "2018-10-09"
Rev "v1.0 Beta"
Comp "Chris Cureau and Jani Kuituniemi"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CPU_NXP_68000:68010D U?
U 1 1 5BBD648E
P 11300 3650
F 0 "U?" H 11700 6100 50  0000 C CNN
F 1 "68010D" H 11700 6000 50  0000 C CNN
F 2 "" H 11300 3650 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/reference-manual/MC68000UM.pdf" H 11300 3650 50  0001 C CNN
	1    11300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	12300 1450 12550 1450
Wire Wire Line
	12300 1550 12550 1550
Wire Wire Line
	12300 1650 12550 1650
Wire Wire Line
	12300 1750 12550 1750
Wire Wire Line
	12300 1850 12550 1850
Wire Wire Line
	12300 1950 12550 1950
Wire Wire Line
	12300 2050 12550 2050
Wire Wire Line
	12300 2150 12550 2150
Wire Wire Line
	12300 2250 12550 2250
Wire Wire Line
	12300 2350 12550 2350
Wire Wire Line
	12300 2450 12550 2450
Wire Wire Line
	12300 2550 12550 2550
Wire Wire Line
	12300 2650 12550 2650
Wire Wire Line
	12300 2750 12550 2750
Wire Wire Line
	12300 2850 12550 2850
Wire Wire Line
	12300 2950 12550 2950
Wire Wire Line
	12300 3050 12550 3050
Wire Wire Line
	12300 3150 12550 3150
Wire Wire Line
	12300 3250 12550 3250
Wire Wire Line
	12300 3350 12550 3350
Wire Wire Line
	12300 3450 12550 3450
Wire Wire Line
	12300 3550 12550 3550
Wire Wire Line
	12300 3650 12550 3650
Wire Wire Line
	12300 3850 12550 3850
Wire Wire Line
	12300 3950 12550 3950
Wire Wire Line
	12300 4050 12550 4050
Wire Wire Line
	12300 4150 12550 4150
Wire Wire Line
	12300 4250 12550 4250
Wire Wire Line
	12300 4350 12550 4350
Wire Wire Line
	12300 4450 12550 4450
Wire Wire Line
	12300 4550 12550 4550
Wire Wire Line
	12300 4650 12550 4650
Wire Wire Line
	12300 4750 12550 4750
Wire Wire Line
	12300 4850 12550 4850
Wire Wire Line
	12300 4950 12550 4950
Wire Wire Line
	12300 5050 12550 5050
Wire Wire Line
	12300 5150 12550 5150
Wire Wire Line
	12300 5250 12550 5250
Wire Wire Line
	12300 5350 12550 5350
Text Label 12300 1450 0    50   ~ 0
A1
Text Label 12300 1550 0    50   ~ 0
A2
Text Label 12300 1650 0    50   ~ 0
A3
Text Label 12300 1750 0    50   ~ 0
A4
Text Label 12300 1850 0    50   ~ 0
A5
Text Label 12300 1950 0    50   ~ 0
A6
Text Label 12300 2050 0    50   ~ 0
A7
Text Label 12300 2150 0    50   ~ 0
A8
Text Label 12300 2250 0    50   ~ 0
A9
Text Label 12300 2350 0    50   ~ 0
A10
Text Label 12300 2450 0    50   ~ 0
A11
Text Label 12300 2550 0    50   ~ 0
A12
Text Label 12300 2650 0    50   ~ 0
A13
Text Label 12300 2750 0    50   ~ 0
A14
Text Label 12300 2850 0    50   ~ 0
A15
Text Label 12300 2950 0    50   ~ 0
A16
Text Label 12300 3050 0    50   ~ 0
A17
Text Label 12300 3150 0    50   ~ 0
A18
Text Label 12300 3250 0    50   ~ 0
A19
Text Label 12300 3350 0    50   ~ 0
A20
Text Label 12300 3450 0    50   ~ 0
A21
Text Label 12300 3550 0    50   ~ 0
A22
Text Label 12300 3650 0    50   ~ 0
A23
Entry Wire Line
	12550 1450 12650 1550
Entry Wire Line
	12550 1550 12650 1650
Entry Wire Line
	12550 1650 12650 1750
Entry Wire Line
	12550 1750 12650 1850
Entry Wire Line
	12550 1850 12650 1950
Entry Wire Line
	12550 1950 12650 2050
Entry Wire Line
	12550 2050 12650 2150
Entry Wire Line
	12550 2150 12650 2250
Entry Wire Line
	12550 2250 12650 2350
Entry Wire Line
	12550 2350 12650 2450
Entry Wire Line
	12550 2450 12650 2550
Entry Wire Line
	12550 2550 12650 2650
Entry Wire Line
	12550 2650 12650 2750
Entry Wire Line
	12550 2750 12650 2850
Entry Wire Line
	12550 2850 12650 2950
Entry Wire Line
	12550 2950 12650 3050
Entry Wire Line
	12550 3050 12650 3150
Entry Wire Line
	12550 3150 12650 3250
Entry Wire Line
	12550 3250 12650 3350
Entry Wire Line
	12550 3350 12650 3450
Entry Wire Line
	12550 3450 12650 3550
Entry Wire Line
	12550 3550 12650 3650
Entry Wire Line
	12550 3650 12650 3750
Wire Bus Line
	12650 1400 12850 1400
Text GLabel 12850 1400 2    50   Output ~ 0
A[1..23]
Text Label 12300 3850 0    50   ~ 0
D0
Text Label 12300 3950 0    50   ~ 0
D1
Text Label 12300 4050 0    50   ~ 0
D2
Text Label 12300 4150 0    50   ~ 0
D3
Text Label 12300 4250 0    50   ~ 0
D4
Text Label 12300 4350 0    50   ~ 0
D5
Text Label 12300 4450 0    50   ~ 0
D6
Text Label 12300 4550 0    50   ~ 0
D7
Text Label 12300 4650 0    50   ~ 0
D8
Text Label 12300 4750 0    50   ~ 0
D9
Text Label 12300 4850 0    50   ~ 0
D10
Text Label 12300 4950 0    50   ~ 0
D11
Text Label 12300 5050 0    50   ~ 0
D12
Text Label 12300 5150 0    50   ~ 0
D13
Text Label 12300 5250 0    50   ~ 0
D14
Text Label 12300 5350 0    50   ~ 0
D15
Entry Wire Line
	12550 3850 12650 3950
Entry Wire Line
	12550 3950 12650 4050
Entry Wire Line
	12550 4050 12650 4150
Entry Wire Line
	12550 4150 12650 4250
Entry Wire Line
	12550 4250 12650 4350
Entry Wire Line
	12550 4350 12650 4450
Entry Wire Line
	12550 4450 12650 4550
Entry Wire Line
	12550 4550 12650 4650
Entry Wire Line
	12550 4650 12650 4750
Entry Wire Line
	12550 4750 12650 4850
Entry Wire Line
	12550 4850 12650 4950
Entry Wire Line
	12550 4950 12650 5050
Entry Wire Line
	12550 5050 12650 5150
Entry Wire Line
	12550 5150 12650 5250
Entry Wire Line
	12550 5250 12650 5350
Entry Wire Line
	12550 5350 12650 5450
Wire Bus Line
	12650 3850 12850 3850
Text GLabel 12850 3850 2    50   3State ~ 0
D[0..15]
$Comp
L Oscillator:CXO_DIP14 X?
U 1 1 5BBD8DE1
P 1600 5450
F 0 "X?" H 1900 5300 50  0000 L CNN
F 1 "8 MHZ" H 1850 5200 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 2050 5100 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 1500 5450 50  0001 C CNN
	1    1600 5450
	1    0    0    -1  
$EndComp
Text GLabel 11000 1200 0    50   Input ~ 0
+5V
Wire Wire Line
	11300 1250 11300 1200
Wire Wire Line
	11300 1200 11000 1200
Wire Wire Line
	11400 1250 11400 1200
Wire Wire Line
	11400 1200 11300 1200
Connection ~ 11300 1200
$Comp
L power:GND #PWR?
U 1 1 5BBDC0F1
P 11550 6200
F 0 "#PWR?" H 11550 5950 50  0001 C CNN
F 1 "GND" H 11555 6027 50  0000 C CNN
F 2 "" H 11550 6200 50  0001 C CNN
F 3 "" H 11550 6200 50  0001 C CNN
	1    11550 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	11400 6050 11400 6200
Wire Wire Line
	11400 6200 11550 6200
Wire Wire Line
	11300 6050 11300 6200
Wire Wire Line
	11300 6200 11400 6200
Connection ~ 11400 6200
Text GLabel 2100 5450 2    50   Output ~ 0
SYS_CLK
Wire Wire Line
	1900 5450 2100 5450
Text GLabel 10150 1450 0    50   Input ~ 0
SYS_CLK
Wire Wire Line
	10150 1450 10300 1450
NoConn ~ 10300 2250
Text GLabel 10100 2150 0    50   Input ~ 0
+5V
Text GLabel 10100 2350 0    50   Input ~ 0
+5V
Wire Wire Line
	10100 2150 10300 2150
Wire Wire Line
	10300 2350 10100 2350
Text GLabel 3350 6150 0    50   Input ~ 0
+5V
Wire Wire Line
	3350 6150 3600 6150
$Comp
L power:GND #PWR?
U 1 1 5BBF29FB
P 3750 7550
F 0 "#PWR?" H 3750 7300 50  0001 C CNN
F 1 "GND" H 3755 7377 50  0000 C CNN
F 2 "" H 3750 7550 50  0001 C CNN
F 3 "" H 3750 7550 50  0001 C CNN
	1    3750 7550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS148 U?
U 1 1 5BBF46DF
P 3600 6850
F 0 "U?" H 3600 7728 50  0000 C CNN
F 1 "74LS148" H 3600 7637 50  0000 C CNN
F 2 "" H 3600 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS148" H 3600 6850 50  0001 C CNN
	1    3600 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 7550 3600 7550
NoConn ~ 4100 6950
NoConn ~ 4100 7050
$Comp
L 74xx:74LS10 U?
U 1 1 5BBFB7E8
P 7650 7150
F 0 "U?" H 7650 6833 50  0000 C CNN
F 1 "74LS10" H 7650 6924 50  0000 C CNN
F 2 "" H 7650 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 7650 7150 50  0001 C CNN
	1    7650 7150
	-1   0    0    1   
$EndComp
Wire Wire Line
	10300 1750 10100 1750
Wire Wire Line
	10300 1850 10100 1850
Wire Wire Line
	10300 1950 10100 1950
Entry Wire Line
	10000 1850 10100 1750
Entry Wire Line
	10000 1950 10100 1850
Entry Wire Line
	10000 2050 10100 1950
Wire Bus Line
	9850 1750 10000 1750
Text GLabel 9850 1750 0    50   Input ~ 0
IPL
Text Label 10150 1750 0    50   ~ 0
IPL0
Text Label 10150 1850 0    50   ~ 0
IPL1
Text Label 10150 1950 0    50   ~ 0
IPL2
Wire Wire Line
	4100 6450 4300 6450
Wire Wire Line
	4100 6550 4300 6550
Wire Wire Line
	4100 6650 4300 6650
Entry Wire Line
	4300 6450 4400 6550
Entry Wire Line
	4300 6550 4400 6650
Entry Wire Line
	4300 6650 4400 6750
Wire Bus Line
	4400 6450 4500 6450
Text GLabel 4500 6450 2    50   Output ~ 0
IPL
Text Label 4100 6450 0    50   ~ 0
IPL0
Text Label 4100 6550 0    50   ~ 0
IPL1
Text Label 4100 6650 0    50   ~ 0
IPL2
$Comp
L power:GND #PWR?
U 1 1 5BC06A34
P 2900 6450
F 0 "#PWR?" H 2900 6200 50  0001 C CNN
F 1 "GND" H 2905 6277 50  0000 C CNN
F 2 "" H 2900 6450 50  0001 C CNN
F 3 "" H 2900 6450 50  0001 C CNN
	1    2900 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 6450 2900 6450
$Comp
L power:GND #PWR?
U 1 1 5BC08D08
P 2900 7250
F 0 "#PWR?" H 2900 7000 50  0001 C CNN
F 1 "GND" H 2905 7077 50  0000 C CNN
F 2 "" H 2900 7250 50  0001 C CNN
F 3 "" H 2900 7250 50  0001 C CNN
	1    2900 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 7250 3100 7250
Wire Wire Line
	10300 2650 10150 2650
Wire Wire Line
	10300 2750 10150 2750
Wire Wire Line
	10300 2850 10150 2850
Entry Wire Line
	10050 2750 10150 2650
Entry Wire Line
	10050 2850 10150 2750
Entry Wire Line
	10050 2950 10150 2850
Wire Bus Line
	10050 2650 10000 2650
Text GLabel 10000 2650 0    50   Output ~ 0
FC
Wire Wire Line
	7950 7050 8100 7050
Wire Wire Line
	7950 7150 8100 7150
Wire Wire Line
	7950 7250 8100 7250
Entry Wire Line
	8100 7050 8200 7150
Entry Wire Line
	8100 7150 8200 7250
Entry Wire Line
	8100 7250 8200 7350
Wire Bus Line
	8200 7050 8300 7050
Text GLabel 8300 7050 2    50   Input ~ 0
FC
$Comp
L 74xx:74LS138 U?
U 1 1 5BC1A1E7
P 6550 6850
F 0 "U?" H 6550 7628 50  0000 C CNN
F 1 "74LS138" H 6550 7537 50  0000 C CNN
F 2 "" H 6550 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 6550 6850 50  0001 C CNN
	1    6550 6850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7050 7150 7350 7150
Text GLabel 7100 7050 2    50   Input ~ 0
+5V
Wire Wire Line
	7050 7050 7100 7050
Text GLabel 12500 5550 2    50   Output ~ 0
AS
Wire Wire Line
	12300 5550 12500 5550
Text GLabel 12500 5650 2    50   Output ~ 0
UDS
Text GLabel 12500 5750 2    50   Output ~ 0
LDS
Wire Wire Line
	12500 5650 12300 5650
Wire Wire Line
	12300 5750 12500 5750
Text GLabel 12500 5850 2    50   Output ~ 0
RW
Wire Wire Line
	12300 5850 12500 5850
Text GLabel 7150 7250 2    50   Input ~ 0
AS
Wire Wire Line
	7050 7250 7150 7250
$Comp
L 74xx:74LS10 U?
U 4 1 5BC41271
P 1550 6800
F 0 "U?" H 1780 6846 50  0000 L CNN
F 1 "74LS10" H 1780 6755 50  0000 L CNN
F 2 "" H 1550 6800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 1550 6800 50  0001 C CNN
	4    1550 6800
	1    0    0    -1  
$EndComp
Text GLabel 1650 6700 0    50   Input ~ 0
+5V
Wire Wire Line
	1650 6700 1800 6700
$Comp
L power:GND #PWR?
U 1 1 5BC4464D
P 1700 7300
F 0 "#PWR?" H 1700 7050 50  0001 C CNN
F 1 "GND" H 1705 7127 50  0000 C CNN
F 2 "" H 1700 7300 50  0001 C CNN
F 3 "" H 1700 7300 50  0001 C CNN
	1    1700 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 7300 1700 7300
Wire Wire Line
	7050 6550 7250 6550
Wire Wire Line
	7050 6650 7250 6650
Wire Wire Line
	7050 6750 7250 6750
Text Label 7100 6550 0    50   ~ 0
A1
Text Label 7100 6650 0    50   ~ 0
A2
Text Label 7100 6750 0    50   ~ 0
A3
Entry Wire Line
	7250 6550 7350 6650
Entry Wire Line
	7250 6650 7350 6750
Entry Wire Line
	7250 6750 7350 6850
Wire Bus Line
	7350 6550 7450 6550
Text GLabel 7450 6550 2    50   Input ~ 0
A[1..23]
NoConn ~ 6050 6550
NoConn ~ 6050 6650
NoConn ~ 6050 6750
NoConn ~ 6050 6850
NoConn ~ 6050 7050
NoConn ~ 6050 7150
NoConn ~ 6050 7250
Text GLabel 6400 6250 0    50   Input ~ 0
+5V
Wire Wire Line
	6400 6250 6550 6250
$Comp
L power:GND #PWR?
U 1 1 5BC706B3
P 6700 7600
F 0 "#PWR?" H 6700 7350 50  0001 C CNN
F 1 "GND" H 6705 7427 50  0000 C CNN
F 2 "" H 6700 7600 50  0001 C CNN
F 3 "" H 6700 7600 50  0001 C CNN
	1    6700 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 7600 6550 7600
Wire Wire Line
	6550 7600 6550 7550
Text GLabel 5900 6950 0    50   Output ~ 0
DUART_IACK
Wire Wire Line
	5900 6950 6050 6950
Text GLabel 2900 6850 0    50   Input ~ 0
DUART_IRQ
Wire Wire Line
	3100 6850 2900 6850
NoConn ~ 3100 6550
NoConn ~ 3100 6650
NoConn ~ 3100 6750
NoConn ~ 3100 6950
NoConn ~ 3100 7050
NoConn ~ 3100 7150
Text GLabel 1450 5100 0    50   Input ~ 0
+5V
$Comp
L power:GND #PWR?
U 1 1 5BC953AC
P 1700 5800
F 0 "#PWR?" H 1700 5550 50  0001 C CNN
F 1 "GND" H 1705 5627 50  0000 C CNN
F 2 "" H 1700 5800 50  0001 C CNN
F 3 "" H 1700 5800 50  0001 C CNN
	1    1700 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 5750 1600 5800
Wire Wire Line
	1600 5800 1700 5800
Wire Wire Line
	1450 5100 1600 5100
Wire Wire Line
	1600 5100 1600 5150
NoConn ~ 1300 5450
Text GLabel 10050 3350 0    50   Input ~ 0
+5V
Wire Wire Line
	10050 3350 10300 3350
NoConn ~ 10300 3150
NoConn ~ 10300 3250
Text GLabel 10050 4250 0    50   Input ~ 0
+5V
Wire Wire Line
	10050 4250 10300 4250
Text GLabel 10050 4450 0    50   Input ~ 0
DTACK
Wire Wire Line
	10300 4450 10050 4450
$Comp
L Power_Supervisor:MCP100-485D U?
U 1 1 5BCBD7C2
P 9300 4950
F 0 "U?" H 9070 4996 50  0000 R CNN
F 1 "MCP100-485D" H 9070 4905 50  0000 R CNN
F 2 "" H 8900 5100 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/11187f.pdf" H 9000 5200 50  0001 C CNN
	1    9300 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 4950 10200 4950
Wire Wire Line
	10300 4850 10200 4850
Wire Wire Line
	10200 4850 10200 4950
Connection ~ 10200 4950
Wire Wire Line
	10200 4950 9900 4950
Wire Wire Line
	9900 4950 9900 5100
Connection ~ 9900 4950
Wire Wire Line
	9900 4950 9600 4950
Text GLabel 9900 5100 3    50   BiDi ~ 0
RESET
Text GLabel 9000 4500 0    50   Input ~ 0
+5V
Wire Wire Line
	9000 4500 9200 4500
Wire Wire Line
	9200 4500 9200 4550
$Comp
L power:GND #PWR?
U 1 1 5BCD185A
P 9350 5350
F 0 "#PWR?" H 9350 5100 50  0001 C CNN
F 1 "GND" H 9355 5177 50  0000 C CNN
F 2 "" H 9350 5350 50  0001 C CNN
F 3 "" H 9350 5350 50  0001 C CNN
	1    9350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5350 9350 5350
$Comp
L Interface:68681 U?
U 1 1 5BD02204
P 6600 2600
F 0 "U?" H 6600 4278 50  0000 C CNN
F 1 "68681" H 6600 4187 50  0000 C CNN
F 2 "" H 6600 2600 50  0001 C CNN
F 3 "" H 6600 2600 50  0001 C CNN
	1    6600 2600
	1    0    0    -1  
$EndComp
Text GLabel 6350 1100 0    50   Input ~ 0
+5V
$Comp
L power:GND #PWR?
U 1 1 5BD02364
P 6800 4000
F 0 "#PWR?" H 6800 3750 50  0001 C CNN
F 1 "GND" H 6805 3827 50  0000 C CNN
F 2 "" H 6800 4000 50  0001 C CNN
F 3 "" H 6800 4000 50  0001 C CNN
	1    6800 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1100 6350 1100
Wire Wire Line
	6600 4000 6800 4000
$Comp
L Oscillator:CXO_DIP14 X?
U 1 1 5BD0D5E0
P 1550 4300
F 0 "X?" H 1850 4150 50  0000 L CNN
F 1 "3.6864 MHZ" H 1800 4050 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 2000 3950 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 1450 4300 50  0001 C CNN
	1    1550 4300
	1    0    0    -1  
$EndComp
Text GLabel 1400 3950 0    50   Input ~ 0
+5V
$Comp
L power:GND #PWR?
U 1 1 5BD0D66E
P 1650 4650
F 0 "#PWR?" H 1650 4400 50  0001 C CNN
F 1 "GND" H 1655 4477 50  0000 C CNN
F 2 "" H 1650 4650 50  0001 C CNN
F 3 "" H 1650 4650 50  0001 C CNN
	1    1650 4650
	1    0    0    -1  
$EndComp
Text GLabel 2100 4300 2    50   Output ~ 0
DUART_CLK
Wire Wire Line
	1400 3950 1550 3950
Wire Wire Line
	1550 3950 1550 4000
Wire Wire Line
	2100 4300 1850 4300
Wire Wire Line
	1550 4600 1550 4650
Wire Wire Line
	1550 4650 1650 4650
NoConn ~ 1250 4300
NoConn ~ 9500 6050
Text GLabel 5300 1400 0    50   Input ~ 0
DUART_CLK
Wire Wire Line
	5300 1400 5600 1400
NoConn ~ 5600 1500
Wire Wire Line
	5600 1700 5400 1700
Wire Wire Line
	5600 1800 5400 1800
Wire Wire Line
	5600 1900 5400 1900
Wire Wire Line
	5600 2000 5400 2000
Wire Wire Line
	5600 2100 5400 2100
Wire Wire Line
	5600 2200 5400 2200
Wire Wire Line
	5600 2300 5400 2300
Wire Wire Line
	5600 2400 5400 2400
Text Label 5500 1700 0    50   ~ 0
D0
Text Label 5500 1800 0    50   ~ 0
D1
Text Label 5500 1900 0    50   ~ 0
D2
Text Label 5500 2000 0    50   ~ 0
D3
Text Label 5500 2100 0    50   ~ 0
D4
Text Label 5500 2200 0    50   ~ 0
D5
Text Label 5500 2300 0    50   ~ 0
D6
Text Label 5500 2400 0    50   ~ 0
D7
Entry Wire Line
	5300 1800 5400 1700
Entry Wire Line
	5300 1900 5400 1800
Entry Wire Line
	5300 2000 5400 1900
Entry Wire Line
	5300 2100 5400 2000
Entry Wire Line
	5300 2200 5400 2100
Entry Wire Line
	5300 2300 5400 2200
Entry Wire Line
	5300 2400 5400 2300
Entry Wire Line
	5300 2500 5400 2400
Wire Bus Line
	5300 1700 5200 1700
Text GLabel 5200 1700 0    50   BiDi ~ 0
D[0..15]
Wire Wire Line
	5600 2600 5400 2600
Wire Wire Line
	5600 2700 5400 2700
Wire Wire Line
	5600 2800 5400 2800
Wire Wire Line
	5600 2900 5400 2900
Text Label 5500 2600 0    50   ~ 0
A1
Text Label 5500 2700 0    50   ~ 0
A2
Text Label 5500 2800 0    50   ~ 0
A3
Text Label 5500 2900 0    50   ~ 0
A4
Entry Wire Line
	5300 2700 5400 2600
Entry Wire Line
	5300 2800 5400 2700
Entry Wire Line
	5300 2900 5400 2800
Entry Wire Line
	5300 3000 5400 2900
Wire Bus Line
	5300 2600 5200 2600
Text GLabel 5200 2600 0    50   Input ~ 0
A[1..23]
Text GLabel 5300 3200 0    50   BiDi ~ 0
RW
Text GLabel 5300 3700 0    50   Output ~ 0
DUART_IRQ
Text GLabel 5300 3300 0    50   Input ~ 0
DUART_IACK
Text GLabel 5300 3400 0    50   BiDi ~ 0
RESET
Text GLabel 5300 3600 0    50   Output ~ 0
DTACK
Wire Wire Line
	5300 3200 5600 3200
Wire Wire Line
	5600 3300 5300 3300
Wire Wire Line
	5300 3400 5600 3400
Wire Wire Line
	5600 3600 5300 3600
Wire Wire Line
	5300 3700 5600 3700
Wire Bus Line
	10000 1750 10000 2050
Wire Bus Line
	4400 6450 4400 6750
Wire Bus Line
	10050 2650 10050 2950
Wire Bus Line
	8200 7050 8200 7350
Wire Bus Line
	7350 6550 7350 6850
Wire Bus Line
	5300 2600 5300 3000
Wire Bus Line
	5300 1700 5300 2500
Wire Bus Line
	12650 3850 12650 5450
Wire Bus Line
	12650 1400 12650 3750
$Sheet
S 800  750  900  1200
U 5BD91A8E
F0 "RAM/ROM/CS Logic" 50
F1 "file5BD91A8D.sch" 50
$EndSheet
$EndSCHEMATC
