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
Sheet 3 5
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
L 28C256 U4
U 1 1 5A5BE29E
P 3300 2000
F 0 "U4" H 3500 3000 50  0000 C CNN
F 1 "28C256" H 3600 1000 50  0000 C CNN
F 2 "" H 3300 2000 50  0001 C CNN
F 3 "" H 3300 2000 50  0001 C CNN
	1    3300 2000
	1    0    0    -1  
$EndComp
$Comp
L 28C256 U5
U 1 1 5A5BE2E6
P 3300 4400
F 0 "U5" H 3500 5400 50  0000 C CNN
F 1 "28C256" H 3600 3400 50  0000 C CNN
F 2 "" H 3300 4400 50  0001 C CNN
F 3 "" H 3300 4400 50  0001 C CNN
	1    3300 4400
	1    0    0    -1  
$EndComp
$Comp
L SRAM_512Ko U6
U 1 1 5A5BE460
P 6950 2200
F 0 "U6" H 7050 3400 50  0000 L CNN
F 1 "SRAM_512Ko" H 7050 1000 50  0000 L CNN
F 2 "" H 6950 2200 50  0001 C CNN
F 3 "" H 6950 2200 50  0001 C CNN
	1    6950 2200
	1    0    0    -1  
$EndComp
$Comp
L SRAM_512Ko U7
U 1 1 5A5BE4AA
P 6950 5000
F 0 "U7" H 7050 6200 50  0000 L CNN
F 1 "SRAM_512Ko" H 7050 3800 50  0000 L CNN
F 2 "" H 6950 5000 50  0001 C CNN
F 3 "" H 6950 5000 50  0001 C CNN
	1    6950 5000
	1    0    0    -1  
$EndComp
Text Label 4000 1100 0    60   ~ 0
D0
Text Label 4000 1200 0    60   ~ 0
D1
Text Label 4000 1300 0    60   ~ 0
D2
Text Label 4000 1400 0    60   ~ 0
D3
Text Label 4000 1500 0    60   ~ 0
D4
Text Label 4000 1600 0    60   ~ 0
D5
Text Label 4000 1700 0    60   ~ 0
D6
Text Label 4000 1800 0    60   ~ 0
D7
Text Label 4000 3500 0    60   ~ 0
D8
Text Label 4000 3600 0    60   ~ 0
D9
Text Label 4000 3700 0    60   ~ 0
D10
Text Label 4000 3800 0    60   ~ 0
D11
Text Label 4000 3900 0    60   ~ 0
D12
Text Label 4000 4000 0    60   ~ 0
D13
Text Label 4000 4100 0    60   ~ 0
D14
Text Label 4000 4200 0    60   ~ 0
D15
Text Label 7650 1100 0    60   ~ 0
D0
Text Label 7650 1200 0    60   ~ 0
D1
Text Label 7650 1300 0    60   ~ 0
D2
Text Label 7650 1400 0    60   ~ 0
D3
Text Label 7650 1500 0    60   ~ 0
D4
Text Label 7650 1600 0    60   ~ 0
D5
Text Label 7650 1700 0    60   ~ 0
D6
Text Label 7650 1800 0    60   ~ 0
D7
Text Label 7650 3900 0    60   ~ 0
D8
Text Label 7650 4000 0    60   ~ 0
D9
Text Label 7650 4100 0    60   ~ 0
D10
Text Label 7650 4200 0    60   ~ 0
D11
Text Label 7650 4300 0    60   ~ 0
D12
Text Label 7650 4400 0    60   ~ 0
D13
Text Label 7650 4500 0    60   ~ 0
D14
Text Label 7650 4600 0    60   ~ 0
D15
Entry Wire Line
	4300 1100 4400 1200
Entry Wire Line
	4300 1200 4400 1300
Entry Wire Line
	4300 1300 4400 1400
Entry Wire Line
	4300 1400 4400 1500
Entry Wire Line
	4300 1500 4400 1600
Entry Wire Line
	4300 1600 4400 1700
Entry Wire Line
	4300 1700 4400 1800
Entry Wire Line
	4300 1800 4400 1900
Entry Wire Line
	4300 3500 4400 3600
Entry Wire Line
	4300 3600 4400 3700
Entry Wire Line
	4300 3700 4400 3800
Entry Wire Line
	4300 3800 4400 3900
Entry Wire Line
	4300 3900 4400 4000
Entry Wire Line
	4300 4000 4400 4100
Entry Wire Line
	4300 4100 4400 4200
