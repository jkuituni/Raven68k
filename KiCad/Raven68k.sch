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
LIBS:Raven68k-cache
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
P 2900 3300
F 0 "U1" H 2900 3400 50  0000 C CNN
F 1 "68000D" H 2900 3150 50  0000 C CNN
F 2 "Housings_DIP:DIP-64_W22.86mm" H 2900 3300 60  0001 C CNN
F 3 "" H 2900 3300 60  0001 C CNN
	1    2900 3300
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
Text Label 4000 1100 0    60   ~ 0
A1
Text Label 4000 1200 0    60   ~ 0
A2
Text Label 4000 1300 0    60   ~ 0
A3
Text Label 4000 1400 0    60   ~ 0
A4
Text Label 4000 1500 0    60   ~ 0
A5
Text Label 4000 1600 0    60   ~ 0
A6
Text Label 4000 1700 0    60   ~ 0
A7
Text Label 4000 1800 0    60   ~ 0
A8
Text Label 4000 1900 0    60   ~ 0
A9
Text Label 4000 2000 0    60   ~ 0
A10
Text Label 4000 2100 0    60   ~ 0
A11
Text Label 4000 2200 0    60   ~ 0
A12
Text Label 4000 2300 0    60   ~ 0
A13
Text Label 4000 2400 0    60   ~ 0
A14
Text Label 4000 2500 0    60   ~ 0
A15
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
$Comp
L Crystal_GND24 Y1
U 1 1 5A53B5EA
P 1100 1050
F 0 "Y1" H 1225 1250 50  0000 L CNN
F 1 "Crystal_GND24" H 1225 1175 50  0000 L CNN
F 2 "Crystals:Crystal_SMD_2520_4Pads" H 1100 1050 50  0001 C CNN
F 3 "" H 1100 1050 50  0000 C CNN
	1    1100 1050
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5A53DA79
P 1600 1900
F 0 "R2" V 1680 1900 50  0000 C CNN
F 1 "R470" V 1600 1900 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 1530 1900 50  0001 C CNN
F 3 "" H 1600 1900 50  0000 C CNN
	1    1600 1900
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 5A53DCFC
P 1600 1750
F 0 "R1" V 1680 1750 50  0000 C CNN
F 1 "R470" V 1600 1750 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 1530 1750 50  0001 C CNN
F 3 "" H 1600 1750 50  0000 C CNN
	1    1600 1750
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
P 850 2350
F 0 "CON1" H 850 2600 50  0000 C CNN
F 1 "BARREL_JACK" H 850 2150 50  0000 C CNN
F 2 "" H 850 2350 50  0000 C CNN
F 3 "" H 850 2350 50  0000 C CNN
	1    850  2350
	0    -1   -1   0   
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
Text Label 3950 3500 0    60   ~ 0
D0
Text Label 3950 3600 0    60   ~ 0
D1
Text Label 3950 3700 0    60   ~ 0
D2
Text Label 3950 3800 0    60   ~ 0
D3
Text Label 3950 3900 0    60   ~ 0
D4
Text Label 3950 4000 0    60   ~ 0
D5
Text Label 3950 4100 0    60   ~ 0
D6
Text Label 3950 4200 0    60   ~ 0
D7
Text Label 3950 4300 0    60   ~ 0
D8
Text Label 3950 4400 0    60   ~ 0
D9
Text Label 3950 4500 0    60   ~ 0
D10
Text Label 3950 4600 0    60   ~ 0
D11
Text Label 3950 4700 0    60   ~ 0
D12
Text Label 3950 4800 0    60   ~ 0
D13
Text Label 3950 4900 0    60   ~ 0
D14
Text Label 3950 5000 0    60   ~ 0
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
Text Label 7800 4600 0    60   ~ 0
A17
Text Label 7800 4500 0    60   ~ 0
A18
Text Label 7800 4400 0    60   ~ 0
A19
$Comp
L +5V #PWR01
U 1 1 5A54DAB7
P 700 1600
F 0 "#PWR01" H 700 1450 50  0001 C CNN
F 1 "+5V" H 700 1740 50  0000 C CNN
F 2 "" H 700 1600 50  0000 C CNN
F 3 "" H 700 1600 50  0000 C CNN
	1    700  1600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 5A54DBD2
