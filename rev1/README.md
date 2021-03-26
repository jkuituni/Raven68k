# Raven68k - Revision 1

## Folder structure

*firmware/* - ROM images to boot and initialize the system

*software/* - S68 programs that can be loaded from the firmware. Many of these are built with [EASy68k](http://easy68k.com/)

*schematic/* - KiCad schematics for this revision. 

*vhdl/* - The vhdl source for the CPLD that manages most of the ttl logic present on the development system

*xilinx/* - The ISE WebPack (14.1) project itself, which targets a QFP44 XC9572XL breakout board