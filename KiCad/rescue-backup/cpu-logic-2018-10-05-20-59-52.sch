EESchema Schematic File Version 2
LIBS:Raven68k-rescue
LIBS:Memory_RAM
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Logic_74xx
LIBS:ds1501y
LIBS:cp2102
LIBS:Raven68k-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
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
L 68000D U3
U 1 1 5A5B8071
P 8500 3600
F 0 "U3" H 8500 3700 50  0000 C CNN
F 1 "68000D" H 8500 3450 50  0000 C CNN
F 2 "" H 8500 3600 50  0001 C CNN
F 3 "" H 8500 3600 50  0001 C CNN
	1    8500 3600
	1    0    0    -1  
$EndComp
$Comp
L CXO_DIP14 X1
U 1 1 5A5B8125
P 5100 1400
F 0 "X1" H 4900 1650 50  0000 L CNN
F 1 "CXO_DIP14" H 5150 1150 50  0000 L CNN
F 2 "Oscillators:Oscillator_DIP-14" H 5550 1050 50  0001 C CNN
F 3 "" H 5000 1400 50  0001 C CNN
	1    5100 1400
	1    0    0    -1  
$EndComp
$Comp
L Barrel_Jack J1
U 1 1 5A5B81F5
P 950 7000
F 0 "J1" H 950 7210 50  0000 C CNN
F 1 "Barrel_Jack" H 950 6825 50  0000 C CNN
F 2 "" H 1000 6960 50  0001 C CNN
F 3 "" H 1000 6960 50  0001 C CNN
	1    950  7000
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A5B8331
P 6550 2100
F 0 "R3" V 6630 2100 50  0000 C CNN
F 1 "470" V 6550 2100 50  0000 C CNN
F 2 "" V 6480 2100 50  0001 C CNN
F 3 "" H 6550 2100 50  0001 C CNN
	1    6550 2100
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 5A5B8385
P 6850 2200
F 0 "R4" V 6930 2200 50  0000 C CNN
F 1 "470" V 6850 2200 50  0000 C CNN
F 2 "" V 6780 2200 50  0001 C CNN
F 3 "" H 6850 2200 50  0001 C CNN
	1    6850 2200
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 5A5B83AC
P 7150 2300
F 0 "R7" V 7230 2300 50  0000 C CNN
F 1 "470" V 7150 2300 50  0000 C CNN
F 2 "" V 7080 2300 50  0001 C CNN
F 3 "" H 7150 2300 50  0001 C CNN
	1    7150 2300
	0    1    1    0   
$EndComp
Text Label 9550 1400 0    60   ~ 0
A1
Text Label 9550 1500 0    60   ~ 0
A2
Text Label 9550 1600 0    60   ~ 0
A3
Text Label 9550 1700 0    60   ~ 0
A4
Text Label 9550 1800 0    60   ~ 0
A5
Text Label 9550 1900 0    60   ~ 0
A6
Text Label 9550 2000 0    60   ~ 0
A7
Text Label 9550 2100 0    60   ~ 0
A8
Text Label 9550 2200 0    60   ~ 0
A9
Text Label 9550 2300 0    60   ~ 0
A10
Text Label 9550 2400 0    60   ~ 0
A11
Text Label 9550 2500 0    60   ~ 0
A12
Text Label 9550 2600 0    60   ~ 0
A13
Text Label 9550 2700 0    60   ~ 0
A14
Text Label 9550 2800 0    60   ~ 0
A15
Text Label 9550 3000 0    60   ~ 0
A17
Text Label 9550 3100 0    60   ~ 0
A18
Text Label 9550 3200 0    60   ~ 0
A19
Text Label 9550 3800 0    60   ~ 0
D0
Text Label 9550 3900 0    60   ~ 0
D1
Text Label 9550 4000 0    60   ~ 0
D2
Text Label 9550 4100 0    60   ~ 0
D3
Text Label 9550 4200 0    60   ~ 0
D4
Text Label 9550 4300 0    60   ~ 0
D5
Text Label 9550 4400 0    60   ~ 0
D6
Text Label 9550 4500 0    60   ~ 0
D7
Text Label 9550 4600 0    60   ~ 0
D8
Text Label 9550 4700 0    60   ~ 0
D9
Text Label 9550 4800 0    60   ~ 0
D10
Text Label 9550 4900 0    60   ~ 0
D11
Text Label 9550 5000 0    60   ~ 0
D12
Text Label 9550 5100 0    60   ~ 0
D13
Text Label 9550 5200 0    60   ~ 0
D14
Text Label 9550 5300 0    60   ~ 0
D15
$Comp
L +5V #PWR01
U 1 1 5A5B9224
P 1250 6600
F 0 "#PWR01" H 1250 6450 50  0001 C CNN
F 1 "+5V" H 1250 6740 50  0000 C CNN
F 2 "" H 1250 6600 50  0001 C CNN
F 3 "" H 1250 6600 50  0001 C CNN
	1    1250 6600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5A5B924A
