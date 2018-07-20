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
Sheet 4 5
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
L XC9572XL-VQFP44 U8
U 1 1 5A665237
P 3450 3500
F 0 "U8" H 3450 1300 60  0000 C CNN
F 1 "XC9572XL-VQFP44" H 3450 1450 60  0000 C CNN
F 2 "" H 3450 3500 60  0001 C CNN
F 3 "" H 3450 3500 60  0001 C CNN
	1    3450 3500
	1    0    0    -1  
$EndComp
Text HLabel 1800 5200 0    60   Input ~ 0
+5V
Text HLabel 1800 5650 0    60   Input ~ 0
GND
NoConn ~ 4400 5350
NoConn ~ 4400 5500
NoConn ~ 4400 5650
NoConn ~ 4400 5800
Entry Wire Line
	2100 3350 2200 3250
Entry Wire Line
	2100 3500 2200 3400
Text Label 2350 3100 0    60   ~ 0
IPL0
Text Label 2350 3250 0    60   ~ 0
IPL1
Text Label 2350 3400 0    60   ~ 0
IPL2
Text Label 2100 3400 2    60   ~ 0
IPL[0..2]
Text HLabel 1750 3500 0    60   Output ~ 0
IPL[0..2]
Entry Wire Line
	2100 2750 2200 2650
Entry Wire Line
	2100 2900 2200 2800
Entry Wire Line
	2100 3050 2200 2950
Text Label 2100 2950 2    60   ~ 0
FC[0..2]
Text HLabel 1750 3050 0    60   Input ~ 0
FC[0..2]
Text Label 2350 2650 0    60   ~ 0
FC0
Text Label 2350 2800 0    60   ~ 0
FC1
Text Label 2350 2950 0    60   ~ 0
FC2
Text Label 4900 3850 0    60   ~ 0
A[1..23]
Text HLabel 5250 3850 2    60   BiDi ~ 0
A[1..23]
Entry Wire Line
	2100 2300 2200 2200
Entry Wire Line
	2100 2450 2200 2350
Entry Wire Line
	2100 2600 2200 2500
Entry Wire Line
	4750 2200 4850 2100
Entry Wire Line
	4750 2350 4850 2250
Entry Wire Line
	4750 2500 4850 2400
Entry Wire Line
	4750 2650 4850 2550
Entry Wire Line
	4750 2800 4850 2700
Entry Wire Line
	4750 2950 4850 2850
Entry Wire Line
	4750 3100 4850 3000
Entry Wire Line
	4750 3250 4850 3150
Entry Wire Line
	4750 3400 4850 3300
Entry Wire Line
	4750 3650 4850 3550
Entry Wire Line
	4750 3800 4850 3700
Entry Wire Line
	4750 3950 4850 3850
Text Label 2350 2200 0    60   ~ 0
A7
Text Label 2350 2350 0    60   ~ 0
A6
Text Label 2350 2500 0    60   ~ 0
A5
Text Label 4450 2200 0    60   ~ 0
A8
Text Label 4450 2350 0    60   ~ 0
A9
Text Label 4450 2500 0    60   ~ 0
A10
Text Label 4450 2650 0    60   ~ 0
A11
Text Label 4450 2800 0    60   ~ 0
A12
Text Label 4450 2950 0    60   ~ 0
A13
Text Label 4450 3100 0    60   ~ 0
A14
Text Label 4450 3250 0    60   ~ 0
A15
Text Label 4450 3400 0    60   ~ 0
A16
Text Label 4450 3650 0    60   ~ 0
A17
Text Label 4450 3800 0    60   ~ 0
A18
Text Label 4450 3950 0    60   ~ 0
A19
Text Label 4350 4100 0    60   ~ 0
ROMSEL
Text Label 4350 4250 0    60   ~ 0
RAMSEL
Text Label 4350 4400 0    60   ~ 0
UARTSEL
Text Label 4350 4550 0    60   ~ 0
RTCSEL
Text HLabel 2200 3650 0    60   Input ~ 0
AS
Text HLabel 2200 3800 0    60   Input ~ 0
UDS
Text HLabel 2200 3950 0    60   Input ~ 0
LDS
Text HLabel 2200 4100 0    60   Input ~ 0
R/W
Text HLabel 2200 4250 0    60   Output ~ 0
OE
Text HLabel 4750 4100 2    60   Output ~ 0
ROMSEL
Text HLabel 4750 4250 2    60   Output ~ 0
RAMSEL
Text HLabel 4750 4400 2    60   Output ~ 0
UARTSEL
Text HLabel 4750 4550 2    60   Output ~ 0
RTCSEL
Text HLabel 2200 4400 0    60   Output ~ 0
IACK
Text HLabel 2200 4550 0    60   Input ~ 0
UARTIRQ
Text HLabel 2200 4700 0    60   Input ~ 0
RTCIRQ
NoConn ~ 2500 4850
Wire Wire Line
	1800 5650 2050 5650
