# Raven68k - Revision 2

The specifications for the revision 2 version of Raven68k are as follows:

- Motorola 68010 CPU
- 64kB of EEPROM for bootstrapping the Linux
- Single 72pin SIMM socket for RAM. Upto 16MB supported.
- Motorola 68681 DUART with USB adapter on one UART and max233 on other
- Dallas DS12887A Real Time Clock
- Xilinx XC9572XL CPLD as system glue logic.

The revision 2 of Raven is intended as a minor improvement and bug fix version. Most likely no further revisions will be made and work will continue in a higher spec follow-up computer.

## Folder structure

*schematic/* - KiCad schematics for this revision.

*vhdl/* - The VHDL source for the CPLD that manages most of the TTL logic present and implements the DRAM controller. 

*xilinx/* - The ISE WebPack (14.2) project itself, which targets a QFP100 XC9572XL.