P 1250 7550
F 0 "#PWR02" H 1250 7300 50  0001 C CNN
F 1 "GND" H 1250 7400 50  0000 C CNN
F 2 "" H 1250 7550 50  0001 C CNN
F 3 "" H 1250 7550 50  0001 C CNN
	1    1250 7550
	1    0    0    -1  
$EndComp
NoConn ~ 7500 3100
NoConn ~ 7500 3200
$Comp
L R R8
U 1 1 5A5BB9E6
P 7200 4150
F 0 "R8" V 7280 4150 50  0000 C CNN
F 1 "470" V 7200 4150 50  0000 C CNN
F 2 "" V 7130 4150 50  0001 C CNN
F 3 "" H 7200 4150 50  0001 C CNN
	1    7200 4150
	0    1    1    0   
$EndComp
NoConn ~ 7500 3300
$Comp
L CP C1
U 1 1 5A5BBEA9
P 1750 7000
F 0 "C1" H 1775 7100 50  0000 L CNN
F 1 "0.1uF" H 1775 6900 50  0000 L CNN
F 2 "" H 1788 6850 50  0001 C CNN
F 3 "" H 1750 7000 50  0001 C CNN
	1    1750 7000
	1    0    0    -1  
$EndComp
Text HLabel 10400 5400 2    60   BiDi ~ 0
D[0..15]
Text HLabel 10450 1050 2    60   BiDi ~ 0
A[1..23]
$Comp
L CP C2
U 1 1 5A62ABAC
P 2150 7000
F 0 "C2" H 2175 7100 50  0000 L CNN
F 1 "0.1uF" H 2175 6900 50  0000 L CNN
F 2 "" H 2188 6850 50  0001 C CNN
F 3 "" H 2150 7000 50  0001 C CNN
	1    2150 7000
	1    0    0    -1  
$EndComp
$Comp
L 74LS05 U2
U 1 1 5A62B26D
P 6400 4800
F 0 "U2" H 6595 4915 50  0000 C CNN
F 1 "74LS05" H 6590 4675 50  0000 C CNN
F 2 "" H 6400 4800 50  0001 C CNN
F 3 "" H 6400 4800 50  0001 C CNN
	1    6400 4800
	1    0    0    -1  
$EndComp
$Comp
L 74LS05 U2
U 2 1 5A62B32D
P 6400 5300
F 0 "U2" H 6595 5415 50  0000 C CNN
F 1 "74LS05" H 6590 5175 50  0000 C CNN
F 2 "" H 6400 5300 50  0001 C CNN
F 3 "" H 6400 5300 50  0001 C CNN
	2    6400 5300
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5A62BC4F
P 6900 5050
F 0 "R5" V 6980 5050 50  0000 C CNN
F 1 "4.7K" V 6900 5050 50  0000 C CNN
F 2 "" V 6830 5050 50  0001 C CNN
F 3 "" H 6900 5050 50  0001 C CNN
	1    6900 5050
	-1   0    0    1   
$EndComp
$Comp
L R R6
U 1 1 5A62BCBF
P 7050 5550
F 0 "R6" V 7130 5550 50  0000 C CNN
F 1 "4.7K" V 7050 5550 50  0000 C CNN
F 2 "" V 6980 5550 50  0001 C CNN
F 3 "" H 7050 5550 50  0001 C CNN
	1    7050 5550
	-1   0    0    1   