Entry Wire Line
	4300 4200 4400 4300
Entry Wire Line
	7900 3900 8000 4000
Entry Wire Line
	7900 4000 8000 4100
Entry Wire Line
	7900 4100 8000 4200
Entry Wire Line
	7900 4200 8000 4300
Entry Wire Line
	7900 4300 8000 4400
Entry Wire Line
	7900 4400 8000 4500
Entry Wire Line
	7900 4500 8000 4600
Entry Wire Line
	7900 4600 8000 4700
Entry Wire Line
	7900 1100 8000 1200
Entry Wire Line
	7900 1200 8000 1300
Entry Wire Line
	7900 1300 8000 1400
Entry Wire Line
	7900 1400 8000 1500
Entry Wire Line
	7900 1500 8000 1600
Entry Wire Line
	7900 1600 8000 1700
Entry Wire Line
	7900 1700 8000 1800
Entry Wire Line
	7900 1800 8000 1900
Text HLabel 4550 4400 2    60   BiDi ~ 0
D[0..15]
Text Label 2500 1100 0    60   ~ 0
A1
Text Label 2500 1200 0    60   ~ 0
A2
Text Label 2500 1300 0    60   ~ 0
A3
Text Label 2500 1400 0    60   ~ 0
A4
Text Label 2500 1500 0    60   ~ 0
A5
Text Label 2500 1600 0    60   ~ 0
A6
Text Label 2500 1700 0    60   ~ 0
A7
Text Label 2500 1800 0    60   ~ 0
A8
Text Label 2500 1900 0    60   ~ 0
A9
Text Label 2500 2000 0    60   ~ 0
A10
Text Label 2500 2100 0    60   ~ 0
A11
Text Label 2500 2200 0    60   ~ 0
A12
Text Label 2500 2300 0    60   ~ 0
A13
Text Label 2500 2400 0    60   ~ 0
A14
Text Label 2500 2500 0    60   ~ 0
A15
Text Label 2500 3500 0    60   ~ 0
A1
Text Label 2500 3600 0    60   ~ 0
A2
Text Label 2500 3700 0    60   ~ 0
A3
Text Label 2500 3800 0    60   ~ 0
A4
Text Label 2500 3900 0    60   ~ 0
A5
Text Label 2500 4000 0    60   ~ 0
A6
Text Label 2500 4100 0    60   ~ 0
A7
Text Label 2500 4200 0    60   ~ 0
A8
Text Label 2500 4300 0    60   ~ 0
A9
Text Label 2500 4400 0    60   ~ 0
A10
Text Label 2500 4500 0    60   ~ 0
A11
Text Label 2500 4600 0    60   ~ 0
A12
Text Label 2500 4700 0    60   ~ 0
A13
Text Label 2500 4800 0    60   ~ 0
A14
Text Label 2500 4900 0    60   ~ 0
A15
Text Label 6150 1100 0    60   ~ 0
A1
Text Label 6150 1200 0    60   ~ 0
A2
Text Label 6150 1300 0    60   ~ 0
A3
Text Label 6150 1400 0    60   ~ 0
A4
Text Label 6150 1500 0    60   ~ 0
A5
Text Label 6150 1600 0    60   ~ 0
A6
Text Label 6150 1700 0    60   ~ 0
A7
Text Label 6150 1800 0    60   ~ 0
A8
Text Label 6150 1900 0    60   ~ 0
A9
Text Label 6150 2000 0    60   ~ 0
A10
Text Label 6150 2100 0    60   ~ 0
A11
Text Label 6150 2200 0    60   ~ 0
A12
Text Label 6150 2300 0    60   ~ 0
A13
Text Label 6150 2400 0    60   ~ 0
A14
Text Label 6150 2500 0    60   ~ 0
A15
Text Label 6150 2600 0    60   ~ 0
A16
Text Label 6150 2700 0    60   ~ 0
A17
Text Label 6150 2800 0    60   ~ 0
A18
Text Label 6150 2900 0    60   ~ 0
A19
Text Label 6150 3900 0    60   ~ 0
A1
Text Label 6150 4000 0    60   ~ 0
A2
Text Label 6150 4100 0    60   ~ 0
A3
Text Label 6150 4200 0    60   ~ 0
A4
Text Label 6150 4300 0    60   ~ 0
A5
Text Label 6150 4400 0    60   ~ 0
A6
Text Label 6150 4500 0    60   ~ 0
A7
Text Label 6150 4600 0    60   ~ 0
A8
Text Label 6150 4700 0    60   ~ 0
A9
Text Label 6150 4800 0    60   ~ 0
A10
Text Label 6150 4900 0    60   ~ 0
A11
Text Label 6150 5000 0    60   ~ 0
A12
Text Label 6150 5100 0    60   ~ 0
A13
Text Label 6150 5200 0    60   ~ 0
A14
Text Label 6150 5300 0    60   ~ 0
A15
Text Label 6150 5400 0    60   ~ 0
A16
Text Label 6150 5500 0    60   ~ 0
A17
Text Label 6150 5600 0    60   ~ 0
A18
Text Label 6150 5700 0    60   ~ 0
A19
Entry Wire Line
	2300 1200 2400 1100
