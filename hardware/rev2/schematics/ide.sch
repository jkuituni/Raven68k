EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
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
L custom:IDE-44-PIN H1
U 1 1 622C5847
P 4700 2850
F 0 "H1" H 5150 3115 50  0000 C CNN
F 1 "IDE-44-PIN" H 5150 3024 50  0000 C CNN
F 2 "raven68k-rev1:SHDR40W66P254_2X20_5829X914X986P" H 5450 2950 50  0001 L CNN
F 3 "https://www.arrow.com/en/products/57102-g06-22lf/amphenol-fci" H 5450 2850 50  0001 L CNN
F 4 "Conn Unshrouded Header HDR 44 POS 2mm Solder ST Thru-Hole Bulk" H 5450 2750 50  0001 L CNN "Description"
F 5 "5.5" H 5450 2650 50  0001 L CNN "Height"
F 6 "Amphenol" H 5450 2350 50  0001 L CNN "Manufacturer_Name"
F 7 "57102-G06-22LF" H 5450 2250 50  0001 L CNN "Manufacturer_Part_Number"
	1    4700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2850 4500 2850
Text HLabel 4150 2850 0    50   Input ~ 0
~RESET
NoConn ~ 4700 4750
$Comp
L Device:R_Small R9
U 1 1 622D98C1
P 4500 4850
F 0 "R9" V 4304 4850 50  0000 C CNN
F 1 "10K" V 4395 4850 50  0000 C CNN
F 2 "" H 4500 4850 50  0001 C CNN
F 3 "~" H 4500 4850 50  0001 C CNN
	1    4500 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 4850 4600 4850
Wire Wire Line
	4250 4850 4400 4850
Wire Wire Line
	4700 4650 4650 4650
Wire Wire Line
	4650 4650 4650 4950
Wire Wire Line
	4700 4950 4650 4950
Connection ~ 4650 4950
Wire Wire Line
	4650 4950 4650 5100
Wire Wire Line
	5600 2850 5700 2850
Text HLabel 6200 2850 2    50   Input ~ 0
~WE
Text HLabel 6300 3050 2    50   Input ~ 0
~OE
Wire Wire Line
	5600 3050 5900 3050
Wire Wire Line
	5600 2950 5700 2950
Wire Wire Line
	5700 2950 5700 3150
Wire Wire Line
	5600 3150 5700 3150
Connection ~ 5700 3150
Wire Wire Line
	5700 3150 5700 3350
Wire Wire Line
	5600 3550 5700 3550
Connection ~ 5700 3550
Wire Wire Line
	5700 3550 5700 4550
Wire Wire Line
	5600 4550 5700 4550
Connection ~ 5700 4550
Wire Wire Line
	5700 4550 5700 4850
Wire Wire Line
	5600 4850 5700 4850
Connection ~ 5700 4850
Wire Wire Line
	5700 4850 5700 5100
NoConn ~ 5600 4950
NoConn ~ 5600 3250
NoConn ~ 5600 3750
NoConn ~ 5600 3950
Wire Wire Line
	5600 3350 5700 3350
Connection ~ 5700 3350
Wire Wire Line
	5700 3350 5700 3550
$Comp
L Device:R_Small R10
U 1 1 622E8E3E
P 5900 3450
F 0 "R10" V 5704 3450 50  0000 C CNN
F 1 "10K" V 5795 3450 50  0000 C CNN
F 2 "" H 5900 3450 50  0001 C CNN
F 3 "~" H 5900 3450 50  0001 C CNN
	1    5900 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 3450 6000 3450
Wire Wire Line
	5600 3450 5800 3450
Text HLabel 6450 3600 2    50   Output ~ 0
~IPL1
Wire Wire Line
	5850 3650 5600 3650
Text HLabel 7000 4150 2    50   Input ~ 0
A[1..23]
Text Label 6700 3850 0    50   ~ 0
A2
Text Label 6700 4050 0    50   ~ 0
A1
Text Label 6700 4150 0    50   ~ 0
A3
Wire Bus Line
	6900 4150 7000 4150
Entry Wire Line
	6800 4150 6900 4050
Entry Wire Line
	6800 4050 6900 3950
Entry Wire Line
	6800 3850 6900 3750
Wire Wire Line
	5600 4250 5800 4250
Wire Wire Line
	5600 4350 5800 4350
Text HLabel 5800 4250 2    50   Input ~ 0
~IDE_CS1
Text HLabel 5800 4350 2    50   Input ~ 0
~IDE_CS2
Text GLabel 5800 4450 2    50   Output ~ 0
~IDE_LED
$Comp
L power:+5V #PWR053
U 1 1 6256690E
P 6100 3450
F 0 "#PWR053" H 6100 3300 50  0001 C CNN
F 1 "+5V" H 6115 3623 50  0000 C CNN
F 2 "" H 6100 3450 50  0001 C CNN
F 3 "" H 6100 3450 50  0001 C CNN
	1    6100 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR052
