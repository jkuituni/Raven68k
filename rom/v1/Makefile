#
#
#
#
#
#
#

CC = m68k-elf-gcc
AS = m68k-elf-as
AR = m68k-elf-ar
LD = m68k-elf-ld

OBJDUMP = m68k-elf-objdump
OBJCOPY = m68k-elf-objcopy
SREC_CAT = srec_cat

all : test.S19 test.dis makeroms

crt0.o : crt0.S Makefile 
	m68k-elf-gcc -c -o crt0.o -m68010 crt0.S

test.o : test.c Makefile
	$(CC) test.c -o test.o -c -m68010 -fomit-frame-pointer

test.x : test.o crt0.o m68k.ld Makefile
	$(LD) -Map test.map crt0.o test.o  -Tm68k.ld -v -nostartfiles -o test.x 

test.S19 : test.x Makefile
	$(OBJCOPY) -O srec test.x test.S19

test.dis : test.x Makefile
	$(OBJDUMP) -d test.o > test.dis
crt0.dis : crt0.o Makefile
	$(OBJDUMP) -d crt0.o > crt0.dis

makeroms : test.S19 Makefile
	$(SREC_CAT) test.S19 -split 2 0 -o firmware.even.S19
	$(SREC_CAT) test.S19 -split 2 1 -o firmware.odd.S19
	$(SREC_CAT) firmware.even.S19 -fill 0x00 0x0000 0x8000 -o firmware.even.bin -binary
	$(SREC_CAT) firmware.odd.S19 -fill 0x00 0x0000 0x8000 -o firmware.odd.bin -binary

clean :
	rm *.o
	rm *.x
	rm *.dis
	rm *.map
