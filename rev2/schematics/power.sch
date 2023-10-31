EESchema Schematic File Version 4
EELAYER 30 0
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
L Diode:SB140 D1
U 1 1 6263E7CB
P 6850 2950
F 0 "D1" H 6850 3167 50  0000 C CNN
F 1 "SB140" H 6850 3076 50  0000 C CNN
F 2 "" H 6850 2775 50  0001 C CNN
F 3 "http://www.diodes.com/_files/datasheets/ds23022.pdf" H 6850 2950 50  0001 C CNN
	1    6850 2950
	0    1    1    0   
$EndComp
$Comp
L custom:SRN5040TA-101K L1
U 1 1 626500F2
P 7000 2100
F 0 "L1" H 7400 2325 50  0000 C CNN
F 1 "SRN5040TA-101K" H 7400 2234 50  0000 C CNN
F 2 "" H 7650 2150 50  0001 L CNN
F 3 "https://www.bourns.com/docs/product-datasheets/SRN5040TA.pdf" H 7650 2050 50  0001 L CNN
F 4 "Inductor SMD 4.95x4.95x3.8mm 100uH 0.72A" H 7650 1950 50  0001 L CNN "Description"
F 5 "4.1" H 7650 1850 50  0001 L CNN "Height"
F 6 "Bourns" H 7650 1750 50  0001 L CNN "Manufacturer_Name"
F 7 "SRN5040TA-101K" H 7650 1650 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "652-SRN5040TA-101K" H 7650 1550 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Bourns/SRN5040TA-101K?qs=qSfuJ%252Bfl%2Fd6IGmzq6oDX8Q%3D%3D" H 7650 1450 50  0001 L CNN "Mouser Price/Stock"
F 10 "SRN5040TA-101K" H 7650 1350 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/srn5040ta-101k/bourns?region=nac" H 7650 1250 50  0001 L CNN "Arrow Price/Stock"
	1    7000 2100
	1    0    0    -1  
$EndComp
NoConn ~ 5550 2100
$Comp
L custom:L5970D013TR IC1
U 1 1 62675D10
P 5550 2200
F 0 "IC1" H 6100 2565 50  0000 C CNN
F 1 "L5970D013TR" H 6100 2474 50  0000 C CNN
F 2 "" H 6500 2300 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00002173.pdf" H 6500 2200 50  0001 L CNN
F 4 "L5970D013TR, Switching Regulator, Buck Controller, 1A, Adjustable, 275 kHz, 8-Pin SO" H 6500 2100 50  0001 L CNN "Description"
F 5 "1.75" H 6500 2000 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 6500 1900 50  0001 L CNN "Manufacturer_Name"
F 7 "L5970D013TR" H 6500 1800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "511-L5970D013TR" H 6500 1700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/STMicroelectronics/L5970D013TR?qs=5tMLENPDcJtqb%2FYZ5i8kRw%3D%3D" H 6500 1600 50  0001 L CNN "Mouser Price/Stock"
F 10 "L5970D013TR" H 6500 1500 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/l5970d013tr/stmicroelectronics" H 6500 1400 50  0001 L CNN "Arrow Price/Stock"
	1    5550 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2100 6850 2100
Wire Wire Line
	6850 2800 6850 2100
Connection ~ 6850 2100
Wire Wire Line
	6850 2100 7000 2100
Wire Wire Line
	6850 3100 6850 3450
Connection ~ 6850 3450
Wire Wire Line
	6850 3450 7950 3450
Wire Wire Line
	7800 2100 7950 2100
$Comp
L Device:R_Small R13
U 1 1 6267F086
P 7950 2400
F 0 "R13" H 8009 2446 50  0000 L CNN
F 1 "3.9K" H 8009 2355 50  0000 L CNN
F 2 "" H 7950 2400 50  0001 C CNN
F 3 "~" H 7950 2400 50  0001 C CNN
	1    7950 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R14
U 1 1 6267F604
P 7950 3100
F 0 "R14" H 8009 3146 50  0000 L CNN
F 1 "1.2K" H 8009 3055 50  0000 L CNN
F 2 "" H 7950 3100 50  0001 C CNN
F 3 "~" H 7950 3100 50  0001 C CNN
	1    7950 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2300 7950 2100
