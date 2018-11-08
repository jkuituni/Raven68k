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
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3350 1150 1750 900 
U 5A5B7F76
F0 "CPU and Support Circuitry" 60
F1 "cpu-logic.sch" 60
F2 "RESET" B R 5100 1650 60 
F3 "AS" O L 3350 1300 60 
F4 "UDS" O L 3350 1400 60 
F5 "LDS" O L 3350 1500 60 
F6 "R/W" O L 3350 1600 60 
F7 "DTACK" I L 3350 1700 60 
F8 "IPL[0..2]" I L 3350 1800 60 
F9 "FC[0..2]" O L 3350 1900 60 
F10 "CLK" O L 3350 1200 60 
F11 "+5V" O R 5100 1800 60 
F12 "GND" O R 5100 1950 60 
F13 "D[0..15]" B R 5100 1400 60 
F14 "A[1..23]" B R 5100 1500 60 
$EndSheet
$Sheet
S 6600 1100 1700 950 
U 5A5BE28C
F0 "Memory and EEPROM" 60
F1 "ram-eeprom.sch" 60
F2 "GND" I R 8300 1950 60 
F3 "+5V" I R 8300 1850 60 
F4 "D[0..15]" B L 6600 1400 60 
F5 "A[0..23]" B L 6600 1500 60 
F6 "OE" I L 6600 1650 60 
F7 "ROMSEL" I L 6600 2000 60 
F8 "RAMSEL" I L 6600 1900 60 
F9 "R/W" I L 6600 1750 60 
$EndSheet
$Sheet
S 3350 2500 1750 1350
U 5A664EFE
F0 "CPLD Logic" 60
F1 "cpld.sch" 60
F2 "+5V" I R 5100 3650 60 
F3 "GND" I R 5100 3750 60 
F4 "IPL[0..2]" O L 3350 2600 60 
F5 "FC[0..2]" I L 3350 2700 60 
F6 "A[1..23]" B R 5100 2600 60 
F7 "AS" I L 3350 2850 60 
F8 "UDS" I L 3350 2950 60 
F9 "LDS" I L 3350 3050 60 
F10 "R/W" I L 3350 3150 60 
F11 "OE" O R 5100 3450 60 
F12 "ROMSEL" O R 5100 2950 60 
F13 "RAMSEL" O R 5100 2850 60 
F14 "UARTSEL" O R 5100 2750 60 
F15 "RTCSEL" O R 5100 3050 60 
F16 "IACK" O R 5100 3350 60 
F17 "UARTIRQ" I L 3350 3350 60 
F18 "RTCIRQ" I L 3350 3450 60 
$EndSheet
$Sheet
S 3350 4400 1800 1700
U 5A689E96
F0 "DUART and RTC" 60
F1 "duart-rtc.sch" 60
F2 "CLK" I L 3350 4650 60 
F3 "D[0..15]" I R 5150 4650 60 
F4 "A[1..23]" I R 5150 4750 60 
F5 "UARTSEL" I R 5150 4950 60 
F6 "IACK" I R 5150 5150 60 
F7 "RESET" I R 5150 4500 60 
F8 "DTACK" I R 5150 5600 60 
F9 "UARTIRQ" I L 3350 5500 60 
F10 "GND" I R 5150 6000 60 
F11 "RTCSEL" I R 5150 5050 60 
F12 "RTCIRQ" I L 3350 5600 60 
F13 "R/W" I L 3350 5250 60 
F14 "OE" I R 5150 5250 60 
F15 "+5V" I R 5150 5900 60 
$EndSheet
Wire Bus Line
	5100 1400 6600 1400
Wire Bus Line
	5100 1500 6600 1500
Connection ~ 5600 1500
Wire Bus Line
	5600 1500 5600 2600
Wire Bus Line
	5600 2600 5100 2600
Connection ~ 5900 1500
Connection ~ 6200 1400
Wire Bus Line
	5900 1500 5900 4750
Wire Bus Line
	5900 4750 5150 4750
Wire Bus Line
	6200 1400 6200 4650
Wire Bus Line
	6200 4650 5150 4650
Text GLabel 5100 1800 2    60   Input ~ 0
+5V
Text GLabel 5100 1950 2    60   Input ~ 0
GND
Text GLabel 5100 1650 2    60   Input ~ 0
RESET
Wire Bus Line
	3350 1800 3050 1800
Wire Bus Line
	3050 1800 3050 2600
Wire Bus Line
	3050 2600 3350 2600
Wire Bus Line
	3150 2700 3350 2700
Wire Bus Line
	3150 1900 3150 2700
Wire Bus Line
	3350 1900 3150 1900
Text GLabel 3350 1200 0    60   Input ~ 0
CLK
Text GLabel 3350 1300 0    60   Input ~ 0
AS
Text GLabel 3350 1400 0    60   Input ~ 0
UDS
Text GLabel 3350 1500 0    60   Input ~ 0
LDS
Text GLabel 3350 1600 0    60   Input ~ 0
R/W
Text GLabel 3350 1700 0    60   Input ~ 0
DTACK
Text GLabel 3350 2850 0    60   Input ~ 0
AS
Text GLabel 3350 2950 0    60   Input ~ 0
UDS
Text GLabel 3350 3050 0    60   Input ~ 0
LDS
Text GLabel 3350 3150 0    60   Input ~ 0
R/W
Text GLabel 3350 3350 0    60   Input ~ 0
UARTIRQ
Text GLabel 3350 3450 0    60   Input ~ 0
RTCIRQ
Text GLabel 3350 5500 0    60   Input ~ 0
UARTIRQ
Text GLabel 3350 5600 0    60   Input ~ 0
RTCIRQ
Text GLabel 3350 4650 0    60   Input ~ 0
CLK
Text GLabel 3350 5250 0    60   Input ~ 0
R/W
Text GLabel 5150 4500 2    60   Input ~ 0
RESET
Text GLabel 5100 3650 2    60   Input ~ 0
+5V
Text GLabel 5100 3750 2    60   Input ~ 0
GND
Text GLabel 5150 4950 2    60   Input ~ 0
UARTSEL
Text GLabel 5150 5050 2    60   Input ~ 0
RTCSEL
Text GLabel 5150 5250 2    60   Input ~ 0
OE
Text GLabel 5150 5150 2    60   Input ~ 0
IACK
Text GLabel 5150 5600 2    60   Input ~ 0
DTACK
Text GLabel 5150 5900 2    60   Input ~ 0
+5V
Text GLabel 5150 6000 2    60   Input ~ 0
GND
Text GLabel 5100 2750 2    60   Input ~ 0
UARTSEL
Text GLabel 5100 3050 2    60   Input ~ 0
RTCSEL
Text GLabel 5100 3350 2    60   Input ~ 0
IACK
Text GLabel 5100 3450 2    60   Input ~ 0
OE
Text GLabel 6600 1650 0    60   Input ~ 0
OE
Text GLabel 6600 1750 0    60   Input ~ 0
R/W
Text GLabel 5100 2850 2    60   Input ~ 0
RAMSEL
Text GLabel 6600 1900 0    60   Input ~ 0
RAMSEL
Text GLabel 5100 2950 2    60   Input ~ 0
ROMSEL
Text GLabel 6600 2000 0    60   Input ~ 0
ROMSEL
Text GLabel 8300 1850 2    60   Input ~ 0
+5V
Text GLabel 8300 1950 2    60   Input ~ 0
GND
$EndSCHEMATC
