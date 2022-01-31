EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
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
L custom:IDE-44-PIN H?
U 1 1 622C5847
P 2050 2250
F 0 "H?" H 2500 2515 50  0000 C CNN
F 1 "IDE-44-PIN" H 2500 2424 50  0000 C CNN
F 2 "HDRV44W80P200_2X22_4400X400X550P" H 2800 2350 50  0001 L CNN
F 3 "https://www.arrow.com/en/products/57102-g06-22lf/amphenol-fci" H 2800 2250 50  0001 L CNN
F 4 "Conn Unshrouded Header HDR 44 POS 2mm Solder ST Thru-Hole Bulk" H 2800 2150 50  0001 L CNN "Description"
F 5 "5.5" H 2800 2050 50  0001 L CNN "Height"
F 6 "Amphenol" H 2800 1750 50  0001 L CNN "Manufacturer_Name"
F 7 "57102-G06-22LF" H 2800 1650 50  0001 L CNN "Manufacturer_Part_Number"
	1    2050 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 622C7DA9
P 1750 2250
F 0 "R?" V 1554 2250 50  0000 C CNN
F 1 "22" V 1645 2250 50  0000 C CNN
F 2 "" H 1750 2250 50  0001 C CNN
F 3 "~" H 1750 2250 50  0001 C CNN
	1    1750 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 2250 1850 2250
Text HLabel 1500 2250 0    50   Input ~ 0
~RESET
Wire Wire Line
	1500 2250 1650 2250
NoConn ~ 2050 4150
Text GLabel 1850 2350 0    50   Input ~ 0
GND
Wire Wire Line
	1850 2350 2050 2350
Wire Wire Line
	2050 2450 1850 2450
Wire Wire Line
	2050 2550 1850 2550
Wire Wire Line
	2050 2650 1850 2650
Wire Wire Line
	2050 2750 1850 2750
Wire Wire Line
	2050 2850 1850 2850
Wire Wire Line
	2050 2950 1850 2950
Wire Wire Line
	2050 3050 1850 3050
Wire Wire Line
	2050 3150 1850 3150
Wire Wire Line
	2050 3250 1850 3250
Wire Wire Line
	2050 3350 1850 3350
Wire Wire Line
	2050 3450 1850 3450
Wire Wire Line
	2050 3550 1850 3550
Wire Wire Line
	2050 3650 1850 3650
Wire Wire Line
	2050 3750 1850 3750
Wire Wire Line
	2050 3850 1850 3850
Wire Wire Line
	2050 3950 1850 3950
Entry Wire Line
	1850 2450 1750 2550
Entry Wire Line
	1850 2550 1750 2650
Entry Wire Line
	1850 2650 1750 2750
Entry Wire Line
	1850 2750 1750 2850
Entry Wire Line
	1850 2850 1750 2950
Entry Wire Line
	1850 2950 1750 3050
Entry Wire Line
	1850 3050 1750 3150
Entry Wire Line
	1850 3150 1750 3250
Entry Wire Line
	1850 3250 1750 3350
Entry Wire Line
	1850 3350 1750 3450
Entry Wire Line
	1850 3450 1750 3550
Entry Wire Line
	1850 3550 1750 3650
Entry Wire Line
	1850 3650 1750 3750
Entry Wire Line
	1850 3750 1750 3850
Entry Wire Line
	1850 3850 1750 3950
Entry Wire Line
	1850 3950 1750 4050
Wire Bus Line
	1750 2500 1700 2500
Text HLabel 1700 2500 0    50   BiDi ~ 0
D[0..15]
Text Label 1900 2450 0    50   ~ 0
D7
Text Label 1900 2550 0    50   ~ 0
D8
Text Label 1900 3850 0    50   ~ 0
D0
Text Label 1900 3650 0    50   ~ 0
D1
Text Label 1900 3450 0    50   ~ 0
D2
Text Label 1900 3250 0    50   ~ 0
D3
Text Label 1900 3050 0    50   ~ 0
D4
Text Label 1900 2850 0    50   ~ 0
D5
Text Label 1900 2650 0    50   ~ 0
D6
Text Label 1900 2750 0    50   ~ 0
D9
Text Label 1900 2950 0    50   ~ 0
D10
Text Label 1900 3150 0    50   ~ 0
D11
Text Label 1900 3350 0    50   ~ 0
D12
Text Label 1900 3550 0    50   ~ 0
D13
Text Label 1900 3750 0    50   ~ 0
D14
Text Label 1900 3950 0    50   ~ 0
D15
Text GLabel 1900 4500 0    50   Input ~ 0
GND
$Comp
L Device:R_Small R?
U 1 1 622D98C1
P 1850 4250
F 0 "R?" V 1654 4250 50  0000 C CNN
F 1 "10K" V 1745 4250 50  0000 C CNN
F 2 "" H 1850 4250 50  0001 C CNN
F 3 "~" H 1850 4250 50  0001 C CNN
	1    1850 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 4250 1950 4250
