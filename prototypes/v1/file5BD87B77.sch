EESchema Schematic File Version 4
LIBS:raven-prototypes-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
L 74xx:74LS04 U?
U 7 1 5BD8F209
P 1950 1350
AR Path="/5BD91A8E/5BD8F209" Ref="U?"  Part="7" 
AR Path="/5BD8F209" Ref="U?"  Part="7" 
AR Path="/5BD87B78/5BD8F209" Ref="U3"  Part="7" 
F 0 "U3" H 2180 1396 50  0000 L CNN
F 1 "74LS04" H 2180 1305 50  0000 L CNN
F 2 "" H 1950 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1950 1350 50  0001 C CNN
	7    1950 1350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 5 1 5BD8F210
P 2750 1350
AR Path="/5BD91A8E/5BD8F210" Ref="U?"  Part="5" 
AR Path="/5BD8F210" Ref="U?"  Part="5" 
AR Path="/5BD87B78/5BD8F210" Ref="U6"  Part="5" 
F 0 "U6" H 2980 1396 50  0000 L CNN
F 1 "74LS00" H 2980 1305 50  0000 L CNN
F 2 "" H 2750 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 2750 1350 50  0001 C CNN
	5    2750 1350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 7 1 5BD8F217
P 3600 1350
AR Path="/5BD91A8E/5BD8F217" Ref="U?"  Part="7" 
AR Path="/5BD8F217" Ref="U?"  Part="7" 
AR Path="/5BD87B78/5BD8F217" Ref="U7"  Part="7" 
F 0 "U7" H 3830 1396 50  0000 L CNN
F 1 "74LS04" H 3830 1305 50  0000 L CNN
F 2 "" H 3600 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3600 1350 50  0001 C CNN
	7    3600 1350
	1    0    0    -1  
$EndComp
Text GLabel 1800 850  0    50   Input ~ 0
+5V
Text GLabel 2600 850  0    50   Input ~ 0
+5V
Text GLabel 3450 850  0    50   Input ~ 0
+5V
Wire Wire Line
	3600 850  3450 850 
Wire Wire Line
	2750 850  2600 850 
Wire Wire Line
	1950 850  1800 850 
$Comp
L power:GND #PWR?
U 1 1 5BD8F224
P 3750 1950
AR Path="/5BD91A8E/5BD8F224" Ref="#PWR?"  Part="1" 
AR Path="/5BD8F224" Ref="#PWR?"  Part="1" 
AR Path="/5BD87B78/5BD8F224" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 3750 1700 50  0001 C CNN
F 1 "GND" H 3755 1777 50  0000 C CNN
F 2 "" H 3750 1950 50  0001 C CNN
F 3 "" H 3750 1950 50  0001 C CNN
	1    3750 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BD8F22A
P 2900 1950
AR Path="/5BD91A8E/5BD8F22A" Ref="#PWR?"  Part="1" 
AR Path="/5BD8F22A" Ref="#PWR?"  Part="1" 
AR Path="/5BD87B78/5BD8F22A" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 2900 1700 50  0001 C CNN
F 1 "GND" H 2905 1777 50  0000 C CNN
F 2 "" H 2900 1950 50  0001 C CNN
F 3 "" H 2900 1950 50  0001 C CNN
	1    2900 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BD8F230
P 2100 1950
AR Path="/5BD91A8E/5BD8F230" Ref="#PWR?"  Part="1" 
AR Path="/5BD8F230" Ref="#PWR?"  Part="1" 
AR Path="/5BD87B78/5BD8F230" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 2100 1700 50  0001 C CNN
F 1 "GND" H 2105 1777 50  0000 C CNN
F 2 "" H 2100 1950 50  0001 C CNN
F 3 "" H 2100 1950 50  0001 C CNN
	1    2100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1850 3600 1950
Wire Wire Line
	3600 1950 3750 1950
Wire Wire Line
	2750 1850 2750 1950
Wire Wire Line
	2750 1950 2900 1950
Wire Wire Line
	1950 1850 1950 1950
Wire Wire Line
	1950 1950 2100 1950
$Comp
L 74xx:74LS20 U?
U 3 1 5BD8F23C
P 1100 1400
AR Path="/5BD91A8E/5BD8F23C" Ref="U?"  Part="3" 
AR Path="/5BD8F23C" Ref="U?"  Part="3" 
AR Path="/5BD87B78/5BD8F23C" Ref="U4"  Part="3" 
F 0 "U4" H 1330 1446 50  0000 L CNN
F 1 "74LS20" H 1330 1355 50  0000 L CNN
F 2 "" H 1100 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS20" H 1100 1400 50  0001 C CNN
	3    1100 1400
	1    0    0    -1  
$EndComp
Text GLabel 950  850  0    50   Input ~ 0
+5V
$Comp
L power:GND #PWR?
U 1 1 5BD8F244
P 1250 1950
AR Path="/5BD91A8E/5BD8F244" Ref="#PWR?"  Part="1" 
AR Path="/5BD8F244" Ref="#PWR?"  Part="1" 
AR Path="/5BD87B78/5BD8F244" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 1250 1700 50  0001 C CNN
F 1 "GND" H 1255 1777 50  0000 C CNN
F 2 "" H 1250 1950 50  0001 C CNN
F 3 "" H 1250 1950 50  0001 C CNN
	1    1250 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1900 1100 1950
Wire Wire Line
	1100 1950 1250 1950
Wire Wire Line
	950  850  1100 850 
Wire Wire Line
	1100 850  1100 900 
$Comp
L 74xx:74LS10 U?
U 4 1 5BDA73F4
P 4450 1350
AR Path="/5BDA73F4" Ref="U?"  Part="4" 
AR Path="/5BD87B78/5BDA73F4" Ref="U1"  Part="4" 
F 0 "U1" H 4680 1396 50  0000 L CNN
F 1 "74LS10" H 4680 1305 50  0000 L CNN
F 2 "" H 4450 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 4450 1350 50  0001 C CNN
	4    4450 1350
	1    0    0    -1  
$EndComp
Text GLabel 4250 850  0    50   Input ~ 0
+5V
$Comp
L power:GND #PWR?
U 1 1 5BDA73FC
P 4600 1850
AR Path="/5BDA73FC" Ref="#PWR?"  Part="1" 
AR Path="/5BD87B78/5BDA73FC" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 4600 1600 50  0001 C CNN
F 1 "GND" H 4605 1677 50  0000 C CNN
F 2 "" H 4600 1850 50  0001 C CNN
F 3 "" H 4600 1850 50  0001 C CNN
	1    4600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1850 4600 1850
Wire Wire Line
	4250 850  4450 850 
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5BDEC5A4
P 2000 3150
F 0 "#FLG01" H 2000 3225 50  0001 C CNN
F 1 "PWR_FLAG" V 2000 3278 50  0000 L CNN
F 2 "" H 2000 3150 50  0001 C CNN
F 3 "~" H 2000 3150 50  0001 C CNN
	1    2000 3150
	0    1    1    0   
$EndComp
Text GLabel 1750 3150 0    50   Input ~ 0
+5V
Wire Wire Line
	1750 3150 1900 3150
$Comp
L power:+5V #PWR02
U 1 1 5BDEC84E
P 1900 2950
F 0 "#PWR02" H 1900 2800 50  0001 C CNN
F 1 "+5V" H 1915 3123 50  0000 C CNN
F 2 "" H 1900 2950 50  0001 C CNN
F 3 "" H 1900 2950 50  0001 C CNN
	1    1900 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2950 1900 3150
Connection ~ 1900 3150
Wire Wire Line
	1900 3150 2000 3150
$EndSCHEMATC
