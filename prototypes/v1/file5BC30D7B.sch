EESchema Schematic File Version 4
LIBS:raven-prototypes-cache
EELAYER 26 0
EELAYER END
$Descr USLegal 14000 8500
encoding utf-8
Sheet 3 4
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
U 1 1 5BC313C4
P 2400 3850
AR Path="/5BC313C4" Ref="U?"  Part="1" 
AR Path="/5BC30D7C/5BC313C4" Ref="U16"  Part="1" 
F 0 "U16" H 2400 5528 50  0000 C CNN
F 1 "68681" H 2400 5437 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 2400 3850 50  0001 C CNN
F 3 "" H 2400 3850 50  0001 C CNN
	1    2400 3850
	1    0    0    -1  
$EndComp
Text GLabel 2150 2350 0    50   Input ~ 0
+5V
$Comp
L power:GND #PWR?
U 1 1 5BC313CC
P 2600 5250
AR Path="/5BC313CC" Ref="#PWR?"  Part="1" 
AR Path="/5BC30D7C/5BC313CC" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 2600 5000 50  0001 C CNN
F 1 "GND" H 2605 5077 50  0000 C CNN
F 2 "" H 2600 5250 50  0001 C CNN
F 3 "" H 2600 5250 50  0001 C CNN
	1    2600 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2350 2150 2350
Wire Wire Line
	2400 5250 2600 5250
Text GLabel 1100 2650 0    50   Input ~ 0
DUART_CLK
Wire Wire Line
	1100 2650 1400 2650
NoConn ~ 1400 2750
Wire Wire Line
	1400 2950 1200 2950
Wire Wire Line
	1400 3050 1200 3050
Wire Wire Line
	1400 3150 1200 3150
Wire Wire Line
	1400 3250 1200 3250
Wire Wire Line
	1400 3350 1200 3350
Wire Wire Line
	1400 3450 1200 3450
Wire Wire Line
	1400 3550 1200 3550
Wire Wire Line
	1400 3650 1200 3650
Text Label 1300 2950 0    50   ~ 0
D0
Text Label 1300 3050 0    50   ~ 0
D1
Text Label 1300 3150 0    50   ~ 0
D2
Text Label 1300 3250 0    50   ~ 0
D3
Text Label 1300 3350 0    50   ~ 0
D4
Text Label 1300 3450 0    50   ~ 0
D5
Text Label 1300 3550 0    50   ~ 0
D6
Text Label 1300 3650 0    50   ~ 0
D7
Entry Wire Line
	1100 3050 1200 2950
Entry Wire Line
	1100 3150 1200 3050
Entry Wire Line
	1100 3250 1200 3150
Entry Wire Line
	1100 3350 1200 3250
Entry Wire Line
	1100 3450 1200 3350
Entry Wire Line
	1100 3550 1200 3450
Entry Wire Line
	1100 3650 1200 3550
Entry Wire Line
	1100 3750 1200 3650
Wire Bus Line
	1100 2950 1000 2950
Text GLabel 1000 2950 0    50   BiDi ~ 0
D[0..15]
Wire Wire Line
	1400 3850 1200 3850
Wire Wire Line
	1400 3950 1200 3950
Wire Wire Line
	1400 4050 1200 4050
Wire Wire Line
	1400 4150 1200 4150
Text Label 1300 3850 0    50   ~ 0
A1
Text Label 1300 3950 0    50   ~ 0
A2
Text Label 1300 4050 0    50   ~ 0
A3
Text Label 1300 4150 0    50   ~ 0
A4
Entry Wire Line
	1100 3950 1200 3850
Entry Wire Line
	1100 4050 1200 3950
Entry Wire Line
	1100 4150 1200 4050
Entry Wire Line
	1100 4250 1200 4150
Wire Bus Line
	1100 3850 1000 3850
Text GLabel 1000 3850 0    50   Input ~ 0
A[1..23]
Text GLabel 1100 4450 0    50   BiDi ~ 0
RW
Text GLabel 1100 4950 0    50   Output ~ 0
DUART_IRQ
Text GLabel 1100 4550 0    50   Input ~ 0
DUART_IACK
Text GLabel 1100 4650 0    50   BiDi ~ 0
RESET
Text GLabel 1100 4850 0    50   Output ~ 0
DTACK
Wire Wire Line
	1100 4450 1400 4450