Text GLabel 1650 4250 0    50   Input ~ 0
+5V
Wire Wire Line
	1650 4250 1750 4250
Wire Wire Line
	2050 4050 2000 4050
Wire Wire Line
	2000 4050 2000 4350
Wire Wire Line
	2000 4500 1900 4500
Wire Wire Line
	2050 4350 2000 4350
Connection ~ 2000 4350
Wire Wire Line
	2000 4350 2000 4500
$Comp
L Device:R_Small R?
U 1 1 622DBF2B
P 3150 2250
F 0 "R?" V 2954 2250 50  0000 C CNN
F 1 "22" V 3045 2250 50  0000 C CNN
F 2 "" H 3150 2250 50  0001 C CNN
F 3 "~" H 3150 2250 50  0001 C CNN
	1    3150 2250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 622DC238
P 3350 2450
F 0 "R?" V 3154 2450 50  0000 C CNN
F 1 "22" V 3245 2450 50  0000 C CNN
F 2 "" H 3350 2450 50  0001 C CNN
F 3 "~" H 3350 2450 50  0001 C CNN
	1    3350 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 2250 3050 2250
Wire Wire Line
	3250 2250 3550 2250
Wire Wire Line
	3450 2450 3550 2450
Text HLabel 3550 2250 2    50   Input ~ 0
~WE
Text HLabel 3550 2450 2    50   Input ~ 0
~OE
Wire Wire Line
	2950 2450 3250 2450
Text GLabel 3400 4500 2    50   Input ~ 0
GND
Wire Wire Line
	2950 2350 3050 2350
Wire Wire Line
	3050 2350 3050 2550
Wire Wire Line
	3050 4500 3400 4500
Wire Wire Line
	2950 2550 3050 2550
Connection ~ 3050 2550
Wire Wire Line
	3050 2550 3050 2750
Wire Wire Line
	2950 2950 3050 2950
Connection ~ 3050 2950
Wire Wire Line
	3050 2950 3050 3950
Wire Wire Line
	2950 3950 3050 3950
Connection ~ 3050 3950
Wire Wire Line
	3050 3950 3050 4250
Text GLabel 3250 4050 2    50   Input ~ 0
+5V
Wire Wire Line
	2950 4050 3150 4050
Wire Wire Line
	2950 4150 3150 4150
Wire Wire Line
	3150 4150 3150 4050
Connection ~ 3150 4050
Wire Wire Line
	3150 4050 3250 4050
Wire Wire Line
	2950 4250 3050 4250
Connection ~ 3050 4250
Wire Wire Line
	3050 4250 3050 4500
NoConn ~ 2950 4350
NoConn ~ 2950 2650
NoConn ~ 2950 3150
NoConn ~ 2950 3350
Wire Wire Line
	2950 2750 3050 2750
Connection ~ 3050 2750
Wire Wire Line
	3050 2750 3050 2950
$Comp
L Device:R_Small R?
U 1 1 622E8E3E
P 3250 2850
F 0 "R?" V 3054 2850 50  0000 C CNN
F 1 "10K" V 3145 2850 50  0000 C CNN
F 2 "" H 3250 2850 50  0001 C CNN
F 3 "~" H 3250 2850 50  0001 C CNN
	1    3250 2850
	0    1    1    0   
$EndComp
Text GLabel 3450 2850 2    50   Input ~ 0
+5V
Wire Wire Line
	3450 2850 3350 2850
Wire Wire Line
	2950 2850 3150 2850
Text HLabel 3200 3050 2    50   Output ~ 0
~IDE_IRQ
Wire Wire Line
	3200 3050 2950 3050
Text HLabel 3650 3550 2    50   Input ~ 0
A[1..23]
Text Label 3350 3250 0    50   ~ 0
A2
Text Label 3350 3450 0    50   ~ 0
A1
Text Label 3350 3550 0    50   ~ 0
A3
Wire Bus Line
	3550 3550 3650 3550