P 850 1600
F 0 "#PWR02" H 850 1450 50  0001 C CNN
F 1 "VCC" H 850 1750 50  0000 C CNN
F 2 "" H 850 1600 50  0000 C CNN
F 3 "" H 850 1600 50  0000 C CNN
	1    850  1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5A54DCEF
P 850 1900
F 0 "#PWR03" H 850 1650 50  0001 C CNN
F 1 "GND" H 850 1750 50  0000 C CNN
F 2 "" H 850 1900 50  0000 C CNN
F 3 "" H 850 1900 50  0000 C CNN
	1    850  1900
	-1   0    0    1   
$EndComp
Text Notes 7050 6800 0    157  ~ 0
The Raven 68k
Text Notes 8150 7650 0    59   ~ 0
08.01.2018
Text Notes 10600 7650 0    59   ~ 0
0.1
$Comp
L XC9572XL-TQ100 U6
U 1 1 5A553F7A
P 9700 3500
F 0 "U6" H 8850 6150 50  0000 C CNN
F 1 "XC9572XL-TQ100" H 10400 850 50  0000 C CNN
F 2 "Housings_QFP:TQFP-100_14x14mm_Pitch0.5mm" H 9700 3600 50  0001 C CNN
F 3 "" H 9650 3550 50  0000 C CNN
	1    9700 3500
	1    0    0    -1  
$EndComp
NoConn ~ 1900 1600
NoConn ~ 1900 2500
NoConn ~ 1900 2800
NoConn ~ 1900 2900
NoConn ~ 1900 3000
NoConn ~ 8500 2300
NoConn ~ 8500 2400
NoConn ~ 8500 2500
NoConn ~ 8500 2600
NoConn ~ 8500 2700
NoConn ~ 8500 2800
NoConn ~ 8500 2900
NoConn ~ 8500 3000
NoConn ~ 8500 3100
NoConn ~ 8500 3200
NoConn ~ 8500 3300
NoConn ~ 8500 3400
NoConn ~ 8500 3600
NoConn ~ 8500 3700
NoConn ~ 8500 3800
NoConn ~ 8500 5300
NoConn ~ 10900 5300
NoConn ~ 10900 5200
NoConn ~ 10900 5100
NoConn ~ 10900 5000
NoConn ~ 10900 4900
NoConn ~ 10900 4800
NoConn ~ 10900 4700
NoConn ~ 10900 4600
NoConn ~ 10900 4500
NoConn ~ 10900 4400
NoConn ~ 10900 4300
NoConn ~ 10900 4200
NoConn ~ 10900 4100
NoConn ~ 10900 4000
NoConn ~ 10900 3900
NoConn ~ 10900 3800
NoConn ~ 10900 3700
NoConn ~ 10900 3600
NoConn ~ 10900 3400
NoConn ~ 10900 3300
NoConn ~ 10900 3200
NoConn ~ 10900 3100
NoConn ~ 10900 3000
NoConn ~ 10900 2900
NoConn ~ 10900 2800
NoConn ~ 10900 2700
NoConn ~ 10900 2600
NoConn ~ 10900 2500
NoConn ~ 10900 2400
NoConn ~ 10900 2300
NoConn ~ 10900 2200
NoConn ~ 10900 2100
NoConn ~ 10900 2000
NoConn ~ 10900 1900
NoConn ~ 10900 1800
NoConn ~ 10900 1700
$Comp
L CONN_01X06 P1
U 1 1 5A55DD2E
P 11050 6250
F 0 "P1" H 11050 6600 50  0000 C CNN
F 1 "CONN_01X06" V 11150 6250 50  0000 C CNN
F 2 "" H 11050 6250 50  0000 C CNN
F 3 "" H 11050 6250 50  0000 C CNN
	1    11050 6250
	1    0    0    -1  