$EndComp
NoConn ~ 4800 1400
$Comp
L GND #PWR03
U 1 1 5A62E4CC
P 5100 1800
F 0 "#PWR03" H 5100 1550 50  0001 C CNN
F 1 "GND" H 5100 1650 50  0000 C CNN
F 2 "" H 5100 1800 50  0001 C CNN
F 3 "" H 5100 1800 50  0001 C CNN
	1    5100 1800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 5A62E63E
P 5100 1000
F 0 "#PWR04" H 5100 850 50  0001 C CNN
F 1 "+5V" H 5100 1140 50  0000 C CNN
F 2 "" H 5100 1000 50  0001 C CNN
F 3 "" H 5100 1000 50  0001 C CNN
	1    5100 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5A62E849
P 6400 2400
F 0 "#PWR05" H 6400 2150 50  0001 C CNN
F 1 "GND" H 6400 2250 50  0000 C CNN
F 2 "" H 6400 2400 50  0001 C CNN
F 3 "" H 6400 2400 50  0001 C CNN
	1    6400 2400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 5A62F126
P 5700 3550
F 0 "#PWR06" H 5700 3400 50  0001 C CNN
F 1 "+5V" H 5700 3690 50  0000 C CNN
F 2 "" H 5700 3550 50  0001 C CNN
F 3 "" H 5700 3550 50  0001 C CNN
	1    5700 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5A62F3C7
P 6800 4150
F 0 "#PWR08" H 6800 3900 50  0001 C CNN
F 1 "GND" H 6800 4000 50  0000 C CNN
F 2 "" H 6800 4150 50  0001 C CNN
F 3 "" H 6800 4150 50  0001 C CNN
	1    6800 4150
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5A62F46A
P 5350 3650
F 0 "R1" V 5430 3650 50  0000 C CNN
F 1 "10K" V 5350 3650 50  0000 C CNN
F 2 "" V 5280 3650 50  0001 C CNN
F 3 "" H 5350 3650 50  0001 C CNN
	1    5350 3650
	0    -1   -1   0   
$EndComp
$Comp
L CP C13
U 1 1 5A63CA8B
P 4750 3650
F 0 "C13" H 4775 3750 50  0000 L CNN
F 1 "47uF" H 4775 3550 50  0000 L CNN
F 2 "" H 4788 3500 50  0001 C CNN
F 3 "" H 4750 3650 50  0001 C CNN
	1    4750 3650
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR09
U 1 1 5A63DBBB
P 6750 5850
F 0 "#PWR09" H 6750 5700 50  0001 C CNN
F 1 "+5V" H 6750 5990 50  0000 C CNN
F 2 "" H 6750 5850 50  0001 C CNN
F 3 "" H 6750 5850 50  0001 C CNN
	1    6750 5850
	1    0    0    -1  
$EndComp
Text HLabel 7250 5300 2    60   BiDi ~ 0
RESET
Text HLabel 9600 5500 2    60   Output ~ 0
AS
Text HLabel 9600 5600 2    60   Output ~ 0
UDS
Text HLabel 9600 5700 2    60   Output ~ 0
LDS
Text HLabel 9600 5800 2    60   Output ~ 0
R/W
Text HLabel 7500 4500 0    60   Input ~ 0
DTACK
Entry Wire Line
	7150 1800 7250 1700
Entry Wire Line
	7150 1900 7250 1800
Text HLabel 6650 1650 0    60   Input ~ 0
IPL[0..2]
Text HLabel 6750 2950 0    60   Output ~ 0
FC[0..2]
$Comp
L CP C3
U 1 1 5A6436A2
P 2550 7000
F 0 "C3" H 2575 7100 50  0000 L CNN
F 1 "0.1uF" H 2575 6900 50  0000 L CNN
F 2 "" H 2588 6850 50  0001 C CNN
F 3 "" H 2550 7000 50  0001 C CNN
	1    2550 7000
	1    0    0    -1  
