/*
 * based on linker code found at https://groups.google.com/forum/#!topic/comp.sys.m68k/nupIo9ypu2E
 * which in turn comes from code at http://bitsnbikes.blogspot.fr/2010/02/das-blinklicht-with-gcc-elf-m68k.html
 */

OUTPUT_FORMAT(srec)
OUTPUT_ARCH(m68k) 
OUTPUT(rom.srec) /* The default filename, if -o is missing */ 
SEARCH_DIR(.)  /* include CRT0.S */ 
/* removed libraries path pointing nowhere, might need to correct this... - JS */

/* Define where RAM and EPROM areas reside. 
  * This gives the linker a rough possibility to detect errors while linking,
  * for example a .text-section growing bigger than 64k. 
  * Don't rely too heavy on this, it can detect only very crude errors. 
  */ 
  /* moved before sections -JS */ 
MEMORY { 
   rom : ORIGIN = 0x00110000, LENGTH = 64K 
   ram : ORIGIN = 0x00000400, LENGTH = 1023k /* after the 1k byte of vectors */
} 

SECTIONS 
{ 
         /* Text section at start of ROM 
          * The next line tells the linker that the EPROM on my board starts 
          * at 0x00110000. The command AT (0) places the code on address 0 in
          * the S-Record output file, ready for burning in an EPROM. 
          */ 
         .text   0x00110000 : AT (0) 
         { 
         LONG (0x00110000)       /* RESET SSP - JS */ 
         LONG (___main)          /* RESET PC - JS */ 
                 __s_text = . ;  /* Define a symbol */ 
                 *     (.text) 
                 CONSTRUCTORS 
                 __e_text = . ;  /* Those symbols are used by crt0.S */ 
         } > rom 

         /* Data section; initialisation data is stored immediately 
          * after the text section in the ROM, but is loaded for 
          * use in RAM 
          * Again, the first address (0x00000400) tells the linker where 
          * the RAM is mapped, while AT (SIZEOF(.text)) puts the initial data`
          * into the output file right after the end of the .text section, 
          * from where it can be copied into RAM on startup. 
          */ 

         .data   0x00000400 : AT (SIZEOF(.text)) 
         { 
                 __s_data = . ; /* Symbols, to know where to */ 
                 *(.data) 
                 __e_data = . ; /* copy the data.            */ 
         } > ram 

         /* BSS section: 
          * 0x00000400 + SIZEOF(.data) places the .bss-section into the RAM 
          * right after the .data-section. The defined symbols enable the 
          * startup code to clear this RAM area. 
          */ 
         .bss    0x00000400 + SIZEOF(.data) : 
         { 
                 __s_bss = . ; /* We should be able */ 
                 *(.bss) 
                 *(COMMON) 
                 __e_bss = . ; /* to clear the bss. */ 
         } > ram 
} 
