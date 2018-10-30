EESchema Schematic File Version 4
LIBS:raven-prototypes-cache
EELAYER 26 0
EELAYER END
$Descr USLegal 14000 8500
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
L 74xx:74LS30 U12
U 1 1 5BBED796
P 1850 6100
F 0 "U12" H 1850 6625 50  0000 C CNN
F 1 "74LS30" H 1850 6534 50  0000 C CNN
F 2 "" H 1850 6100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 1850 6100 50  0001 C CNN
	1    1850 6100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U7
U 6 1 5BBF6601
P 2050 7100
F 0 "U7" H 2050 7417 50  0000 C CNN
F 1 "74LS04" H 2050 7326 50  0000 C CNN
F 2 "" H 2050 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2050 7100 50  0001 C CNN
	6    2050 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5800 1400 5800
Wire Wire Line
	1550 5900 1400 5900
Wire Wire Line
	1550 6000 1400 6000
Wire Wire Line
	1550 6100 1400 6100
Wire Wire Line
	1550 6200 1400 6200
Wire Wire Line
	1550 6300 1400 6300
Wire Wire Line
	1550 6400 1400 6400
Wire Wire Line
	1550 6500 1400 6500
Entry Wire Line
	1300 5900 1400 5800
Entry Wire Line
	1300 6000 1400 5900
Entry Wire Line
	1300 6100 1400 6000
Entry Wire Line
	1300 6200 1400 6100
Entry Wire Line
	1300 6300 1400 6200
Entry Wire Line
	1300 6400 1400 6300
Entry Wire Line
	1300 6500 1400 6400
Wire Bus Line
	1300 5800 1200 5800
Text GLabel 1200 5800 0    50   Input ~ 0
A[1..23]
Text Label 1400 5800 0    50   ~ 0
A17
Text Label 1400 5900 0    50   ~ 0
A18
Text Label 1400 6000 0    50   ~ 0
A19
Text Label 1400 6100 0    50   ~ 0
A20
Text Label 1400 6200 0    50   ~ 0
A21
Text Label 1400 6300 0    50   ~ 0
A22
Text Label 1400 6400 0    50   ~ 0
A23
Text GLabel 1600 6650 2    50   Input ~ 0
+5V
Wire Wire Line
	1400 6500 1400 6650
Text GLabel 2400 6100 2    50   Output ~ 0
ROM_CS_JMPR
Wire Wire Line
	1400 6650 1600 6650
$Comp
L 74xx:74LS138 U13
U 1 1 5BBF8186
P 4300 6950
F 0 "U13" H 4300 7728 50  0000 C CNN
F 1 "74LS138" H 4300 7637 50  0000 C CNN
F 2 "" H 4300 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4300 6950 50  0001 C CNN
	1    4300 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5BBF86B5
P 3800 7550
F 0 "#PWR010" H 3800 7300 50  0001 C CNN
F 1 "GND" H 3805 7377 50  0000 C CNN
F 2 "" H 3800 7550 50  0001 C CNN
F 3 "" H 3800 7550 50  0001 C CNN
	1    3800 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 7350 3800 7550
Wire Wire Line
	3800 6650 3650 6650
Wire Wire Line
	3800 6750 3650 6750
Wire Wire Line
	3800 6850 3650 6850
Entry Wire Line
	3550 6750 3650 6650
Entry Wire Line
	3550 6850 3650 6750
Entry Wire Line
	3550 6950 3650 6850
Wire Bus Line
	3550 6650 3400 6650
Text GLabel 3400 6650 0    50   Input ~ 0
A[1..23]
Text Label 3700 6650 0    50   ~ 0
A7
Text Label 3700 6750 0    50   ~ 0
A8
Text Label 3700 6850 0    50   ~ 0
A9
Text GLabel 3650 7150 0    50   Input ~ 0
+5V
Wire Wire Line
	3650 7150 3800 7150
Wire Wire Line
	4800 6650 4950 6650
Text GLabel 4950 6650 2    50   Output ~ 0
DUART_CS_JMPR
NoConn ~ 4800 6750
NoConn ~ 4800 6850
NoConn ~ 4800 6950
NoConn ~ 4800 7050
NoConn ~ 4800 7150
NoConn ~ 4800 7250
NoConn ~ 4800 7350
Wire Wire Line
	2800 7400 2650 7400
Entry Wire Line
	2550 7500 2650 7400
Wire Bus Line
	2550 7400 2450 7400
Text GLabel 2450 7400 0    50   Input ~ 0
A[1..23]
$Comp
L power:GND #PWR011
U 1 1 5BBFAF39
P 4450 7650
F 0 "#PWR011" H 4450 7400 50  0001 C CNN
F 1 "GND" H 4455 7477 50  0000 C CNN
F 2 "" H 4450 7650 50  0001 C CNN
F 3 "" H 4450 7650 50  0001 C CNN
	1    4450 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 7650 4300 7650
