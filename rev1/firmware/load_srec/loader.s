/*
 * Memory Map
 * --------------
 * 0x000000-0x1FFFFF ROM    (Actual: 0x000000-0x007FFF)
 * 0x200000-0x3FFFFF RAM    (Actual: 0x200000-0x2FFFFF)       
 * 0x400000-0x5FFFFF DUART  (Actual: 0x400000-0x400020)
 *
 */

.include "raven68k.inc"

.section .vectors, "a"
.title "Init vectors"
    .long   _stack_start
    .long   .init
    .long   .unhandled  | bus error
    .long   .unhandled  | addr error
    .long   .unhandled  | illegal instruction
    .long   .unhandled  | divide by zero
    .rept 0x2e
    .long .reset
    .endr
    .rept 0x40
    .long 0xffffffff
    .endr
    .rept 0x80
    .long .reset
    .endr

.section .text
.title "Program"

*************************************************************************
*
*  Init the CPU and disable interrupts
*
.init:
            move.w      #0x2700, %sr                | mask interrupts and set supervisor mode

*************************************************************************
*
*  Setup DUART - Port A active, 9600 8N1
*
.setup_uart:
            lea         _uarts, %a0

            move.b      #0x30, %a0@(_ua_cra)        | reset RX on uart a
            move.b      #0x20, %a0@(_ua_cra)        | reset TX on uart a
            move.b      #0x10, %a0@(_ua_cra)

            move.b      #0x80, %a0@(_ua_acr)        | set 2 of BRG baud rates

            /* uart a */
            move.b      #0xBB, %a0@(_ua_csra)       | set uart a TX and RX to 9600
            move.b      #0x13, %a0@(_ua_mra)        | 8 bits, no parity bit, char error mode,
                                                    | char status in ISR for RX rather than full fifo
            move.b      #0x07, %a0@(_ua_mra)        | set one stop bit, no cts/rts, normal mode
            move.b      #0x05, %a0@(_ua_cra)        | nop command, enable TX and RX

*************************************************************************
*
*  RAM Check - Test the memory for an issues
*
.check_ram:
            lea         _mem_banner, %a0
            bsr         .send_string
            lea         _ram_start, %a0             | set a5 to top bottom of RAM
            move.l      #_ram_end, %d0              | set d0 to RAM end

_chk_ram:   move.b      #0x00, %a0@                 | load 0x00 into byte of RAM
            cmpi.b      #0x00, %a0@                 | confirm byte matches 0x00
            bne.s       _ram_error                  | branch to error if it doesn't

            move.b      #0xFF, %a0@                 | load 0xFF into byte of RAM
            cmpi.b      #0xFF, %a0@+                | confirm byte matches 0xFF
            bne.s       _ram_error                  | branch to error if it doesn't

            dbra        %d0, _chk_ram               | loop till we reach top of RAM

            lea         _mem_ok, %a0                | send "OK!" to console
            bsr         .send_string

            bra         .main                       | jump to main

_ram_error:
            lea         _mem_error, %a0             | senr "ERROR!" to console
            bsr         .send_string
            bsr         .send_hex_l
            bra         .check_ram

*************************************************************************
*
*  MAIN - Start of the bootloader
*
.main:
            lea         _stack_start, %sp           | reset the stack pointer

            | move.w      #0x2000, %sr              | enable interrupts by clearing mask

            lea         _banner, %a0                | send start up banner
            bsr         .send_string

            clr.l       %d7                         | reset the error flags

            bsr.s       .load                       | load srec file into RAM
            cmpi.l      #0, %d7                     | check for errors
            bne.s       .srec_error                 | errors found, offer to reset

            lea         _srec_loaded, %a0           | send srec loaded message
            bsr         .send_string
            move.l      %a2, %d0                    | get start address from srec
            bsr.w       .send_hex_l                 | output the starting address
            lea         _srec_run, %a0              | send srec loaded message
            bsr         .send_string

_press_s:   bsr.w       .recv_char
            cmpi.b      #'S', %d0
            bne.s       _press_s

            jmp         %a2@                        | jump into entry point from srec

.srec_error:
            lea         _srec_error, %a0
            bsr         .send_string

_press_r:   bsr.w       .recv_char
            cmpi.b      #'R', %d0
            bne.s       _press_r

            jmp         .reset

*************************************************************************
*
*  Load srec file into RAM
*
.load:
            bsr.w       .recv_char                  | get a character from host
            cmp.b       #'S', %d0                   | records must start with 'S'
            bne.s       .load                       | if not, repeat getting chars until we get an 'S'

            bsr.w       .recv_char                  | get character after 'S'
            cmp.b       #'9', %d0                   | test for an S9 terminator
            beq.s       _ld_s9
            cmp.b       #'8', %d0                   | test for an S8 terminator
            beq.s       _ld_s8
            cmp.b       #'1', %d0                   | test for an S1 record
            beq.s       _ld_s1
            cmp.b       #'2', %d0                   | test for an S2 record
            beq.s       _ld_s2
            bra.s       .load