$EndComp
$Comp
L CP C5
U 1 1 5A6436F2
P 2900 7000
F 0 "C5" H 2925 7100 50  0000 L CNN
F 1 "0.1uF" H 2925 6900 50  0000 L CNN
F 2 "" H 2938 6850 50  0001 C CNN
F 3 "" H 2900 7000 50  0001 C CNN
	1    2900 7000
	1    0    0    -1  
$EndComp
$Comp
L CP C6
U 1 1 5A643746
P 3250 7000
F 0 "C6" H 3275 7100 50  0000 L CNN
F 1 "0.1uF" H 3275 6900 50  0000 L CNN
F 2 "" H 3288 6850 50  0001 C CNN
F 3 "" H 3250 7000 50  0001 C CNN
	1    3250 7000
	1    0    0    -1  
$EndComp
$Comp
L CP C7
U 1 1 5A64379B
P 3600 7000
F 0 "C7" H 3625 7100 50  0000 L CNN
F 1 "0.1uF" H 3625 6900 50  0000 L CNN
F 2 "" H 3638 6850 50  0001 C CNN
F 3 "" H 3600 7000 50  0001 C CNN
	1    3600 7000
	1    0    0    -1  
$EndComp
$Comp
L CP C9
U 1 1 5A6437F5
P 3950 7000
F 0 "C9" H 3975 7100 50  0000 L CNN
F 1 "0.1uF" H 3975 6900 50  0000 L CNN
F 2 "" H 3988 6850 50  0001 C CNN
F 3 "" H 3950 7000 50  0001 C CNN
	1    3950 7000
	1    0    0    -1  
$EndComp
$Comp
L CP C10
U 1 1 5A643850
P 4300 7000
F 0 "C10" H 4325 7100 50  0000 L CNN
F 1 "0.1uF" H 4325 6900 50  0000 L CNN
F 2 "" H 4338 6850 50  0001 C CNN
F 3 "" H 4300 7000 50  0001 C CNN
	1    4300 7000
	1    0    0    -1  
$EndComp
Text HLabel 6500 1150 1    60   Output ~ 0
CLK
Text Label 6500 1350 1    60   ~ 0
CLK
Entry Wire Line
	7200 2800 7300 2700
Entry Wire Line
	7200 2700 7300 2600
$Comp
L PWR_FLAG #FLG010
U 1 1 5A64C595
P 5850 6650
F 0 "#FLG010" H 5850 6725 50  0001 C CNN
F 1 "PWR_FLAG" H 5850 6800 50  0000 C CNN
F 2 "" H 5850 6650 50  0001 C CNN
F 3 "" H 5850 6650 50  0001 C CNN
	1    5850 6650
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG011
U 1 1 5A64C71E
P 5850 7500
F 0 "#FLG011" H 5850 7575 50  0001 C CNN
F 1 "PWR_FLAG" H 5850 7650 50  0000 C CNN
F 2 "" H 5850 7500 50  0001 C CNN
F 3 "" H 5850 7500 50  0001 C CNN
	1    5850 7500
	-1   0    0    1   
$EndComp
Text HLabel 6150 6750 2    60   Output ~ 0
+5V
Text HLabel 6150 7350 2    60   Output ~ 0
GND
Text Label 9550 2900 0    60   ~ 0
A16
Entry Wire Line
	9750 1400 9850 1300
Entry Wire Line
	9750 1500 9850 1400
Entry Wire Line
	9750 1600 9850 1500
Entry Wire Line
	9750 1700 9850 1600
Entry Wire Line
	9750 1800 9850 1700
Entry Wire Line
	9750 1900 9850 1800
Entry Wire Line
	9750 2000 9850 1900
Entry Wire Line
	9750 2100 9850 2000
Entry Wire Line
	9750 2200 9850 2100
Entry Wire Line
	9750 2300 9850 2200
Entry Wire Line
	9750 2400 9850 2300
Entry Wire Line
	9750 2500 9850 2400
Entry Wire Line
	9750 2600 9850 2500
Entry Wire Line
	9750 2700 9850 2600
Entry Wire Line
	9750 2800 9850 2700
Entry Wire Line
	9750 2900 9850 2800