$EndComp
Text Label 1750 4500 0    60   ~ 0
HALT
Text Label 1750 4600 0    60   ~ 0
RESET
Text Label 8400 3900 0    60   ~ 0
HALT
Text Label 8400 4000 0    60   ~ 0
RESET
Text Label 1750 4050 0    60   ~ 0
DTACK
Text Label 8400 4100 0    60   ~ 0
DTACK
Text Label 1750 1400 0    60   ~ 0
IPL0
Text Label 1750 1500 0    60   ~ 0
IPL1
Text Label 1750 2300 0    60   ~ 0
FC0
Text Label 1750 2400 0    60   ~ 0
FC1
Text Label 8400 4200 0    60   ~ 0
IPL0
Text Label 8400 4300 0    60   ~ 0
IPL1
Text Label 8400 4400 0    60   ~ 0
FC0
Text Label 8400 4500 0    60   ~ 0
FC1
$Comp
L R R3
U 1 1 5A56B70B
P 4150 2600
F 0 "R3" V 4230 2600 50  0000 C CNN
F 1 "R470" V 4150 2600 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 4080 2600 50  0001 C CNN
F 3 "" H 4150 2600 50  0000 C CNN
	1    4150 2600
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 5A56B7AF
P 4150 2700
F 0 "R4" V 4230 2700 50  0000 C CNN
F 1 "R470" V 4150 2700 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 4080 2700 50  0001 C CNN
F 3 "" H 4150 2700 50  0000 C CNN
	1    4150 2700
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 5A56B7E6
P 4150 2800
F 0 "R5" V 4230 2800 50  0000 C CNN
F 1 "R470" V 4150 2800 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 4080 2800 50  0001 C CNN
F 3 "" H 4150 2800 50  0000 C CNN
	1    4150 2800
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 5A56B820
P 4150 2900
F 0 "R6" V 4230 2900 50  0000 C CNN
F 1 "R470" V 4150 2900 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 4080 2900 50  0001 C CNN
F 3 "" H 4150 2900 50  0000 C CNN
	1    4150 2900
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 5A56B85D
P 4150 3000
F 0 "R7" V 4230 3000 50  0000 C CNN
F 1 "R470" V 4150 3000 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 4080 3000 50  0001 C CNN
F 3 "" H 4150 3000 50  0000 C CNN
	1    4150 3000
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 5A56B8A9
P 4150 3100
F 0 "R8" V 4230 3100 50  0000 C CNN
F 1 "R470" V 4150 3100 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 4080 3100 50  0001 C CNN
F 3 "" H 4150 3100 50  0000 C CNN
	1    4150 3100
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 5A56B8EC
P 4150 3200
F 0 "R9" V 4230 3200 50  0000 C CNN
F 1 "R470" V 4150 3200 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 4080 3200 50  0001 C CNN
F 3 "" H 4150 3200 50  0000 C CNN
	1    4150 3200
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 5A56B932
P 4150 3300
F 0 "R10" V 4230 3300 50  0000 C CNN
F 1 "R470" V 4150 3300 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_1206_RM10_HandSoldering" V 4080 3300 50  0001 C CNN
F 3 "" H 4150 3300 50  0000 C CNN
	1    4150 3300
	0    1    1    0   
$EndComp
Text Label 7800 4700 0    60   ~ 0
A16
Text Label 3950 5200 0    60   ~ 0
AS
Text Label 3900 5300 0    60   ~ 0
UDS
Text Label 3900 5400 0    60   ~ 0
LDS
Text Label 3900 5500 0    60   ~ 0
RW
Text Label 8400 4600 0    60   ~ 0
AS
Text Label 8400 4700 0    60   ~ 0
UDS
Text Label 8400 4800 0    60   ~ 0
LDS
Text Label 8400 4900 0    60   ~ 0
RW
$Comp
L 68681 U7
U 1 1 5A57F567
P 2550 7050
F 0 "U7" H 2550 7200 50  0000 C CNN
F 1 "68681" H 2550 6950 50  0000 C CNN
F 2 "" H 2550 7050 60  0001 C CNN
F 3 "" H 2550 7050 60  0001 C CNN
	1    2550 7050
	0    1    1    0   
