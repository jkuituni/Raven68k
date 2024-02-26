MEMORY
{
    ROM (rx) : ORIGIN = 0x00000000, LENGTH = 0x10000
    RAM (xrw) : ORIGIN = 0x200000, LENGTH = 0x100000
}

/* stack location */
stack_size = 1024;

_stack_start = ORIGIN(RAM)+LENGTH(RAM)-0x10;
_stack_end = _stack_start - stack_size;

/* ram location */
_ram_start = ORIGIN(RAM);
_ram_end = ORIGIN(RAM)+LENGTH(RAM);

SECTIONS { 
  .vectors 0x00 :
  {
    . = ALIGN(4);
    KEEP(*(.vectors))
    . = ALIGN(4);
  } > ROM

  .text 0x400 : {
    . = ALIGN(4);
    *(.text)
    . = ALIGN(4);
  } > ROM

  .data : { *(.data) } > RAM
  .bss :  { *(.bss)  *(COMMON) } > RAM
}

OUTPUT_ARCH(m68k)
