EESchema Schematic File Version 2
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
L 68681 U9
U 1 1 5A689F83
P 3900 2150
F 0 "U9" H 3900 2300 50  0000 C CNN
F 1 "68681" H 3900 2050 50  0000 C CNN
F 2 "" H 3900 2150 50  0001 C CNN
F 3 "" H 3900 2150 50  0001 C CNN
	1    3900 2150
	1    0    0    -1  
$EndComp
NoConn ~ 4900 1650
NoConn ~ 4900 1750
NoConn ~ 4900 1850
NoConn ~ 4900 1950
NoConn ~ 4900 2050
NoConn ~ 4900 2150
NoConn ~ 4900 2250
Entry Wire Line
	2550 1350 2650 1250
Entry Wire Line
	2550 2250 2650 2150
Entry Wire Line
	2550 2250 2650 2150
Entry Wire Line
	2550 1450 2650 1350
Entry Wire Line
	2550 1550 2650 1450
Entry Wire Line
	2550 1650 2650 1550
Entry Wire Line
	2550 1750 2650 1650
Entry Wire Line
	2550 1850 2650 1750
Entry Wire Line
	2550 1950 2650 1850
Entry Wire Line
	2550 2050 2650 1950
Entry Wire Line
	2550 2350 2650 2250
Entry Wire Line
	2550 2450 2650 2350
Entry Wire Line
	2550 2550 2650 2450
Text Label 2700 1250 0    60   ~ 0
D0
Text Label 2700 1350 0    60   ~ 0
D1
Text Label 2700 1450 0    60   ~ 0
D2
Text Label 2700 1550 0    60   ~ 0
D3
Text Label 2700 1650 0    60   ~ 0
D4
Text Label 2700 1750 0    60   ~ 0
D5
Text Label 2700 1850 0    60   ~ 0
D6
Text Label 2700 1950 0    60   ~ 0
D7
Text Label 2700 2150 0    60   ~ 0
A1
Text Label 2700 2250 0    60   ~ 0
A2
Text Label 2700 2350 0    60   ~ 0
A3
Text Label 2700 2450 0    60   ~ 0
A4
Text HLabel 2750 950  0    60   Input ~ 0
CLK
NoConn ~ 2900 1050
Text Label 2550 1750 2    60   ~ 0
D[0..15]
Text HLabel 2250 2050 0    60   Input ~ 0
D[0..15]
Text Label 2550 2450 2    60   ~ 0
A[1..23]
Text HLabel 2250 2550 0    60   Input ~ 0
A[1..23]
Text HLabel 2900 2650 0    60   Input ~ 0
UARTSEL
Text HLabel 2900 2850 0    60   Input ~ 0
IACK
Text HLabel 7600 4250 2    60   Input ~ 0
RESET
Text HLabel 2900 3150 0    60   Input ~ 0
DTACK
Text HLabel 2900 3250 0    60   Input ~ 0
UARTIRQ
NoConn ~ 4900 1250
NoConn ~ 4900 1350
Text Label 5050 1550 2    60   ~ 0
RTSA
Text Label 5050 2450 2    60   ~ 0
CTSA
NoConn ~ 4900 2550
NoConn ~ 4900 2650
NoConn ~ 4900 2750
NoConn ~ 4900 2850
NoConn ~ 4900 2950
Text Label 5050 950  2    60   ~ 0
TXA
Text Label 5050 1050 2    60   ~ 0
RXA
$Comp
L DS1501Y U10
U 1 1 5A68C753
P 4050 5200
F 0 "U10" H 4050 4750 60  0000 C CNN
F 1 "DS1501Y" H 4050 5500 60  0000 C CNN
F 2 "" H 4050 5200 60  0001 C CNN
F 3 "" H 4050 5200 60  0001 C CNN
	1    4050 5200
	-1   0    0    1   
$EndComp
Entry Wire Line
	2550 4600 2650 4500
Entry Wire Line
	2550 5600 2650 5500
Entry Wire Line
	2550 4700 2650 4600
Entry Wire Line
	2550 4800 2650 4700
Entry Wire Line
	2550 4900 2650 4800
Entry Wire Line
	2550 5000 2650 4900
