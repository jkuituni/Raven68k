EESchema Schematic File Version 2
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
LIBS:kicad_test-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L 68000D U1
U 1 1 5A51FAD7
P 2900 3550
F 0 "U1" H 2900 3650 50  0000 C CNN
F 1 "68000D" H 2900 3400 50  0000 C CNN
F 2 "Housings_DIP:DIP-64_W22.86mm" H 2900 3550 60  0001 C CNN
F 3 "" H 2900 3550 60  0001 C CNN
	1    2900 3550
	1    0    0    -1  
$EndComp
$Comp
L 28C256 U2
U 1 1 5A51FD96
P 5400 2250
F 0 "U2" H 5600 3250 50  0000 C CNN
F 1 "28C256" H 5700 1250 50  0000 C CNN
F 2 "Housings_DIP:DIP-28_W15.24mm" H 5400 2250 50  0001 C CNN
F 3 "" H 5400 2250 50  0000 C CNN
	1    5400 2250
	1    0    0    -1  
$EndComp
$Comp
L 28C256 U5
U 1 1 5A51FE11
P 5400 4500
F 0 "U5" H 5600 5500 50  0000 C CNN
F 1 "28C256" H 5700 3500 50  0000 C CNN
F 2 "Housings_DIP:DIP-28_W15.24mm" H 5400 4500 50  0001 C CNN
F 3 "" H 5400 4500 50  0000 C CNN
	1    5400 4500
	1    0    0    -1  
$EndComp
$Comp
L SRAM_512Ko U3
U 1 1 5A51FE9E
P 7050 2350
F 0 "U3" H 7150 3550 50  0000 L CNN
F 1 "SRAM_512Ko" H 7150 1150 50  0000 L CNN
F 2 "Housings_DIP:DIP-32_W15.24mm" H 7050 2350 50  0001 C CNN
F 3 "" H 7050 2350 50  0000 C CNN
	1    7050 2350
	-1   0    0    1   
$EndComp
Text Label 4000 1350 0    60   ~ 0
A1
Text Label 4000 1450 0    60   ~ 0
A2
Text Label 4000 1550 0    60   ~ 0
A3
Text Label 4000 1650 0    60   ~ 0
A4
Text Label 4000 1750 0    60   ~ 0
A5
Text Label 4000 1850 0    60   ~ 0
A6
Text Label 4000 1950 0    60   ~ 0
A7
Text Label 4000 2050 0    60   ~ 0
A8
Text Label 4000 2150 0    60   ~ 0
A9
Text Label 4000 2250 0    60   ~ 0
A10
Text Label 4000 2350 0    60   ~ 0
A11
Text Label 4000 2450 0    60   ~ 0
A12
Text Label 4000 2550 0    60   ~ 0
A13
Text Label 4000 2650 0    60   ~ 0
A14
Text Label 4000 2750 0    60   ~ 0
A15
Text Label 4000 2850 0    60   ~ 0
A16
Text Label 4000 2950 0    60   ~ 0
A17
Text Label 4000 3050 0    60   ~ 0
A18
Text Label 4000 3150 0    60   ~ 0
A19
Text Label 4000 3250 0    60   ~ 0
A20
Text Label 4000 3350 0    60   ~ 0
A21
Text Label 4000 3450 0    60   ~ 0
A22
Text Label 4000 3550 0    60   ~ 0
A23
Text Label 4500 1350 0    60   ~ 0
A1
Text Label 4500 1450 0    60   ~ 0
A2
Text Label 4500 1550 0    60   ~ 0
A3
Text Label 4500 1650 0    60   ~ 0
A4
Text Label 4500 1750 0    60   ~ 0
A5
Text Label 4500 1850 0    60   ~ 0
A6
Text Label 4500 1950 0    60   ~ 0
A7
Text Label 4500 2050 0    60   ~ 0
A8
Text Label 4500 2150 0    60   ~ 0
A9
Text Label 4500 2250 0    60   ~ 0
A10
Text Label 4500 2350 0    60   ~ 0
A11
Text Label 4500 2450 0    60   ~ 0
A12
Text Label 4500 2550 0    60   ~ 0
A13
Text Label 4500 2650 0    60   ~ 0
A14
Text Label 4500 2750 0    60   ~ 0
A15
Text Label 6100 1350 0    60   ~ 0
D0
Text Label 6100 1450 0    60   ~ 0
D1
Text Label 6100 1550 0    60   ~ 0
D2
Text Label 6100 1650 0    60   ~ 0
D3
Text Label 6100 1750 0    60   ~ 0
D4
Text Label 6100 1850 0    60   ~ 0
D5
Text Label 6100 1950 0    60   ~ 0
D6
Text Label 6100 2050 0    60   ~ 0
D7
Entry Wire Line
	8700 3650 8800 3750