Connection ~ 7950 2100
Wire Wire Line
	7950 2100 8650 2100
Wire Wire Line
	7950 2500 7950 2800
Wire Wire Line
	7950 3200 7950 3450
Connection ~ 7950 3450
Wire Wire Line
	6650 2500 7500 2500
Wire Wire Line
	7500 2500 7500 2800
Wire Wire Line
	7500 2800 7950 2800
Connection ~ 7950 2800
Wire Wire Line
	7950 2800 7950 3000
$Comp
L Device:C_Small C20
U 1 1 62680B33
P 8300 2800
F 0 "C20" V 8071 2800 50  0000 C CNN
F 1 "470pF" V 8162 2800 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 8300 2800 50  0001 C CNN
F 3 "~" H 8300 2800 50  0001 C CNN
	1    8300 2800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R17
U 1 1 626813B4
P 8650 2400
F 0 "R17" H 8709 2446 50  0000 L CNN
F 1 "390" H 8709 2355 50  0000 L CNN
F 2 "" H 8650 2400 50  0001 C CNN
F 3 "~" H 8650 2400 50  0001 C CNN
	1    8650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2800 7950 2800
Wire Wire Line
	8400 2800 8650 2800
Wire Wire Line
	8650 2800 8650 2500
Wire Wire Line
	8650 2300 8650 2100
Connection ~ 8650 2100
Wire Wire Line
	8650 2100 9100 2100
$Comp
L Device:C_Small C22
U 1 1 62682AF8
P 9100 2750
F 0 "C22" H 9008 2704 50  0000 R CNN
F 1 "47uF" H 9008 2795 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9100 2750 50  0001 C CNN
F 3 "~" H 9100 2750 50  0001 C CNN
	1    9100 2750
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C24
U 1 1 62683279
P 9550 2750
F 0 "C24" H 9458 2704 50  0000 R CNN
F 1 "47uF" H 9458 2795 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9550 2750 50  0001 C CNN
F 3 "~" H 9550 2750 50  0001 C CNN
	1    9550 2750
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C26
U 1 1 6268364E
P 10000 2750
F 0 "C26" H 9908 2704 50  0000 R CNN
F 1 "100nF" H 9908 2795 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 10000 2750 50  0001 C CNN
F 3 "~" H 10000 2750 50  0001 C CNN
	1    10000 2750
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R20
U 1 1 626840E1
P 10500 2450
F 0 "R20" H 10559 2496 50  0000 L CNN
F 1 "680" H 10559 2405 50  0000 L CNN
F 2 "" H 10500 2450 50  0001 C CNN
F 3 "~" H 10500 2450 50  0001 C CNN
	1    10500 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 62684723
P 10500 3050
F 0 "D4" V 10539 2932 50  0000 R CNN
F 1 "5V" V 10448 2932 50  0000 R CNN
F 2 "" H 10500 3050 50  0001 C CNN
F 3 "~" H 10500 3050 50  0001 C CNN
	1    10500 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9100 2650 9100 2100
Connection ~ 9100 2100
Wire Wire Line
	9100 2100 9550 2100
Wire Wire Line
	9100 2850 9100 3450
Wire Wire Line
	7950 3450 9100 3450
Connection ~ 9100 3450
Wire Wire Line
	9100 3450 9550 3450
Wire Wire Line
	9550 2650 9550 2100
Connection ~ 9550 2100
Wire Wire Line
	9550 2100 10000 2100
Wire Wire Line
	9550 2850 9550 3450
Connection ~ 9550 3450
Wire Wire Line
	10000 2650 10000 2100
Connection ~ 10000 2100
Wire Wire Line
	9550 3450 10000 3450
Wire Wire Line
	10000 2100 10500 2100
Wire Wire Line
	10000 2850 10000 3450
Connection ~ 10000 3450
Wire Wire Line
	10000 3450 10500 3450
Wire Wire Line
	10500 2350 10500 2100
Connection ~ 10500 2100
Wire Wire Line
	10500 2100 11050 2100
Wire Wire Line
	10500 2550 10500 2900
Wire Wire Line
	10500 3200 10500 3450
Wire Wire Line
	6150 2950 6150 3450
Connection ~ 6150 3450
Wire Wire Line
	6150 3450 6850 3450