Entry Wire Line
	2550 5100 2650 5000
Entry Wire Line
	2550 5200 2650 5100
Entry Wire Line
	2550 5300 2650 5200
Entry Wire Line
	2550 6000 2650 5900
Entry Wire Line
	2550 5900 2650 5800
Entry Wire Line
	2550 5800 2650 5700
Entry Wire Line
	2550 5700 2650 5600
Text Label 2900 4500 2    60   ~ 0
D7
Text Label 2900 4600 2    60   ~ 0
D6
Text Label 2900 4700 2    60   ~ 0
D5
Text Label 2900 4800 2    60   ~ 0
D4
Text Label 2900 4900 2    60   ~ 0
D3
Text Label 2900 5000 2    60   ~ 0
D2
Text Label 2900 5100 2    60   ~ 0
D1
Text Label 2900 5200 2    60   ~ 0
D0
Text Label 2900 5500 2    60   ~ 0
A5
Text Label 2900 5600 2    60   ~ 0
A4
Text Label 2900 5700 2    60   ~ 0
A3
Text Label 2900 5800 2    60   ~ 0
A2
Text Label 2900 5900 2    60   ~ 0
A1
Text HLabel 7650 4650 2    60   Input ~ 0
GND
Text HLabel 5150 5050 2    60   Input ~ 0
RTCSEL
Text HLabel 5150 5450 2    60   Input ~ 0
RTCIRQ
Text HLabel 5150 5850 2    60   Input ~ 0
CLK
NoConn ~ 5150 5750
Text HLabel 7650 4450 2    60   Input ~ 0
R/W
Text HLabel 5150 5250 2    60   Input ~ 0
OE
$Comp
L CP2102 U11
U 1 1 5A65454A
P 7200 1950
F 0 "U11" H 7200 1950 60  0000 C CNN
F 1 "CP2102" H 7150 2950 60  0000 C CNN
F 2 "" H 7200 1950 60  0001 C CNN
F 3 "" H 7200 1950 60  0001 C CNN
	1    7200 1950
	0    -1   -1   0   
$EndComp
NoConn ~ 6800 1250
NoConn ~ 6900 1250
NoConn ~ 7000 1250
NoConn ~ 7100 1250
NoConn ~ 7200 1250
NoConn ~ 7300 1250
NoConn ~ 7400 1250
NoConn ~ 7950 1600
NoConn ~ 7950 1700
NoConn ~ 7950 2000
NoConn ~ 6350 1650
NoConn ~ 6350 2150
NoConn ~ 6350 2300
NoConn ~ 6850 2650
NoConn ~ 6950 2650
$Comp
L USB_B J2
U 1 1 5A654AF7
P 9400 1950
F 0 "J2" H 9200 2400 50  0000 L CNN
F 1 "USB_B" H 9200 2300 50  0000 L CNN
F 2 "" H 9550 1900 50  0001 C CNN
F 3 "" H 9550 1900 50  0001 C CNN
	1    9400 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 1250 2650 1250
Wire Wire Line
	2900 1350 2650 1350
Wire Wire Line
	2900 1450 2650 1450
Wire Wire Line
	2900 1550 2650 1550
Wire Wire Line
	2900 1650 2650 1650
Wire Wire Line
	2900 1750 2650 1750
Wire Wire Line
	2900 1850 2650 1850
Wire Wire Line
	2900 1950 2650 1950
Wire Wire Line
	2900 2150 2650 2150
Wire Wire Line
	2900 2250 2650 2250
Wire Wire Line
	2900 2350 2650 2350
Wire Wire Line
	2900 2450 2650 2450
Wire Bus Line
	2550 1350 2550 2050
Wire Bus Line
	2550 2050 2250 2050
Wire Bus Line
	2550 2250 2550 2550
Wire Wire Line
	2750 950  2900 950 
Wire Wire Line
	4900 1550 6250 1550
Wire Wire Line
	4900 2450 5150 2450
Wire Wire Line
	4900 950  6100 950 
Wire Wire Line
	4900 1050 6150 1050
Wire Bus Line
	2550 2550 2250 2550
Wire Wire Line
	2950 4500 2650 4500