Entry Wire Line
	8700 3750 8800 3850
Entry Wire Line
	8700 3850 8800 3950
Entry Wire Line
	8700 3950 8800 4050
Entry Wire Line
	8700 4050 8800 4150
Entry Wire Line
	8700 4150 8800 4250
Entry Wire Line
	8700 4250 8800 4350
Entry Wire Line
	8700 4350 8800 4450
$Comp
L Crystal_GND24 Y1
U 1 1 5A53B5EA
P 1100 1300
F 0 "Y1" H 1225 1500 50  0000 L CNN
F 1 "Crystal_GND24" H 1225 1425 50  0000 L CNN
F 2 "Crystals:Crystal_SMD_2520_4Pads" H 1100 1300 50  0001 C CNN
F 3 "" H 1100 1300 50  0000 C CNN
	1    1100 1300
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A53D960
P 1600 4300
F 0 "R3" V 1680 4300 50  0000 C CNN
F 1 "R470" V 1600 4300 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 1530 4300 50  0001 C CNN
F 3 "" H 1600 4300 50  0000 C CNN
	1    1600 4300
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5A53DA79
P 1600 2150
F 0 "R2" V 1680 2150 50  0000 C CNN
F 1 "R470" V 1600 2150 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 1530 2150 50  0001 C CNN
F 3 "" H 1600 2150 50  0000 C CNN
	1    1600 2150
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 5A53DCFC
P 1600 2000
F 0 "R1" V 1680 2000 50  0000 C CNN
F 1 "R470" V 1600 2000 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 1530 2000 50  0001 C CNN
F 3 "" H 1600 2000 50  0000 C CNN
	1    1600 2000
	0    1    1    0   
$EndComp
$Comp
L SRAM_512Ko U4
U 1 1 5A51FF23
P 7000 5100
F 0 "U4" H 7100 6300 50  0000 L CNN
F 1 "SRAM_512Ko" H 7100 3900 50  0000 L CNN
F 2 "Housings_DIP:DIP-32_W15.24mm" H 7000 5100 50  0001 C CNN
F 3 "" H 7000 5100 50  0000 C CNN
	1    7000 5100
	-1   0    0    1   
$EndComp
$Comp
L BARREL_JACK CON1
U 1 1 5A53E35A
P 850 2600
F 0 "CON1" H 850 2850 50  0000 C CNN
F 1 "BARREL_JACK" H 850 2400 50  0000 C CNN
F 2 "" H 850 2600 50  0000 C CNN
F 3 "" H 850 2600 50  0000 C CNN
	1    850  2600
	0    -1   -1   0   
$EndComp
$Comp
L XC9572XL-TQ100 U6
U 1 1 5A5414FF
P 9650 3500
F 0 "U6" H 8800 6150 50  0000 C CNN
F 1 "XC9572XL-TQ100" H 10350 850 50  0000 C CNN
F 2 "Housings_QFP:TQFP-100_14x14mm_Pitch0.5mm" H 9650 3600 50  0001 C CNN
F 3 "" H 9600 3550 50  0000 C CNN
	1    9650 3500
	1    0    0    -1  
