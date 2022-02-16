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
 * To use any of the routines with-in the ROM code,please
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

.global warmFirmware

* ---- Vector locations ----
.section .vectors,"a"
.title "Init vectors"
ROMStart:
.long   _stack_start    | 0 - Supervisor stack pointer
.long   initFirmware    | 1 - Initial Program Counter
.long   unhandled       | 2 - bus error
.long   unhandled       | 3 - addr error
.long   unhandled       | 4 - illegal instruction
.long   unhandled       | 5 - divide by zero
.long   unhandled       | 6 - CHK
.long   unhandled    		| 7 - TRAPV
.long   unhandled    		| 8 - Privilage Violation
.long   unhandled    		| 9 - Trace
.long   unhandled    		| 10- Line 1010/Unused
.long   unhandled    		| 11- Line 1111/Unused
.long   unhandled    		| 12- Unused
.long   unhandled    		| 13- Unused
.long   unhandled    		| 14- Unused
.long   unhandled    		| 15- Uninitialized Interrupt Vector
.long   unhandled    		| 16- Unused
.long   unhandled    		| 17- Unused
.long   unhandled    		| 18- Unused
.long   unhandled    		| 19- Unused
.long   unhandled    		| 20- Unused
.long   unhandled    		| 21- Unused
.long   unhandled    		| 22- Unused
.long   unhandled    		| 23- Unused
.long   unhandled    		| 24- Spurious Interrupt
.long   autovect1    		| 25- Autovector 1
.long   unhandled    		| 26- Autovector 2
.long   unhandled    		| 27- Autovector 3
.long   unhandled    		| 28- Autovector 4
.long   unhandled    		| 29- Autovector 5
.long   unhandled    		| 30- Autovector 6
.long   unhandled    		| 31- Autovector 7
.long   unhandled    		| 32- TRAP #0
.long   unhandled    		| 33- TRAP #1
.long   unhandled    		| 34- TRAP #2
.long   unhandled    		| 35- TRAP #3
.long   unhandled    		| 36- TRAP #4
.long   unhandled    		| 37- TRAP #5
.long   unhandled    		| 38- TRAP #6
.long   unhandled    		| 39- TRAP #7
.long   unhandled    		| 40- TRAP #8
.long   unhandled    		| 41- TRAP #9
.long   unhandled    		| 42- TRAP #10
.long   unhandled    		| 43- TRAP #11
.long   unhandled    		| 44- TRAP #12
.long   unhandled    		| 45- TRAP #13
.long   unhandled    		| 46- TRAP #14
.long   unhandled    		| 47- TRAP #15

.long   unhandled    		| 48- Unassigned
.long   unhandled    		| 49- Unassigned
.long   unhandled    		| 50- Unassigned
.long   unhandled    		| 51- Unassigned
.long   unhandled    		| 52- Unassigned
.long   unhandled    		| 53- Unassigned
.long   unhandled    		| 54- Unassigned
.long   unhandled    		| 55- Unassigned
.long   unhandled    		| 56- Unassigned
.long   unhandled    		| 57- Unassigned
.long   unhandled    		| 58- Unassigned
.long   unhandled    		| 59- Unassigned
.long   unhandled    		| 60- Unassigned
.long   unhandled    		| 61- Unassigned
.long   unhandled    		| 62- Unassigned
.long   unhandled    		| 63- Unassigned

* 64-255 User
.rept 0xc0              | 192 entries
.long unhandled
.endr


* ---- Firmware Jump-Table ----
.section .text

.long   initFirmware            | Firmware init routine
.long   chkRam                  | System RAM check
.long   prntChar                | Print a char in d0
.long   getChar                 | Read a char into d0
.long   prntStr                 | Print a message in a5
.long   initDuart               | Init the 68681 Duart to 38400,8,N,1
.long   SRecUpload              | Upload Motorola SRecord format binary
.long   SRecExec                | Execute Motorola SRecord format binary

* ---- Firmware Init ----
initFirmware:
  move.l  #_stack_start,%sp     | Push stack (should already be done, but...)
  move.w  #0x2700,%sr           | mask interrupts and set supervisor mode

  move.l  #0,%a0
  move.l  #ROMStart,%a1
1:
  move.l  (%a1)+,(%a0)+         | copy vector table into RAM
  cmp.w   #0x400,%a0
  ble     1b