Text GLabel 4100 6350 0    50   Input ~ 0
+5V
Wire Wire Line
	4100 6350 4300 6350
$Comp
L raven:KM684000BLP-7L U3
U 1 1 5BC094F5
P 2900 2300
F 0 "U3" H 2900 3928 50  0000 C CNN
F 1 "KM684000BLP-7L" H 2900 3837 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 2900 2350 50  0001 C CNN
F 3 "https://pdf1.alldatasheet.com/datasheet-pdf/view/37316/SAMSUNG/KM684000BLP-7L.html" H 2900 2650 50  0001 C CNN
	1    2900 2300
	1    0    0    -1  
$EndComp
$Comp
L raven:KM684000BLP-7L U4
U 1 1 5BC095A7
P 5300 2300
F 0 "U4" H 5300 3928 50  0000 C CNN
F 1 "KM684000BLP-7L" H 5300 3837 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 5300 2350 50  0001 C CNN
F 3 "https://pdf1.alldatasheet.com/datasheet-pdf/view/37316/SAMSUNG/KM684000BLP-7L.html" H 5300 2650 50  0001 C CNN
	1    5300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1050 4750 1050
Wire Wire Line
	4900 1150 4750 1150
Wire Wire Line
	4900 1250 4750 1250
Wire Wire Line
	4900 1350 4750 1350
Wire Wire Line
	4900 1450 4750 1450
Wire Wire Line
	4900 1550 4750 1550
Wire Wire Line
	4900 1650 4750 1650
Wire Wire Line
	4900 1750 4750 1750
Wire Wire Line
	4900 1850 4750 1850
Wire Wire Line
	4900 1950 4750 1950
Wire Wire Line
	4900 2050 4750 2050
Wire Wire Line
	4900 2150 4750 2150
Wire Wire Line
	4900 2250 4750 2250
Wire Wire Line
	4900 2350 4750 2350
Wire Wire Line
	4900 2450 4750 2450
Wire Wire Line
	4900 2550 4750 2550
Wire Wire Line
	4900 2650 4750 2650
Wire Wire Line
	4900 2750 4750 2750
Wire Wire Line
	4900 2850 4750 2850
Wire Wire Line
	2500 1050 2350 1050
Wire Wire Line
	2500 1150 2350 1150
Wire Wire Line
	2500 1250 2350 1250
Wire Wire Line
	2500 1350 2350 1350
Wire Wire Line
	2500 1450 2350 1450
Wire Wire Line
	2500 1550 2350 1550
Wire Wire Line
	2500 1650 2350 1650
Wire Wire Line
	2500 1750 2350 1750
Wire Wire Line
	2500 1850 2350 1850
Wire Wire Line
	2500 1950 2350 1950
Wire Wire Line
	2500 2050 2350 2050
Wire Wire Line
	2500 2150 2350 2150
Wire Wire Line
	2500 2250 2350 2250
Wire Wire Line
	2500 2350 2350 2350
Wire Wire Line
	2500 2450 2350 2450
Wire Wire Line
	2500 2550 2350 2550
Wire Wire Line
	2500 2650 2350 2650
Wire Wire Line
	2500 2750 2350 2750
Wire Wire Line
	2500 2850 2350 2850
Entry Wire Line
	4650 1150 4750 1050
Entry Wire Line
	4650 1250 4750 1150
Entry Wire Line
	4650 1350 4750 1250
Entry Wire Line
	4650 1450 4750 1350
Entry Wire Line
	4650 1550 4750 1450
Entry Wire Line
	4650 1650 4750 1550
Entry Wire Line
	4650 1750 4750 1650
Entry Wire Line
	4650 1850 4750 1750
Entry Wire Line
	4650 1950 4750 1850
Entry Wire Line
	4650 2050 4750 1950
Entry Wire Line
	4650 2150 4750 2050
Entry Wire Line
	4650 2250 4750 2150
Entry Wire Line
	4650 2350 4750 2250
Entry Wire Line
	4650 2450 4750 2350
Entry Wire Line
	4650 2550 4750 2450
Entry Wire Line
	4650 2650 4750 2550
Entry Wire Line
	4650 2750 4750 2650
Entry Wire Line
	4650 2850 4750 2750
Entry Wire Line
	4650 2950 4750 2850
Entry Wire Line
	2250 1150 2350 1050
Entry Wire Line
	2250 1250 2350 1150
Entry Wire Line
	2250 1350 2350 1250
Entry Wire Line
	2250 1450 2350 1350
Entry Wire Line
	2250 1550 2350 1450
Entry Wire Line
	2250 1650 2350 1550
Entry Wire Line
	2250 1750 2350 1650
Entry Wire Line
	2250 1850 2350 1750
Entry Wire Line
	2250 1950 2350 1850
Entry Wire Line
	2250 2050 2350 1950
Entry Wire Line
	2250 2150 2350 2050
Entry Wire Line
	2250 2250 2350 2150
Entry Wire Line
	2250 2350 2350 2250
Entry Wire Line
	2250 2450 2350 2350