$EndComp
Text Label 4600 3600 0    60   ~ 0
A1
Text Label 4600 3700 0    60   ~ 0
A2
Text Label 4600 3800 0    60   ~ 0
A3
Text Label 4600 3900 0    60   ~ 0
A4
Text Label 4600 4000 0    60   ~ 0
A5
Text Label 4600 4100 0    60   ~ 0
A6
Text Label 4600 4200 0    60   ~ 0
A7
Text Label 4600 4300 0    60   ~ 0
A8
Text Label 4600 4400 0    60   ~ 0
A9
Text Label 4600 4500 0    60   ~ 0
A10
Text Label 4600 4600 0    60   ~ 0
A11
Text Label 4600 4700 0    60   ~ 0
A12
Text Label 4600 4800 0    60   ~ 0
A13
Text Label 4600 4900 0    60   ~ 0
A14
Text Label 4600 5000 0    60   ~ 0
A15
Text Label 3950 3750 0    60   ~ 0
D0
Text Label 3950 3850 0    60   ~ 0
D1
Text Label 3950 3950 0    60   ~ 0
D2
Text Label 3950 4050 0    60   ~ 0
D3
Text Label 3950 4150 0    60   ~ 0
D4
Text Label 3950 4250 0    60   ~ 0
D5
Text Label 3950 4350 0    60   ~ 0
D6
Text Label 3950 4450 0    60   ~ 0
D7
Text Label 3950 4550 0    60   ~ 0
D8
Text Label 3950 4650 0    60   ~ 0
D9
Text Label 3950 4750 0    60   ~ 0
D10
Text Label 3950 4850 0    60   ~ 0
D11
Text Label 3950 4950 0    60   ~ 0
D12
Text Label 3950 5050 0    60   ~ 0
D13
Text Label 3950 5150 0    60   ~ 0
D14
Text Label 3950 5250 0    60   ~ 0
D15
Text Label 6150 3600 0    60   ~ 0
D8
Text Label 6150 3700 0    60   ~ 0
D9
Text Label 6150 3800 0    60   ~ 0
D10
Text Label 6150 3900 0    60   ~ 0
D11
Text Label 6150 4000 0    60   ~ 0
D12
Text Label 6150 4100 0    60   ~ 0
D13
Text Label 6150 4200 0    60   ~ 0
D14
Text Label 6150 4300 0    60   ~ 0
D15
Text Label 6200 2750 0    60   ~ 0
D7
Text Label 6200 2850 0    60   ~ 0
D6
Text Label 6200 2950 0    60   ~ 0
D5
Text Label 6200 3050 0    60   ~ 0
D4
Text Label 6200 3150 0    60   ~ 0
D3
Text Label 6200 3250 0    60   ~ 0
D2
Text Label 6200 3350 0    60   ~ 0
D1
Text Label 6200 3450 0    60   ~ 0
D0
Text Label 6150 6200 0    60   ~ 0
D8
Text Label 6150 6100 0    60   ~ 0
D9
Text Label 6150 6000 0    60   ~ 0
D10
Text Label 6150 5900 0    60   ~ 0
D11
Text Label 6150 5800 0    60   ~ 0
D12
Text Label 6150 5700 0    60   ~ 0
D13
Text Label 6150 5600 0    60   ~ 0
D14
Text Label 6150 5500 0    60   ~ 0
D15
Wire Wire Line
	3900 1350 4200 1350
Wire Wire Line
	3900 1450 4200 1450
Wire Wire Line
	3900 1550 4200 1550
Wire Wire Line
	3900 1650 4200 1650
Wire Wire Line
	3900 1750 4200 1750
Wire Wire Line
	3900 1850 4200 1850
Wire Wire Line
	3900 1950 4200 1950
Wire Wire Line
	3900 2050 4200 2050
Wire Wire Line
	3900 2150 4200 2150
Wire Wire Line
	3900 2250 4200 2250
Wire Wire Line
	3900 2350 4200 2350
Wire Wire Line
	3900 2450 4200 2450
Wire Wire Line
	3900 2550 4200 2550
Wire Wire Line
	3900 2650 4200 2650
Wire Wire Line
	3900 2750 4200 2750
Wire Wire Line
	3900 2850 4350 2850
Wire Wire Line
	3900 2950 4350 2950
