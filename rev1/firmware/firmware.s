/*
 * ::: Raven68k Firmware version 0.1.0 :::
 *
 * WORK-IN-PROGRESS
 *
 * Contains currently routines for:
 * - System Init
 * - DUART Init.
 * - Serial port read and write
 * - Motorola SRec format binary download
 *
 * To use any of the routines with-in the ROM code, please
 * use the jump-table at the beginning of the ROM. Do *NOT*
 * jump directly to any of the routines contained with-in as
 * they and their locations are subject to change!
 *
 * Code from the following people have been used either as an
 * inspiration or adapted for use in this firmware:
 *
 * - Hayden Kroepfl
 * - Alan Garfield
 */

.include "raven68k.inc"

* ---- Variables and Defines
MAX_LINE_LENGTH     equ     80
BEL                 equ $07
BKSP                equ $08
TAB                 equ $09
LF                  equ $0A
CR                  equ $0D
ESC                 equ $1B
CTRLC	              equ	$03
CTRLX	              equ	$18
varCurAddr          equ _ram_end-4
varLineBuf          equ varCurAddr-MAX_LINE_LENGTH-2
varLast             equ varLineBuf

* ---- Vector locations ----
.section .vectors, "a"
.title "Init vectors"
.long   _stack_start
.long   .init
.long   .unhandled  | bus error
.long   .unhandled  | addr error
.long   .unhandled  | illegal instruction
.long   .unhandled  | divide by zero
.rept 0xfa
.long .unhandled
.endr

* ---- Firmware Jump-Table ----
.section .text

.long   .init                   | Firmware init routine
.long   .chkRam                 | System RAM check
.long   .prntChar               | Print a char in d0
.long   .getChar                | Read a char into d0
.long   .prntMsg                | Print a message in a0
.long   .initDuart              | Init the 68681 Duart to 9600,8,n,1
.long   .SRecUpload             | Upload Motorola SRecord format binary
.long   .SRecExec               | Execute Motorola SRecord format binary

* ---- Firmware Init ----
.init:
  move.w  #0x2700, %sr          | mask interrupts and set supervisor mode
  jsr     .initDuart            | Init the DUART serial port console connection
  lea.l   _msgBanner,%a0        | Set the banner message pointer
  jsr     .prntMsg              | Print out the message
  lea.l   _msgRamTst,%a0        | Set the RAM test message pointer
  jsr     .prntMsg              | Print out the message
.ramtst:
  jmp     .chkRam               | Jump to check RAM
.ramtstok:
  lea.l   _msgRamOK,%a0         | Set RAM pass message pointer
  jsr     .prntMsg              | Print out the message
* ---- Main Run Loop
  jsr     .prntHelp
.run:
  lea.l   _msgPrompt,%a0        | Set the prompt message pointer
  jsr     .prntMsg              | Print out the message
  jsr     .getChar              | Get command
  cmpi.b  #'U',%d0              | Is it 'U'pload?
  beq     .SRecUpload           | Go to SRec upload routine
  cmpi.b  #'E',%d0              | Is it 'E'xecute?
  beq     .SRecExec             | Go to SRecExecute routine
  cmpi.b  #'M',%d0              | Is it 'M'achine monitor?
  beq     monitorStart          | Go to built-in Machine Monitor
  cmpi.b  #'H',%d0              | Is it 'H'elp?
  beq     .prntHelp             | Go to Print Help routine
  cmpi.b  #'R',%d0              | Is it 'R'eset?
  beq     .reset                | Go to Reset routine
  lea.l   _msgUnknown,%a0       | Unknown command!
  jsr     .prntMsg              | Complain about it..
  jmp     .run                  | Jump back to main loop
* ---- System RAM check
.chkRam:
  move.l  #_ram_start,%a0        | Set the start of RAM
  move.l  #_ram_end,%a1          | Set the end of RAM
.chkRamLoop:
  move.b  #0x00,%d1             | Set the first test pattern
  move.b  %d1,(%a0)             | Write test pattern to RAM
  move.b  (%a0),%d0             | Read from address location into d0
  cmp.b   %d1,%d0               | Compare if it was written correctly
  bne     .prntRamError         | No -> Print error message
  move.b  #0xff,%d1             | Set second test pattern
  move.b  %d1,(%a0)             | Write test pattern to RAM
  move.b  (%a0)+,%d0            | Read from address location into d0
  cmp.b   %d1,%d0               | Compare if it was written correctly
  bne     .prntRamError         | No -> Print error message
  cmpa.l  %a0,%a1               | Are we at the end of memory range?
  bne     .chkRamLoop           | No -> Loop
  jmp     .ramtstok             | All done -> Return
