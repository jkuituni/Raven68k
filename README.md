# Raven68k
Raven 68k is a Motorola 68000 based simple single board computer. The machine will serve as a learning tool 
for building a 68000 based machine as well as for learning more about Linux. The goal is to eventually have 
the machine up and running uCLinux. The initial minimal specications for the machine are:

- Motorola 68000 CPU 
- 64kB of EEPROM for bootstrapping the Linux
- 1MB of Static RAM
- Motorola 68681 DUART with USB adapter on one UART and max233 on other
- Dallas DS1501Y RealTimeClock
- Classic 555 used for timer
- Mass storage of some description. Most likely a basic IDE will be implemented.

The project will be documented to a blog along with datasheets of all the components used.
 