Wire Wire Line
	6000 2950 6000 3450
Connection ~ 6000 3450
Wire Wire Line
	6000 3450 6150 3450
$Comp
L Device:C_Small C12
U 1 1 6268CA4F
P 4100 2800
F 0 "C12" H 4008 2754 50  0000 R CNN
F 1 "0.1uF" H 4008 2845 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4100 2800 50  0001 C CNN
F 3 "~" H 4100 2800 50  0001 C CNN
	1    4100 2800
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C14
U 1 1 6268CF72
P 4500 2800
F 0 "C14" H 4408 2754 50  0000 R CNN
F 1 "10uF" H 4408 2845 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4500 2800 50  0001 C CNN
F 3 "~" H 4500 2800 50  0001 C CNN
	1    4500 2800
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C16
U 1 1 6268D249
P 4900 2800
F 0 "C16" H 4808 2754 50  0000 R CNN
F 1 "220pF" H 4808 2845 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4900 2800 50  0001 C CNN
F 3 "~" H 4900 2800 50  0001 C CNN
	1    4900 2800
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C18
U 1 1 6268D599
P 5300 2800
F 0 "C18" H 5208 2754 50  0000 R CNN
F 1 "22nF" H 5208 2845 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 5300 2800 50  0001 C CNN
F 3 "~" H 5300 2800 50  0001 C CNN
	1    5300 2800
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 6268D8A0
P 5300 3200
F 0 "R11" H 5359 3246 50  0000 L CNN
F 1 "4.7K" H 5359 3155 50  0000 L CNN
F 2 "" H 5300 3200 50  0001 C CNN
F 3 "~" H 5300 3200 50  0001 C CNN
	1    5300 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3300 5300 3450
Connection ~ 5300 3450
Wire Wire Line
	5300 3450 6000 3450
Wire Wire Line
	5300 3100 5300 2900
Wire Wire Line
	5300 2700 5300 2550
NoConn ~ 5550 2400
Wire Wire Line
	4100 2700 4100 2250
Connection ~ 4100 2250
Wire Wire Line
	4100 2900 4100 3450
Connection ~ 4100 3450
Wire Wire Line
	4100 3450 4500 3450
Wire Wire Line
	4500 2700 4500 2250
Wire Wire Line
	4100 2250 4500 2250
Connection ~ 4500 2250
Wire Wire Line
	4500 2250 4900 2250
Wire Wire Line
	4500 2900 4500 3450
Connection ~ 4500 3450
Wire Wire Line
	4500 3450 4900 3450
Connection ~ 4900 2250
Wire Wire Line
	4900 2250 5550 2250
Wire Wire Line
	4900 2900 4900 3450
Connection ~ 4900 3450
Wire Wire Line
	4900 3450 5300 3450
$Comp
L Diode:SB140 D2
U 1 1 626B0F66
P 6850 5400
F 0 "D2" H 6850 5617 50  0000 C CNN
F 1 "SB140" H 6850 5526 50  0000 C CNN
F 2 "" H 6850 5225 50  0001 C CNN
F 3 "http://www.diodes.com/_files/datasheets/ds23022.pdf" H 6850 5400 50  0001 C CNN
	1    6850 5400
	0    1    1    0   
$EndComp
$Comp
L custom:SRN5040TA-101K L2
U 1 1 626B0F74
P 7000 4550
F 0 "L2" H 7400 4775 50  0000 C CNN
F 1 "SRN5040TA-101K" H 7400 4684 50  0000 C CNN
F 2 "" H 7650 4600 50  0001 L CNN
F 3 "https://www.bourns.com/docs/product-datasheets/SRN5040TA.pdf" H 7650 4500 50  0001 L CNN
F 4 "Inductor SMD 4.95x4.95x3.8mm 100uH 0.72A" H 7650 4400 50  0001 L CNN "Description"
F 5 "4.1" H 7650 4300 50  0001 L CNN "Height"
F 6 "Bourns" H 7650 4200 50  0001 L CNN "Manufacturer_Name"
F 7 "SRN5040TA-101K" H 7650 4100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "652-SRN5040TA-101K" H 7650 4000 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Bourns/SRN5040TA-101K?qs=qSfuJ%252Bfl%2Fd6IGmzq6oDX8Q%3D%3D" H 7650 3900 50  0001 L CNN "Mouser Price/Stock"
F 10 "SRN5040TA-101K" H 7650 3800 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/srn5040ta-101k/bourns?region=nac" H 7650 3700 50  0001 L CNN "Arrow Price/Stock"
	1    7000 4550
	1    0    0    -1  