$EndComp
NoConn ~ 3750 8050
NoConn ~ 3650 8050
NoConn ~ 3450 8050
NoConn ~ 3350 8050
NoConn ~ 3150 8050
NoConn ~ 3050 8050
NoConn ~ 2950 8050
NoConn ~ 2850 8050
NoConn ~ 2750 8050
NoConn ~ 2650 8050
NoConn ~ 2550 8050
NoConn ~ 2450 8050
NoConn ~ 2250 8050
NoConn ~ 2150 8050
NoConn ~ 2050 8050
NoConn ~ 1950 8050
NoConn ~ 1850 8050
NoConn ~ 1750 8050
Text Label 1550 6050 1    60   ~ 0
DTACK
Text Label 1750 6050 1    60   ~ 0
RESET
Text Label 1950 6000 1    60   ~ 0
RW
Text Label 2750 6050 1    60   ~ 0
D7
Text Label 2850 6050 1    60   ~ 0
D6
Text Label 2950 6050 1    60   ~ 0
D5
Text Label 3050 6050 1    60   ~ 0
D4
Text Label 3150 6050 1    60   ~ 0
D3
Text Label 3250 6050 1    60   ~ 0
D2
Text Label 3350 6050 1    60   ~ 0
D1
Text Label 3450 6050 1    60   ~ 0
D0
Text Label 2050 6050 1    60   ~ 0
RSSEL
Text Label 8400 5000 0    60   ~ 0
RSSEL
Text Label 1450 6050 1    60   ~ 0
RSIRQ
Text Label 8400 5100 0    60   ~ 0
RSIRQ
Text Label 1850 6050 1    60   ~ 0
IACK
Wire Wire Line
	3900 1100 4200 1100
Wire Wire Line
	3900 1200 4200 1200
Wire Wire Line
	3900 1300 4200 1300
Wire Wire Line
	3900 1400 4200 1400
Wire Wire Line
	3900 1500 4200 1500
Wire Wire Line
	3900 1600 4200 1600
Wire Wire Line
	3900 1700 4200 1700
Wire Wire Line
	3900 1800 4200 1800
Wire Wire Line
	3900 1900 4200 1900
Wire Wire Line
	3900 2000 4200 2000
Wire Wire Line
	3900 2100 4200 2100
Wire Wire Line
	3900 2200 4200 2200
Wire Wire Line
	3900 2300 4200 2300
Wire Wire Line
	3900 2400 4200 2400
Wire Wire Line
	3900 2500 4200 2500
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
	1900 1150 1400 1150
Wire Wire Line
	1400 1150 1400 1050
Wire Wire Line
	1400 1050 1250 1050
Wire Wire Line
	1900 1150 1900 1100
Wire Wire Line
	1300 1600 1300 1400
Wire Wire Line
	1300 1400 800  1400
Wire Wire Line
	800  1050 950  1050
Wire Wire Line
	1200 1700 1350 1700
Wire Wire Line
	1350 1300 1100 1300
Wire Wire Line
	1100 1300 1100 1250
Connection ~ 1350 1700
Wire Wire Line
	1350 1950 600  1950
Wire Wire Line
	1900 1800 1900 1750
Wire Wire Line
	1900 1750 1750 1750
Wire Wire Line
	1900 1900 1750 1900
Wire Wire Line
	950  1750 1450 1750
Connection ~ 1350 1750
Wire Wire Line
	1200 1900 1450 1900
Connection ~ 1350 1900
Wire Wire Line
	1900 4050 1750 4050
Connection ~ 1200 1950
Wire Wire Line
	1200 1800 1350 1800
Connection ~ 1350 1800
Connection ~ 1350 1950
Connection ~ 800  1050
Wire Wire Line
	1100 650  1100 850 
Wire Wire Line
	600  650  8150 650 
Connection ~ 1100 750 
Wire Wire Line
	1200 1700 1200 1800
Connection ~ 1200 1750
Wire Wire Line
	1300 1600 1150 1600
Wire Wire Line
	1150 1600 1150 1650
Wire Wire Line
	1150 1650 700  1650
Wire Wire Line
	800  1400 800  550 
Wire Wire Line
	950  2050 850  2050
Wire Wire Line
	950  1750 950  2050
Connection ~ 950  1950
Connection ~ 750  1650
Wire Wire Line
	1350 1700 1350 1300
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
	3900 3500 4050 3500
Wire Wire Line
	3900 3600 4050 3600
Wire Wire Line
	3900 3700 4050 3700
Wire Wire Line
	3900 3800 4050 3800
Wire Wire Line
	3900 3900 4050 3900
Wire Wire Line
	3900 4000 4050 4000
Wire Wire Line
	3900 4100 4050 4100
Wire Wire Line
	3900 4200 4050 4200
Wire Wire Line
	3900 4300 4050 4300