Wire Wire Line
	3900 3050 4350 3050
Wire Wire Line
	3900 3150 4350 3150
Wire Wire Line
	4700 1350 4400 1350
Wire Wire Line
	4700 1450 4400 1450
Wire Wire Line
	4700 1550 4400 1550
Wire Wire Line
	4700 1650 4400 1650
Wire Wire Line
	4700 1850 4400 1850
Wire Wire Line
	4700 2050 4400 2050
Wire Wire Line
	4700 2150 4400 2150
Wire Wire Line
	4700 2250 4400 2250
Wire Wire Line
	4700 2350 4400 2350
Wire Wire Line
	4700 2450 4400 2450
Wire Wire Line
	4700 2550 4400 2550
Wire Wire Line
	4700 2650 4400 2650
Wire Wire Line
	4700 2750 4400 2750
Wire Wire Line
	4700 1750 4400 1750
Wire Wire Line
	4700 1950 4400 1950
Wire Wire Line
	6100 1350 6200 1350
Wire Wire Line
	6100 1450 6200 1450
Wire Wire Line
	6100 1550 6200 1550
Wire Wire Line
	6100 1650 6200 1650
Wire Wire Line
	6100 1750 6200 1750
Wire Wire Line
	6100 1850 6200 1850
Wire Wire Line
	6100 1950 6200 1950
Wire Wire Line
	6100 2050 6200 2050
Wire Wire Line
	1900 1400 1400 1400
Wire Wire Line
	1400 1400 1400 1300
Wire Wire Line
	1400 1300 1250 1300
Wire Wire Line
	1900 1400 1900 1350
Wire Wire Line
	1300 1850 1300 1650
Wire Wire Line
	1300 1650 800  1650
Wire Wire Line
	800  1300 950  1300
Wire Wire Line
	1200 1950 1350 1950
Wire Wire Line
	1350 1550 1100 1550
Wire Wire Line
	1100 1550 1100 1500
Connection ~ 1350 1950
Wire Wire Line
	1350 2200 600  2200
Wire Wire Line
	1900 2050 1900 2000
Wire Wire Line
	1900 2000 1750 2000
Wire Wire Line
	1900 2150 1750 2150
Wire Wire Line
	950  2000 1450 2000
Connection ~ 1350 2000
Wire Wire Line
	1200 2150 1450 2150
Connection ~ 1350 2150
Wire Wire Line
	1900 4300 1750 4300
Wire Wire Line
	1200 4300 1450 4300
Connection ~ 1200 2200
Wire Wire Line
	1200 2050 1350 2050
Connection ~ 1350 2050
Connection ~ 1350 2200
Connection ~ 800  1300
Wire Wire Line
	7750 1200 7750 1250
Connection ~ 1200 4300
Wire Wire Line
	1100 900  1100 1100
Wire Wire Line
	600  900  8150 900 
Connection ~ 1100 1000
Wire Wire Line
	1200 1950 1200 2050
Connection ~ 1200 2000
Wire Wire Line
	1300 1850 1150 1850
Wire Wire Line
	1150 1850 1150 1900
Wire Wire Line
	1150 1900 700  1900
Wire Wire Line
	1200 2150 1200 6000
Wire Wire Line
	800  1650 800  1300
Wire Wire Line
	950  2300 850  2300
Wire Wire Line
	950  2000 950  2300
Connection ~ 950  2200
Connection ~ 750  1900
Wire Wire Line
	1350 1950 1350 1550
Wire Wire Line
	3900 3250 4350 3250
Wire Wire Line
	3900 3350 4350 3350
Wire Wire Line
	3900 3450 4350 3450
Wire Wire Line
	3900 3550 4350 3550
Wire Wire Line
	4700 3600 4550 3600
Wire Wire Line
	4700 3700 4550 3700
Wire Wire Line
	4700 3800 4550 3800
Wire Wire Line
	4700 3900 4550 3900
Wire Wire Line
	4700 4000 4550 4000
Wire Wire Line
	4700 4100 4550 4100
Wire Wire Line
	4700 4200 4550 4200
