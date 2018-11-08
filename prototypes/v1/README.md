
# Raven68k Prototype Build

## Revision 0
This is the first publicly available release of the Raven68k project as generated and sent to [JLCPCB (Shenzhen JLC Electronics Co., Ltd.)](https://jlcpcb.com) for manufacture on November 5th, 2018.  As this is the very first prototype board, one should expect things that don't make sense or are outright wrong.  You have been warned. ;)

## Software 

The Rev0 software is available in this repository under the /rom/v1 directory.

## Errata

### ROM Decoding logic
 ROM decoding is enabled when lines A17-A23 are high.  It should be active when lines **A16**-A23 are high. This can be solved by feeding A16 into pin 12 on U11 and cutting the +5V trace that leads to it.
 
 ### I/O Space Decoding Logic
 
 I/O space decoding is supposed to be immediately above the 1MiB RAM. This translates into 
 
     NOT(ROM_CS) AND A16=HIGH

The extra NOT gate between ROM_CS effectively turn it on when the ROM is active.

### Map ROM to RAM for boot

The system is missing a logic chip that maps the ROM into the bottom 64k of memory for the first 8 cycles so the boot sequence can happen.  This can be implemented by using an 8 bit shift register (74HC164) as in [Motorola Application Note AN897](http://retronik.fr/motorola/68K/68000/AN897_MC68008_minimum_configuration_system_%5BMotorola_1984_12p%5D.pdf) 

### Corrected Schematic
A corrected schematic will be made available once the errors have all been corrected and validated.