Entry Wire Line
	2250 2550 2350 2450
Entry Wire Line
	2250 2650 2350 2550
Entry Wire Line
	2250 2750 2350 2650
Entry Wire Line
	2250 2850 2350 2750
Entry Wire Line
	2250 2950 2350 2850
Wire Bus Line
	2250 1050 2150 1050
Wire Bus Line
	4550 1050 4650 1050
Text GLabel 2150 1050 0    50   Input ~ 0
A[1..23]
Text GLabel 4550 1050 0    50   Input ~ 0
A[1..23]
Wire Wire Line
	3300 1050 3450 1050
Wire Wire Line
	3300 1150 3450 1150
Wire Wire Line
	3300 1250 3450 1250
Wire Wire Line
	3300 1350 3450 1350
Wire Wire Line
	3300 1450 3450 1450
Wire Wire Line
	3300 1550 3450 1550
Wire Wire Line
	3300 1650 3450 1650
Wire Wire Line
	3300 1750 3450 1750
Wire Wire Line
	5700 1050 5850 1050
Wire Wire Line
	5700 1150 5850 1150
Wire Wire Line
	5700 1250 5850 1250
Wire Wire Line
	5700 1350 5850 1350
Wire Wire Line
	5700 1450 5850 1450
Wire Wire Line
	5700 1550 5850 1550
Wire Wire Line
	5700 1650 5850 1650
Wire Wire Line
	5700 1750 5850 1750
Entry Wire Line
	3450 1050 3550 1150
Entry Wire Line
	3450 1150 3550 1250
Entry Wire Line
	3450 1250 3550 1350
Entry Wire Line
	3450 1350 3550 1450
Entry Wire Line
	3450 1450 3550 1550
Entry Wire Line
	3450 1550 3550 1650
Entry Wire Line
	3450 1650 3550 1750
Entry Wire Line
	3450 1750 3550 1850
Entry Wire Line
	5850 1050 5950 1150
Entry Wire Line
	5850 1150 5950 1250
Entry Wire Line
	5850 1250 5950 1350
Entry Wire Line
	5850 1350 5950 1450
Entry Wire Line
	5850 1450 5950 1550
Entry Wire Line
	5850 1550 5950 1650
Entry Wire Line
	5850 1650 5950 1750
Entry Wire Line
	5850 1750 5950 1850
Wire Bus Line
	3550 1050 3650 1050
Wire Bus Line
	5950 1050 6050 1050
Text GLabel 6050 1050 2    50   BiDi ~ 0
D[0..15]
Text GLabel 3650 1050 2    50   BiDi ~ 0
D[0..15]
Text Label 3350 1050 0    50   ~ 0
D0
Text Label 3350 1150 0    50   ~ 0
D1
Text Label 3350 1250 0    50   ~ 0
D2
Text Label 3350 1350 0    50   ~ 0
D3
Text Label 3350 1450 0    50   ~ 0
D4
Text Label 3350 1550 0    50   ~ 0
D5
Text Label 3350 1650 0    50   ~ 0
D6
Text Label 3350 1750 0    50   ~ 0
D7
Text Label 5750 1050 0    50   ~ 0
D8
Text Label 5750 1150 0    50   ~ 0
D9
Text Label 5750 1250 0    50   ~ 0
D10
Text Label 5750 1350 0    50   ~ 0
D11
Text Label 5750 1450 0    50   ~ 0
D12
Text Label 5750 1550 0    50   ~ 0
D13
Text Label 5750 1650 0    50   ~ 0
D14
Text Label 5750 1750 0    50   ~ 0
D15
Text Label 2350 1050 0    50   ~ 0
A1
Text Label 2350 1150 0    50   ~ 0
A2
Text Label 2350 1250 0    50   ~ 0
A3
Text Label 2350 1350 0    50   ~ 0
A4
Text Label 2350 1450 0    50   ~ 0
A5
Text Label 2350 1550 0    50   ~ 0
A6
Text Label 2350 1650 0    50   ~ 0
A7
Text Label 2350 1750 0    50   ~ 0
A8
Text Label 2350 1850 0    50   ~ 0
A9
Text Label 2350 1950 0    50   ~ 0
A10
Text Label 2350 2050 0    50   ~ 0
A11
Text Label 2350 2150 0    50   ~ 0
A12
Text Label 2350 2250 0    50   ~ 0
A13
Text Label 2350 2350 0    50   ~ 0
A14
Text Label 2350 2450 0    50   ~ 0
A15
Text Label 2350 2550 0    50   ~ 0
A16
Text Label 2350 2650 0    50   ~ 0
A17
Text Label 2350 2750 0    50   ~ 0
A18
Text Label 2350 2850 0    50   ~ 0
A19
Text Label 4750 1050 0    50   ~ 0
A1
Text Label 4750 1150 0    50   ~ 0
A2
Text Label 4750 1250 0    50   ~ 0
A3
Text Label 4750 1350 0    50   ~ 0
A4
Text Label 4750 1450 0    50   ~ 0
A5
Text Label 4750 1550 0    50   ~ 0
A6
Text Label 4750 1650 0    50   ~ 0
A7
Text Label 4750 1750 0    50   ~ 0
A8
Text Label 4750 1850 0    50   ~ 0
A9
Text Label 4750 1950 0    50   ~ 0
A10
Text Label 4750 2050 0    50   ~ 0
A11
Text Label 4750 2150 0    50   ~ 0
A12
Text Label 4750 2250 0    50   ~ 0
A13
Text Label 4750 2350 0    50   ~ 0
A14
Text Label 4750 2450 0    50   ~ 0
A15
Text Label 4750 2550 0    50   ~ 0
A16
Text Label 4750 2650 0    50   ~ 0
A17
Text Label 4750 2750 0    50   ~ 0
A18
Text Label 4750 2850 0    50   ~ 0
A19
Text GLabel 2400 3100 0    50   Input ~ 0
RW
Text GLabel 4800 3100 0    50   Input ~ 0
RW
Text GLabel 2400 3200 0    50   Input ~ 0
OE
Text GLabel 4800 3200 0    50   Input ~ 0
OE
Wire Wire Line
	4800 3100 4900 3100