Wire Wire Line
	2950 4600 2650 4600
Wire Wire Line
	2950 4700 2650 4700
Wire Wire Line
	2950 4800 2650 4800
Wire Wire Line
	2950 4900 2650 4900
Wire Wire Line
	2950 5000 2650 5000
Wire Wire Line
	2950 5100 2650 5100
Wire Wire Line
	2950 5200 2650 5200
Wire Wire Line
	2950 5500 2650 5500
Wire Wire Line
	2950 5600 2650 5600
Wire Wire Line
	2950 5700 2650 5700
Wire Wire Line
	2950 5800 2650 5800
Wire Wire Line
	2950 5900 2650 5900
Wire Bus Line
	2550 4600 2550 5300
Wire Bus Line
	2550 5600 2550 6000
Wire Wire Line
	5150 4550 5450 4550
Wire Wire Line
	5450 4850 5150 4850
Wire Wire Line
	7600 3650 7600 4250
Wire Wire Line
	2300 3650 8200 3650
Wire Wire Line
	2300 3650 2300 2950
Wire Wire Line
	2300 2950 2900 2950
Wire Wire Line
	5150 5550 6350 5550
Wire Wire Line
	6350 5550 6350 3650
Connection ~ 6350 3650
Wire Wire Line
	2900 2750 2200 2750
Wire Wire Line
	2200 2750 2200 3800
Wire Wire Line
	2200 3800 7500 3800
Wire Wire Line
	7500 3800 7500 4450
Wire Wire Line
	7500 4450 7650 4450
Wire Wire Line
	5150 5150 6500 5150
Wire Wire Line
	6500 5150 6500 3800
Connection ~ 6500 3800
Wire Wire Line
	6250 1550 6250 1750
Wire Wire Line
	6250 1750 6350 1750
Wire Wire Line
	5150 2450 5150 1850
Wire Wire Line
	5150 1850 6350 1850
Wire Wire Line
	6150 1050 6150 2050
Wire Wire Line
	6150 2050 6350 2050
Wire Wire Line
	6100 950  6100 1950
Wire Wire Line
	6100 1950 6350 1950
Wire Wire Line
	6350 2350 5650 2350
Wire Wire Line
	7050 2650 7050 2800
Wire Wire Line
	7350 3100 7350 2650
Wire Wire Line
	5650 3100 7350 3100
Wire Wire Line
	7250 2650 7250 2800
Wire Wire Line
	7250 2800 8900 2800
Wire Wire Line
	8900 2800 8900 1850
Wire Wire Line
	8900 1850 9100 1850
Wire Wire Line
	9100 1950 9000 1950
Wire Wire Line
	9000 1950 9000 2900
Wire Wire Line
	9000 2900 7150 2900
Wire Wire Line
	7150 2900 7150 2650
Wire Wire Line
	9100 2150 9100 3000
Wire Wire Line
	9100 3000 7450 3000
Wire Wire Line
	7450 3000 7450 2650
Wire Wire Line
	7950 2100 8200 2100
Wire Wire Line
	8200 2100 8200 3650
Connection ~ 7600 3650
Text Notes 6650 1150 0    60   ~ 0
CP2102 needs +3.3V!
Text GLabel 7400 4650 0    60   Input ~ 0
GND
Wire Wire Line
	7400 4650 7650 4650
Text GLabel 5650 4650 2    60   Input ~ 0
GND
Wire Wire Line
	5150 4650 5650 4650
Wire Wire Line
	5450 4550 5450 4850
Connection ~ 5450 4650
Text GLabel 5650 2800 0    60   Input ~ 0
GND
Wire Wire Line
	5650 2350 5650 3100
Wire Wire Line
	7050 2800 5650 2800
Text GLabel 9300 1450 0    60   Input ~ 0
GND
Wire Wire Line
	9400 1550 9400 1450
Wire Wire Line
	9400 1450 9300 1450
Wire Wire Line
	7950 2200 9100 2200
Connection ~ 9100 2200
NoConn ~ 9500 1550
Connection ~ 5650 2800
NoConn ~ 6350 2250
Text HLabel 7650 4850 2    60   Input ~ 0
+5V
$EndSCHEMATC