Wire Wire Line
	3900 4400 4050 4400
Wire Wire Line
	3900 4500 4050 4500
Wire Wire Line
	3900 4600 4050 4600
Wire Wire Line
	3900 4700 4050 4700
Wire Wire Line
	3900 4800 4050 4800
Wire Wire Line
	3900 4900 4050 4900
Wire Wire Line
	3900 5000 4050 5000
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
Wire Wire Line
	7750 1450 8400 1450
Wire Wire Line
	750  2000 600  2000
Connection ~ 600  2000
Connection ~ 750  2000
Wire Wire Line
	600  1950 600  650 
Wire Wire Line
	7000 3800 8150 3800
Connection ~ 1100 650 
Wire Wire Line
	750  1650 750  2050
Wire Wire Line
	700  1650 700  1600
Connection ~ 850  1950
Connection ~ 8150 3800
Wire Wire Line
	8150 650  8150 6500
Wire Wire Line
	7000 3800 7000 3600
Wire Wire Line
	7000 3600 6450 3600
Wire Wire Line
	6450 3500 6450 5350
Wire Wire Line
	6450 3500 5850 3500
Wire Wire Line
	5850 3500 5850 3300
Wire Wire Line
	5850 3300 4300 3300
Wire Wire Line
	6450 5350 5950 5350
Wire Wire Line
	5950 5350 5950 5650
Wire Wire Line
	5950 5650 5400 5650
Connection ~ 6450 3600
Wire Wire Line
	6500 3550 6500 3750
Wire Wire Line
	6500 3550 6000 3550
Wire Wire Line
	6000 3450 5400 3450
Wire Wire Line
	6350 2200 6350 1200
Wire Wire Line
	6350 1200 5400 1200
Connection ~ 6000 3450
Connection ~ 5400 1200
Wire Wire Line
	2850 1050 2850 850 
Wire Wire Line
	1750 850  5400 850 
Wire Wire Line
	2950 5750 2950 5550
Connection ~ 2950 5750
Wire Wire Line
	5400 850  5400 1250
Connection ~ 600  6200
Wire Wire Line
	600  2000 600  6450
Wire Wire Line
	7000 6400 7000 6450
Connection ~ 7000 6450
Wire Wire Line
	9900 6400 9900 6500
Connection ~ 9900 6500
Wire Wire Line
	9800 6400 9800 6500
Connection ~ 9800 6500
Wire Wire Line
	9700 6400 9700 6500
Connection ~ 9700 6500
Wire Wire Line
	9500 6400 9500 6500
Connection ~ 9500 6500
Wire Wire Line
	9400 6400 9400 6500
Connection ~ 9400 6500
Wire Wire Line
	9500 600  9500 550 
Wire Wire Line
	5400 550  11150 550 
Wire Wire Line
	5400 550  5400 1150
Connection ~ 5400 1150
Wire Wire Line
	9400 600  9400 550 
Connection ~ 9400 550 
Wire Wire Line
	9300 600  9300 550 
Connection ~ 9300 550 
Wire Wire Line
	10100 550  10100 600 
Connection ~ 9500 550 
Wire Wire Line
	10000 600  10000 550 
Connection ~ 10000 550 
Wire Wire Line
	9900 600  9900 550 
Connection ~ 9900 550 
Wire Wire Line
	7750 1250 8500 1250
Wire Wire Line
	8500 1250 8500 1700
Wire Wire Line
	7750 1350 8450 1350
Wire Wire Line
	8450 1350 8450 1800
Wire Wire Line
	8450 1800 8500 1800
Connection ~ 8200 1250
Connection ~ 8250 1350
Wire Wire Line
	9800 600  9800 550 
Connection ~ 9800 550 
Wire Wire Line
	10900 5600 10650 5600
Wire Wire Line
	10650 5600 10650 6400
Wire Wire Line
	10650 6400 10850 6400
Wire Wire Line
	10900 5700 10700 5700
Wire Wire Line
	10700 5700 10700 6300
Wire Wire Line
	10700 6300 10850 6300
Wire Wire Line
	10900 5800 10750 5800
Wire Wire Line
	10750 5800 10750 6200
Wire Wire Line
	10750 6200 10850 6200
Wire Wire Line
	10900 5900 10800 5900
Wire Wire Line
	10800 5900 10800 6100
