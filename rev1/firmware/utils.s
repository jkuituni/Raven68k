* utility functions for firmware
* these routines are shared across all source files

.include "raven68k.inc"

* Exports
.global prntChar
.global getChar
.global prntStr
.global getStr
.global strToUpper
.global consClear

.section .text

* Print_character in %d0 to console
* trashes %a5
prntChar:
  lea.l     _uarts,%a5           		   | Load UART base address
1:
  btst    #2,%a5@(_ua_sra)     		   | Test TxRDY bit in status register
  beq     1b                     		 | Not ready yet -> loop
  move.b  %d0,%a5@(_ua_tba)    		   | Send_character in d0 to console
  rts
*  move.b  %d1,-(%sp)
*  move.b  %d0,%d1
*  move.b  #6,%d0
*  trap    #15
*  move.b  (%sp)+,%d1
*  rts

* (BLOCKING) Get_character from console into %d0
* trashes %a5,%d0
getChar:
  lea.l     _uarts,%a5           		   | Load UART base address
1:
  btst    #0,%a5@(_ua_sra)     		   | Test RxRDY bit in status register
  beq     1b                     		 | Not ready yet -> loop
  move.b  %a5@(_ua_rba),%d0    		   | Read_character from console to d0
  rts
*  move.b  %d1,-(%sp)
*  move.b  #5,%d0
*  trap    #15
*  move.b  %d1,%d0
*  move.b  (%sp)+,%d1
*  rts

* Prints null-terminated string at %a5 to console
* trashes %a5
prntStr:
  move.b  %a5@+,%d0             		| Load first_char from message
  jsr     prntChar               		| Print it
  tst.b   %a5@                  		| Check if there's more to send
  bne     prntStr               		| Yes -> loop
  rts                           		| No -> return

* (BLOCKING) gets a null-terminated string from the console into %a0
getStr:
    movem.l %d2/%a2,-(%sp)     		  | Save changed registers
    lea.l     _varLineBuf,%a2   	  | Start of the lineBuffer
    eor.w   %d2,%d2            		  | Clear the_character counter
1:
    bsr.w   getChar             		| Read a_character from the serial port
    cmp.b   #_bksp,%d0          		| Is it a backspace?
    beq.s   3f
    cmp.b   #_ctrlx,%d0         		| Is it Ctrl-H (Line Clear)?
    beq.s   4f
    cmp.b   #_cr,%d0            		| Is it a carriage return?
    beq.s   6f
    cmp.b   #_lf,%d0            		| Is it anything else but a LF?
    beq.s   1b                      | Ignore LFs and get the next_character
2:                            		  | Normal_character to be inserted into the buffer
    cmp.w   #_max_line,%d2
    bge.s   1b                      | If the buffer is full ignore the_character
    move.b  %d0,(%a2)+         		  | Otherwise store the_character
    addq.w  #1,%d2             		  | Increment_character count
    bsr.w   prntChar            		| Echo the_character
    bra.s   1b                      | And get the next one
3:
    tst.w   %d2                 		| Are we at the beginning of the line?
    beq.s   1b                      | Then ignore it
    bsr.w    prntChar           		| Backspace
    move.b  #' ',%d0
    bsr.w    prntChar           		| Space
    move.b  #_bksp,%d0
    bsr.w    prntChar           		| Backspace
    subq.l  #1,%a2             		  | Move back in the buffer
    subq.l  #1,%d2             		  | And current_character count
    bra.s   1b                      | And goto the next_character
4:
    tst     %d2                 		| Anything to clear?
    beq.s   1b                      | If not,fetch the next_character
    suba.l  %d2,%a2            		  | Return to the start of the buffer
5:
    move.b  #_bksp,%d0
    bsr.w   prntChar            		| Backspace
    move.b  #' ',%d0
    bsr.w   prntChar            		| Space
    move.b  #_bksp,%d0
    bsr.w   prntChar            		| Backspace
    subq.w  #1,%d2
    bne.s   5b      		            | Go till the start of the line
    bra.s   1b
6:
    bsr.w   prntChar            		| Echo the CR
    move.b  #_lf,%d0
    bsr.w   prntChar            		| Line feed to be safe
    move.b  #0,(%a2)           		  | Terminate the line (Buffer is longer than max to allow this at full length)
    movea.l %a2,%a0            		  | Ready the pointer to return (if needed)
    movem.l (%sp)+,%d2/%a2     		  | Restore registers
    rts                         		| And return

strToUpper:
    lea.l   _varLineBuf, %a0        | Get the start of the line buffer
1:
    move.b  (%a0), %d0              | Read in a character
    cmp.b   #'a', %d0
    blt.s   2f                      | Is it less than lower-case 'a', then move on
    cmp.b   #'z', %d0
    bgt.s   2f                      | Is it greater than lower-case 'z', then move on
    sub.b   #0x20, %d0              | Then convert a to A, b to B, etc.
2:
    move.b  %d0, (%a0)+             | Store the character back into a0, and move to the next
    bne.s   1b                      | Keep going till we hit a null terminator
    rts

* clear the console screen
consClear:
    lea.l   _vtClear,%a5
    bsr.w   prntStr
    rts

.section .rodata

.align(2)
_vtClear:
              .asciz "\x1b[2J"