Wire Wire Line
	4900 3200 4800 3200
Wire Wire Line
	2400 3100 2500 3100
Wire Wire Line
	2500 3200 2400 3200
$Comp
L 74xx:74LS20 U11
U 1 1 5BC614E2
P 1850 5100
F 0 "U11" H 1850 5475 50  0000 C CNN
F 1 "74LS20" H 1850 5384 50  0000 C CNN
F 2 "" H 1850 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS20" H 1850 5100 50  0001 C CNN
	1    1850 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4950 1400 4950
Wire Wire Line
	1550 5050 1400 5050
Wire Wire Line
	1550 5150 1400 5150
Wire Wire Line
	1550 5250 1400 5250
Entry Wire Line
	1300 5050 1400 4950
Entry Wire Line
	1300 5150 1400 5050
Entry Wire Line
	1300 5250 1400 5150
Entry Wire Line
	1300 5350 1400 5250
Wire Bus Line
	1300 4950 1200 4950
Text GLabel 1200 4950 0    50   Input ~ 0
A[1..23]
Text Label 1400 4950 0    50   ~ 0
A20
Text Label 1400 5050 0    50   ~ 0
A21
Text Label 1400 5150 0    50   ~ 0
A22
Text Label 1400 5250 0    50   ~ 0
A23
$Comp
L 74xx:74LS04 U7
U 5 1 5BC6B7CE
P 2600 5100
F 0 "U7" H 2600 5417 50  0000 C CNN
F 1 "74LS04" H 2600 5326 50  0000 C CNN
F 2 "" H 2600 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2600 5100 50  0001 C CNN
	5    2600 5100
	1    0    0    -1  
$EndComp
Text GLabel 3150 5100 2    50   Output ~ 0
RAM_CS_JMPR
Wire Wire Line
	2150 5100 2300 5100
Wire Wire Line
	2900 5100 3150 5100
Wire Wire Line
	4800 3300 4900 3300
Wire Wire Line
	2400 3300 2500 3300
$Comp
L Memory_EEPROM:28C256 U5
U 1 1 5BC8E11F
P 7900 1950
F 0 "U5" H 7900 3228 50  0000 C CNN
F 1 "28C256" H 7900 3137 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 7900 1950 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 7900 1950 50  0001 C CNN
	1    7900 1950
	1    0    0    -1  
$EndComp
$Comp
L Memory_EEPROM:28C256 U6
U 1 1 5BC8E17D
P 10350 1950
F 0 "U6" H 10350 3228 50  0000 C CNN
F 1 "28C256" H 10350 3137 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 10350 1950 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 10350 1950 50  0001 C CNN
	1    10350 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 1050 10950 1050
Wire Wire Line
	10750 1150 10950 1150
Wire Wire Line
	10750 1250 10950 1250
Wire Wire Line
	10750 1350 10950 1350
Wire Wire Line
	10750 1450 10950 1450
Wire Wire Line
	10750 1550 10950 1550
Wire Wire Line
	10750 1650 10950 1650
Wire Wire Line
	10750 1750 10950 1750
Wire Wire Line
	9950 1050 9750 1050
Wire Wire Line
	9950 1150 9750 1150
Wire Wire Line
	9950 1250 9750 1250
Wire Wire Line
	9950 1350 9750 1350
Wire Wire Line
	9950 1450 9750 1450
Wire Wire Line
	9950 1550 9750 1550
Wire Wire Line
	9950 1650 9750 1650
Wire Wire Line
	9950 1750 9750 1750
Wire Wire Line
	9950 1850 9750 1850
Wire Wire Line
	9950 1950 9750 1950
Wire Wire Line
	9950 2050 9750 2050
Wire Wire Line
	9950 2150 9750 2150
