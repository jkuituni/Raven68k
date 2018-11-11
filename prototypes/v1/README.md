
# Raven68k Prototype Build

## Revision 0
This is the first publicly available release of the Raven68k project as generated and sent to [JLCPCB (Shenzhen JLC Electronics Co., Ltd.)](https://jlcpcb.com) for manufacture on November 5th, 2018.  As this is the very first prototype board, one should expect things that don't make sense or are outright wrong.  You have been warned. ;)

## Software 

The Rev0 software is available in this repository under the /rom/v1 directory.

## RAM and ROM locations

| Type 	| Start Address 	| Size   	|
|------	|---------------	|--------	|
| RAM  	| $000000       	| 1 MiB  	|
| ROM  	| $FFFF00       	| 64 KiB 	|

## Device Select Logic

Each peripheral has 64 bytes (32 words) of address space available to it.  As the 68681 has 16 registers, it is only using 1/2 of the available space.  This probably has the unintended effect of mirroring into the unused half of I/O space, making it unavailable for other use.

| Decimal | Hexadecimal | Device     |
|---------|-------------|------------|
| 1048576 |   $100000   | Dual UART  |
| 1048704 |   $100080   | Unassigned |
| 1048832 |   $100100   | Unassigned |
| 1048960 |   $100180   | Unassigned |
| 1049088 |   $100200   | Unassigned |
| 1049216 |   $100280   | Unassigned |
| 1049344 |   $100300   | Unassigned |
| 1049472 |   $100380   | Unassigned |

## Errata

### ROM Decoding logic
 ROM decoding is enabled when lines A17-A23 are high.  It should be active when lines **A16**-A23 are high. This can be solved by feeding A16 into pin 12 on U11 and cutting the +5V trace that leads to it.
 
 ### I/O Space Decoding Logic
 
 I/O space decoding is supposed to be immediately above the 1MiB RAM. This translates into 
 
     NOT(ROM_CS) AND A16=HIGH

The NAND gate (U11B) is not necessary and should be removed. All of this can be hooked directly to the 74HC138 (U13)

### Map ROM to RAM for boot

The system is missing a logic chip that maps the ROM into the bottom 64k of memory for the first 8 cycles so the boot sequence can happen.  This can be implemented by using an 8 bit shift register (74HC164) as in [Motorola Application Note AN897](http://retronik.fr/motorola/68K/68000/AN897_MC68008_minimum_configuration_system_%5BMotorola_1984_12p%5D.pdf) 

### Corrected Schematic
A corrected schematic will be made available once the errors have all been corrected and validated.