$EndComp
NoConn ~ 5550 4550
$Comp
L custom:L5970D013TR IC2
U 1 1 626B0F83
P 5550 4650
F 0 "IC2" H 6100 5015 50  0000 C CNN
F 1 "L5970D013TR" H 6100 4924 50  0000 C CNN
F 2 "" H 6500 4750 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00002173.pdf" H 6500 4650 50  0001 L CNN
F 4 "L5970D013TR, Switching Regulator, Buck Controller, 1A, Adjustable, 275 kHz, 8-Pin SO" H 6500 4550 50  0001 L CNN "Description"
F 5 "1.75" H 6500 4450 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 6500 4350 50  0001 L CNN "Manufacturer_Name"
F 7 "L5970D013TR" H 6500 4250 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "511-L5970D013TR" H 6500 4150 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/STMicroelectronics/L5970D013TR?qs=5tMLENPDcJtqb%2FYZ5i8kRw%3D%3D" H 6500 4050 50  0001 L CNN "Mouser Price/Stock"
F 10 "L5970D013TR" H 6500 3950 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/l5970d013tr/stmicroelectronics" H 6500 3850 50  0001 L CNN "Arrow Price/Stock"
	1    5550 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4550 6850 4550
Wire Wire Line
	6850 5250 6850 4550
Connection ~ 6850 4550
Wire Wire Line
	6850 4550 7000 4550
Wire Wire Line
	6850 5550 6850 5900
Connection ~ 6850 5900
Wire Wire Line
	6850 5900 7950 5900
Wire Wire Line
	7800 4550 7950 4550
$Comp
L Device:R_Small R15
U 1 1 626B0F9E
P 7950 4850
F 0 "R15" H 8009 4896 50  0000 L CNN
F 1 "4.7K" H 8009 4805 50  0000 L CNN
F 2 "" H 7950 4850 50  0001 C CNN
F 3 "~" H 7950 4850 50  0001 C CNN
	1    7950 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R16
U 1 1 626B0FA4
P 7950 5550
F 0 "R16" H 8009 5596 50  0000 L CNN
F 1 "2.7K" H 8009 5505 50  0000 L CNN
F 2 "" H 7950 5550 50  0001 C CNN
F 3 "~" H 7950 5550 50  0001 C CNN
	1    7950 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4750 7950 4550
Connection ~ 7950 4550
Wire Wire Line
	7950 4550 8650 4550
Wire Wire Line
	7950 4950 7950 5250
Wire Wire Line
	7950 5650 7950 5900
Connection ~ 7950 5900
Wire Wire Line
	6650 4950 7500 4950
Wire Wire Line
	7500 4950 7500 5250
Wire Wire Line
	7500 5250 7950 5250
Connection ~ 7950 5250
Wire Wire Line
	7950 5250 7950 5450
$Comp
L Device:C_Small C21
U 1 1 626B0FB5
P 8300 5250
F 0 "C21" V 8071 5250 50  0000 C CNN
F 1 "470pF" V 8162 5250 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 8300 5250 50  0001 C CNN
F 3 "~" H 8300 5250 50  0001 C CNN
	1    8300 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R18
U 1 1 626B0FBB
P 8650 4850
F 0 "R18" H 8709 4896 50  0000 L CNN
F 1 "390" H 8709 4805 50  0000 L CNN
F 2 "" H 8650 4850 50  0001 C CNN
F 3 "~" H 8650 4850 50  0001 C CNN
	1    8650 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 5250 7950 5250
Wire Wire Line
	8400 5250 8650 5250
Wire Wire Line
	8650 5250 8650 4950
Wire Wire Line
	8650 4750 8650 4550
Connection ~ 8650 4550
Wire Wire Line
	8650 4550 9100 4550