U 1 1 62567E82
P 5950 4750
F 0 "#PWR052" H 5950 4600 50  0001 C CNN
F 1 "+5V" H 5965 4923 50  0000 C CNN
F 2 "" H 5950 4750 50  0001 C CNN
F 3 "" H 5950 4750 50  0001 C CNN
	1    5950 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4750 5850 4750
Wire Wire Line
	5850 4650 5850 4750
Wire Wire Line
	5600 4650 5850 4650
Connection ~ 5850 4750
Wire Wire Line
	5850 4750 5950 4750
$Comp
L power:+5V #PWR049
U 1 1 6256C5B8
P 4250 4850
F 0 "#PWR049" H 4250 4700 50  0001 C CNN
F 1 "+5V" H 4265 5023 50  0000 C CNN
F 2 "" H 4250 4850 50  0001 C CNN
F 3 "" H 4250 4850 50  0001 C CNN
	1    4250 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR048
U 1 1 6256EB41
P 3800 3000
F 0 "#PWR048" H 3800 2750 50  0001 C CNN
F 1 "GND" H 3805 2827 50  0000 C CNN
F 2 "" H 3800 3000 50  0001 C CNN
F 3 "" H 3800 3000 50  0001 C CNN
	1    3800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2950 3800 3000
Wire Wire Line
	3800 2950 4700 2950
$Comp
L power:GND #PWR050
U 1 1 6257141A
P 4650 5100
F 0 "#PWR050" H 4650 4850 50  0001 C CNN
F 1 "GND" H 4655 4927 50  0000 C CNN
F 2 "" H 4650 5100 50  0001 C CNN
F 3 "" H 4650 5100 50  0001 C CNN
	1    4650 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR051
U 1 1 62571974
P 5700 5100
F 0 "#PWR051" H 5700 4850 50  0001 C CNN
F 1 "GND" H 5705 4927 50  0000 C CNN
F 2 "" H 5700 5100 50  0001 C CNN
F 3 "" H 5700 5100 50  0001 C CNN
	1    5700 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack08_Split RN1
U 1 1 635B564C
P 4350 2850
F 0 "RN1" V 4143 2850 50  0000 C CNN
F 1 "22" V 4234 2850 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" V 4270 2850 50  0001 C CNN
F 3 "~" H 4350 2850 50  0001 C CNN
	1    4350 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 2850 4200 2850
$Comp
L Device:R_Pack08_Split RN1
U 2 1 6360F3EF
P 5850 2850
F 0 "RN1" V 5643 2850 50  0000 C CNN
F 1 "22" V 5734 2850 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" V 5770 2850 50  0001 C CNN
F 3 "~" H 5850 2850 50  0001 C CNN
	2    5850 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 2850 6000 2850
$Comp
L Device:R_Pack08_Split RN1
U 5 1 636291F0
P 6050 3050
F 0 "RN1" V 5843 3050 50  0000 C CNN
F 1 "22" V 5934 3050 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" V 5970 3050 50  0001 C CNN
F 3 "~" H 6050 3050 50  0001 C CNN
	5    6050 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 3050 6200 3050
$Comp
L Device:R_Pack08_Split RN1
U 3 1 63672FA4
P 6250 3850
F 0 "RN1" V 6043 3850 50  0000 C CNN
F 1 "22" V 6134 3850 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" V 6170 3850 50  0001 C CNN
F 3 "~" H 6250 3850 50  0001 C CNN
	3    6250 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN1
U 4 1 63674927
P 6000 4050
F 0 "RN1" V 5793 4050 50  0000 C CNN
F 1 "22" V 5884 4050 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" V 5920 4050 50  0001 C CNN
F 3 "~" H 6000 4050 50  0001 C CNN
	4    6000 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN1
U 6 1 636763BF
P 6400 4150
F 0 "RN1" V 6193 4150 50  0000 C CNN
F 1 "22" V 6284 4150 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" V 6320 4150 50  0001 C CNN
F 3 "~" H 6400 4150 50  0001 C CNN
	6    6400 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 4050 5850 4050
Wire Wire Line
	5600 4150 6250 4150
Wire Wire Line
	6400 3850 6800 3850
$Comp
L Device:R_Pack08_Split RN1
U 7 1 6375887D
P 6700 4900
F 0 "RN1" H 6788 4946 50  0000 L CNN
F 1 "22" H 6788 4855 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" V 6620 4900 50  0001 C CNN
F 3 "~" H 6700 4900 50  0001 C CNN
	7    6700 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack08_Split RN1
U 8 1 6375A173
P 7100 4900
F 0 "RN1" H 7188 4946 50  0000 L CNN
F 1 "22" H 7188 4855 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" V 7020 4900 50  0001 C CNN
F 3 "~" H 7100 4900 50  0001 C CNN
	8    7100 4900
	1    0    0    -1  