Entry Wire Line
	9750 3000 9850 2900
Entry Wire Line
	9750 3100 9850 3000
Entry Wire Line
	9750 3200 9850 3100
Wire Wire Line
	9500 1600 9750 1600
Wire Wire Line
	9500 1700 9750 1700
Wire Wire Line
	9500 1800 9750 1800
Wire Wire Line
	9500 1900 9750 1900
Wire Wire Line
	9500 2000 9750 2000
Wire Wire Line
	9500 2100 9750 2100
Wire Wire Line
	9500 2200 9750 2200
Wire Wire Line
	9500 2300 9750 2300
Wire Wire Line
	9500 2400 9750 2400
Wire Wire Line
	9500 2500 9750 2500
Wire Wire Line
	9500 2600 9750 2600
Wire Wire Line
	9500 2700 9750 2700
Wire Wire Line
	9500 2800 9750 2800
Wire Wire Line
	9500 3000 9750 3000
Wire Wire Line
	9500 3100 9750 3100
Wire Wire Line
	9500 3200 9750 3200
Wire Wire Line
	9500 3800 9750 3800
Wire Wire Line
	9500 3900 9750 3900
Wire Wire Line
	9500 4000 9750 4000
Wire Wire Line
	9500 4100 9750 4100
Wire Wire Line
	9500 4200 9750 4200
Wire Wire Line
	9500 4300 9750 4300
Wire Wire Line
	9500 4400 9750 4400
Wire Wire Line
	9500 4500 9750 4500
Wire Wire Line
	9500 4600 9750 4600
Wire Wire Line
	9500 4700 9750 4700
Wire Wire Line
	9500 4800 9750 4800
Wire Wire Line
	9500 4900 9750 4900
Wire Wire Line
	9500 5000 9750 5000
Wire Wire Line
	9500 5100 9750 5100
Wire Wire Line
	9500 5200 9750 5200
Wire Wire Line
	9500 5300 9750 5300
Wire Wire Line
	6400 2300 7000 2300
Wire Wire Line
	6700 2200 6700 2300
Connection ~ 6700 2300
Wire Wire Line
	6400 2100 6400 2400
Connection ~ 6400 2300
Wire Wire Line
	7500 2100 6700 2100
Wire Wire Line
	7500 2300 7300 2300
Wire Wire Line
	7500 2200 7000 2200
Wire Wire Line
	1250 7350 6150 7350
Wire Wire Line
	1250 6750 6150 6750
Wire Wire Line
	6850 4800 7500 4800
Wire Wire Line
	7500 4150 7350 4150
Wire Wire Line
	1750 6850 1750 6750
Connection ~ 1750 6750
Wire Wire Line
	1750 7150 1750 7350
Connection ~ 1750 7350
Wire Wire Line
	2150 6750 2150 6850
Connection ~ 2150 6750
Wire Wire Line
	2150 7350 2150 7150
Connection ~ 2150 7350
Wire Wire Line
	6850 5300 7250 5300
Wire Wire Line
	7050 4900 7050 5400
Connection ~ 7050 5300
Wire Wire Line
	6900 4900 6900 4800
Connection ~ 6900 4800
Wire Wire Line
	5400 1400 7500 1400
Wire Wire Line
	5100 1000 5100 1100
Wire Wire Line
	5100 1700 5100 1800
Wire Wire Line
	6800 4150 7050 4150
Wire Wire Line
	5950 4800 5950 5300
Wire Wire Line
	6900 5200 6900 5850
Wire Wire Line
	6750 5850 7050 5850
Wire Wire Line
	7050 5850 7050 5700
Connection ~ 6900 5850
Wire Wire Line
	7500 4900 7050 4900
Wire Wire Line
	9500 5500 9600 5500
Wire Wire Line
	9500 5600 9600 5600
Wire Wire Line
	9500 5700 9600 5700
Wire Wire Line
	9500 5800 9600 5800
Wire Wire Line
	7500 4350 7500 4500
Wire Wire Line
	7500 1700 7250 1700
Wire Wire Line
	7500 1800 7250 1800
Wire Bus Line
	7150 1650 7150 2000