*  move.l  #0xFF0000,%d0
*  movec.l %d0,%vbr              | Point VBR at the top of ROM
  move.w  #0,%sr                | Enable interrupts, enter user mode
  move.l  #_ustack_start,%sp    | Set up user mode stack
  jsr     initDuart             | Init the DUART serial port console connection
  lea.l   _msgBanner,%a5        | Set the banner message pointer
  jsr     prntStr               | Print out the message
  lea.l   _msgRamTst,%a5        | Set the RAM test message pointer
  jsr     prntStr               | Print out the message
ramtst:
  jmp     chkRam                | Jump to check RAM
ramtstok:
  lea.l   _msgRamOK,%a5         | Set RAM pass message pointer
  jsr     prntStr               | Print out the message
* ---- Main Run Loop
warmFirmware:
  jsr     prntHelp
runFirmware:
  lea.l   _msgPrompt,%a5        | Set the prompt message pointer
  jsr     prntStr               | Print out the message
  jsr     getChar               | Get command
  cmpi.b  #'U',%d0              | Is it 'U'pload?
  beq     SRecUpload            | Go to SRec upload routine
  cmpi.b  #'E',%d0              | Is it 'E'xecute?
  beq     SRecExec              | Go to SRecExecute routine
  cmpi.b  #'M',%d0              | Is it 'M'achine monitor?
  beq     monitorStart          | Go to built-in Machine Monitor
  cmpi.b  #'H',%d0              | Is it 'H'elp?
  beq     prntHelp              | Go to Print Help routine
  cmpi.b  #'R',%d0              | Is it 'R'eset?
  beq     reset                 | Go to Reset routine
  lea.l   _msgUnknown,%a5       | Unknown command!
  jsr     prntStr               | Complain about it..
  jmp     runFirmware           | Jump back to main loop
* ---- System RAM check
chkRam:
  move.l  #_ram_start,%a0       | Set the start of RAM
  move.l  #_ram_end,%a1         | Set the end of RAM
1:
  move.b  #0x00,%d1             | Set the first test pattern
  move.b  %d1,(%a0)             | Write test pattern to RAM
  move.b  (%a0),%d0             | Read from address location into d0
  cmp.b   %d1,%d0               | Compare if it was written correctly
  bne     prntRamError          | No -> Print error message
  move.b  #0xff,%d1             | Set second test pattern
  move.b  %d1,(%a0)             | Write test pattern to RAM
  move.b  (%a0)+,%d0            | Read from address location into d0
  cmp.b   %d1,%d0               | Compare if it was written correctly
  bne     prntRamError          | No -> Print error message
  cmpa.l  %a0,%a1               | Are we at the end of memory range?
  bne     1b                    | No -> Loop
  jmp     ramtstok              | All done -> Return

* ---- Init 68681 DUART ----
initDuart:
  lea.l   _uarts,%a0
  move.b  #0x30,_ua_cra(%a0)    | Reset RX
  move.b  #0x20,_ua_cra(%a0)    | Reset TX
  move.b  #0x10,_ua_cra(%a0)
  move.b  #0x00,_ua_acr(%a0)    | Set 1 of BRG baud rates
  move.b  #0xCC,_ua_csra(%a0)   | Set TX and RX to 38400
  move.b  #0x13,_ua_mra(%a0)    | 8 bits,no parity,char error mode,char status in ISR for RX rather than full fifo
  move.b  #0x07,_ua_mra(%a0)    | Set one stop bit,no cts/rts,normal mode
  move.b  #0x02,_ua_imr(%a0)    | Enable RxRDY interrupt
  move.b  #0x05,_ua_cra(%a0)    | Enable TX and RX
  rts                           | Return

* -- SRecord utility routines
SRecUpload:
  movem.l %d0-%d7,-(%sp)        | Save registers to stack
  move.b  #1,%d5                | set end of srec flag at %d5
  move.l  #0,%d4                | byte count at %d4
ld_start:
  jsr     getChar               | Get a character from host
  cmp.b   #'S',%d0              | Records must start with 'S'
  bne     1b                    | If not,repeat getting chars until we get an 'S'
  jsr     getChar               | Get character after 'S'
  cmp.b   #'9',%d0              | Test for an S9 terminator
  beq     loadS9                | Handle it..
  cmp.b   #'8',%d0              | Test for an S8 terminator
  beq     loadS8                | Handle it..
  cmp.b   #'1',%d0              | Test for an S1 record
  beq     loadS1                | Handle it..
  cmp.b   #'2',%d0              | Test for an S2 record
  beq     loadS2                | Handle it..
  bra     ld_start              | Unknown terminator -> Go back to beginning