* ---- PrintChar ----
.prntChar:
  lea     _uarts, %a5           | Load UART base address
_ctxrdy:
  btst    #2, %a5@(_ua_sra)     | Test TxRDY bit in status register
  beq     _ctxrdy               | Not ready yet -> loop
  move.b  %d0, %a5@(_ua_tba)    | Send character in d0 to console
  rts                           | Return
* -- GetChar ----
.getChar:
  lea     _uarts, %a5           | Load UART base address
_crxrdy:
  btst    #0, %a5@(_ua_sra)     | Test RxRDY bit in status register
  beq     _crxrdy               | Not ready yet -> loop
  move.b  %a5@(_ua_rba), %d0    | Read character from console to d0
  rts                           | Return
* ---- PrintMsg ----
.prntMsg:
.prntLoop:
  move.b  %a0@+,%d0             | Load first char from message
  jsr     .prntChar             | Print it
  tst.b   %a0@                  | Check if there's more to send
  bne     .prntLoop             | Yes -> loop
  rts                           | No -> return
* ---- Init 68681 DUART ----
.initDuart:
  lea     _uarts, %a0
  move.b  #0x30, %a0@(_ua_cra)  | Reset RX
  move.b  #0x20, %a0@(_ua_cra)  | Reset TX
  move.b  #0x10, %a0@(_ua_cra)
  move.b  #0x80, %a0@(_ua_acr)  | Set 2 of BRG baud rates
  move.b  #0xBB, %a0@(_ua_csra) | Set TX and RX to 9600
  move.b  #0x13, %a0@(_ua_mra)  | 8 bits, no parity, char error mode, char status in ISR for RX rather than full fifo
  move.b  #0x07, %a0@(_ua_mra)  | Set one stop bit, no cts/rts, normal mode
  move.b  #0x05, %a0@(_ua_cra)  | Enable TX and RX
  rts                           | Return

* -- SRecord utility routines
.SRecUpload:
  movem.l d0-d7/a0-a6,(sp)+     | Save registers to stack
_ld_up:
  jsr     .getChar              | Get a character from host
  cmp.b   #'S', %d0             | Records must start with 'S'
  bne     .ld_up                | If not, repeat getting chars until we get an 'S'
  jsr     .getChar              | Get character after 'S'
  cmp.b   #'9', %d0             | Test for an S9 terminator
  beq     _ld_s9                | Handle it..
  cmp.b   #'8', %d0             | Test for an S8 terminator
  beq     _ld_s8                | Handle it..
  cmp.b   #'1', %d0             | Test for an S1 record
  beq     _ld_s1                | Handle it..
  cmp.b   #'2', %d0             | Test for an S2 record
  beq     _ld_s2                | Handle it..
  bra     .ld_up                | Unknown terminator -> Go back to beginning
_ld_s1:
  clr.b   %d3                   | Clear the checksum
  jsr     _ld_get_byte          | Read the S1 byte count and address
  sub.b   #3, %d0               | Subtract 3 from record length
  move.b  %d0, %d2              | Save byte count in d2
  move.l  %d2, _SRecLoadSize    | Store loadsize
  clr.l   %d0                   | Clear address accumulator
  jsr     _ld_get_byte          | Get MS byte of load address
  asl.l   #8, %d0               | Move it to MS position
  jsr     _ld_get_byte          | Get LS byte in d2
  move.l  %d0, %a2              | a2 points to destination of data
  move.l  %a2, _SRecLoadAddr    | Store load address
  bra     _ld_data              | Load the data
_ld_s2:
  clr.b   %d3                   | Clear the checksum
  jsr     _ld_get_byte          | Read the S2 byte count and address
  sub.b   #4, %d0               | Calculate size of data field
  move.b  %d0, %d2              | d2 contains data bytes to read
  clr.l   %d0                   | Clear address accumulator
  jsr     _ld_get_byte          | Read MS byte of address
  asl.l   #8, %d0               | Move it one byte left
  jsr     _ld_get_byte          | Read middle byte of address
  asl.l   #8, %d0               | Move it one byte left
  jsr     _ld_get_byte          | Read LS byte of address
  move.l  %d0, %a2              | a2 points to destination of record
  bra     _ld_data              | Load the data
