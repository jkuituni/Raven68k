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

all : test.S19 test.dis

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
download: test.S19
	/media/disk/Projects/microrom/sw/microrom test.S19 -s -e512 -rl

clean :
	rm *.o
	rm *.x
	rm *.dis
	rm *.map
