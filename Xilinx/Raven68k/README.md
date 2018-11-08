# Raven68k VHDL Logic

This folder holds the Webpack ISE project for the glue logic that binds the Raven68k together.  It currently handles chip selection, /DTACK generation, and /IPL generation.


## CPLD Information
The logic has been designed to fit onto a single Xilinx XC9572XL CPLD.  The logic can be written directly to a XC9572XL chip or to a development board.  

The initial version was coded and tested against a [LC Technologies XC9572XL Development Board](http://www.chinalctech.com/index.php?_m=mod_product&_a=view&p_id=1022).  Schematics for this board can be found [here](https://www.openimpulse.com/blog/products-page/product-category/xc9572xl-xilinx-cpld-development-board/). 

**NOTE** -- this board uses the VQ44 packaging for the CPLD.  The pinout is different than that of the PLCC44.  Make sure that you update your layout before writing to the CPLD.


## Hardware description

The logic has been broken down into the following units for clarity as well as ease of extension:

 1. **dtack.vhd** -- This module watches for the /CS lines to activate on peripheral chips and sets /DTACK accordingly.  /DTACK is generated either from the /DTACK on the peripheral chip or after a specified delay time has passed.
 2. **mem_decoder.vhd** -- This module watches the address lines and generates the appropriate /CS lines based on them.  The /CS outputs are passed to **dtack.vhd** for the /DTACK generation.
 3. **irq.vhd** -- This module watches the /IRQ lines from all devices and generates the appropriate /IPL[0..2] for the CPU.

All of these modules are instantiated by the **cpld.vhd** module.  This module also handles the clock buffering and /OE generation.

## Future Plans

The **bus_error.vhd** file is unused at the moment.  It was intended to generate the /BERR signal to the CPU when an out-of-range access was attempted.