Wire Wire Line
	1400 4550 1100 4550
Wire Wire Line
	1100 4650 1400 4650
Wire Wire Line
	1400 4850 1100 4850
Wire Wire Line
	1100 4950 1400 4950
Text GLabel 1100 4350 0    50   Input ~ 0
DUART_CS
Wire Wire Line
	1400 4350 1100 4350
$Comp
L power:GND #PWR?
U 1 1 5BC393DB
P 5800 3350
AR Path="/5BC393DB" Ref="#PWR?"  Part="1" 
AR Path="/5BC30D7C/5BC393DB" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 5800 3100 50  0001 C CNN
F 1 "GND" H 5805 3177 50  0000 C CNN
F 2 "" H 5800 3350 50  0001 C CNN
F 3 "" H 5800 3350 50  0001 C CNN
	1    5800 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3250 5800 3350
Wire Wire Line
	5600 3250 5600 3350
Text GLabel 5450 850  0    50   Input ~ 0
+5V
Wire Wire Line
	5450 850  5700 850 
$Comp
L power:GND #PWR?
U 1 1 5BC39992
P 5850 6450
AR Path="/5BC39992" Ref="#PWR?"  Part="1" 
AR Path="/5BC30D7C/5BC39992" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 5850 6200 50  0001 C CNN
F 1 "GND" H 5855 6277 50  0000 C CNN
F 2 "" H 5850 6450 50  0001 C CNN
F 3 "" H 5850 6450 50  0001 C CNN
	1    5850 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 6350 5850 6450
Wire Wire Line
	5650 6350 5650 6450
Text GLabel 5500 3950 0    50   Input ~ 0
+5V
Wire Wire Line
	5500 3950 5750 3950
Wire Wire Line
	3400 2650 3550 2650
Wire Wire Line
	3400 2750 3550 2750
Wire Wire Line
	3400 2950 3550 2950
Wire Wire Line
	3400 3050 3550 3050
Wire Wire Line
	3400 3250 3550 3250
Wire Wire Line
	3400 3350 3550 3350
Wire Wire Line
	3400 4150 3550 4150
Wire Wire Line
	3400 4250 3550 4250
NoConn ~ 3400 3450
NoConn ~ 3400 3550
NoConn ~ 3400 3650
NoConn ~ 3400 3750
NoConn ~ 3400 3850
NoConn ~ 3400 3950
NoConn ~ 3400 4350
NoConn ~ 3400 4450
NoConn ~ 3400 4550
NoConn ~ 3400 4650
Text GLabel 3550 2650 2    50   Output ~ 0
TxD-A
Text GLabel 3550 2750 2    50   Input ~ 0
RxD-A
Text GLabel 4750 2150 0    50   Input ~ 0
TxD-A
Wire Wire Line
	4900 2150 4750 2150
Wire Wire Line
	4900 2350 4750 2350
Wire Wire Line
	4900 2550 4750 2550
Wire Wire Line
	4900 2750 4750 2750
Wire Wire Line
	6500 2150 6700 2150
Wire Wire Line
	6500 2350 6700 2350
Wire Wire Line
	6500 2550 6700 2550
Wire Wire Line
	6500 2750 6700 2750
Text GLabel 4750 2550 0    50   Output ~ 0
RxD-A
Text GLabel 3550 2950 2    50   Output ~ 0
TxD-B
Text GLabel 3550 3050 2    50   Input ~ 0
RxD-B
Wire Wire Line
	4950 5250 4800 5250
Wire Wire Line
	4950 5450 4800 5450
Wire Wire Line
	4950 5650 4800 5650
Wire Wire Line
	4950 5850 4800 5850
Text GLabel 4800 5250 0    50   Input ~ 0
TxD-B
Text GLabel 4800 5650 0    50   Output ~ 0
RxD-B
Text GLabel 3550 3250 2    50   Output ~ 0
RTS-A
Text GLabel 3550 3350 2    50   Output ~ 0
RTS-B
Text GLabel 3550 4150 2    50   Input ~ 0
CTS-A
Text GLabel 3550 4250 2    50   Input ~ 0
CTS-B
Text GLabel 4750 2350 0    50   Input ~ 0
RTS-A
Text GLabel 4750 2750 0    50   Output ~ 0
CTS-A
Text GLabel 4800 5450 0    50   Input ~ 0
RTS-B
Text GLabel 4800 5850 0    50   Output ~ 0
CTS-B
Wire Wire Line
	6550 5250 6750 5250
