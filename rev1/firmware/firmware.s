/*
 * ::: Raven68k Firmware version 0.0.2 :::
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
  cmpi.b  #'H',%d0              | Is it 'H'elp?
  beq     .prntHelp             | Go to Print Help routine
  cmpi.b  #'R',%d0              | Is it 'R'eset?
  beq     .reset                | Go to Reset routine
  lea.l   _msgUnknown,%a0       | Unknown command!
  jsr     .prntMsg              | Complain about it..
  jmp     .run                  | Jump back to main loop
* ---- System RAM check
.chkRam:
  move.l  _ram_start,%a0        | Set the start of RAM
  move.l  _ram_end,%a1          | Set the end of RAM
.chkRamLoop:
  move.b  #0x00,%d1             | Set the first test pattern
  move.b  %d1,(%a0)             | Write test pattern to RAM
  move.b  (%a0)+,%d0            | Read from address location into d0
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
  jsr     .getChar              | Get a character from host
  cmp.b   #'S', %d0             | Records must start with 'S'
  bne     .SRecUpload           | If not, repeat getting chars until we get an 'S'
  
  jsr     .getChar              | Get character after 'S'
  cmp.b   #'9', %d0             | Test for an S9 terminator
  beq     _ld_s9                | Handle it..
  cmp.b   #'8', %d0             | Test for an S8 terminator
  beq     _ld_s8                | Handle it..
  cmp.b   #'1', %d0             | Test for an S1 record
  beq     _ld_s1                | Handle it..
  cmp.b   #'2', %d0             | Test for an S2 record
  beq     _ld_s2                | Handle it..
  bra     .SRecUpload           | Unknown terminator -> Go back to beginning

_ld_s1:
  clr.b   %d3                   | Clear the checksum
  jsr     _ld_get_byte          | Read the S1 byte count and address
  sub.b   #3, %d0               | Subtract 3 from record length
  move.b  %d0, %d2              | Save byte count in d2
  clr.l   %d0                   | Clear address accumulator
  jsr     _ld_get_byte          | Get MS byte of load address
  asl.l   #8, %d0               | Move it to MS position
  jsr     _ld_get_byte          | Get LS byte in d2
  move.l  %d0, %a2              | a2 points to destination of data
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
  bra     .SRecUpload           | Get next record

_ld_exit:
  cmpi.l  #0, %d7               | Check for errors
  bne     .SRecError            | Errors found, offer to reset
  lea     _msgSRecLoaded, %a0   | Send SRec loaded message
  jsr     .prntMsg
  move.l  %a2, %d0              | Get start address from SRec
  jsr     .send_hex_l           | Output the starting address
_ld_get_byte:
  jsr     .get_hex_b
  add.b   %d0, %d3              | Update checksum
  jmp     .run                  | SRec loaded -> Back to main routine
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
  jmp     %a2@                  | Jump to address in a2 register
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

* ---- Autovector handling routines
.stop:
  jmp .stop                     | Busy-Loop jumping to STOP
.unhandled:
  rte                           | Return exception
.reset:
  reset                         | Soft-Reset the CPU

* ---- Utility routines
.toupper:
  cmp.b   #'a',%d0
  ble.s   _notchar
  cmp.b   #'z',%d0
  bgt.s   _notchar
  sub.b   #32,%d0
  rts

.tolower:
  cmp.b   #'A',%d0
  ble.s   _notchar
  cmp.b   #'Z',%d0
  bgt.s   _notchar
  add.b   #32,%d0
_notchar:
  rts

* ---- Various system messages and prompts ----
.align(2)
_msgBanner:     .ascii  "::::: Raven68k - A Simple 68000 based computer\r\n"
                .ascii  ":::: Hardware revision 1.0\r\n"
                .asciz  "::: Firmware version v0.0.2\r\n\r\n"
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
_msgSRecLoaded: .asciz  "\r\nSRec data downloaded. The starting address is 0x"
.align(2)
_msgSRecRun:    .asciz  "Executing downloaded SRec..\r\n"