Wire Wire Line
	9950 2250 9750 2250
Wire Wire Line
	9950 2350 9750 2350
Wire Wire Line
	9950 2450 9750 2450
Wire Wire Line
	9950 2650 9850 2650
Wire Wire Line
	9950 2750 9850 2750
Wire Wire Line
	9950 2850 9850 2850
Wire Wire Line
	7500 2650 7400 2650
Wire Wire Line
	7500 2750 7400 2750
Wire Wire Line
	7500 2850 7400 2850
Wire Wire Line
	7500 1050 7300 1050
Wire Wire Line
	7500 1150 7300 1150
Wire Wire Line
	7500 1250 7300 1250
Wire Wire Line
	7500 1350 7300 1350
Wire Wire Line
	7500 1450 7300 1450
Wire Wire Line
	7500 1550 7300 1550
Wire Wire Line
	7500 1650 7300 1650
Wire Wire Line
	7500 1750 7300 1750
Wire Wire Line
	7500 1850 7300 1850
Wire Wire Line
	7500 1950 7300 1950
Wire Wire Line
	7500 2050 7300 2050
Wire Wire Line
	7500 2150 7300 2150
Wire Wire Line
	7500 2250 7300 2250
Wire Wire Line
	7500 2350 7300 2350
Wire Wire Line
	7500 2450 7300 2450
Wire Wire Line
	8300 1050 8500 1050
Wire Wire Line
	8300 1150 8500 1150
Wire Wire Line
	8300 1250 8500 1250
Wire Wire Line
	8300 1350 8500 1350
Wire Wire Line
	8300 1450 8500 1450
Wire Wire Line
	8300 1550 8500 1550
Wire Wire Line
	8300 1650 8500 1650
Wire Wire Line
	8300 1750 8500 1750
Entry Wire Line
	10950 1050 11050 1150
Entry Wire Line
	10950 1150 11050 1250
Entry Wire Line
	10950 1250 11050 1350
Entry Wire Line
	10950 1350 11050 1450
Entry Wire Line
	10950 1450 11050 1550
Entry Wire Line
	10950 1550 11050 1650
Entry Wire Line
	10950 1650 11050 1750
Entry Wire Line
	10950 1750 11050 1850
Entry Wire Line
	9650 1150 9750 1050
Entry Wire Line
	9650 1250 9750 1150
Entry Wire Line
	9650 1350 9750 1250
Entry Wire Line
	9650 1450 9750 1350
Entry Wire Line
	9650 1550 9750 1450
Entry Wire Line
	9650 1650 9750 1550
Entry Wire Line
	9650 1750 9750 1650
Entry Wire Line
	9650 1850 9750 1750
Entry Wire Line
	9650 1950 9750 1850
Entry Wire Line
	9650 2050 9750 1950
Entry Wire Line
	9650 2150 9750 2050
Entry Wire Line
	9650 2250 9750 2150
Entry Wire Line
	9650 2350 9750 2250
Entry Wire Line
	9650 2450 9750 2350
Entry Wire Line
	9650 2550 9750 2450
Entry Wire Line
	7200 1150 7300 1050
Entry Wire Line
	7200 1250 7300 1150
Entry Wire Line
	7200 1350 7300 1250
Entry Wire Line
	7200 1450 7300 1350
Entry Wire Line
	7200 1550 7300 1450
Entry Wire Line
	7200 1650 7300 1550
Entry Wire Line
	7200 1750 7300 1650
Entry Wire Line
	7200 1850 7300 1750
Entry Wire Line
	7200 1950 7300 1850
Entry Wire Line
	7200 2050 7300 1950
Entry Wire Line
	7200 2150 7300 2050
Entry Wire Line
	7200 2250 7300 2150
Entry Wire Line
	7200 2350 7300 2250
Entry Wire Line
	7200 2450 7300 2350
Entry Wire Line
	7200 2550 7300 2450
Entry Wire Line
	8500 1050 8600 1150
Entry Wire Line
	8500 1150 8600 1250
Entry Wire Line
	8500 1250 8600 1350
Entry Wire Line
	8500 1350 8600 1450
Entry Wire Line
	8500 1450 8600 1550
Entry Wire Line
	8500 1550 8600 1650
Entry Wire Line
	8500 1650 8600 1750
Entry Wire Line
	8500 1750 8600 1850
Wire Bus Line
	11050 1050 11150 1050
Wire Bus Line
	8600 1050 8700 1050
Wire Bus Line
	9650 1050 9550 1050
Wire Bus Line
	7200 1050 7100 1050