$Comp
L Device:C_Small C23
U 1 1 626B0FC7
P 9100 5200
F 0 "C23" H 9008 5154 50  0000 R CNN
F 1 "47uF" H 9008 5245 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9100 5200 50  0001 C CNN
F 3 "~" H 9100 5200 50  0001 C CNN
	1    9100 5200
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C25
U 1 1 626B0FCD
P 9550 5200
F 0 "C25" H 9458 5154 50  0000 R CNN
F 1 "47uF" H 9458 5245 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9550 5200 50  0001 C CNN
F 3 "~" H 9550 5200 50  0001 C CNN
	1    9550 5200
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C27
U 1 1 626B0FD3
P 10000 5200
F 0 "C27" H 9908 5154 50  0000 R CNN
F 1 "100nF" H 9908 5245 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 10000 5200 50  0001 C CNN
F 3 "~" H 10000 5200 50  0001 C CNN
	1    10000 5200
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 5100 9100 4550
Connection ~ 9100 4550
Wire Wire Line
	9100 4550 9550 4550
Wire Wire Line
	9100 5300 9100 5900
Wire Wire Line
	7950 5900 9100 5900
Connection ~ 9100 5900
Wire Wire Line
	9100 5900 9550 5900
Wire Wire Line
	9550 5100 9550 4550
Connection ~ 9550 4550
Wire Wire Line
	9550 4550 10000 4550
Wire Wire Line
	9550 5300 9550 5900
Connection ~ 9550 5900
Wire Wire Line
	10000 5100 10000 4550
Connection ~ 10000 4550
Wire Wire Line
	9550 5900 10000 5900
Wire Wire Line
	10000 5300 10000 5900
Wire Wire Line
	6150 5400 6150 5900
Connection ~ 6150 5900
Wire Wire Line
	6150 5900 6850 5900
Wire Wire Line
	6000 5400 6000 5900
Connection ~ 6000 5900
Wire Wire Line
	6000 5900 6150 5900
$Comp
L Device:C_Small C13
U 1 1 626B1015
P 4100 5250
F 0 "C13" H 4008 5204 50  0000 R CNN
F 1 "0.1uF" H 4008 5295 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4100 5250 50  0001 C CNN
F 3 "~" H 4100 5250 50  0001 C CNN
	1    4100 5250
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C15
U 1 1 626B101B
P 4500 5250
F 0 "C15" H 4408 5204 50  0000 R CNN
F 1 "10uF" H 4408 5295 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4500 5250 50  0001 C CNN
F 3 "~" H 4500 5250 50  0001 C CNN
	1    4500 5250
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C17
U 1 1 626B1021
P 4900 5250
F 0 "C17" H 4808 5204 50  0000 R CNN
F 1 "220pF" H 4808 5295 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4900 5250 50  0001 C CNN
F 3 "~" H 4900 5250 50  0001 C CNN
	1    4900 5250
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C19
U 1 1 626B1027
P 5300 5250
F 0 "C19" H 5208 5204 50  0000 R CNN
F 1 "22nF" H 5208 5295 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 5300 5250 50  0001 C CNN
F 3 "~" H 5300 5250 50  0001 C CNN
	1    5300 5250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R12
U 1 1 626B102D
P 5300 5650
F 0 "R12" H 5359 5696 50  0000 L CNN
F 1 "4.7K" H 5359 5605 50  0000 L CNN
F 2 "" H 5300 5650 50  0001 C CNN
F 3 "~" H 5300 5650 50  0001 C CNN
	1    5300 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 5750 5300 5900
Connection ~ 5300 5900
Wire Wire Line
	5300 5900 6000 5900
Wire Wire Line
	5300 5550 5300 5350
Wire Wire Line
	5300 5150 5300 5000
Wire Wire Line
	5300 5000 5550 5000
NoConn ~ 5550 4850
Wire Wire Line
	4100 5150 4100 4700
Connection ~ 4100 4700
Wire Wire Line
	4100 5350 4100 5900
Connection ~ 4100 5900
Wire Wire Line
	4100 5900 4500 5900
Wire Wire Line
	4500 5150 4500 4700
Wire Wire Line
	4100 4700 4500 4700
Connection ~ 4500 4700
Wire Wire Line
	4500 4700 4900 4700
Wire Wire Line
	4500 5350 4500 5900
Connection ~ 4500 5900
Wire Wire Line
	4500 5900 4900 5900