Wire Wire Line
	4300 6750 4300 6850
Connection ~ 4300 6750
Wire Wire Line
	4300 7350 4300 7150
Connection ~ 4300 7350
Wire Wire Line
	3950 6850 3950 6750
Connection ~ 3950 6750
Wire Wire Line
	3950 7150 3950 7350
Connection ~ 3950 7350
Wire Wire Line
	3600 7150 3600 7350
Connection ~ 3600 7350
Wire Wire Line
	3250 7150 3250 7350
Connection ~ 3250 7350
Wire Wire Line
	2900 7150 2900 7350
Connection ~ 2900 7350
Wire Wire Line
	2550 7150 2550 7350
Connection ~ 2550 7350
Wire Wire Line
	2550 6850 2550 6750
Connection ~ 2550 6750
Wire Wire Line
	2900 6850 2900 6750
Connection ~ 2900 6750
Wire Wire Line
	3250 6850 3250 6750
Connection ~ 3250 6750
Wire Wire Line
	3600 6850 3600 6750
Connection ~ 3600 6750
Connection ~ 6500 1400
Wire Wire Line
	6500 1400 6500 1150
Wire Wire Line
	9500 2900 9750 2900
Wire Wire Line
	1250 6600 1250 6900
Connection ~ 1250 6750
Wire Bus Line
	7200 2700 7200 2950
Wire Wire Line
	7300 2600 7500 2600
Wire Wire Line
	7300 2700 7500 2700
Wire Wire Line
	1250 7000 1250 7550
Connection ~ 1250 7100
Connection ~ 1250 7350
Wire Bus Line
	7200 2950 6750 2950
Wire Wire Line
	9500 1500 9750 1500
Wire Wire Line
	9500 1400 9750 1400
Wire Bus Line
	9850 1050 10450 1050
Wire Bus Line
	9850 3700 9850 5400
Wire Bus Line
	9850 5400 10400 5400
Text Label 10000 5400 0    60   ~ 0
D[0..15]
Entry Wire Line
	9750 3800 9850 3700
Entry Wire Line
	9750 3900 9850 3800
Entry Wire Line
	9750 4000 9850 3900
Entry Wire Line
	9750 4100 9850 4000
Entry Wire Line
	9750 4200 9850 4100
Entry Wire Line
	9750 4300 9850 4200
Entry Wire Line
	9750 4400 9850 4300
Entry Wire Line
	9750 4500 9850 4400
Entry Wire Line
	9750 4600 9850 4500
Entry Wire Line
	9750 4700 9850 4600
Entry Wire Line
	9750 4800 9850 4700
Entry Wire Line
	9750 4900 9850 4800
Entry Wire Line
	9750 5000 9850 4900
Entry Wire Line
	9750 5100 9850 5000
Entry Wire Line
	9750 5200 9850 5100
Entry Wire Line
	9750 5300 9850 5200
Text Label 10050 1050 0    60   ~ 0
A[1..23]
Wire Bus Line
	7150 1650 6650 1650
Text Label 6750 1650 0    60   ~ 0
IPL[0..2]
Text Label 7150 2950 2    60   ~ 0
FC[0..2]
Wire Wire Line
	7500 2800 7300 2800
Entry Wire Line
	7200 2900 7300 2800
Wire Wire Line
	7500 1900 7250 1900
Entry Wire Line
	7150 2000 7250 1900
Text Label 7350 1700 0    60   ~ 0
IPL0
Text Label 7350 1800 0    60   ~ 0
IPL1
Text Label 7350 1900 0    60   ~ 0
IPL2
Text Label 7350 2600 0    60   ~ 0
FC0
Text Label 7350 2700 0    60   ~ 0
FC1
Text Label 7350 2800 0    60   ~ 0
FC2
$Comp
L CP C11
U 1 1 5A66C0BF
P 4650 7000
F 0 "C11" H 4675 7100 50  0000 L CNN
F 1 "0.1uF" H 4675 6900 50  0000 L CNN
F 2 "" H 4688 6850 50  0001 C CNN
F 3 "" H 4650 7000 50  0001 C CNN
	1    4650 7000
	1    0    0    -1  