Entry Wire Line
	2300 1300 2400 1200
Entry Wire Line
	2300 1400 2400 1300
Entry Wire Line
	2300 1500 2400 1400
Entry Wire Line
	2300 1600 2400 1500
Entry Wire Line
	2300 1700 2400 1600
Entry Wire Line
	2300 1800 2400 1700
Entry Wire Line
	2300 1900 2400 1800
Entry Wire Line
	2300 2000 2400 1900
Entry Wire Line
	2300 2100 2400 2000
Entry Wire Line
	2300 2200 2400 2100
Entry Wire Line
	2300 2300 2400 2200
Entry Wire Line
	2300 2400 2400 2300
Entry Wire Line
	2300 2500 2400 2400
Entry Wire Line
	2300 2600 2400 2500
Entry Wire Line
	2300 3600 2400 3500
Entry Wire Line
	2300 3700 2400 3600
Entry Wire Line
	2300 3800 2400 3700
Entry Wire Line
	2300 3900 2400 3800
Entry Wire Line
	2300 4000 2400 3900
Entry Wire Line
	2300 4100 2400 4000
Entry Wire Line
	2300 4200 2400 4100
Entry Wire Line
	2300 4300 2400 4200
Entry Wire Line
	2300 4400 2400 4300
Entry Wire Line
	2300 4500 2400 4400
Entry Wire Line
	2300 4600 2400 4500
Entry Wire Line
	2300 4700 2400 4600
Entry Wire Line
	2300 4800 2400 4700
Entry Wire Line
	2300 4900 2400 4800
Entry Wire Line
	2300 5000 2400 4900
Entry Wire Line
	5950 4000 6050 3900
Entry Wire Line
	5950 4100 6050 4000
Entry Wire Line
	5950 4200 6050 4100
Entry Wire Line
	5950 4300 6050 4200
Entry Wire Line
	5950 4400 6050 4300
Entry Wire Line
	5950 4500 6050 4400
Entry Wire Line
	5950 4600 6050 4500
Entry Wire Line
	5950 4700 6050 4600
Entry Wire Line
	5950 4800 6050 4700
Entry Wire Line
	5950 4900 6050 4800
Entry Wire Line
	5950 5000 6050 4900
Entry Wire Line
	5950 5100 6050 5000
Entry Wire Line
	5950 5200 6050 5100
Entry Wire Line
	5950 5300 6050 5200
Entry Wire Line
	5950 5400 6050 5300
Entry Wire Line
	5950 5500 6050 5400
Entry Wire Line
	5950 5600 6050 5500
Entry Wire Line
	5950 5700 6050 5600
Entry Wire Line
	5950 5800 6050 5700
Entry Wire Line
	5950 1200 6050 1100
Entry Wire Line
	5950 1400 6050 1300
Entry Wire Line
	5950 1500 6050 1400
Entry Wire Line
	5950 1600 6050 1500
Entry Wire Line
	5950 1700 6050 1600
Entry Wire Line
	5950 1800 6050 1700
Entry Wire Line
	5950 1900 6050 1800
Entry Wire Line
	5950 2000 6050 1900
Entry Wire Line
	5950 2100 6050 2000
Entry Wire Line
	5950 2200 6050 2100
Entry Wire Line
	5950 2300 6050 2200
Entry Wire Line
	5950 2400 6050 2300
Entry Wire Line
	5950 2500 6050 2400
Entry Wire Line
	5950 2600 6050 2500
Entry Wire Line
	5950 2700 6050 2600
Entry Wire Line
	5950 2800 6050 2700
Entry Wire Line
	5950 2900 6050 2800
Entry Wire Line
	5950 3000 6050 2900