_ld_s8:
  clr.b   %d3                   | Clear the checksum
  jsr     _ld_get_byte          | Read the S8 byte count and address
  move.b  %d0, %d2              | d2 contains data bytes to read
  clr.l   %d0                   | Clear address accumulator
  jsr     _ld_get_byte          | Read MS byte of address
  asl.l   #8, %d0               | Move it one byte left
  jsr     _ld_get_byte          | Read middle byte of address
  asl.l   #8, %d0               | Move it one byte left
  jsr     _ld_get_byte          | Read LS byte of address
  move.l  %d0, %a2              | a2 points to destination of record
  bra     _ld_terminate         | Return
_ld_s9:
  clr.b   %d3                   | Clear the checksum
  jsr     _ld_get_byte          | Read the S9 byte count and address
  move.b  %d0, %d2              | Save byte count in d2
  clr.l   %d0                   | Clear address accumulator
  jsr     _ld_get_byte          | Get MS byte of load address
  asl.l   #8, %d0               | Move it to MS position
  jsr     _ld_get_byte          | Get LS byte in D2
  move.l  %d0, %a2              | a2 points to destination of data
  bra     _ld_terminate         | Return
_ld_data:
  jsr     _ld_get_byte          | Get byte of data for loading
  move.b  %d0, %a2@+            | Store it
  sub.b   #1, %d2               | Decrement byte counter
  bne     _ld_data              | Repeat until count = 0
  jsr     _ld_get_byte          | Read checksum
  add.b   #1, %d3               | Add 1 to total checksum
  beq     _ld_data_ok           | If zero then  draw a dot to console
  or.b    #0b00001000, %d7      | Else set checksum error bit
_ld_terminate:
  btst.b  #0, %d7               | Test for input errors
  beq     _ld_chksum            | If no errors check the checksum
  lea     _msgErrNotHex, %a0    | Send error message to console
  jsr     .prntMsg

_ld_chksum:
  btst.b  #3, %d7               | Test for checksum errors
  beq     _ld_exit              | If no errors return
  lea     _msgErrChksum, %a0    | Send error message to console
  jsr     .prntMsg
  bra     _ld_exit
_ld_data_ok:
  move.b  #'.', %d0             | Send a '.' to console
  jsr     .prntChar
  bra     .ld_up                | Get next record
_ld_exit:
  cmpi.l  #0, %d7               | Check for errors
  bne     .SRecError            | Errors found, offer to reset
  lea     _msgSRecLoaded, %a0   | Send SRec loaded message
  jsr     .prntMsg
  move.l  %d2, %d0              | Get SRec size
  jsr     .send_hex_l           | Output the size
  move.l  %a2, %d0              | Get load address
  loa     _msgSRecLoaded2, %a0  | Get rest of the message line
  jsr     .PrintMsg
_ld_get_byte:
  jsr     .get_hex_b
  add.b   %d0, %d3              | Update checksum
  movem.l (sp)+,d0-d7/a0-a6     | Restore stored registers from stack
  rts                           | SRec loaded -> Back to main routine
.send_hex_n:
  movem.l %d0, %a7@-            | Save d0 to stack
  and.b   #0x0f, %d0            | Mask off MS nybble
  add.b   #0x30, %d0            | Convert to ASCII
  cmp.b   #0x39, %d0            | ASCII = HEX + 0x30
  bls     _send_low             | If ASCII <= 39 then print and exit
  add.b   #0x07, %d0            | Else ASCII = HEX + 7
_send_low:
  jsr     .prntChar             | Print the character to the console
  movem.l %a7@+, %d0            | Restore d0 from stack
  rts
.send_hex_b:
  ror.b   #4, %d0               | Move MS nybble to the LS nybble
  jsr     .send_hex_n           | Send the MS nybble hex
  rol.b   #4, %d0               | Restore the LS nybble
  bra     .send_hex_n           | Send the LS nybble hex and return