_ld_s1:
            clr.b       %d3                         | clear the checksum
            bsr.w       _ld_get_byte                | read the S1 byte count and address
            sub.b       #3, %d0                     | subtract 3 from record length
            move.b      %d0, %d2                    | save byte count in d2
            clr.l       %d0                         | clear address accumulator
            bsr.w       _ld_get_byte                | get MS byte of load address
            asl.l       #8, %d0                     | move it to MS position 
            bsr.w       _ld_get_byte                | get LS byte in D2
            move.l      %d0, %a2                    | a2 points to destination of data
            bra.s       _ld_data                    | load the data

_ld_s2:
            clr.b       %d3                         | clear the checksum
            bsr.s       _ld_get_byte                | read the S2 byte count and address
            sub.b       #4, %d0                     | calculate size of data field
            move.b      %d0, %d2                    | d2 contains data bytes to read
            clr.l       %d0                         | clear address accumulator
            bsr.s       _ld_get_byte                | read most sig byte of address
            asl.l       #8, %d0                     | move it one byte left
            bsr.s       _ld_get_byte                | read middle byte of address
            asl.l       #8, %d0                     | move it one byte left
            bsr.s       _ld_get_byte                | read least sig byte of address
            move.l      %d0, %a2                    | a2 points to destination of record
            bra.s       _ld_data                    | load the data

_ld_s8:
            clr.b       %d3                         | clear the checksum
            bsr.s       _ld_get_byte                | read the S8 byte count and address
            move.b      %d0, %d2                    | d2 contains data bytes to read
            clr.l       %d0                         | clear address accumulator
            bsr.s       _ld_get_byte                | read most sig byte of address
            asl.l       #8, %d0                     | move it one byte left
            bsr.s       _ld_get_byte                | read middle byte of address
            asl.l       #8, %d0                     | move it one byte left
            bsr.s       _ld_get_byte                | read least sig byte of address
            move.l      %d0, %a2                    | a2 points to destination of record
            bra.s       _ld_terminate               | return

_ld_s9:
            clr.b       %d3                         | clear the checksum
            bsr.s       _ld_get_byte                | read the S9 byte count and address
            move.b      %d0, %d2                    | save byte count in d2
            clr.l       %d0                         | clear address accumulator
            bsr.s       _ld_get_byte                | get MS byte of load address
            asl.l       #8, %d0                     | move it to MS position 
            bsr.s       _ld_get_byte                | get LS byte in D2
            move.l      %d0, %a2                    | a2 points to destination of data
            bra.s       _ld_terminate               | return

_ld_data:   bsr.s       _ld_get_byte                | get byte of data for loading
            move.b      %d0, %a2@+                  | store it
            sub.b       #1, %d2                     | decrement byte counter
            bne.s       _ld_data                    | repeat until count = 0
            bsr.s       _ld_get_byte                | read checksum
            add.b       #1, %d3                     | add 1 to total checksum
            beq.w       _ld_data_ok                 | if zero then  draw a dot to console
            or.b        #0b00001000, %d7            | else set checksum error bit,

_ld_terminate:
            btst.b      #0, %d7                     | test for input errors
            beq.s       _ld_chksum                  | if no errors check the checksum
            lea         _err_not_hex, %a0           | send error message to console
            bsr.w       .send_string

_ld_chksum:
            btst.b      #3, %d7                     | test for checksum errors
            beq.s       _ld_exit                    | if no errors return
            lea         _err_checksum, %a0          | send error message to console
            bsr.w       .send_string
            bra.s       _ld_exit

_ld_data_ok:
            move.b      #'.', %d0                   | send a '.' to console
            bsr         .send_char
            bra         .load                       | get next record

_ld_exit:
            rts

_ld_get_byte:
            bsr.w       .get_hex_b
            add.b       %d0, %d3                    | update checksum
            rts


*************************************************************************
*
*  Get character from console - receives character and puts it in %d0
*
.recv_char:
            movem.l     %a5, %a7@-                  | save a5 to stack
            lea         _uarts, %a5

_crxrdy:    btst        #0, %a5@(_ua_sra)           | test RxRDY bit in status
            beq.s       _crxrdy
            move.b      %a5@(_ua_rba), %d0          | send character to console

            movem.l     %a7@+, %a5                  | restore a5 from stack
            rts

*************************************************************************
*
*  Send character to console - sends character in %d0 to console
*
.send_char:
            movem.l     %a5, %a7@-                  | save a5 to stack
            lea         _uarts, %a5

_ctxrdy:    btst        #2, %a5@(_ua_sra)           | test TxRDY bit in status
            beq.s       _ctxrdy
            move.b      %d0, %a5@(_ua_tba)          | send character to console

            movem.l     %a7@+, %a5                  | restore a5 from stack
            rts