Text HLabel 5750 1000 0    60   BiDi ~ 0
A[0..23]
Text HLabel 9150 3500 2    60   Input ~ 0
GND
Text HLabel 9150 3700 2    60   Input ~ 0
+5V
Entry Wire Line
	5950 1300 6050 1200
Text Label 4400 2600 0    60   ~ 0
D[0..15]
Text HLabel 1200 3100 0    60   Input ~ 0
OE
Text HLabel 1200 3300 0    60   Input ~ 0
ROMSEL
Text HLabel 5500 3700 0    60   Input ~ 0
RAMSEL
Text GLabel 1400 3100 2    60   Input ~ 0
OE
Text GLabel 2600 2650 0    60   Input ~ 0
WE
Text GLabel 2600 5050 0    60   Input ~ 0
WE
Text GLabel 6250 3250 0    60   Input ~ 0
WE
Text GLabel 6250 6050 0    60   Input ~ 0
WE
Text HLabel 1200 2900 0    60   Input ~ 0
R/W
Text GLabel 1400 2900 2    60   Input ~ 0
WE
Text GLabel 2600 2850 0    60   Input ~ 0
OE
Text GLabel 2600 5250 0    60   Input ~ 0
OE
Text GLabel 6250 3050 0    60   Input ~ 0
OE
Text GLabel 6250 5850 0    60   Input ~ 0
OE
Wire Wire Line
	4000 1100 4300 1100
Wire Wire Line
	4000 1200 4300 1200
Wire Wire Line
	4000 1300 4300 1300
Wire Wire Line
	4000 1400 4300 1400
Wire Wire Line
	4000 1500 4300 1500
Wire Wire Line
	4000 1600 4300 1600
Wire Wire Line
	4000 1700 4300 1700
Wire Wire Line
	4000 1800 4300 1800
Wire Wire Line
	4000 3500 4300 3500
Wire Wire Line
	4000 3600 4300 3600
Wire Wire Line
	4000 3700 4300 3700
Wire Wire Line
	4000 3800 4300 3800
Wire Wire Line
	4000 3900 4300 3900
Wire Wire Line
	4000 4000 4300 4000
Wire Wire Line
	4000 4100 4300 4100
Wire Wire Line
	4000 4200 4300 4200
Wire Wire Line
	7650 3900 7900 3900
Wire Wire Line
	7650 4000 7900 4000
Wire Wire Line
	7650 4100 7900 4100
Wire Wire Line
	7650 4200 7900 4200
Wire Wire Line
	7650 4300 7900 4300
Wire Wire Line
	7650 4400 7900 4400
Wire Wire Line
	7650 4500 7900 4500
Wire Wire Line
	7650 4600 7900 4600
Wire Wire Line
	7650 1100 7900 1100
Wire Wire Line
	7650 1200 7900 1200
Wire Wire Line
	7650 1300 7900 1300
Wire Wire Line
	7650 1400 7900 1400
Wire Wire Line
	7650 1500 7900 1500
Wire Wire Line
	7650 1600 7900 1600
Wire Wire Line
	7650 1700 7900 1700
Wire Wire Line
	7650 1800 7900 1800
Wire Bus Line
	4400 800  4400 4400
Wire Bus Line
	4400 800  8000 800 
Wire Bus Line
	8000 800  8000 4700
Wire Wire Line
	2600 1300 2400 1300
Wire Wire Line
	2600 1400 2400 1400
Wire Wire Line
	2600 1500 2400 1500
Wire Wire Line
	2600 1600 2400 1600
Wire Wire Line
	2600 1700 2400 1700
Wire Wire Line
	2600 1900 2400 1900
Wire Wire Line
	2600 2000 2400 2000
Wire Wire Line
	2600 2200 2400 2200
Wire Wire Line
	2600 2500 2400 2500
Wire Wire Line
	2600 3500 2400 3500
Wire Wire Line
	2600 3600 2400 3600
Wire Wire Line
	2600 3700 2400 3700
Wire Wire Line
	2600 3800 2400 3800
Wire Wire Line
	2600 3900 2400 3900
Wire Wire Line
	2600 4000 2400 4000
Wire Wire Line
	2600 4100 2400 4100
Wire Wire Line
	2600 4200 2400 4200
Wire Wire Line
	2600 4300 2400 4300
Wire Wire Line
	2600 4400 2400 4400
Wire Wire Line
	2600 4500 2400 4500
Wire Wire Line
	2600 4600 2400 4600
Wire Wire Line
	2600 4700 2400 4700