Text GLabel 8700 1050 2    50   BiDi ~ 0
D[0..15]
Text GLabel 11150 1050 2    50   BiDi ~ 0
D[0..15]
Text GLabel 7100 1050 0    50   Input ~ 0
A[1..23]
Text GLabel 9550 1050 0    50   Input ~ 0
A[1..23]
Text Label 9750 1050 0    50   ~ 0
A1
Text Label 9750 1150 0    50   ~ 0
A2
Text Label 9750 1250 0    50   ~ 0
A3
Text Label 9750 1350 0    50   ~ 0
A4
Text Label 9750 1450 0    50   ~ 0
A5
Text Label 9750 1550 0    50   ~ 0
A6
Text Label 9750 1650 0    50   ~ 0
A7
Text Label 9750 1750 0    50   ~ 0
A8
Text Label 9750 1850 0    50   ~ 0
A9
Text Label 9750 1950 0    50   ~ 0
A10
Text Label 9750 2050 0    50   ~ 0
A11
Text Label 9750 2150 0    50   ~ 0
A12
Text Label 9750 2250 0    50   ~ 0
A13
Text Label 9750 2350 0    50   ~ 0
A14
Text Label 9750 2450 0    50   ~ 0
A15
Text Label 7300 1050 0    50   ~ 0
A1
Text Label 7300 1150 0    50   ~ 0
A2
Text Label 7300 1250 0    50   ~ 0
A3
Text Label 7300 1350 0    50   ~ 0
A4
Text Label 7300 1450 0    50   ~ 0
A5
Text Label 7300 1550 0    50   ~ 0
A6
Text Label 7300 1650 0    50   ~ 0
A7
Text Label 7300 1750 0    50   ~ 0
A8
Text Label 7300 1850 0    50   ~ 0
A9
Text Label 7300 1950 0    50   ~ 0
A10
Text Label 7300 2050 0    50   ~ 0
A11
Text Label 7300 2150 0    50   ~ 0
A12
Text Label 7300 2250 0    50   ~ 0
A13
Text Label 7300 2350 0    50   ~ 0
A14
Text Label 7300 2450 0    50   ~ 0
A15
Text Label 8350 1050 0    50   ~ 0
D0
Text Label 8350 1150 0    50   ~ 0
D1
Text Label 8350 1250 0    50   ~ 0
D2
Text Label 8350 1350 0    50   ~ 0
D3
Text Label 8350 1450 0    50   ~ 0
D4
Text Label 8350 1550 0    50   ~ 0
D5
Text Label 8350 1650 0    50   ~ 0
D6
Text Label 8350 1750 0    50   ~ 0
D7
Text Label 10800 1050 0    50   ~ 0
D8
Text Label 10800 1150 0    50   ~ 0
D9
Text Label 10800 1250 0    50   ~ 0
D10
Text Label 10800 1350 0    50   ~ 0
D11
Text Label 10800 1450 0    50   ~ 0
D12
Text Label 10800 1550 0    50   ~ 0
D13
Text Label 10800 1650 0    50   ~ 0
D14
Text Label 10800 1750 0    50   ~ 0
D15
Text GLabel 9850 2650 0    50   Input ~ 0
RW
Text GLabel 7400 2650 0    50   Input ~ 0
RW
Text GLabel 7400 2750 0    50   Input ~ 0
OE
Text GLabel 9850 2750 0    50   Input ~ 0
OE
Text GLabel 7400 2850 0    50   Input ~ 0
ROM_LDS
Text GLabel 9850 2850 0    50   Input ~ 0
ROM_UDS
Wire Wire Line
	2150 6100 2400 6100
Wire Wire Line
	2350 7100 2800 7100
Text GLabel 1550 7100 0    50   Input ~ 0
ROM_CS
Wire Wire Line
	1550 7100 1750 7100
Wire Wire Line
	3800 7250 3400 7250
Text GLabel 2700 850  0    50   Input ~ 0
+5V
Text GLabel 5100 850  0    50   Input ~ 0
+5V
Wire Wire Line
	5300 850  5100 850 
Wire Wire Line
	2900 850  2700 850 
Text GLabel 7750 850  0    50   Input ~ 0
+5V
Text GLabel 10200 850  0    50   Input ~ 0
+5V
Wire Wire Line
	10200 850  10350 850 
Wire Wire Line
	7750 850  7900 850 
$Comp
L power:GND #PWR014
U 1 1 5BDCD12E
P 10500 3050
F 0 "#PWR014" H 10500 2800 50  0001 C CNN
F 1 "GND" H 10505 2877 50  0000 C CNN
F 2 "" H 10500 3050 50  0001 C CNN
F 3 "" H 10500 3050 50  0001 C CNN
	1    10500 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5BDCD15C
P 8050 3050
F 0 "#PWR013" H 8050 2800 50  0001 C CNN
F 1 "GND" H 8055 2877 50  0000 C CNN
F 2 "" H 8050 3050 50  0001 C CNN
F 3 "" H 8050 3050 50  0001 C CNN
	1    8050 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 3050 10500 3050
Wire Wire Line
	7900 3050 8050 3050
$Comp
L power:GND #PWR012
U 1 1 5BDE7E41
P 5450 3550
F 0 "#PWR012" H 5450 3300 50  0001 C CNN
F 1 "GND" H 5455 3377 50  0000 C CNN
F 2 "" H 5450 3550 50  0001 C CNN
F 3 "" H 5450 3550 50  0001 C CNN
	1    5450 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5BDE7EE6
