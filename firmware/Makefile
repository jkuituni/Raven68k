M68K=m68k-elf
AS=$(M68K)-as
LD=$(M68K)-ld
COPY=$(M68K)-objcopy
DUMP=$(M68K)-objdump 

ASFLAGS=-m68000 --warn --fatal-warnings --register-prefix-optional
LDFLAGS=-T m68k.ld
DUMPFLAGS=-m68000 -x -D

EEPROM=AT28C256
#EEPROM=SST39SF010A
PREFIX=m68k-

FMT=binary

SRCS=utils.s firmware.s monitor.s
OBJS=$(SRCS:.s=.o)
MAIN=firmware

.PHONY: dump clean

all:	$(MAIN)

.s.o:
	$(AS) $(ASFLAGS) -o $@ $<

$(MAIN): $(OBJS)
	$(LD) $(LDFLAGS) -o $(MAIN).a $(OBJS) -Map=$(MAIN).map
	$(COPY) -O srec $(MAIN).a $(MAIN).S68
	$(COPY) -O $(FMT) $(MAIN).a $(PREFIX)$(MAIN).bin
	$(COPY) -b 0 -i 2 --interleave-width=1 -j .text -O $(FMT) $(MAIN).a $(PREFIX)$(MAIN)-even.bin
	truncate -s 32768 $(PREFIX)$(MAIN)-even.bin
	$(COPY) -b 1 -i 2 --interleave-width=1 -j .text -O $(FMT) $(MAIN).a $(PREFIX)$(MAIN)-odd.bin
	truncate -s 32768 $(PREFIX)$(MAIN)-odd.bin

clean:
	rm -f *.o $(PREFIX)$(MAIN)-even.bin $(PREFIX)$(MAIN)-odd.bin $(PREFIX)$(MAIN).bin *.map *.o

prog_even:
	@echo Programming $(MAIN)-even onto $(EEPROM)
	minipro -p "$(EEPROM)" -w $(PREFIX)$(MAIN)-even.bin -s

prog_odd:
	@echo Programming $(MAIN)-odd onto $(EEPROM)
	minipro -p "$(EEPROM)" -w $(PREFIX)$(MAIN)-odd.bin -s

dump:	$(MAIN)
	$(DUMP) $(DUMPFLAGS) $(MAIN).a