Entry Wire Line
	3450 3550 3550 3450
Entry Wire Line
	3450 3450 3550 3350
Entry Wire Line
	3450 3250 3550 3150
$Comp
L Device:R_Small R?
U 1 1 622F64E6
P 3200 3250
F 0 "R?" V 3004 3250 50  0000 C CNN
F 1 "22" V 3095 3250 50  0000 C CNN
F 2 "" H 3200 3250 50  0001 C CNN
F 3 "~" H 3200 3250 50  0001 C CNN
	1    3200 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 622F6789
P 3200 3450
F 0 "R?" V 3004 3450 50  0000 C CNN
F 1 "22" V 3095 3450 50  0000 C CNN
F 2 "" H 3200 3450 50  0001 C CNN
F 3 "~" H 3200 3450 50  0001 C CNN
	1    3200 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 622F6A52
P 3200 3550
F 0 "R?" V 3004 3550 50  0000 C CNN
F 1 "22" V 3095 3550 50  0000 C CNN
F 2 "" H 3200 3550 50  0001 C CNN
F 3 "~" H 3200 3550 50  0001 C CNN
	1    3200 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 3250 3100 3250
Wire Wire Line
	2950 3450 3100 3450
Wire Wire Line
	2950 3550 3100 3550
Wire Wire Line
	3300 3250 3450 3250
Wire Wire Line
	3450 3450 3300 3450
Wire Wire Line
	3300 3550 3450 3550
Wire Wire Line
	2950 3650 3150 3650
Wire Wire Line
	2950 3750 3150 3750
Wire Wire Line
	2950 3850 3150 3850
Text HLabel 3150 3650 2    50   Input ~ 0
~IDE_CS1
Text HLabel 3150 3750 2    50   Input ~ 0
~IDE_CS2
Text GLabel 3150 3850 2    50   Output ~ 0
~IDE_LED
Wire Wire Line
	1700 6100 2000 6100
Text GLabel 3700 6100 2    50   Output ~ 0
+5V
Wire Wire Line
	1700 6550 2000 6550
Text GLabel 3700 6550 2    50   Output ~ 0
GND
$Comp
L power:GND #PWR?
U 1 1 6230B92E
P 1700 6700
F 0 "#PWR?" H 1700 6450 50  0001 C CNN
F 1 "GND" H 1705 6527 50  0000 C CNN
F 2 "" H 1700 6700 50  0001 C CNN
F 3 "" H 1700 6700 50  0001 C CNN
	1    1700 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6230B934
P 1700 5950
F 0 "#PWR?" H 1700 5800 50  0001 C CNN
F 1 "+5V" H 1715 6123 50  0000 C CNN
F 2 "" H 1700 5950 50  0001 C CNN
F 3 "" H 1700 5950 50  0001 C CNN
	1    1700 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5950 1700 6100
Wire Wire Line
	1700 6550 1700 6700
Connection ~ 2000 6100
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6230B93E
P 2000 6100
F 0 "#FLG?" H 2000 6175 50  0001 C CNN
F 1 "PWR_FLAG" H 2000 6273 50  0000 C CNN
F 2 "" H 2000 6100 50  0001 C CNN
F 3 "~" H 2000 6100 50  0001 C CNN
	1    2000 6100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6230B944
P 2000 6550
F 0 "#FLG?" H 2000 6625 50  0001 C CNN
F 1 "PWR_FLAG" H 2000 6723 50  0000 C CNN
F 2 "" H 2000 6550 50  0001 C CNN
F 3 "~" H 2000 6550 50  0001 C CNN
	1    2000 6550
	-1   0    0    1   
$EndComp
Connection ~ 2000 6550
Wire Bus Line
	3550 3150 3550 3550
Wire Bus Line
	1750 2500 1750 4050
Wire Wire Line
	2000 6100 3700 6100
Wire Wire Line
	2000 6550 3700 6550
$Comp
L Regulator_Linear:L7805 U?
U 1 1 6230E821
P 5850 4950
F 0 "U?" H 5850 5192 50  0000 C CNN
F 1 "L7805" H 5850 5101 50  0000 C CNN
F 2 "" H 5875 4800 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 5850 4900 50  0001 C CNN
	1    5850 4950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