.send_hex_w:
  ror.w   #8, %d0               | Move MS byte to the LS byte
  jsr     .send_hex_b           | Send the MS byte HEX
  rol.w   #8, %d0               | Restore the LS byte
  bra     .send_hex_b           | Send the LS byte HEX and return
.send_hex_l:
  swap    %d0                   | Move MS word to the LS word
  jsr     .send_hex_w           | Send the MS word HEX
  swap    %d0                   | Restore the LS word
  bra     .send_hex_w           | Send the LS word HEX and return
.get_hex_n:
  jsr     .getChar              | Get character from console
  sub.b   #0x30, %d0            | Drop ASCII down to numbers
  bmi     _not_hex              | Check we didn't underflow on not numerics
  cmp.b   #0x09, %d0            | Check we're a number <= 9
  ble     _hex_ok               | OK, we got a number, job done
  sub.b   #0x07, %d0            | Move ASCII down to 'A'
  cmp.b   #0x0F, %d0            | Check we're between A-F
  ble     _hex_ok               | OK, we are in A-F range, job done
_not_hex:
  or.b    #1, %d7               | Not a HEX value, set flag
_hex_ok:
  rts
.get_hex_b:
  movem.l %d1, %a7@-            | Save d1 to stack
  jsr     .get_hex_n            | Get first hex character
  asl.b   #4, %d0               | Move value to MS nybble position
  move.b  %d0, %d1              | Save MS nybble in d1
  bsr     .get_hex_n            | Get second HEX character
  add.b   %d1, %d0              | Merge the MS and LS nybbles
  movem.l %a7@+, %d1            | Restore d1 from stack
  rts
.SRecError:
  lea     _msgSRecErr,%a0       | Set SRec Error message pointer
  jsr     .prntMsg              | Print the message
  jmp     .run                  | Jump back to main routine
.SRecExec:
  lea.l   _msgSRecRun,%a0       | Set runSRec message pointer
  jsr     .prntMsg              | Print the message
  lea.l   _SRecLoadAddr,%a2     | Load the pointer to loaded SRec
  jmp     %a2@                  | Jump to address in a2 register

* -- Built-in machine monitor by Hayden Kroeplf
* -- Ported to run for Raven from firmware ROM

monitorStart:
    lea     msgBanner, %a0      | Show monitor banner
    jsr     .prntMsg            | Print the message
    lea     msgHelp,   %a0      | And the command help message
    jsr     .prntMsg            | Print the message
monitorLine:                    | Our main monitor loop
    lea     msgPrompt, %a0      | Prompt
    jsr     .prntMsg            | Print the message
    bsr.w   readLine            | Read in the line
    bsr.w   lineToUpper         | Convert to upper-case for ease of parsing
    bsr.w   parseLine           | Then parse and respond to the line
    bra.s   monitorLine