Wire Wire Line
	10800 6100 10850 6100
Wire Wire Line
	10850 6000 10850 5550
Wire Wire Line
	10850 5550 11150 5550
Wire Wire Line
	11150 5550 11150 550 
Connection ~ 10100 550 
Wire Wire Line
	1900 4500 1700 4500
Wire Wire Line
	1900 4600 1700 4600
Wire Wire Line
	8500 3900 8400 3900
Wire Wire Line
	8500 4000 8400 4000
Wire Wire Line
	1100 5750 5400 5750
Wire Wire Line
	8500 4100 8400 4100
Connection ~ 5400 5650
Wire Wire Line
	1750 850  1750 550 
Wire Wire Line
	1750 550  800  550 
Connection ~ 2850 850 
Wire Wire Line
	2950 1050 2950 850 
Connection ~ 2950 850 
Wire Wire Line
	1900 2000 1600 2000
Wire Wire Line
	1600 2000 1600 3850
Wire Wire Line
	1600 3850 1900 3850
Wire Wire Line
	1600 2950 600  2950
Connection ~ 600  2950
Connection ~ 1600 2950
Wire Wire Line
	1900 1400 1700 1400
Wire Wire Line
	1900 1500 1700 1500
Wire Wire Line
	1900 2300 1700 2300
Wire Wire Line
	1900 2400 1700 2400
Wire Wire Line
	8500 4200 8400 4200
Wire Wire Line
	8500 4300 8400 4300
Wire Wire Line
	8500 4400 8400 4400
Wire Wire Line
	8500 4500 8400 4500
Wire Wire Line
	3900 2600 4000 2600
Wire Wire Line
	3900 2700 4000 2700
Wire Wire Line
	3900 2800 4000 2800
Wire Wire Line
	3900 2900 4000 2900
Wire Wire Line
	3900 3000 4000 3000
Wire Wire Line
	3900 3100 4000 3100
Wire Wire Line
	3900 3200 4000 3200
Wire Wire Line
	3900 3300 4000 3300
Wire Wire Line
	4300 2600 4350 2600
Wire Wire Line
	4350 3200 4300 3200
Wire Wire Line
	4350 3100 4300 3100
Wire Wire Line
	4350 3000 4300 3000
Wire Wire Line
	4350 2900 4300 2900
Wire Wire Line
	4350 2800 4300 2800
Wire Wire Line
	4300 2700 4350 2700
Wire Wire Line
	7700 4700 7950 4700
Wire Wire Line
	4350 2600 4350 3300
Connection ~ 4350 2700
Connection ~ 4350 2800
Connection ~ 4350 2900
Connection ~ 4350 3000
Connection ~ 4350 3100
Connection ~ 4350 3300
Connection ~ 4350 3200
Connection ~ 8150 6500
Wire Wire Line
	7000 6450 600  6450
Wire Wire Line
	5400 5500 5400 6500
Connection ~ 7050 650 
Connection ~ 5400 850 
Wire Wire Line
	6000 3550 6000 2200
Wire Wire Line
	6000 2200 6350 2200
Wire Wire Line
	8200 1250 8200 4000
Wire Wire Line
	8200 4000 7700 4000
Wire Wire Line
	8250 1350 8250 4100
Wire Wire Line
	8250 4100 7700 4100
Wire Wire Line
	7700 4250 8100 4250
Wire Wire Line
	8100 4250 8100 1450
Wire Wire Line
	8500 1900 8400 1900
Wire Wire Line
	8400 1900 8400 1450
Connection ~ 8100 1450
Wire Wire Line
	7700 4250 7700 4200
Wire Wire Line
	4700 5200 4400 5200
Wire Wire Line
	4400 2950 4400 5900
Wire Wire Line
	4400 2950 4700 2950
Wire Wire Line
	4700 5300 4450 5300
Wire Wire Line
	4450 3050 4450 5850
Wire Wire Line
	4450 3050 4700 3050
Wire Wire Line
	4700 5400 4500 5400
Wire Wire Line
	4500 3150 4500 5800
Wire Wire Line
	4500 3150 4700 3150
Wire Wire Line
	8500 2000 8300 2000
Wire Wire Line
	8300 2000 8300 4150
Wire Wire Line
	8300 4150 8200 4150