Wire Wire Line
	2600 4800 2400 4800
Wire Wire Line
	2600 4900 2400 4900
Wire Wire Line
	6250 1100 6050 1100
Wire Wire Line
	6250 1300 6050 1300
Wire Wire Line
	6250 1400 6050 1400
Wire Wire Line
	6250 1500 6050 1500
Wire Wire Line
	6250 1600 6050 1600
Wire Wire Line
	6250 1700 6050 1700
Wire Wire Line
	6250 1800 6050 1800
Wire Wire Line
	6250 1900 6050 1900
Wire Wire Line
	6250 2000 6050 2000
Wire Wire Line
	6250 2100 6050 2100
Wire Wire Line
	6250 2200 6050 2200
Wire Wire Line
	6250 2300 6050 2300
Wire Wire Line
	6250 2400 6050 2400
Wire Wire Line
	6250 2500 6050 2500
Wire Wire Line
	6250 2600 6050 2600
Wire Wire Line
	6250 2700 6050 2700
Wire Wire Line
	6250 2800 6050 2800
Wire Wire Line
	6250 2900 6050 2900
Wire Wire Line
	6250 3900 6050 3900
Wire Wire Line
	6250 4000 6050 4000
Wire Wire Line
	6250 4100 6050 4100
Wire Wire Line
	6250 4200 6050 4200
Wire Wire Line
	6250 4300 6050 4300
Wire Wire Line
	6250 4400 6050 4400
Wire Wire Line
	6250 4500 6050 4500
Wire Wire Line
	6250 4600 6050 4600
Wire Wire Line
	6250 4700 6050 4700
Wire Wire Line
	6250 4800 6050 4800
Wire Wire Line
	6250 4900 6050 4900
Wire Wire Line
	6250 5000 6050 5000
Wire Wire Line
	6250 5100 6050 5100
Wire Wire Line
	6250 5200 6050 5200
Wire Wire Line
	6250 5300 6050 5300
Wire Wire Line
	6250 5400 6050 5400
Wire Wire Line
	6250 5500 6050 5500
Wire Wire Line
	6250 5600 6050 5600
Wire Wire Line
	6250 5700 6050 5700
Wire Bus Line
	2300 1200 2300 6000
Wire Bus Line
	2300 6000 5950 6000
Wire Bus Line
	5950 6000 5950 1000
Wire Wire Line
	2400 2100 2600 2100
Wire Wire Line
	2400 2300 2600 2300
Wire Wire Line
	2400 1100 2600 1100
Wire Wire Line
	2400 1200 2600 1200
Wire Wire Line
	2400 1800 2600 1800
Wire Wire Line
	2400 2400 2600 2400
Wire Bus Line
	4400 4400 4550 4400
Wire Bus Line
	5950 1000 5750 1000
Wire Wire Line
	6950 3500 9150 3500
Wire Wire Line
	6950 6300 8800 6300
Wire Wire Line
	8800 6300 8800 3500
Connection ~ 8800 3500
Wire Wire Line
	6950 3700 9150 3700
Wire Wire Line
	6950 900  8550 900 
Wire Wire Line
	8550 900  8550 3700
Connection ~ 8550 3700
Wire Wire Line
	6250 1200 6050 1200
Wire Wire Line
	1200 3100 1400 3100
Wire Wire Line
	1200 2900 1400 2900
Wire Wire Line
	1200 3300 2050 3300
Wire Wire Line
	2050 3100 2050 5450
Connection ~ 2050 3300
Wire Wire Line
	5500 3700 6250 3700
Wire Wire Line
	6250 3700 6250 3300
Wire Wire Line
	5700 3700 5700 6200
Connection ~ 5700 3700
Wire Wire Line
	2600 2800 2600 2850
Wire Wire Line
	2600 2700 2600 2650
Wire Wire Line
	2600 5200 2600 5250
Wire Wire Line
	2600 5300 2600 5450
Wire Wire Line
	2600 5450 2050 5450
Wire Wire Line
	2600 2900 2600 3100
Wire Wire Line
	2600 3100 2050 3100
Wire Wire Line
	6250 3200 6250 3250
Wire Wire Line
	6250 5850 6250 5900
Wire Wire Line
	6250 6000 6250 6050
Wire Wire Line
	6250 6100 6250 6200
Wire Wire Line
	6250 6200 5700 6200
Wire Wire Line
	2600 5050 2600 5100
Wire Wire Line
	6250 3050 6250 3100
$EndSCHEMATC