loadS1:
  clr.b   %d3                   | Clear the checksum
  jsr     ldGetByte             | Read the S1 byte count and address
  sub.b   #3,%d0                | Subtract 3 from record length
  move.b  %d0,%d2               | Save byte count in d2
  clr.l   %d0                   | Clear address accumulator
  jsr     ldGetByte             | Get MS byte of load address
  asl.l   #8,%d0                | Move it to MS position
  jsr     ldGetByte             | Get LS byte in d2
  move.l  %d0,%a2               | a2 points to destination of data
  bra     ld_data               | Load the data
loadS2:
  clr.b   %d3                   | Clear the checksum
  jsr     ldGetByte             | Read the S2 byte count and address
  sub.b   #4,%d0                | Calculate size of data field
  move.b  %d0,%d2               | d2 contains data bytes to read
  clr.l   %d0                   | Clear address accumulator
  jsr     ldGetByte             | Read MS byte of address
  asl.l   #8,%d0                | Move it one byte left
  jsr     ldGetByte             | Read middle byte of address
  asl.l   #8,%d0                | Move it one byte left
  jsr     ldGetByte             | Read LS byte of address
  move.l  %d0,%a2               | a2 points to destination of record
  bra     ld_data               | Load the data
loadS8:
  move.b  #0,%d5                | last record to be imported
  clr.b   %d3                   | Clear the checksum
  jsr     ldGetByte             | Read the S8 byte count and address
  move.b  %d0,%d2               | d2 contains data bytes to read
  clr.l   %d0                   | Clear address accumulator
  jsr     ldGetByte             | Read MS byte of address
  asl.l   #8,%d0                | Move it one byte left
  jsr     ldGetByte             | Read middle byte of address
  asl.l   #8,%d0                | Move it one byte left
  jsr     ldGetByte             | Read LS byte of address
  move.l  %d0,%a2               | a2 points to destination of record
  bra     ld_terminate          | Return
loadS9:
  move.b  #0,%d5                | last record to be imported
  clr.b   %d3                   | Clear the checksum
  jsr     ldGetByte             | Read the S9 byte count and address
  move.b  %d0,%d2               | Save byte count in d2
  clr.l   %d0                   | Clear address accumulator
  jsr     ldGetByte             | Get MS byte of load address
  asl.l   #8,%d0                | Move it to MS position
  jsr     ldGetByte             | Get LS byte in D2
  move.l  %d0,%a2               | a2 points to destination of data
  bra     ld_terminate          | Return
ld_data:
  jsr     ldGetByte             | Get byte of data for loading
  move.b  %d0,%a2@+             | Store it
  sub.b   #1,%d2                | Decrement byte counter
  bne     ld_data               | Repeat until count = 0
ld_terminate:
  jsr     ldGetByte             | Read checksum
  add.b   #1,%d3                | Add 1 to total checksum
  beq     ld_data_ok            | If zero then  draw a dot to console
  or.b    #0b00001000,%d7       | Else set checksum error bit
  btst.b  #0,%d7                | Test for input errors
  beq     ld_chksum             | If no errors check the checksum
  lea     _msgErrNotHex,%a5     | Send error message to console
  jsr     prntStr

ld_chksum:
  btst.b  #3,%d7                | Test for checksum errors
  beq     ld_exit               | If no errors return
  lea     _msgErrChksum,%a5     | Send error message to console
  jsr     prntStr
  bra     ld_exit
ld_data_ok:
  move.b  #'.',%d0              | Send a '.' to console
  jsr     prntChar
ld_exit:
  cmpi.l  #0,%d5                | Are we on the last record?
  beq     srecExit
  bra     ld_start              | Nope, return as if subroutine
ldGetByte:
  jsr     get_hex_b
  add.w   #1,%a4                | keep track of loaded byte count
  add.b   %d0,%d3               | Update checksum
  rts                           | byte loaded -> Back to load

srecExit:
  lea     _msgSRecLoaded,%a5    | Send SRec loaded message
  jsr     prntStr
  move.l  %a4,%d0               | Get byte count
  jsr     send_hex_l            | Output the size
  move.l  %a2,%d0               | Get load address
  lea     _msgSRecLoaded2,%a5   | Get rest of the message line
  jsr     prntStr
  move.l  %a2,%d0               | print load Address
  jsr     send_hex_l
  lea     _msgNewLine,%a5
  jsr     prntStr
  move.l  %a2,_SRecLoadAddr     | save the load address
  movem.l (%sp)+,%d0-%d7        | Restore registers
  bra     runFirmware