P 3050 3550
F 0 "#PWR09" H 3050 3300 50  0001 C CNN
F 1 "GND" H 3055 3377 50  0000 C CNN
F 2 "" H 3050 3550 50  0001 C CNN
F 3 "" H 3050 3550 50  0001 C CNN
	1    3050 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3550 5450 3550
Wire Wire Line
	2900 3550 3050 3550
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 5BC8F021
P 7100 4000
F 0 "JP1" H 7100 4204 50  0000 C CNN
F 1 "Ext_DUART_CS" H 7100 4113 50  0000 C CNN
F 2 "" H 7100 4000 50  0001 C CNN
F 3 "~" H 7100 4000 50  0001 C CNN
	1    7100 4000
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP3
U 1 1 5BC8F0D3
P 7150 6200
F 0 "JP3" H 7150 6404 50  0000 C CNN
F 1 "Ext_RAM_CS" H 7150 6313 50  0000 C CNN
F 2 "" H 7150 6200 50  0001 C CNN
F 3 "~" H 7150 6200 50  0001 C CNN
	1    7150 6200
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP2
U 1 1 5BC8F171
P 7100 5150
F 0 "JP2" H 7100 5354 50  0000 C CNN
F 1 "Ext_ROM_CS" H 7100 5263 50  0000 C CNN
F 2 "" H 7100 5150 50  0001 C CNN
F 3 "~" H 7100 5150 50  0001 C CNN
	1    7100 5150
	1    0    0    -1  
$EndComp
Text GLabel 6750 6200 0    50   Input ~ 0
RAM_CS_JMPR
Text GLabel 7550 6200 2    50   Input ~ 0
EXT_RAM_CS
Text GLabel 7150 6450 3    50   Output ~ 0
RAM_CS
Wire Wire Line
	6900 6200 6750 6200
Text GLabel 6700 5150 0    50   Input ~ 0
ROM_CS_JMPR
Text GLabel 7500 5150 2    50   Input ~ 0
EXT_ROM_CS
Wire Wire Line
	6850 5150 6700 5150
Wire Wire Line
	7500 5150 7350 5150
Text GLabel 6700 4000 0    50   Input ~ 0
DUART_CS_JMPR
Text GLabel 7500 4000 2    50   Input ~ 0
EXT_DUART_CS
Text GLabel 7100 4300 3    50   Output ~ 0
DUART_CS
Wire Wire Line
	6700 4000 6850 4000
Wire Wire Line
	7350 4000 7500 4000
Text Label 2650 7400 0    50   ~ 0
A16
$Comp
L 74xx:74LS00 U15
U 3 1 5BE1C1ED
P 12050 5650
F 0 "U15" H 12050 5975 50  0000 C CNN
F 1 "74LS00" H 12050 5884 50  0000 C CNN
F 2 "" H 12050 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 12050 5650 50  0001 C CNN
	3    12050 5650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U15
U 2 1 5BE1C33C
P 12050 4950
F 0 "U15" H 12050 5275 50  0000 C CNN
F 1 "74LS00" H 12050 5184 50  0000 C CNN
F 2 "" H 12050 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 12050 4950 50  0001 C CNN
	2    12050 4950
	1    0    0    -1  
$EndComp
Text GLabel 12500 5650 2    50   Output ~ 0
RAM_UDS
Wire Wire Line
	12350 5650 12500 5650
$Comp
L 74xx:74LS00 U15
U 4 1 5BEA51CD
P 12050 6300
F 0 "U15" H 12050 6625 50  0000 C CNN
F 1 "74LS00" H 12050 6534 50  0000 C CNN
F 2 "" H 12050 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 12050 6300 50  0001 C CNN
	4    12050 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	12350 6300 12550 6300
Text GLabel 12550 6300 2    50   Output ~ 0
RAM_LDS
Text GLabel 4800 3300 0    50   Input ~ 0
RAM_UDS
Text GLabel 2400 3300 0    50   Input ~ 0
RAM_LDS
$Comp
L 74xx:74LS00 U15
U 1 1 5BC85CE3
P 12050 4300
F 0 "U15" H 12050 4625 50  0000 C CNN
F 1 "74LS00" H 12050 4534 50  0000 C CNN
F 2 "" H 12050 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 12050 4300 50  0001 C CNN
	1    12050 4300
	1    0    0    -1  
$EndComp
Text GLabel 9300 5600 0    50   Input ~ 0
RAM_CS
Text GLabel 9300 5000 0    50   Input ~ 0
UDS
$Comp
L 74xx:74LS04 U14
U 3 1 5BC85CEC
P 9900 5600
F 0 "U14" H 9900 5917 50  0000 C CNN
F 1 "74LS04" H 9900 5826 50  0000 C CNN
F 2 "" H 9900 5600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9900 5600 50  0001 C CNN
	3    9900 5600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U14