Wire Wire Line
	2050 5650 2350 5650
Wire Wire Line
	2350 5650 2500 5650
Wire Wire Line
	1800 5200 2050 5200
Wire Wire Line
	2050 5200 2350 5200
Wire Wire Line
	2350 5200 2500 5200
Wire Wire Line
	2500 5350 2050 5350
Wire Wire Line
	2050 5350 2050 5200
Connection ~ 2050 5200
Wire Wire Line
	2500 5800 2050 5800
Wire Wire Line
	2050 5800 2050 5650
Connection ~ 2050 5650
Wire Wire Line
	2500 2200 2200 2200
Wire Wire Line
	2500 2350 2200 2350
Wire Wire Line
	2500 2500 2200 2500
Wire Wire Line
	2500 2650 2200 2650
Wire Wire Line
	2500 2800 2200 2800
Wire Wire Line
	2500 2950 2200 2950
Wire Wire Line
	2500 3250 2200 3250
Wire Wire Line
	2500 3400 2200 3400
Wire Bus Line
	2100 3150 2100 3200
Wire Bus Line
	2100 3200 2100 3350
Wire Bus Line
	2100 3350 2100 3500
Wire Bus Line
	2100 3500 1750 3500
Wire Bus Line
	2100 2750 2100 2900
Wire Bus Line
	2100 2900 2100 3050
Wire Bus Line
	2100 3050 1750 3050
Wire Wire Line
	4400 2200 4750 2200
Wire Wire Line
	4400 2350 4750 2350
Wire Wire Line
	4400 2500 4750 2500
Wire Wire Line
	4400 2650 4750 2650
Wire Wire Line
	4400 2800 4750 2800
Wire Wire Line
	4400 2950 4750 2950
Wire Wire Line
	4400 3100 4750 3100
Wire Wire Line
	4400 3250 4750 3250
Wire Wire Line
	4400 3400 4750 3400
Wire Wire Line
	4400 3650 4750 3650
Wire Wire Line
	4400 3800 4750 3800
Wire Wire Line
	4400 3950 4750 3950
Wire Wire Line
	4400 4100 4750 4100
Wire Wire Line
	4400 4250 4750 4250
Wire Wire Line
	4400 4400 4750 4400
Wire Wire Line
	4400 4550 4750 4550
Wire Wire Line
	2500 3650 2200 3650
Wire Wire Line
	2500 3800 2200 3800
Wire Wire Line
	2500 3950 2200 3950
Wire Wire Line
	2500 4100 2200 4100
Wire Wire Line
	2500 4250 2200 4250
Wire Wire Line
	2500 4400 2200 4400
Wire Wire Line
	2500 4550 2200 4550
Wire Wire Line
	2500 4700 2200 4700
Wire Bus Line
	2100 1700 2100 2300
Wire Bus Line
	2100 2300 2100 2450
Wire Bus Line
	2100 2450 2100 2600
Wire Bus Line
	2100 1700 4850 1700
Wire Bus Line
	4850 1700 4850 2100
Wire Bus Line
	4850 2100 4850 2250
Wire Bus Line
	4850 2250 4850 2400
Wire Bus Line
	4850 2400 4850 2550
Wire Bus Line
	4850 2550 4850 2700
Wire Bus Line
	4850 2700 4850 2850
Wire Bus Line
	4850 2850 4850 3000
Wire Bus Line
	4850 3000 4850 3150
Wire Bus Line
	4850 3150 4850 3300
Wire Bus Line
	4850 3300 4850 3550
Wire Bus Line
	4850 3550 4850 3700
Wire Bus Line
	4850 3700 4850 3850
Wire Bus Line
	4850 3850 5250 3850
Wire Wire Line
	2500 5500 2350 5500
Wire Wire Line
	2350 5500 2350 5650
Connection ~ 2350 5650
Wire Wire Line
	2500 5050 2350 5050
Wire Wire Line
	2350 5050 2350 5200
Connection ~ 2350 5200
Wire Wire Line
	2500 3100 2200 3100
Entry Wire Line
	2100 3200 2200 3100
$EndSCHEMATC