parseLine:
    movem.l %a2-%a3, -(%sp)     | Save registers
    lea     varLineBuf, %a0
 .findCommand:
    move.b  (%a0)+, %d0
    cmp.b   #' ', %d0           | Ignore spaces
    beq.w   .findCommand
    cmp.b   #'E', %d0           | Examine command
    beq.w   .examine
    cmp.b   #'D', %d0           | Deposit command
    beq.w   .deposit
    cmp.b   #'R', %d0           | Run command
    beq.w   .run
    cmp.b   #'H', %d0           | Help command
    beq.w   .help
    cmp.b   #0, %d0             | Ignore blank lines
    beq.s   .exit
 .invalid:
    lea     msgInvalidCommand, %a0
    bsr.w   .prntMsg
 .exit:
    movem.l (sp)+, %a2-%a3      | Restore registers
    rts
 .examine:
    bsr.w   parseNumber         | Read in the start address
    tst.b   %d1                 | Make sure it's valid (parseNumber returns non-zero in d1 for failure)
    bne.w   .invalidAddr
    move.l  %d0, %a3            | Save the start address
 .exloop:
    move.b  (%a0)+, %d0
    cmp.b   #' ', %d0           | Ignore spaces
    beq.s   .exloop
    cmp.b   #'-', %d0           | Check if it's a range specifier
    beq.s   .exrange
    cmp.b   #'+', %d0           | Check if it's a length specifier
    beq.s   .exlength
    cmp.b   #';', %d0           | Check if we're going interactive
    beq.s   .exinter
    cmp.b   #'.', %d0           | Check if quick 16
    beq.s   .exquick
    move.l  #1, %d0             | Otherwise read in a single byte
    bra.s   .exend
 .exrange:
    bsr.w   parseNumber         | Find the end address
    tst.b   %d1                 | Check if we found a valid address
    bne.w   .invalidAddr
    sub.l   %a3, %d0            | Get the length
    bra.s   .exend
 .exquick:                      | Quick mode means show one line of 16 bytes
    move.l  #$10, %d0
    bra.s   .exend
 .exlength:                     | Length mode means a length is specified
    bsr.w   parseNumber         | Find the length
    tst.b   %d1
    bne.w   .invalidAddr
 .exend:                        | We're done parsing, give the parameters to dumpRAM and exit
    move.l  %a3, %a0
    bsr.w   dumpRAM
    bra.s   .exit
 .exinter:                      | Interactive mode, Space shows 16 lines, enter shows 1.
    move.l  %a3, %a0            | Current Address
    move.l  #$10, %d0           | 16 bytes
    bsr.w   dumpRAM             | Dump this line
    add.l   #$10, %a3           | Move up the current address 16 bytes
 .exinterend:
    bsr.w   inChar
    cmp.b   #CR, %d0            | Display another line
    beq.s   .exinter
    cmp.b   #' ', %d0           | Display a page (256 bytes at a time)
    beq.s   .exinterpage
    bra.s   .exit               | Otherwise exit
 .exinterpage:
    move.l  %a3, %a0
    move.l  #$100, %d0          | 256 bytes
    bsr.w   dumpRAM             | Dump 16 lines of RAM
    add.l   #$100, %a3          | Move up the current address by 256
    bra.s   .exinterend
 .deposit:
    move.b  (%a0), %d0
    cmp.b   #':', %d0           | Check if we want to continue from last
    beq.s   .depCont
    bsr.w   parseNumber         | Otherwise read the address
    tst.b   %d1
    bne.s   .invalidAddr
    move.l  %d0, %a3            | Save the start address
 .depLoop:
    move.b  (%a0), %d0
    cmp.b   #';', %d0           | Check for continue
    beq.s   .depMultiline
    tst     %d0                 | Check for the end of line
    beq     .depEnd
    bsr.s   parseNumber         | Otherwise read a value
    tst.b   %d1
    bne.s   .invalidVal
    cmp.w   #255, %d0           | Make sure it's a byte
    bgt.s   .invalidVal
    move.b  %d0, (%a3)+         | Store the value into memory
    bra.s   .depLoop

 .depCont:
    move.l  varCurAddr, %a3     | Read in the last address
    addq.l  #1, %a0             | Skip over the ':'
    bra.s   .depLoop

 .depMultiline:
    lea     msgDepositPrompt, %a0
    bsr.w   .prntMsg
    bsr.w   readLine            | Read in the next line to be parsed
    bsr.w   lineToUpper         | Convert to uppercase
    lea     varLineBuf, %a0     | Reset our buffer pointer
    bra.s   .depLoop            | And jump back to decoding
 .depEnd:
    move.l  %a3, varCurAddr
    bra.w   .exit
 .run:
    bsr.w   parseNumber         | Otherwise read the address
    tst.b   %d1
    bne.s   .invalidAddr
    move.l  %d0, %a0
    jsr     (%a0)               | Jump to the code!
                                | Go as subroutine to allow code to return to us
    jsr     monitorStart        | Warm start after returning so everything is in
                                | a known state.
 .help:
    lea     msgHelp, %a0
    bsr.w   .prntMsg
    bra.w   .exit
 .invalidAddr:
    lea     msgInvalidAddress, %a0
    bsr.w   .prntMsg
    bra.w   .exit
 .invalidVal:
    lea     msgInvalidValue, %a0
    bsr.w   .prntMsg
    bra.w   .exit