Wire Wire Line
	6550 5450 6750 5450
Wire Wire Line
	6550 5650 6750 5650
Wire Wire Line
	6550 5850 6750 5850
NoConn ~ 4950 4250
NoConn ~ 4950 4400
NoConn ~ 4900 1150
NoConn ~ 4900 1300
NoConn ~ 4900 1850
NoConn ~ 4950 4950
Wire Wire Line
	4950 4600 4800 4600
Wire Wire Line
	4800 4600 4800 4750
Wire Wire Line
	4800 4750 4950 4750
Wire Wire Line
	4900 1500 4800 1500
Wire Wire Line
	4800 1500 4800 1650
Wire Wire Line
	4800 1650 4900 1650
Wire Wire Line
	6500 1150 6600 1150
Wire Wire Line
	6600 1150 6600 1300
Wire Wire Line
	6600 1300 6500 1300
Wire Wire Line
	6500 1650 6600 1650
Wire Wire Line
	6600 1650 6600 1800
Wire Wire Line
	6600 1800 6500 1800
Wire Wire Line
	6550 4250 6650 4250
Wire Wire Line
	6650 4250 6650 4400
Wire Wire Line
	6650 4400 6550 4400
Wire Wire Line
	6550 4750 6650 4750
Wire Wire Line
	6650 4750 6650 4900
Wire Wire Line
	6650 4900 6550 4900
Text GLabel 6750 5250 2    50   Output ~ 0
TxD-B-SERIAL
Text GLabel 6750 5450 2    50   Output ~ 0
RTS-B-SERIAL
Text GLabel 6750 5650 2    50   Input ~ 0
RxD-B-SERIAL
Text GLabel 6750 5850 2    50   Input ~ 0
CTS-B-SERIAL
Text GLabel 6700 2150 2    50   Output ~ 0
TxD-A-SERIAL
Text GLabel 6700 2350 2    50   Output ~ 0
RTS-A-SERIAL
Text GLabel 6700 2550 2    50   Input ~ 0
RxD-A-SERIAL
Text GLabel 6700 2750 2    50   Input ~ 0
CTS-A-SERIAL
$Comp
L Connector:Conn_01x08_Male J1
U 1 1 5BC756E2
P 9400 3650
F 0 "J1" H 9373 3623 50  0000 R CNN
F 1 "Serial_Connections" H 9373 3532 50  0000 R CNN
F 2 "" H 9400 3650 50  0001 C CNN
F 3 "~" H 9400 3650 50  0001 C CNN
	1    9400 3650
	-1   0    0    -1  
$EndComp
Text GLabel 8950 3350 0    50   Input ~ 0
TxD-A-SERIAL
Text GLabel 8950 3450 0    50   Output ~ 0
RxD-A-SERIAL
Text GLabel 8950 3550 0    50   Input ~ 0
RTS-A-SERIAL
Text GLabel 8950 3650 0    50   Output ~ 0
CTS-A-SERIAL
Text GLabel 8950 3750 0    50   Input ~ 0
TxD-B-SERIAL
Text GLabel 8950 3850 0    50   Output ~ 0
RxD-B-SERIAL
Text GLabel 8950 3950 0    50   Input ~ 0
RTS-B-SERIAL
Text GLabel 8950 4050 0    50   Output ~ 0
CTS-B-SERIAL
Wire Wire Line
	9200 3350 8950 3350
Wire Wire Line
	9200 3450 8950 3450
Wire Wire Line
	9200 3550 8950 3550
Wire Wire Line
	8950 3650 9200 3650
Wire Wire Line
	9200 3750 8950 3750
Wire Wire Line
	8950 3850 9200 3850
Wire Wire Line
	9200 3950 8950 3950
Wire Wire Line
	8950 4050 9200 4050
$Comp
L Connector:Conn_01x14_Male J2
U 1 1 5BCD7D12
P 11150 3450
F 0 "J2" H 11256 4228 50  0000 C CNN
F 1 "Ext_Signal" H 11256 4137 50  0000 C CNN
F 2 "" H 11150 3450 50  0001 C CNN
F 3 "~" H 11150 3450 50  0001 C CNN
	1    11150 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11350 2850 11550 2850
