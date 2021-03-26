# Raven68k
Raven 68k is a simple Motorola 68000-based single board computer. The machine will serve as a learning tool 
for building a 68000 based machine as well as for learning more about Linux. The goal is to eventually have 
the machine up and running uCLinux. The initial minimal specifications for the machine are:

- Motorola 68000 CPU 
- 64kB of EEPROM for bootstrapping the Linux
- 1MB of Static RAM
- Motorola 68681 DUART with USB adapter on one UART and max233 on other
- Dallas DS1501Y Real Time Clock
- Classic 555 used for periodic interrupt (task switching)
- Full Parallel IDE interface (SD connector optional)

The project will be documented to a blog along with datasheets of all the components used.

## Folder Structure
*rev1* - Files relating to Revision 1 of the Raven68k 
 
