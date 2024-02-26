MEMORY
{
    ROM (rx) : ORIGIN = 0xFF0000, LENGTH = 0x10000
    RAM (xrw) : ORIGIN = 0x000000, LENGTH = 0x100000
}

/* ram location */
_ram_start = ORIGIN(RAM)+0x400;   /* after vectors */
_ram_end = ORIGIN(RAM)+LENGTH(RAM)-0x400;

/* rom location */
_rom_start = ORIGIN(ROM);
_rom_end = ORIGIN(ROM)+LENGTH(ROM);

SECTIONS {
  .text _rom_start : {
    . = ALIGN(4);
    KEEP(*(.vectors))
    . = ALIGN(4);
    *(.text)
    . = ALIGN(4);
  } > ROM

  .rodata : { *(.rodata) } > ROM
  .bss :  { *(.bss)  *(COMMON) } > RAM
}

OUTPUT_ARCH(m68k)