Wire Wire Line
	4700 4300 4550 4300
Wire Wire Line
	4700 4400 4550 4400
Wire Wire Line
	4700 4500 4550 4500
Wire Wire Line
	4700 4600 4550 4600
Wire Wire Line
	4700 4700 4550 4700
Wire Wire Line
	4700 4800 4550 4800
Wire Wire Line
	4700 4900 4550 4900
Wire Wire Line
	4700 5000 4550 5000
Wire Wire Line
	3900 3750 4050 3750
Wire Wire Line
	3900 3850 4050 3850
Wire Wire Line
	3900 3950 4050 3950
Wire Wire Line
	3900 4050 4050 4050
Wire Wire Line
	3900 4150 4050 4150
Wire Wire Line
	3900 4250 4050 4250
Wire Wire Line
	3900 4350 4050 4350
Wire Wire Line
	3900 4450 4050 4450
Wire Wire Line
	3900 4550 4050 4550
Wire Wire Line
	3900 4650 4050 4650
Wire Wire Line
	3900 4750 4050 4750
Wire Wire Line
	3900 4850 4050 4850
Wire Wire Line
	3900 4950 4050 4950
Wire Wire Line
	3900 5050 4050 5050
Wire Wire Line
	3900 5150 4050 5150
Wire Wire Line
	3900 5250 4050 5250
Wire Wire Line
	6100 3600 6300 3600
Wire Wire Line
	6100 3700 6300 3700
Wire Wire Line
	6100 3800 6300 3800
Wire Wire Line
	6100 3900 6300 3900
Wire Wire Line
	6100 4000 6300 4000
Wire Wire Line
	6100 4100 6300 4100
Wire Wire Line
	6100 4200 6300 4200
Wire Wire Line
	6100 4300 6300 4300
Wire Wire Line
	4350 2850 4350 6000
Wire Wire Line
	4350 6000 1200 6000
Connection ~ 4350 2950
Connection ~ 4350 3050
Connection ~ 4350 3150
Connection ~ 4350 3250
Connection ~ 4350 3350
Connection ~ 4350 3450
Connection ~ 4350 3550
Wire Wire Line
	6350 2750 6100 2750
Wire Wire Line
	6350 2850 6100 2850
Wire Wire Line
	6350 2950 6100 2950
Wire Wire Line
	6350 3050 6100 3050
Wire Wire Line
	6350 3150 6100 3150
Wire Wire Line
	6350 3250 6100 3250
Wire Wire Line
	6350 3350 6100 3350
Wire Wire Line
	6350 3450 6100 3450
Wire Wire Line
	6300 5500 6100 5500
Wire Wire Line
	6300 5600 6100 5600
Wire Wire Line
	6300 5700 6100 5700
Wire Wire Line
	6300 5800 6100 5800
Wire Wire Line
	6300 5900 6100 5900
Wire Wire Line
	6300 6000 6100 6000
Wire Wire Line
	6300 6100 6100 6100
Wire Wire Line
	6300 6200 6100 6200
Wire Wire Line
	7700 4400 7950 4400
Wire Wire Line
	7700 4500 7950 4500
Wire Wire Line
	7700 4600 7950 4600
Wire Wire Line
	7700 4700 7950 4700
Wire Wire Line
	7700 4800 7950 4800
Wire Wire Line
	7700 4900 7950 4900
Wire Wire Line
	7700 5000 7950 5000
Wire Wire Line
	7700 5100 7950 5100
Wire Wire Line
	7700 5200 7950 5200
Wire Wire Line
	7700 5300 7950 5300
Wire Wire Line
	7700 5400 7950 5400
Wire Wire Line
	7700 5500 7950 5500
Wire Wire Line
	7700 5600 7950 5600
Wire Wire Line
	7700 5700 7950 5700
Wire Wire Line
	7700 5800 7950 5800
Wire Wire Line
	7700 5900 7950 5900
Wire Wire Line
	7700 6000 7950 6000
Wire Wire Line
	7700 6100 7950 6100
Wire Wire Line
	7700 6200 7950 6200