Wire Wire Line
	8200 4150 8200 6300
Wire Wire Line
	8200 6300 5200 6300
Wire Wire Line
	5200 6300 5200 5800
Wire Wire Line
	5200 5800 4500 5800
Connection ~ 4500 5400
Wire Wire Line
	8500 2100 8350 2100
Wire Wire Line
	8350 2100 8350 4200
Wire Wire Line
	8350 4200 8250 4200
Wire Wire Line
	8250 4200 8250 6350
Wire Wire Line
	8250 6350 5150 6350
Wire Wire Line
	5150 6350 5150 5850
Wire Wire Line
	5150 5850 4450 5850
Connection ~ 4450 5300
Wire Wire Line
	8500 2200 8400 2200
Wire Wire Line
	8400 2200 8400 4250
Wire Wire Line
	8400 4250 8300 4250
Wire Wire Line
	8300 4250 8300 6400
Wire Wire Line
	8300 6400 5100 6400
Wire Wire Line
	5100 6400 5100 5900
Wire Wire Line
	5100 5900 4400 5900
Connection ~ 4400 5200
Wire Wire Line
	3900 5200 4100 5200
Wire Wire Line
	3900 5300 4100 5300
Wire Wire Line
	3900 5400 4100 5400
Wire Wire Line
	3900 5500 4100 5500
Wire Wire Line
	8500 4600 8400 4600
Wire Wire Line
	8500 4700 8400 4700
Wire Wire Line
	8500 4800 8400 4800
Wire Wire Line
	8500 4900 8400 4900
Wire Wire Line
	850  1900 850  1950
Wire Wire Line
	7050 1050 7050 650 
Wire Wire Line
	2850 5550 2850 5750
Connection ~ 2850 5750
Wire Wire Line
	5400 3250 5400 3300
Connection ~ 5400 3300
Wire Wire Line
	5400 3450 5400 3500
Wire Wire Line
	9300 6400 9300 6500
Connection ~ 9300 6500
Wire Wire Line
	9600 6400 9600 6500
Connection ~ 9600 6500
Wire Wire Line
	10000 6400 10000 6500
Connection ~ 10000 6500
Wire Wire Line
	6500 3750 7050 3750
Wire Wire Line
	7050 3750 7050 3650
Wire Wire Line
	850  1600 850  1650
Connection ~ 850  1650
Wire Wire Line
	3850 7050 4050 7050
Wire Wire Line
	4050 7050 4050 6450
Connection ~ 4050 6450
Wire Wire Line
	1100 7050 1250 7050
Wire Wire Line
	1100 2950 1100 7050
Wire Wire Line
	1550 6050 1550 5850
Wire Wire Line
	1750 6050 1750 5850
Wire Wire Line
	1950 6050 1950 5850
Wire Wire Line
	2750 6050 2750 5850
Wire Wire Line
	2850 6050 2850 5850
Wire Wire Line
	2950 6050 2950 5850
Wire Wire Line
	3050 6050 3050 5850
Wire Wire Line
	3150 6050 3150 5850
Wire Wire Line
	3250 6050 3250 5850
Wire Wire Line
	3350 6050 3350 5850
Wire Wire Line
	3450 6050 3450 5850
Wire Wire Line
	2050 6050 2050 5850
Wire Wire Line
	8500 5000 8400 5000
Wire Wire Line
	1450 6050 1450 5850
Wire Wire Line
	1850 6050 1850 5850
Wire Wire Line
	8500 5100 8400 5100
Wire Wire Line
	8500 5200 8400 5200
Text Label 8400 5200 0    60   ~ 0
IACK
Wire Wire Line
	2550 6050 2550 5850
Wire Wire Line
	2450 6050 2450 5850
Wire Wire Line
	2350 6050 2350 5850
Wire Wire Line
	2250 6050 2250 5850
Text Label 2550 6000 1    60   ~ 0
A0
Text Label 2450 6000 1    60   ~ 0
A1
Text Label 2350 6000 1    60   ~ 0
A2
Text Label 2250 6000 1    60   ~ 0
A3
Connection ~ 5400 6500
Connection ~ 5400 5750
Connection ~ 1100 2950
Connection ~ 1100 5750
Wire Wire Line
	5400 6500 10850 6500
$EndSCHEMATC
