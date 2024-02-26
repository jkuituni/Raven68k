# Raven68k
Raven 68k is a simple Motorola 68k family based single board computer. The machine will serve as a learning tool
for building a 68k based machines for learning on how to interface various chips and add on expansions for the
architecture. It is also aimed to be a platform for learning on how to write firmware and operating system level
code and how to implement the required logic in VHDL code to tie in all of the functionality required. We are
interested on eventually getting Linux up and running on the hardware as the Linux/m68k is still maintained and
it supports many of the basic building blocks.

The project will be documented to a blog along with datasheets of all the components used.

## Folder Structure
*datasheets/* -- The datasheets of the components used in various revisions of Raven.

*firmware/* - ROM images to boot and initialize the system.

*software/* - S68 programs that can be loaded from the firmware. Many of these are built with [EASy68k](http://easy68k.com/).

*hardware/* -- KiCAD schematics and other files as well as VHDL code for the CPLD are located here.