parseNumber:
    eor.l   %d0, %d0            | Zero out d0
    move.b  (%a0)+, %d0
    cmp.b   #' ', %d0           | Ignore all leading spaces
    beq.s   parseNumber
    cmp.b   #'0', %d0           | Look for hex digits 0-9
    blt.s   .invalid
    cmp.b   #'9', %d0
    ble.s   .firstdigit1
    cmp.b   #'A', %d0           | Look for hex digits A-F
    blt.s   .invalid
    cmp.b   #'F', %d0
    ble.s   .firstdigit2
 .invalid:
    move.l  #1, %d1             | Invalid character, mark failure and return
    rts
 .firstdigit2:
    sub.b   #'7', %d0           | Turn 'A' to 10
    bra.s   .loop
 .firstdigit1:
    sub.b   #'0', %d0           | Turn '0' to 0
 .loop:
    move.b  (%a0)+, %d1         | Read in a digit
    cmp.b   #'0', %d1           | Look for hex digits 0-9
    blt.s   .end                | Any other characters mean we're done reading
    cmp.b   #'9', %d1
    ble.s   .digit1
    cmp.b   #'A', %d1           | Look for hex digits A-F
    blt.s   .end
    cmp.b   #'F', %d1
    ble.s   .digit2
.end:                           | We hit a non-hex digit character, we're done parsing
    subq.l  #1, %a0             | Move the pointer back before the end character we read
    move.l  #0, %d1
    rts
 .digit2:
    sub.b   #'7', %d1           | Turn 'A' to 10
    bra.s   .digit3
 .digit1:
    sub.b   #'0', %d1           | Turn '0' to 0
 .digit3:
    lsl.l   #4, %d0             | Shift over to the next nybble
    add.b   %d1, %d0            | Place in our current nybble (could be or.b instead)
    bra.s   .loop
dumpRAM:
    movem.l %d2-%d4/%a2, -(sp)  | Save registers
    move.l  %a0, %a2            | Save the start address
    move.l  %d0, %d2            | And the number of bytes
 .line:
    move.l  %a2, %d0
    bsr.w   printHexAddr        | Starting address of this line
    lea     msgColonSpace, %a0
    bsr.w   .prntMsg
    move.l  #16, %d3            | 16 Bytes can be printed on a line
    move.l  %d3, %d4            | Save number of bytes on this line
 .hexbyte:
    tst.l   %d2                 | Check if we're out of bytes
    beq.s   .endbytesShort
    tst.b   %d3                 | Check if we're done this line
    beq.s   .endbytes
    move.b  (%a2)+, %d0         | Read a byte in from RAM
    bsr.w   printHexByte        | Display it
    move.b  #' ', %d0
    bsr.w   .prntChar           | Space out bytes
    subq.l  #1, %d3
    subq.l  #1, %d2
    bra.s   .hexbyte
 .endbytesShort:
    sub.b   %d3, %d4            | Make d4 the actual number of bytes on this line
    move.b  #' ', %d0
 .endbytesShortLoop:
    tst.b   %d3                 | Check if we ended the line
    beq.s   .endbytes
    move.b  #' ', %d0
    bsr.w   .prntChar           | Three spaces to pad out
    move.b  #' ', %d0
    bsr.w   .prntChar
    move.b  #' ', %d0
    bsr.w   .prntChar
    subq.b  #1, %d3
    bra.s   .endbytesShortLoop
 .endbytes:
    suba.l  %d4, %a2            | Return to the start address of this line
 .endbytesLoop:
    tst.b   %d4                 | Check if we're done printing ascii
    beq     .endline
    subq.b  #1, %d4
    move.b  (%a2)+, %d0         | Read the byte again
    cmp.b   #' ', %d0           | Lowest printable character
    blt.s   .unprintable
    cmp.b   #'~', %d0           | Highest printable character
    bgt.s   .unprintable
    bsr.w   .prntChar
    bra.s   .endbytesLoop
 .unprintable:
    move.b  #'.', %d0
    bsr.w   .prntChar
    bra.s   .endbytesLoop
 .endline:
    lea     msgNewline, %a0
    bsr.w   .prntMsg
    tst.l   %d2
    ble.s   .end
    bra.w   .line
 .end:
    movem.l (sp)+, %d2-%d4/%a2  | Restore registers
    rts