$EndComp
NoConn ~ 6700 4750
NoConn ~ 7100 4750
NoConn ~ 7100 5050
NoConn ~ 6700 5050
Wire Wire Line
	5850 3650 5850 3600
Wire Wire Line
	5850 3600 6450 3600
Wire Wire Line
	5600 3850 6100 3850
Wire Wire Line
	6800 4150 6550 4150
Wire Wire Line
	6800 4050 6150 4050
Wire Wire Line
	5600 4450 5800 4450
Text GLabel 8250 3650 0    50   Input ~ 0
~IDE_LED
$Comp
L Device:R_Small R21
U 1 1 63AC7071
P 8900 3650
F 0 "R21" V 8704 3650 50  0000 C CNN
F 1 "680K" V 8795 3650 50  0000 C CNN
F 2 "" H 8900 3650 50  0001 C CNN
F 3 "~" H 8900 3650 50  0001 C CNN
	1    8900 3650
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR056
U 1 1 63AC766F
P 9150 3650
F 0 "#PWR056" H 9150 3500 50  0001 C CNN
F 1 "+5V" H 9165 3823 50  0000 C CNN
F 2 "" H 9150 3650 50  0001 C CNN
F 3 "" H 9150 3650 50  0001 C CNN
	1    9150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 63ACA6F5
P 8500 3650
F 0 "D5" H 8493 3867 50  0000 C CNN
F 1 "LED" H 8493 3776 50  0000 C CNN
F 2 "" H 8500 3650 50  0001 C CNN
F 3 "~" H 8500 3650 50  0001 C CNN
	1    8500 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3650 8350 3650
Wire Wire Line
	8650 3650 8800 3650
Wire Wire Line
	9000 3650 9150 3650
Wire Wire Line
	4700 3050 4625 3050
Wire Wire Line
	4700 3150 4625 3150
Wire Wire Line
	4700 3250 4625 3250
Wire Wire Line
	4700 3350 4625 3350
Wire Wire Line
	4700 3450 4625 3450
Wire Wire Line
	4700 3550 4625 3550
Wire Wire Line
	4700 3650 4625 3650
Wire Wire Line
	4700 3750 4625 3750
Wire Wire Line
	4700 3850 4625 3850
Wire Wire Line
	4700 3950 4625 3950
Wire Wire Line
	4700 4050 4625 4050
Wire Wire Line
	4700 4150 4625 4150
Wire Wire Line
	4700 4250 4625 4250
Wire Wire Line
	4700 4350 4625 4350
Wire Wire Line
	4700 4450 4625 4450
Wire Wire Line
	4700 4550 4625 4550
Entry Wire Line
	4625 3050 4525 3150
Entry Wire Line
	4625 3150 4525 3250
Entry Wire Line
	4625 3250 4525 3350
Entry Wire Line
	4625 3350 4525 3450
Entry Wire Line
	4625 3450 4525 3550
Entry Wire Line
	4625 3550 4525 3650
Entry Wire Line
	4625 3650 4525 3750
Entry Wire Line
	4625 3750 4525 3850
Entry Wire Line
	4625 3850 4525 3950
Entry Wire Line
	4625 3950 4525 4050
Entry Wire Line
	4625 4050 4525 4150
Entry Wire Line
	4625 4150 4525 4250
Entry Wire Line
	4625 4250 4525 4350
Entry Wire Line
	4625 4350 4525 4450
Entry Wire Line
	4625 4450 4525 4550
Entry Wire Line
	4625 4550 4525 4650
Wire Bus Line
	4525 3050 4450 3050
Text HLabel 4450 3050 0    50   BiDi ~ 0
D[0..15]
Text Label 4650 3050 0    50   ~ 0
D7
Text Label 4650 3150 0    50   ~ 0
D8
Text Label 4650 3250 0    50   ~ 0
D6
Text Label 4650 3350 0    50   ~ 0
D9
Wire Bus Line
	6900 3750 6900 4150
Wire Bus Line
	4525 3050 4525 4650
Text Label 4650 3450 0    50   ~ 0
D5
Text Label 4650 3550 0    50   ~ 0
D10
Text Label 4650 3650 0    50   ~ 0
D4
Text Label 4650 3750 0    50   ~ 0
D11
Text Label 4650 3850 0    50   ~ 0
D3
Text Label 4650 3950 0    50   ~ 0
D12
Text Label 4650 4050 0    50   ~ 0
D2
Text Label 4650 4150 0    50   ~ 0
D13
Text Label 4650 4350 0    50   ~ 0
D14
Text Label 4650 4550 0    50   ~ 0
D15
Text Label 4650 4450 0    50   ~ 0
D0
Text Label 4650 4250 0    50   ~ 0
D1
$EndSCHEMATC