send_hex_n:
  movem.l %d0,-(%sp)            | Save d0 to stack
  and.b   #0x0f,%d0             | Mask off MS nybble
  add.b   #0x30,%d0             | Convert to ASCII
  cmp.b   #0x39,%d0             | ASCII = HEX + 0x30
  bls     send_low              | If ASCII <= 39 then print and exit
  add.b   #0x07,%d0             | Else ASCII = HEX + 7
send_low:
  jsr     prntChar              | Print the character to the console
  movem.l (%sp)+,%d0            | Restore d0 from stack
  rts
send_hex_b:
  ror.b   #4,%d0                | Move MS nybble to the LS nybble
  jsr     send_hex_n            | Send the MS nybble hex
  rol.b   #4,%d0                | Restore the LS nybble
  bra     send_hex_n            | Send the LS nybble hex and return
send_hex_w:
  ror.w   #8,%d0                | Move MS byte to the LS byte
  jsr     send_hex_b            | Send the MS byte HEX
  rol.w   #8,%d0                | Restore the LS byte
  bra     send_hex_b            | Send the LS byte HEX and return
send_hex_l:
  swap    %d0                   | Move MS word to the LS word
  jsr     send_hex_w            | Send the MS word HEX
  swap    %d0                   | Restore the LS word
  bra     send_hex_w            | Send the LS word HEX and return
get_hex_n:
  jsr     getChar               | Get character from console
  sub.b   #0x30,%d0             | Drop ASCII down to numbers
  bmi     not_hex               | Check we didn't underflow on not numerics
  cmp.b   #0x09,%d0             | Check we're a number <= 9
  ble     hex_ok                | OK,we got a number,job done
  sub.b   #0x07,%d0             | Move ASCII down to 'A'
  cmp.b   #0x0F,%d0             | Check we're between A-F
  ble     hex_ok                | OK,we are in A-F range,job done
not_hex:
  or.b    #1,%d7                | Not a HEX value, set flag
hex_ok:
  rts
get_hex_b:
  movem.l %d1,%a7@-             | Save d1 to stack
  jsr     get_hex_n             | Get first hex character
  asl.b   #4,%d0                | Move value to MS nybble position
  move.b  %d0,%d1               | Save MS nybble in d1
  bsr     get_hex_n             | Get second HEX character
  add.b   %d1,%d0               | Merge the MS and LS nybbles
  movem.l %a7@+,%d1             | Restore d1 from stack
  rts
SrecError:
  lea     _msgSRecErr,%a5       | Set SRec Error message pointer
  jsr     prntStr               | Print the message
  jmp     runFirmware           | Jump back to main routine
SRecExec:
  lea.l   _msgSRecRun,%a5       | Set runSRec message pointer
  jsr     prntStr               | Print the message
  lea.l   _SRecLoadAddr,%a2     | Load the pointer to loaded SRec
  jmp     %a2@                  | Jump to address in a2 register


* -- General utility routines
prntRamError:
  move.l  %a0,%d0               | Save current RAM address
  lea.l   _msgRamErr,%a5        | Set RAM Error message pointer
  jsr     prntStr               | Print the message
  jsr     prntChar              | Print the RAM location in d0
  jmp     stop                  | Die
prntHelp:
  lea.l   _msgHelp,%a5          | Set Help message pointer
  jsr     prntStr               | Print the message
  jmp     runFirmware           | Jump back to main routine


* ---- Autovector handling routines
autovect1:
  movem.l %d0-%d1/%a0-%a1,-(%sp)  | Save registers
  btst.b  #1,_ua_isr              | Character received?
  beq     1f
  bsr     uartReadByte
1:
  btst.b  #3,_ua_isr              | Timer? (not yet handled)
  beq     2f

2:
  movem.l (%sp)+,%d0-%d1/%a0-%a1  | Restore registers
  rte

stop:
  jmp stop                     | Busy-Loop jumping to STOP
unhandled:
  rte                          | Return exception
reset:
  reset                        | Soft-Reset the CPU

.section .rodata

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
_msgPrompt:     .asciz  "\r\nReady: "
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
_msgSRecLoaded: .asciz  "\r\nLoaded "
.align(2)
_msgSRecLoaded2: .asciz " bytes starting from "
.align(2)
_msgSRecRun:    .asciz  "Executing downloaded SRec..\r\n"
.align(2)
_SRecLoadAddr:  dc.l 0