readLine:
    movem.l %d2/%a2, -(sp)      | Save changed registers
    lea     varLineBuf, %a2     | Start of the lineBuffer
    eor.w   %d2, %d2            | Clear the character counter
 .loop:
    bsr.w   .getChar            | Read a character from the serial port
    cmp.b   #BKSP, %d0          | Is it a backspace?
    beq.s   .backspace
    cmp.b   #CTRLX, %d0         | Is it Ctrl-H (Line Clear)?
    beq.s   .lineclear
    cmp.b   #CR, %d0            | Is it a carriage return?
    beq.s   .endline
    cmp.b   #LF, %d0            | Is it anything else but a LF?
    beq.s   .loop               | Ignore LFs and get the next character
 .char:                         | Normal character to be inserted into the buffer
    cmp.w   #MAX_LINE_LENGTH, %d2
    bge.s   .loop               | If the buffer is full ignore the character
    move.b  %d0, (%a2)+         | Otherwise store the character
    addq.w  #1, %d2             | Increment character count
    bsr.w   .prntChar           | Echo the character
    bra.s   .loop               | And get the next one
 .backspace:
    tst.w   %d2                 | Are we at the beginning of the line?
    beq.s   .loop               | Then ignore it
    bsr.w   .prntChar           | Backspace
    move.b  #' ', %d0
    bsr.w   .prntChar           | Space
    move.b  #BKSP, %d0
    bsr.w   .prntChar           | Backspace
    subq.l  #1, %a2             | Move back in the buffer
    subq.l  #1, %d2             | And current character count
    bra.s   .loop               | And goto the next character
 .lineclear:
    tst     %d2                 | Anything to clear?
    beq.s   .loop               | If not, fetch the next character
    suba.l  %d2, %a2            | Return to the start of the buffer
 .lineclearloop:
    move.b  #BKSP, %d0
    bsr.w   .prntChar           | Backspace
    move.b  #' ', %d0
    bsr.w   .prntChar           | Space
    move.b  #BKSP, %d0
    bsr.w   .prntChar           | Backspace
    subq.w  #1, %d2
    bne.s   .lineclearloop      | Go till the start of the line
    bra.s   .loop
 .endline:
    bsr.w   .prntChar           | Echo the CR
    move.b  #LF, %d0
    bsr.w   .prntChar           | Line feed to be safe
    move.b  #0, (%a2)           | Terminate the line (Buffer is longer than max to allow this at full length)
    movea.l %a2, %a0            | Ready the pointer to return (if needed)
    movem.l (sp)+, %d2/%a2      | Restore registers
    rts                         | And return
printNewline:
    lea     msgNewline, %a0
printString:
 .loop:
    move.b  (%a0)+, %d0         | Read in character
    beq.s   .end                | Check for the null

    bsr.s   .prntChar           | Otherwise write the character
    bra.s   .loop               | And continue
 .end:
    rts
printHexWord:
    move.l  %d2, -(sp)          | Save d2
    move.l  %d0, %d2            | Save the address in d2

    rol.l   #8, %d2             | 4321 -> 3214
    rol.l   #8, %d2             | 3214 -> 2143
    bra.s   printHex_wordentry  | Print out the last 16 bits
printHexAddr:
    move.l %d2, -(sp)           | Save d2
    move.l %d0, %d2             | Save the address in d2
    rol.l   #8, %d2             | 4321 -> 3214
    bra.s   printHex_addrentry  | Print out the last 24 bits
printHexLong:
    move.l  %d2, -(sp)          | Save d2
    move.l  %d0, %d2            | Save the address in d2
    rol.l   #8, %d2             | 4321 -> 3214 high byte in low
    move.l  %d2, %d0
    bsr.s   printHexByte        | Print the high byte (24-31)
printHex_addrentry:
    rol.l   #8, %d2             | 3214 -> 2143 middle-high byte in low
    move.l  %d2, %d0
    bsr.s   printHexByte        | Print the high-middle byte (16-23)
printHex_wordentry:
    rol.l   #8, %d2             | 2143 -> 1432 Middle byte in low
    move.l  %d2, %d0
    bsr.s   printHexByte        | Print the middle byte (8-15)
    rol.l   #8, %d2
    move.l  %d2, %d0
    bsr.s   printHexByte        | Print the low byte (0-7)
    move.l (sp)+, %d2           | Restore d2
    rts
printHexByte:
    move.l  %d2, -(sp)
    move.b  %d0, %d2
    lsr.b   #$4, %d0
    add.b   #'0', %d0
    cmp.b   #'9', %d0           | Check if the hex number was from 0-9
    ble.s   .second
    add.b   #7, %d0             | Shift 0xA-0xF from ':' to 'A'