Wire Wire Line
	7750 1650 8000 1650
Wire Wire Line
	7750 1750 8000 1750
Wire Wire Line
	7750 1850 8000 1850
Wire Wire Line
	7750 1950 8000 1950
Wire Wire Line
	7750 2050 8000 2050
Wire Wire Line
	7750 2150 8000 2150
Wire Wire Line
	7750 2250 8000 2250
Wire Wire Line
	7750 2350 8000 2350
Wire Wire Line
	7750 2450 8000 2450
Wire Wire Line
	7750 2550 8000 2550
Wire Wire Line
	7750 2650 8000 2650
Wire Wire Line
	7750 2750 8000 2750
Wire Wire Line
	7750 2850 8000 2850
Wire Wire Line
	7750 2950 8000 2950
Wire Wire Line
	7750 3050 8000 3050
Wire Wire Line
	7750 3150 8000 3150
Wire Wire Line
	7750 3250 8000 3250
Wire Wire Line
	7750 3350 8000 3350
Wire Wire Line
	7750 3450 8000 3450
Text Label 7800 3450 0    60   ~ 0
A1
Text Label 7800 3350 0    60   ~ 0
A2
Text Label 7800 3250 0    60   ~ 0
A3
Text Label 7800 3150 0    60   ~ 0
A4
Text Label 7800 3050 0    60   ~ 0
A5
Text Label 7800 2950 0    60   ~ 0
A6
Text Label 7800 2850 0    60   ~ 0
A7
Text Label 7800 2750 0    60   ~ 0
A8
Text Label 7800 2650 0    60   ~ 0
A9
Text Label 7800 2550 0    60   ~ 0
A10
Text Label 7800 2450 0    60   ~ 0
A11
Text Label 7800 2350 0    60   ~ 0
A12
Text Label 7800 2250 0    60   ~ 0
A13
Text Label 7800 2150 0    60   ~ 0
A14
Text Label 7800 2050 0    60   ~ 0
A15
Text Label 7800 1950 0    60   ~ 0
A16
Text Label 7800 1850 0    60   ~ 0
A17
Text Label 7800 1750 0    60   ~ 0
A18
Text Label 7800 1650 0    60   ~ 0
A19
Text Label 7800 6200 0    60   ~ 0
A1
Text Label 7800 6100 0    60   ~ 0
A2
Text Label 7800 6000 0    60   ~ 0
A3
Text Label 7800 5900 0    60   ~ 0
A4
Text Label 7800 5800 0    60   ~ 0
A5
Text Label 7800 5700 0    60   ~ 0
A6
Text Label 7800 5600 0    60   ~ 0
A7
Text Label 7800 5500 0    60   ~ 0
A8
Text Label 7800 5400 0    60   ~ 0
A9
Text Label 7800 5300 0    60   ~ 0
A10
Text Label 7800 5200 0    60   ~ 0
A11
Text Label 7800 5100 0    60   ~ 0
A12
Text Label 7800 5000 0    60   ~ 0
A13
Text Label 7800 4900 0    60   ~ 0
A14
Text Label 7800 4800 0    60   ~ 0
A15
Text Label 7800 4700 0    60   ~ 0
A16
Text Label 7800 4600 0    60   ~ 0
A17
Text Label 7800 4500 0    60   ~ 0
A18
Text Label 7800 4400 0    60   ~ 0
A19
Wire Wire Line
	4550 5550 4550 5300
Wire Wire Line
	4550 5300 4700 5300
Connection ~ 4550 5550
Wire Wire Line
	3900 5650 4450 5650
Wire Wire Line
	4450 5650 4450 3050
Wire Wire Line
	4450 3050 4700 3050
Wire Wire Line
	4450 3350 5900 3350
Wire Wire Line
	5900 3350 5900 2150
Wire Wire Line
	5900 2150 6400 2150
Wire Wire Line
	6400 2150 6400 1000
Wire Wire Line
	6400 1000 8050 1000
Wire Wire Line
	8050 1000 8050 1450
Wire Wire Line
	8050 1450 7750 1450
