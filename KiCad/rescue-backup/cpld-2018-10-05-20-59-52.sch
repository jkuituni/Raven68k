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
L R R?
U 1 1 5B52BAAC
P 6950 4600
F 0 "R?" V 7030 4600 50  0000 C CNN
F 1 "R" V 6950 4600 50  0000 C CNN
F 2 "" V 6880 4600 50  0000 C CNN
F 3 "" H 6950 4600 50  0000 C CNN
	1    6950 4600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5B52BB3B
P 6950 4200
F 0 "#PWR?" H 6950 4050 50  0001 C CNN
F 1 "+5V" H 6950 4340 50  0000 C CNN
F 2 "" H 6950 4200 50  0000 C CNN
F 3 "" H 6950 4200 50  0000 C CNN
	1    6950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2200 2200 2200
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
Wire Wire Line
	2500 3100 2200 3100
Wire Wire Line
	7350 5000 6950 5000
Wire Wire Line
	6950 5000 6950 4850
Wire Wire Line
	6950 4850 6950 4750
Wire Wire Line
	7350 4850 6950 4850
Connection ~ 6950 4850
Wire Wire Line
	6950 4200 6950 4450
Text GLabel 7350 5450 0    60   Input ~ 0
AS
Text GLabel 7350 5650 0    60   Input ~ 0
RESET
Text GLabel 8350 5600 2    60   Output ~ 0
ROMBOOT
$Comp
L 74LS164 U?
U 1 1 5B52B9BF
P 7850 5250
F 0 "U?" H 7550 6000 50  0000 C CNN
F 1 "74LS164" H 7550 4400 50  0000 C CNN
F 2 "" H 7850 5250 50  0001 C CNN
F 3 "" H 7850 5250 50  0001 C CNN
	1    7850 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2350 2200 2350
Wire Wire Line
	2500 2500 2200 2500
Wire Wire Line
	4400 3650 4750 3650
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
$EndSCHEMATC