.second:
    bsr.s   .prntChar           | Print the digit
    andi.b  #$0F, %d2           | Now we want the lower digit Mask only the lower digit
    add.b   #'0', %d2
    cmp.b   #'9', %d2           | Same as before
    ble.s   .end
    add.b   #7, %d2
.end:
    move.b  %d2, %d0
    bsr.s   .prntChar           | Print the lower digit
    move.l  (sp)+, %d2
    rts

* -- General utility routines
.prntRamError:
  move.l  %a0,%d0               | Save current RAM address
  lea.l   _msgRamErr,%a0        | Set RAM Error message pointer
  jsr     .prntMsg              | Print the message
  jsr     .prntChar             | Print the RAM location in d0
  jmp     .stop                 | Die
.prntHelp:
  lea.l   _msgHelp,%a0          | Set Help message pointer
  jsr     .prntMsg              | Print the message
  jmp     .run                  | Jump back to main routine
lineToUpper:
  lea     varLineBuf, %a0   * Get the start of the line buffer
.loop:
  move.b  (%a0), %d0         * Read in a character
  cmp.b   #'a', %d0
  blt.s   .next            * Is it less than lower-case 'a', then move on
  cmp.b   #'z', %d0
  bgt.s   .next            * Is it greater than lower-case 'z', then move on
  sub.b   #$20, %d0         * Then convert a to A, b to B, etc.
.next:
  move.b  %d0, (%a0)+        * Store the character back into a0, and move to the next
  bne.s   .loop            * Keep going till we hit a null terminator
  rts

* ---- Autovector handling routines
.stop:
  jmp .stop                     | Busy-Loop jumping to STOP
.unhandled:
  rte                           | Return exception
.reset:
  reset                         | Soft-Reset the CPU

* ---- Various system messages and prompts ----
.align(2)
_msgBanner:     .ascii  "::::: Raven68k - A Simple 68000 based computer\r\n"
                .ascii  ":::: Hardware revision 1.0\r\n"
                .asciz  "::: Firmware version v0.1.0\r\n\r\n"
.align(2)
_msgRamTst:     .asciz  "Checking RAM memory...\r\n"
.align(2)
_msgRamOK:      .asciz "OK!\r\n\r\n"
.align(2)
_msgRamErr:     .asciz "\fERROR at location : "
.align(2)
_msgNewLine:    .asciz  "\r\n"
.align(2)
_msgPrompt:     .asciz  "Ready:\r\n"
.align(2)
_msgHelp:       .ascii  "Commands:\r\n"
                .ascii  "(U)pload SRec (S19/S28) file\r\n"
                .ascii  "(E)xecute SRec file\r\n"
                .ascii  "(M)achine monitor file\r\n"
                .ascii  "(H)elp\r\n"
                .asciz  "(R)eset\r\n\r\n"
.align(2)
_msgUnknown:    .asciz  "Unknown command!\r\n"
.align(2)
_msgErrNotHex:  .asciz  "Invalid HEX value!\r\n"
.align(2)
_msgErrChksum:  .asciz  "Checksum Error!\r\n"
.align(2)
_msgSRecErr:    .asciz  "\r\nThere was an error loading the SRec data (as shown above).\r\n"
.align(2)
_msgSRecLoaded: .asciz  "\r\nLoaded
.align(2)
_msgSRecLoaded2: .asciz " bytes starting from "
.align(2)
_msgSRecRun:    .asciz  "Executing downloaded SRec..\r\n"
.align(2)
_SRecLoadAddr:  dc.l 0;
.align(2)
_SRecLoadSize:  dc.l 0;
.align(2)
msgBanner:
               .ascii "Chartreuse's 68000 ROM Monitor"
               .ascii "** Ported for Raven **
               .asciz "=============================="
.align(2)
msgHelp:
               .ascii "Available Commands: "
               .asciz "(E)xamine    (D)eposit    (R)un     (H)elp"
.align(2)
msgDepositPrompt:
               .asciz ': ',0
.align(2)
msgPrompt:
               .asciz '> ',0
.align(2)
msgInvalidCommand:
               .asciz 'Invalid Command',CR,LF,0
.align(2)
msgInvalidAddress:
               .asciz 'Invalid Address',CR,LF,0
.align(2)
msgInvalidValue:
               .asciz 'Invalid Value',CR,LF,0