Wire Wire Line
	4900 5150 4900 5000
Connection ~ 4900 4700
Wire Wire Line
	4900 4700 5550 4700
Wire Wire Line
	4900 5350 4900 5900
Connection ~ 4900 5900
Wire Wire Line
	4900 5900 5300 5900
Wire Wire Line
	5300 5000 4900 5000
Connection ~ 5300 5000
Connection ~ 4900 5000
Wire Wire Line
	4900 5000 4900 4700
Wire Wire Line
	10000 4550 10450 4550
$Comp
L Connector:Jack-DC J3
U 1 1 626BFBFD
P 1050 2350
F 0 "J3" H 1107 2675 50  0000 C CNN
F 1 "Jack-DC" H 1107 2584 50  0000 C CNN
F 2 "" H 1100 2310 50  0001 C CNN
F 3 "~" H 1100 2310 50  0001 C CNN
	1    1050 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR055
U 1 1 626D1D90
P 11050 2100
F 0 "#PWR055" H 11050 1950 50  0001 C CNN
F 1 "+5V" H 11065 2273 50  0000 C CNN
F 2 "" H 11050 2100 50  0001 C CNN
F 3 "" H 11050 2100 50  0001 C CNN
	1    11050 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR054
U 1 1 626D2AAE
P 10700 4550
F 0 "#PWR054" H 10700 4400 50  0001 C CNN
F 1 "+3.3V" H 10715 4723 50  0000 C CNN
F 2 "" H 10700 4550 50  0001 C CNN
F 3 "" H 10700 4550 50  0001 C CNN
	1    10700 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3450 4100 3450
Wire Wire Line
	3400 5900 4100 5900
Wire Wire Line
	3400 2450 3400 3450
Wire Wire Line
	2900 2250 2900 4700
Wire Wire Line
	2900 4700 4100 4700
Connection ~ 2900 2250
Wire Wire Line
	3400 3450 3400 5900
Connection ~ 3400 3450
Wire Wire Line
	4900 2250 4900 2550
Wire Wire Line
	5550 2550 5300 2550
Wire Wire Line
	5300 2550 4900 2550
Connection ~ 5300 2550
Connection ~ 4900 2550
Wire Wire Line
	4900 2550 4900 2700
Wire Wire Line
	2900 2250 4100 2250
$Comp
L Device:R_Small R19
U 1 1 638129F6
P 10450 4900
F 0 "R19" H 10509 4946 50  0000 L CNN
F 1 "330" H 10509 4855 50  0000 L CNN
F 2 "" H 10450 4900 50  0001 C CNN
F 3 "~" H 10450 4900 50  0001 C CNN
	1    10450 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 638129FC
P 10450 5500
F 0 "D3" V 10489 5382 50  0000 R CNN
F 1 "3.3V" V 10398 5382 50  0000 R CNN
F 2 "" H 10450 5500 50  0001 C CNN
F 3 "~" H 10450 5500 50  0001 C CNN
	1    10450 5500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10450 5000 10450 5350
Wire Wire Line
	10450 5650 10450 5900
Wire Wire Line
	10000 5900 10450 5900
Connection ~ 10000 5900
Wire Wire Line
	10450 4800 10450 4550
Connection ~ 10450 4550
Wire Wire Line
	10450 4550 10700 4550
$Comp
L Switch:SW_SPST SW2
U 1 1 63842467
P 1750 2250
F 0 "SW2" H 1750 2485 50  0000 C CNN
F 1 "POWER_SW" H 1750 2394 50  0000 C CNN
F 2 "" H 1750 2250 50  0001 C CNN
F 3 "~" H 1750 2250 50  0001 C CNN
	1    1750 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F1
U 1 1 63843171
P 2350 2250
F 0 "F1" V 2153 2250 50  0000 C CNN
F 1 "2A" V 2244 2250 50  0000 C CNN
F 2 "" V 2280 2250 50  0001 C CNN
F 3 "~" H 2350 2250 50  0001 C CNN
	1    2350 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 2250 1550 2250
Wire Wire Line
	2500 2250 2900 2250
Wire Wire Line
	1350 2450 3400 2450
Wire Wire Line
	1950 2250 2200 2250
$EndSCHEMATC