$EndComp
$Comp
L CP C12
U 1 1 5A66C124
P 5000 7000
F 0 "C12" H 5025 7100 50  0000 L CNN
F 1 "0.1uF" H 5025 6900 50  0000 L CNN
F 2 "" H 5038 6850 50  0001 C CNN
F 3 "" H 5000 7000 50  0001 C CNN
	1    5000 7000
	1    0    0    -1  
$EndComp
$Comp
L CP C14
U 1 1 5A66C18C
P 5350 7000
F 0 "C14" H 5375 7100 50  0000 L CNN
F 1 "0.1uF" H 5375 6900 50  0000 L CNN
F 2 "" H 5388 6850 50  0001 C CNN
F 3 "" H 5350 7000 50  0001 C CNN
	1    5350 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 6650 5850 6750
Connection ~ 5850 6750
Wire Wire Line
	5850 7500 5850 7350
Connection ~ 5850 7350
Wire Wire Line
	5350 7150 5350 7350
Connection ~ 5350 7350
Wire Wire Line
	5000 7150 5000 7350
Connection ~ 5000 7350
Wire Wire Line
	4650 7150 4650 7350
Connection ~ 4650 7350
Wire Wire Line
	4650 6850 4650 6750
Connection ~ 4650 6750
Wire Wire Line
	5000 6850 5000 6750
Connection ~ 5000 6750
Wire Wire Line
	5350 6850 5350 6750
Connection ~ 5350 6750
Wire Bus Line
	9850 1050 9850 3600
$Comp
L 74LS123 U?
U 1 1 5B522F26
P 4750 4750
F 0 "U?" H 4750 4700 50  0000 C CNN
F 1 "74LS123" H 4750 4600 50  0000 C CNN
F 2 "" H 4750 4750 50  0001 C CNN
F 3 "" H 4750 4750 50  0001 C CNN
	1    4750 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3950 4550 3650
Wire Wire Line
	4550 3650 4600 3650
Wire Wire Line
	4950 3950 4950 3650
Wire Wire Line
	4900 3650 5200 3650
Connection ~ 4950 3650
Wire Wire Line
	5500 3650 5700 3650
Wire Wire Line
	5700 3650 5700 3550
$Comp
L GND #PWR?
U 1 1 5B524750
P 4150 3950
F 0 "#PWR?" H 4150 3700 50  0001 C CNN
F 1 "GND" H 4150 3800 50  0000 C CNN
F 2 "" H 4150 3950 50  0001 C CNN
F 3 "" H 4150 3950 50  0001 C CNN
	1    4150 3950
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5B5247BB
P 3750 4100
F 0 "#PWR?" H 3750 3950 50  0001 C CNN
F 1 "+5V" H 3750 4240 50  0000 C CNN
F 2 "" H 3750 4100 50  0001 C CNN
F 3 "" H 3750 4100 50  0001 C CNN
	1    3750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4550 3750 4550
Wire Wire Line
	3750 4550 3750 4100
Wire Wire Line
	4150 3950 4000 3950
Wire Wire Line
	4000 3950 4000 4400
Wire Wire Line
	4750 5550 3900 5550
Wire Wire Line
	3900 5550 3900 4550
Connection ~ 3900 4550
Wire Wire Line
	5500 5050 5950 5050
Connection ~ 5950 5050
Wire Wire Line
	9500 3300 9750 3300
Wire Wire Line
	9500 3400 9750 3400
Wire Wire Line
	9500 3500 9750 3500
Wire Wire Line
	9500 3600 9750 3600
Text Label 9550 3300 0    60   ~ 0
A20
Text Label 9550 3400 0    60   ~ 0
A21
Text Label 9550 3500 0    60   ~ 0
A22
Text Label 9550 3600 0    60   ~ 0
A23
Entry Wire Line
	9750 3300 9850 3200
Entry Wire Line
	9750 3300 9850 3200
Entry Wire Line
	9750 3400 9850 3300
Entry Wire Line
	9750 3500 9850 3400
Entry Wire Line
	9750 3600 9850 3500
$EndSCHEMATC