*************************************************************************
*
*  Send string to console - sends string till null in %a0 to console
*
.send_string:
            movem.l     %a5, %a7@-                  | save a5 to stack
            lea         _uarts, %a5

_txrdy:     btst        #2, %a5@(_ua_sra)           | test TxRDY bit in status
            beq.s       _txrdy                      | loop till TxRDY is clear
            move.b      %a0@+, %a5@(_ua_tba)        | send character in buffer of a0
            tstb        %a0@                        | check if there is another character to send
            bnes        _txrdy                      | send it if there is

            movem.l     %a7@+, %a5                  | restore a5 from stack
            rts

*************************************************************************
*
*  Send hex values to console - %d0 contains value to send as hex
*                             - nibble, byte, word, longword
*
.send_hex_n:
            movem.l     %d0, %a7@-                  | save d0 to stack
            and.b       #0x0f, %d0                  | mask off MS nybble
            add.b       #0x30, %d0                  | convert to ascii
            cmp.b       #0x39, %d0                  | ascii = hex + 0x30
            bls         _send_low                   | if ascii <= 39 then print and exit
            add.b       #0x07, %d0                  | else ascii = hex + 7
_send_low:  bsr         .send_char                  | print the character to the console
            movem.l     %a7@+, %d0                  | restor d0 from stack
            rts

.send_hex_b:
            ror.b       #4, %d0                     | move MS nybble to the LS nybble
            bsr         .send_hex_n                 | send the MS nybble hex
            rol.b       #4, %d0                     | restore the LS nybble
            bra         .send_hex_n                 | send the LS nybble hex and return

.send_hex_w:
            ror.w       #8, %d0                     | move MS byte to the LS byte
            bsr         .send_hex_b                 | send the MS byte hex
            rol.w       #8, %d0                     | restore the LS byte
            bra         .send_hex_b                 | send the LS byte hex and return

.send_hex_l:
            swap        %d0                         | move MS word to the LS word
            bsr         .send_hex_w                 | send the MS word hex
            swap        %d0                         | restore the LS word
            bra         .send_hex_w                 | send the LS word hex and return

*************************************************************************
*
*  Get hex value from console
*
.get_hex_n:
            bsr.w       .recv_char                  | get character from console
            sub.b       #0x30, %d0                  | drop ascii down to numbers
            bmi.s       _not_hex                    | check we didn't underflow on not numerics
            cmp.b       #0x09, %d0                  | check we're a number <= 9
            ble.s       _hex_ok                     | ok, we got a number, job done
            sub.b       #0x07, %d0                  | move ascii down to 'A'
            cmp.b       #0x0F, %d0                  | check we're between A-F
            ble.s       _hex_ok                     | ok, we are in A-F range, job done
_not_hex:   or.b        #1, %d7                     | not a hex value, set flag
_hex_ok:    rts

.get_hex_b:
            movem.l     %d1, %a7@-                  | save d1 to stack
            bsr.s       .get_hex_n                  | get first hex character
            asl.b       #4, %d0                     | move value to MS nybble position
            move.b      %d0, %d1                    | save MS nybble in d1
            bsr.s       .get_hex_n                  | get seccond hex character
            add.b       %d1, %d0                    | merge the MS and LS nybbles
            movem.l     %a7@+, %d1                  | restore d1 from stack
            rts

*************************************************************************
*
*  DIE - Infinite loop for dying
*
.stop:
            jmp .stop

*************************************************************************
*
*  Unhandled Vector Handler - Used for unhandled vectors, just returns
*
.unhandled: rte         | return exception

*************************************************************************
*
*  Reset Vector Handler - Used to reset CPU if vector called
*
.reset:     reset       | reset


*************************************************************************
*
*  Strings - Strings used for console output
*
.align(2)
_banner:        .ascii      "Raven68k Bootloader v1.0\r\n"
                .ascii      "Inspired by Alan Garfield <alan@fromorbit.com>\r\n"
                .ascii      "\r\n"
                .asciz      "Send srec (S19/S28) data when ready...\r\n"

.align(2)
_crlf:          .asciz      "\r\n"

.align(2)
_mem_banner:    .ascii      "\r\nChecking Memory..."
.align(2)
_mem_ok:        .asciz      "OK!\r\n\r\n"
.align(2)
_mem_error:     .asciz      "\fERROR!\r\n\r\n"

.align(2)
_err_not_hex:   .asciz      "NOT A HEX VALUE!\r\n"
.align(2)
_err_checksum:  .asciz      "CHECKSUM ERROR!\r\n"
.align(2)
_srec_error:    .ascii      "\r\nThere was an error loading the srec data (as shown above).\r\n"
                .asciz      "Press 'R' to reset system...\r\n"
.align(2)
_srec_loaded:   .ascii      "\r\nsrec data loaded.\r\n"
                .asciz      "The starting address is 0x"
.align(2)
_srec_run:      .asciz      "\r\n\r\nPress 'S' to start program.\r\n"
