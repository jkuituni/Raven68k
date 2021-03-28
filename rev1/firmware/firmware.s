/*
 * ::: Raven68k Firmware version 0.0.1 :::
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

// ---- Vector locations ----

.long   _stack_start            | Initial StackPointer
.long   .init                   | Initial ProgramCounter
.long   .unhandled              | Bus error
.long   .unhandled              | Address error
.long   .unhandled              | Illegal instruction
.long   .unhandled              | Divide by zero
.rept   0x2e
.long   .reset
.endr
.rept   0x40
.long   0xffffffff
.endr
.rept   0x80
.long   .reset

// ---- Firmware Jump-Table ----
.long   .init                   | Firmware init routine
.long   .chkRam                 | System RAM check
.long   .prntChar               | Print a char in d0
.long   .getChar                | Read a char into d0
.long   .prntMsg                | Print a message in a0
.long   .initDuart              | Init the 68681 Duart to 9600,8,n,1

// ---- Firmware Init ----
.init:
  move.w  #0x2700, %sr          | mask interrupts and set supervisor mode
  jsr     .initDuart            | Init the DUART serial port console connection
  lea.l   _msgBanner,%a0        | Set the banner message pointer
  jsr     .prntMsg              | Print out the message
  lea.l   _msgRamTst,%a0        | Set the RAM test message pointer
  jsr     .prntMsg              | Print out the message
  lea.l   _ram_start,%a0        | Set the start of RAM
  move.l  _ram_end,%a1          | Set the end of RAM
  move.b  #0x00,%d0             | Set the test pattern
  jsr     .chkRam               | Check the RAM for errors
  move.b  #0xff,%d0             | Check another test pattern
  jsr     .chkRam               | Check the RAM for errors
  lea.l   ._msgRamOK            | Set RAM pass message pointer
  jsr     .prntMsg              | Print out the message
// ---- Main Run Loop
.run:
  lea.l   _msgPrompt,%a0        | Set the prompt message pointer
  jsr     .prntMsg              | Print out the message
  jsr     .getChar              | Get command
  cmpi.b  #'U',%d0              | Is it 'U'pload?
  bne     .SRecUpload           | Go to SRec upload routine
  cmpi.b  #'E',%d0              | Is it 'E'xecute?
  bne     .SRecExec             | Go to SRecExecute routine
  cmpi.b  #'H',%d0              | Is it 'H'elp?
  bne     .prntHelp             | Go to Print Help routine
  cmpi.b  #'R',%d0              | Is it 'R'eset?
  bne     .reset                | Go to Reset routine
  lea.l   _msgUnknown,%a0       | Unknown command!
  jsr     .prntMsg              | Complain about it..
  jmp     .run                  | Jump back to main loop
// ---- System RAM check
.chkRam:
  move.b  %d0,%a0               | Write test pattern to RAM
  cmpi.b  %d0,%a0               | Compare if it was written correctly
  bne.s   .prntRamError         | No -> Print error message
  dbra    %a1,chkRam            | Yes -> Loop
  rts                           | All done -> Return
// ---- PrintChar ----
.prntChar:
  lea     _uarts, %a5           | Load UART base address
_ctxrdy:
  btst    #2, %a5@(_ua_sra)     | Test TxRDY bit in status register
  beq.s   _ctxrdy               | Not ready yet -> loop
  move.b  %d0, %a5@(_ua_tba)    | Send character in d0 to console
  rts                           | Return
// -- GetChar ----
.getChar:
  lea     _uarts, %a5           | Load UART base address
_crxrdy:
  btst    #0, %a5@(_ua_sra)     | Test RxRDY bit in status register
  beq.s   _crxrdy               | Not ready yet -> loop
  move.b  %a5@(_ua_rba), %d0    | Read character from console to d0
  rts                           | Return
// ---- PrintMsg ----
.prntMsg:
.prntLoop:
  move.b  %a0@+,%d0             | Load first char from message
  jsr     .prntChar             | Print it
  tst.b   %a0@                  | Check if there's more to send
  bne     .prntLoop             | Yes -> loop
  rts                           | No -> return
// ---- Init 68681 DUART ----
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

// -- SRecord utility routines
.SRecUpload:
  jsr     .getChar              | get a character from host
  cmp.b   #'S', %d0             | records must start with 'S'
  bne     .SRecUpload           | if not, repeat getting chars until we get an 'S'
  jsr     .getChar              | get character after 'S'
  cmp.b   #'9', %d0             | test for an S9 terminator
  beq     _ld_s9                | Handle it..
  cmp.b   #'8', %d0             | test for an S8 terminator
  beq     _ld_s8                | Handle it..
  cmp.b   #'1', %d0             | test for an S1 record
  beq     _ld_s1                | Handle it..
  cmp.b   #'2', %d0             | test for an S2 record
  beq     _ld_s2                | Handle it..
  bra     .SRecUpload           | Unknown terminator -> Go back to beginning
_ld_s1:
  clr.b   %d3                   | clear the checksum
  jsr     _ld_get_byte          | read the S1 byte count and address
  sub.b   #3, %d0               | subtract 3 from record length
  move.b  %d0, %d2              | save byte count in d2
  clr.l   %d0                   | clear address accumulator
  jsr     _ld_get_byte          | get MS byte of load address
  asl.l   #8, %d0               | move it to MS position
  jsr     _ld_get_byte          | get LS byte in D2
  move.l  %d0, %a2              | a2 points to destination of data
  bra     _ld_data              | load the data
_ld_s2:
  clr.b   %d3                   | clear the checksum
  jsr     _ld_get_byte          | read the S2 byte count and address
  sub.b   #4, %d0               | calculate size of data field
  move.b  %d0, %d2              | d2 contains data bytes to read
  clr.l   %d0                   | clear address accumulator
  jsr     _ld_get_byte          | read most sig byte of address
  asl.l   #8, %d0               | move it one byte left
  jsr     _ld_get_byte          | read middle byte of address
  asl.l   #8, %d0               | move it one byte left
  jsr     _ld_get_byte          | read least sig byte of address
  move.l  %d0, %a2              | a2 points to destination of record
  bra     _ld_data              | load the data
_ld_s8:
  clr.b   %d3                   | clear the checksum
  jsr     _ld_get_byte          | read the S8 byte count and address
  move.b  %d0, %d2              | d2 contains data bytes to read
  clr.l   %d0                   | clear address accumulator
  jsr     _ld_get_byte          | read most sig byte of address
  asl.l   #8, %d0               | move it one byte left
  jsr     _ld_get_byte          | read middle byte of address
  asl.l   #8, %d0               | move it one byte left
  jsr     _ld_get_byte          | read least sig byte of address
  move.l  %d0, %a2              | a2 points to destination of record
  bra     _ld_terminate         | return
_ld_s9:
  clr.b   %d3                   | clear the checksum
  jsr     _ld_get_byte          | read the S9 byte count and address
  move.b  %d0, %d2              | save byte count in d2
  clr.l   %d0                   | clear address accumulator
  jsr     _ld_get_byte          | get MS byte of load address
  asl.l   #8, %d0               | move it to MS position
  jsr     _ld_get_byte          | get LS byte in D2
  move.l  %d0, %a2              | a2 points to destination of data
  bra     _ld_terminate         | return
_ld_data:
  jsr     _ld_get_byte          | get byte of data for loading
  move.b  %d0, %a2@+            | store it
  sub.b   #1, %d2               | decrement byte counter
  bne     _ld_data              | repeat until count = 0
  jsr     _ld_get_byte          | read checksum
  add.b   #1, %d3               | add 1 to total checksum
  beq     _ld_data_ok           | if zero then  draw a dot to console
  or.b    #0b00001000, %d7      | else set checksum error bit,
_ld_terminate:
  btst.b  #0, %d7               | test for input errors
  beq     _ld_chksum            | if no errors check the checksum
  lea     _msgErrNotHex, %a0    | send error message to console
  jsr     .prntMsg
_ld_chksum:
  btst.b  #3, %d7               | test for checksum errors
  beq     _ld_exit              | if no errors return
  lea     _msgErrChksum, %a0    | send error message to console
  jsr     .prntMsg
  bra     _ld_exit
_ld_data_ok:
  move.b  #'.', %d0             | send a '.' to console
  jsr     .prntChar
  bra     .SRecUpload           | get next record
_ld_exit:
  cmpi.l  #0, %d7               | check for errors
  bne     .SRecError            | errors found, offer to reset
  lea     _msgSRecLoaded, %a0   | send srec loaded message
  jsr     .prntMsg
  move.l  %a2, %d0              | get start address from srec
  jsr     .send_hex_l           | output the starting address
_ld_get_byte:
  jsr     .get_hex_b
  add.b   %d0, %d3              | update checksum
  jmp     .run                  | SRec loaded -> Back to main routine
.send_hex_n:
  movem.l %d0, %a7@-            | save d0 to stack
  and.b   #0x0f, %d0            | mask off MS nybble
  add.b   #0x30, %d0            | convert to ascii
  cmp.b   #0x39, %d0            | ascii = hex + 0x30
  bls     _send_low             | if ascii <= 39 then print and exit
  add.b   #0x07, %d0            | else ascii = hex + 7
_send_low:
  jsr     .prntChar             | print the character to the console
  movem.l %a7@+, %d0            | restore d0 from stack
  rts
.send_hex_b:
  ror.b   #4, %d0               | move MS nybble to the LS nybble
  jsr     .send_hex_n           | send the MS nybble hex
  rol.b   #4, %d0               | restore the LS nybble
  bra     .send_hex_n           | send the LS nybble hex and return
.send_hex_w:
  ror.w   #8, %d0               | move MS byte to the LS byte
  jsr     .send_hex_b           | send the MS byte hex
  rol.w   #8, %d0               | restore the LS byte
  bra     .send_hex_b           | send the LS byte hex and return
.send_hex_l:
  swap    %d0                   | move MS word to the LS word
  jsr     .send_hex_w           | send the MS word hex
  swap    %d0                   | restore the LS word
  bra     .send_hex_w           | send the LS word hex and return
.get_hex_n:
  jsr     .getChar              | get character from console
  sub.b   #0x30, %d0            | drop ascii down to numbers
  bmi     _not_hex              | check we didn't underflow on not numerics
  cmp.b   #0x09, %d0            | check we're a number <= 9
  ble     _hex_ok               | ok, we got a number, job done
  sub.b   #0x07, %d0            | move ascii down to 'A'
  cmp.b   #0x0F, %d0            | check we're between A-F
  ble     _hex_ok               | ok, we are in A-F range, job done
_not_hex:
  or.b    #1, %d7               | not a hex value, set flag
_hex_ok:
  rts
.get_hex_b:
  movem.l %d1, %a7@-            | save d1 to stack
  jsr     .get_hex_n            | get first hex character
  asl.b   #4, %d0               | move value to MS nybble position
  move.b  %d0, %d1              | save MS nybble in d1
  bsr     .get_hex_n            | get seccond hex character
  add.b   %d1, %d0              | merge the MS and LS nybbles
  movem.l %a7@+, %d1            | restore d1 from stack
  rts
.SRecError:
  lea     _msgSRecErr, %a0      | Set SRec Error message pointer
  jsr     .prntMsg              | Print the message
  jmp     .run                  | Jump back to main routine
.SRecExec:
  lea.l   _msgSRecRun,a0        | Set runSRec message pointer
  jsr     .prntMsg              | Print the message
  jmp     %a2@                  | Jump to address in A2 register
// -- General utility routines
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
.stop:
  jmp .stop                     | Busy-Loop jumping to STOP
.unhandled:
  rte                           | Return exception
.reset:
  reset                         | Soft-Reset the CPU

// ---- Various system messages and prompts ----
.align(2)
_msgBanner:     .ascii  "::::: Raven68k - A Simple 68000 based computer\r\n"
                .ascii  ":::: Hardware revision 1.0\r\n"
                .asciz  "::: Firmware version v0.0.1\r\n"
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
                .ascii  "(H)elp\r\n""
                .asciz  "(R)eset\r\n\r\n"
.align(2)
_msgUnknown:    .asciz  "Unknown command!\r\n"
.align(2)
_msgErrNotHex:  .asciz  "NOT A HEX VALUE!\r\n"
.align(2)
_msgErrChksum:  .asciz  "CHECKSUM ERROR!\r\n"
.align(2)
_msgSRecErr:    .ascii  "\r\nThere was an error loading the SRec data (as shown above).\r\n"
                .asciz  "Press 'R' to reset system...\r\n"
.align(2)
_msgSRecLoaded: .asciz  "\r\nSRec data downloaded. The starting address is 0x"
.align(2)
_msgSRecRun:    .asciz  "Executing downloaded SRec..\r\n"
