# Raven68k - Revision 1

The specifications for the first revision 1 version of Raven68k are as follows:

- Motorola 68010 CPU
- 64kB of EEPROM for bootstrapping the Linux
- 1MB of Static RAM
- Motorola 68681 DUART with USB adapter on one UART and max233 on other
- Dallas DS12887A Real Time Clock
- Xilinx XC9572XL CPLD as system glue logic.

## Folder structure

*schematic/* - KiCad schematics for this revision.

*vhdl/* - The VHDL source for the CPLD that manages most of the TTL logic present on the development system.

*xilinx/* - The ISE WebPack (14.2) project itself, which targets a QFP44 XC9572XL breakout board.