Wire Wire Line
	11350 2950 11550 2950
Wire Wire Line
	11350 3050 11550 3050
Wire Wire Line
	11350 3150 11550 3150
Wire Wire Line
	11350 3250 11550 3250
Wire Wire Line
	11350 3350 11550 3350
Wire Wire Line
	11350 3450 11550 3450
Wire Wire Line
	11350 3550 11550 3550
Wire Wire Line
	11350 3650 11550 3650
Wire Wire Line
	11350 3750 11550 3750
Wire Wire Line
	11350 3850 11550 3850
Wire Wire Line
	11350 3950 11550 3950
Wire Wire Line
	11350 4050 11550 4050
Wire Wire Line
	11350 4150 11550 4150
Text GLabel 11550 2850 2    50   Output ~ 0
EXT_ROM_CS
Text GLabel 11550 2950 2    50   Output ~ 0
EXT_RAM_CS
Text GLabel 11550 3050 2    50   Output ~ 0
EXT_DUART_CS
Text GLabel 11550 3150 2    50   Input ~ 0
UDS
Text GLabel 11550 3250 2    50   Input ~ 0
LDS
Entry Wire Line
	11550 4150 11650 4250
Entry Wire Line
	11550 4050 11650 4150
Entry Wire Line
	11550 3950 11650 4050
Entry Wire Line
	11550 3850 11650 3950
Entry Wire Line
	11550 3750 11650 3850
Entry Wire Line
	11550 3650 11650 3750
Entry Wire Line
	11550 3550 11650 3650
Entry Wire Line
	11550 3450 11650 3550
Wire Bus Line
	11650 3500 11750 3500
Text GLabel 11750 3500 2    50   Input ~ 0
A[1..23]
Text Label 11400 3450 0    50   ~ 0
A16
Text Label 11400 3550 0    50   ~ 0
A17
Text Label 11400 3650 0    50   ~ 0
A18
Text Label 11400 3750 0    50   ~ 0
A19
Text Label 11400 3850 0    50   ~ 0
A20
Text Label 11400 3950 0    50   ~ 0
A21
Text Label 11400 4050 0    50   ~ 0
A22
Text Label 11400 4150 0    50   ~ 0
A23
NoConn ~ 11550 3350
$Comp
L raven-prototypes:MAX233-DIP U18
U 1 1 5BD453EC
P 5750 5150
F 0 "U18" H 5750 6528 50  0000 C CNN
F 1 "MAX233-DIP" H 5750 6437 50  0000 C CNN
F 2 "" H 5800 4100 50  0001 L CNN
F 3 "" H 5750 5250 50  0001 C CNN
	1    5750 5150
	1    0    0    -1  
$EndComp
$Comp
L raven-prototypes:MAX233-DIP U17
U 1 1 5BD45448
P 5700 2050
F 0 "U17" H 5700 3428 50  0000 C CNN
F 1 "MAX233-DIP" H 5700 3337 50  0000 C CNN
F 2 "" H 5750 1000 50  0001 L CNN
F 3 "" H 5700 2150 50  0001 C CNN
	1    5700 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BD6853B
P 5600 3350
AR Path="/5BD6853B" Ref="#PWR?"  Part="1" 
AR Path="/5BC30D7C/5BD6853B" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 5600 3100 50  0001 C CNN
F 1 "GND" H 5605 3177 50  0000 C CNN
F 2 "" H 5600 3350 50  0001 C CNN
F 3 "" H 5600 3350 50  0001 C CNN
	1    5600 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BD685AC
P 5650 6450
AR Path="/5BD685AC" Ref="#PWR?"  Part="1" 
AR Path="/5BC30D7C/5BD685AC" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 5650 6200 50  0001 C CNN
F 1 "GND" H 5655 6277 50  0000 C CNN
F 2 "" H 5650 6450 50  0001 C CNN
F 3 "" H 5650 6450 50  0001 C CNN
	1    5650 6450
	1    0    0    -1  
$EndComp
Wire Bus Line
	1100 3850 1100 4250
Wire Bus Line
	1100 2950 1100 3750
Wire Bus Line
	11650 3500 11650 4250
$EndSCHEMATC