U 2 1 5BC85CF3
P 9900 5000
F 0 "U14" H 9900 5317 50  0000 C CNN
F 1 "74LS04" H 9900 5226 50  0000 C CNN
F 2 "" H 9900 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9900 5000 50  0001 C CNN
	2    9900 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 5000 9600 5000
Text GLabel 12500 4300 2    50   Output ~ 0
ROM_UDS
Wire Wire Line
	12350 4300 12500 4300
$Comp
L 74xx:74LS04 U14
U 1 1 5BC85D10
P 9900 4400
F 0 "U14" H 9900 4717 50  0000 C CNN
F 1 "74LS04" H 9900 4626 50  0000 C CNN
F 2 "" H 9900 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9900 4400 50  0001 C CNN
	1    9900 4400
	1    0    0    -1  
$EndComp
Text GLabel 9300 4400 0    50   Input ~ 0
LDS
Wire Wire Line
	9300 4400 9600 4400
Wire Wire Line
	12350 4950 12550 4950
Text GLabel 12550 4950 2    50   Output ~ 0
ROM_LDS
Wire Wire Line
	7400 6200 7550 6200
Wire Wire Line
	7150 6350 7150 6450
Wire Wire Line
	9600 5600 9300 5600
Wire Wire Line
	7100 4150 7100 4300
Wire Wire Line
	7100 5300 7100 5450
Text GLabel 7100 5450 3    50   Output ~ 0
RAM_CS
Text GLabel 10300 5000 2    50   Output ~ 0
INV_UDS
Wire Wire Line
	10200 5000 10300 5000
Text GLabel 11550 5550 0    50   Input ~ 0
INV_ROM_CS
Text GLabel 11550 6200 0    50   Input ~ 0
INV_ROM_CS
Text GLabel 10300 4400 2    50   Output ~ 0
INV_LDS
Wire Wire Line
	10200 4400 10300 4400
Text GLabel 10300 5600 2    50   Output ~ 0
INV_ROM_CS
Wire Wire Line
	10200 5600 10300 5600
Text GLabel 9300 6150 0    50   Input ~ 0
ROM_CS
$Comp
L 74xx:74LS04 U7
U 4 1 5BF1F055
P 9900 6150
F 0 "U7" H 9900 6467 50  0000 C CNN
F 1 "74LS04" H 9900 6376 50  0000 C CNN
F 2 "" H 9900 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9900 6150 50  0001 C CNN
	4    9900 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 6150 9300 6150
Text GLabel 10300 6150 2    50   Output ~ 0
INV_RAM_CS
Wire Wire Line
	10200 6150 10300 6150
Text GLabel 11550 4200 0    50   Input ~ 0
INV_RAM_CS
Text GLabel 11550 4850 0    50   Input ~ 0
INV_RAM_CS
Text GLabel 11550 4400 0    50   Input ~ 0
INV_UDS
Text GLabel 11550 5750 0    50   Input ~ 0
INV_UDS
Text GLabel 11550 5050 0    50   Input ~ 0
INV_LDS
Text GLabel 11550 6400 0    50   Input ~ 0
INV_LDS
Wire Wire Line
	11550 4200 11750 4200
Wire Wire Line
	11550 4400 11750 4400
Wire Wire Line
	11550 4850 11750 4850
Wire Wire Line
	11550 5050 11750 5050
Wire Wire Line
	11550 5550 11750 5550
Wire Wire Line
	11550 5750 11750 5750
Wire Wire Line
	11550 6200 11750 6200
Wire Wire Line
	11550 6400 11750 6400
$Comp
L 74xx:74LS20 U11
U 2 1 5C0AD83F
P 3100 7250
F 0 "U11" H 3100 7625 50  0000 C CNN
F 1 "74LS20" H 3100 7534 50  0000 C CNN
F 2 "" H 3100 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS20" H 3100 7250 50  0001 C CNN
	2    3100 7250
	1    0    0    -1  
$EndComp
Text GLabel 2650 7200 0    50   Input ~ 0
+5V
Wire Wire Line
	2650 7200 2700 7200
Wire Wire Line
	2800 7300 2700 7300
Wire Wire Line
	2700 7300 2700 7200
Connection ~ 2700 7200
Wire Wire Line
	2700 7200 2800 7200
Wire Bus Line
	2550 7400 2550 7550
Wire Bus Line
	3550 6650 3550 6950
Wire Bus Line
	1300 4950 1300 5350
Wire Bus Line
	1300 5800 1300 6500
Wire Bus Line
	3550 1050 3550 1850
Wire Bus Line
	5950 1050 5950 1850
Wire Bus Line
	11050 1050 11050 1850
Wire Bus Line
	8600 1050 8600 1850
Wire Bus Line
	9650 1050 9650 2550
Wire Bus Line
	7200 1050 7200 2550
Wire Bus Line
	2250 1050 2250 2950
Wire Bus Line
	4650 1050 4650 2950
$EndSCHEMATC