Connection ~ 4450 3350
Wire Wire Line
	3900 5550 5900 5550
Wire Wire Line
	5900 5550 5900 4400
Wire Wire Line
	5900 4400 6500 4400
Wire Wire Line
	6500 4400 6500 3750
Wire Wire Line
	6500 3750 8000 3750
Wire Wire Line
	8000 3750 8000 4200
Wire Wire Line
	8000 4200 7700 4200
Wire Wire Line
	7050 3650 8200 3650
Wire Wire Line
	8100 3650 8100 6500
Wire Wire Line
	8100 6500 600  6500
Wire Wire Line
	7000 6400 7000 6500
Connection ~ 7000 6500
Wire Wire Line
	750  2250 600  2250
Connection ~ 600  2250
Connection ~ 750  2250
Wire Wire Line
	600  2200 600  900 
Wire Wire Line
	600  2250 600  6500
Wire Wire Line
	7000 3800 8150 3800
Wire Wire Line
	8150 900  8150 6500
Connection ~ 1100 900 
Wire Wire Line
	7050 1050 7050 900 
Connection ~ 7050 900 
Wire Wire Line
	750  1900 750  2300
$Comp
L +5V #PWR01
U 1 1 5A54DAB7
P 700 1850
F 0 "#PWR01" H 700 1700 50  0001 C CNN
F 1 "+5V" H 700 1990 50  0000 C CNN
F 2 "" H 700 1850 50  0000 C CNN
F 3 "" H 700 1850 50  0000 C CNN
	1    700  1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  1900 700  1850
$Comp
L VCC #PWR02
U 1 1 5A54DBD2
P 850 1850
F 0 "#PWR02" H 850 1700 50  0001 C CNN
F 1 "VCC" H 850 2000 50  0000 C CNN
F 2 "" H 850 1850 50  0000 C CNN
F 3 "" H 850 1850 50  0000 C CNN
	1    850  1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1850 850  1900
Connection ~ 850  1900
$Comp
L GND #PWR03
U 1 1 5A54DCEF
P 850 2150
F 0 "#PWR03" H 850 1900 50  0001 C CNN
F 1 "GND" H 850 2000 50  0000 C CNN
F 2 "" H 850 2150 50  0000 C CNN
F 3 "" H 850 2150 50  0000 C CNN
	1    850  2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	850  2150 850  2200
Connection ~ 850  2200
Wire Wire Line
	9950 6400 9950 6500
Wire Wire Line
	9950 6500 8150 6500
Connection ~ 8150 3800
Wire Wire Line
	9850 6400 9850 6500
Connection ~ 9850 6500
Wire Wire Line
	9750 6400 9750 6500
Connection ~ 9750 6500
Wire Wire Line
	9650 6400 9650 6500
Connection ~ 9650 6500
Wire Wire Line
	9550 6400 9550 6500
Connection ~ 9550 6500
Wire Wire Line
	9450 6400 9450 6500
Connection ~ 9450 6500
Wire Wire Line
	9350 6400 9350 6500
Connection ~ 9350 6500
Wire Wire Line
	9250 6400 9250 6500
Connection ~ 9250 6500
Wire Wire Line
	8200 3650 8200 500 
Wire Wire Line
	8200 500  10050 500 
Wire Wire Line
	9450 500  9450 600 
Connection ~ 8100 3650
Wire Wire Line
	9350 600  9350 500 
Connection ~ 9350 500 
Wire Wire Line
	9250 600  9250 500 
Connection ~ 9250 500 
Wire Wire Line
	10050 500  10050 600 
Connection ~ 9450 500 
Wire Wire Line
	9950 600  9950 500 
Connection ~ 9950 500 
Wire Wire Line
	9850 600  9850 500 
Connection ~ 9850 500 
Wire Wire Line
	9750 600  9750 500 
Connection ~ 9750 500 
Text Notes 7050 6800 0    157  ~ 0
The Raven 68k
Text Notes 8150 7650 0    59   ~ 0
08.01.2018
Text Notes 10600 7650 0    59   ~ 0
0.1
$EndSCHEMATC
