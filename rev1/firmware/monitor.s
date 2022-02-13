* -- Built-in machine monitor by Hayden Kroeplf
* -- Ported to run for Raven from firmware ROM

.include "raven68k.inc"

.global monitorStart

.text
monitorStart:
    lea     msgBanner,%a5       | Show monitor banner
    jsr     prntStr             | Print the message
    lea     msgHelp,  %a5       | And the command help message
    jsr     prntStr             | Print the message
monitorLine:                    | Our main monitor loop
    lea     msgPrompt,%a5       | Prompt
    jsr     prntStr             | Print the message
    jsr     getStr              | Read in the line
    jsr     strToUpper          | Convert to upper-case for ease of parsing
    bsr.w   parseLine           | Then parse and respond to the line
    bra.s   monitorLine
parseLine:
    movem.l %a2-%a3,-(%sp)      | Save registers
    lea     _varLineBuf,%a0
findCommand:
    move.b  (%a0)+,%d0
    cmp.b   #' ',%d0            | Ignore spaces
    beq.w   findCommand
    cmp.b   #'E',%d0            | Examine command
    beq.w   examine
    cmp.b   #'D',%d0            | Deposit command
    beq.w   deposit
    cmp.b   #'R',%d0            | Run command
    beq.w   run
    cmp.b   #'H',%d0            | Help command
    beq.w   help
    cmp.b   #'Q',%d0            | Quit to Firmware
    beq.w   endMonitor
    cmp.b   #0,%d0              | Ignore blank lines
    beq.s   exit
    lea     msgInvalidCommand,%a5
    jsr     prntStr
 exit:
    movem.l (%sp)+,%a2-%a3       | Restore registers
    rts

endMonitor:
    jmp     warmFirmware

**********************
* Examines memory addresses
* Valid modes:
*   e ADDR                  Displays a single byte
*   e ADDR-ADDR             Dispalys all bytes between the two addresses
*   e ADDR+LEN              Dispays LEN bytes after ADDR
*   e ADDR;                 Interactive mode, space shows 16 lines, enter shows 1.
*   e ADDR.                 Quick line, displays one line
 examine:
    bsr.w   parseNumber         | Read in the start address
    tst.b   %d1                 | Make sure it's valid (parseNumber returns non-zero in d1 for failure)
    bne.w   invalidAddr
    move.l  %d0,%a3             | Save the start address
 exloop:
    move.b  (%a0)+,%d0
    cmp.b   #' ',%d0            | Ignore spaces
    beq.s   exloop
    cmp.b   #'-',%d0            | Check if it's a range specifier
    beq.s   exrange
    cmp.b   #'+',%d0            | Check if it's a length specifier
    beq.s   exlength
    cmp.b   #';',%d0            | Check if we're going interactive
    beq.s   exinter
    cmp.b   #'.',%d0            | Check if quick 16
    beq.s   exquick
    move.l  #1,%d0              | Otherwise read in a single byte
    bra.s   exend
 exrange:
    bsr.w   parseNumber         | Find the end address
    tst.b   %d1                 | Check if we found a valid address
    bne.w   invalidAddr
    sub.l   %a3,%d0             | Get the length
    bra.s   exend
 exquick:                      | Quick mode means show one line of 16 bytes
    move.l  #0x10,%d0
    bra.s   exend
 exlength:                     | Length mode means a length is specified
    bsr.w   parseNumber         | Find the length
    tst.b   %d1
    bne.w   invalidAddr
 exend:                        | We're done parsing,give the parameters to dumpRAM and exit
    move.l  %a3,%a0
    bsr.w   dumpRAM
    bra.s   exit
 exinter:                      | Interactive mode,Space shows 16 lines,enter shows 1.
    move.l  %a3,%a0            | Current Address
    move.l  #0x10,%d0           | 16 bytes
    bsr.w   dumpRAM             | Dump this line
    add.l   #0x10,%a3           | Move up the current address 16 bytes
 exinterend:
    jsr     getChar
    cmp.b   #_cr,%d0            | Display another line
    beq.s   exinter
    cmp.b   #' ',%d0           | Display a page (256 bytes at a time)
    beq.s   exinterpage
    bra     exit               | Otherwise exit
 exinterpage:
    move.l  %a3,%a0
    move.l  #0x100,%d0          | 256 bytes
    bsr.w   dumpRAM             | Dump 16 lines of RAM
    add.l   #0x100,%a3          | Move up the current address by 256
    bra.s   exinterend

****************************************
* Deposit values into RAM
* d ADDR VAL VAL            Deposit value(s) into RAM
* d ADDR VAL VAL;           Deposit values, continue with values on next line
*  VAL VAL VAL;              - Continuing with further continue
* d: VAL VAL                Continue depositing values after the last address written to
 deposit:
    move.b  (%a0),%d0
    cmp.b   #':',%d0           | Check if we want to continue from last
    beq.s   depCont
    bsr.w   parseNumber         | Otherwise read the address
    tst.b   %d1
    bne.s   invalidAddr
    move.l  %d0,%a3            | Save the start address
 depLoop:
    move.b  (%a0),%d0
    cmp.b   #';',%d0           | Check for continue
    beq.s   depMultiline
    tst     %d0                 | Check for the end of line
    beq     depEnd
    bsr.w   parseNumber         | Otherwise read a value
    tst.b   %d1
    bne.s   invalidVal
    cmp.w   #255,%d0           | Make sure it's a byte
    bgt.s   invalidVal
    move.b  %d0,(%a3)+         | Store the value into memory
    bra.s   depLoop

 depCont:
    move.l  _varCurAddr,%a3     | Read in the last address
    addq.l  #1,%a0             | Skip over the ':'
    bra.s   depLoop

 depMultiline:
    lea     msgDepositPrompt,%a5
    jmp     prntStr
    jsr     getStr            | Read in the next line to be parsed
    jsr     strToUpper         | Convert to uppercase
    lea     _varLineBuf,%a0     | Reset our buffer pointer
    bra.s   depLoop            | And jump back to decoding
 depEnd:
    move.l  %a3,_varCurAddr
    bra.w   exit

* Run command
 run:
    bsr.w   parseNumber         | Otherwise read the address
    tst.b   %d1
    bne.s   invalidAddr
    move.l  %d0,%a0
    jsr     (%a0)               | Jump to the code!
                                | Go as subroutine to allow code to return to us
    jsr     monitorStart        | Warm start after returning so everything is in
                                | a known state.

* Help command
 help:
    lea     msgHelp,%a5
    jsr     prntStr
    bra.w   exit
 invalidAddr:
    lea     msgInvalidAddress,%a5
    jsr     prntStr
    bra.w   exit
 invalidVal:
    lea     msgInvalidValue,%a5
    jsr     prntStr
    bra.w   exit

**************************************
* Find and parse a hex number
*  Starting address in A0
*  Number returned in D0
*  Status in D1   (0 success, 1 fail)
*  TODO: Try and merge first digit code with remaining digit code
parseNumber:
    eor.l   %d0,%d0            | Zero out d0
    move.b  (%a0)+,%d0
    cmp.b   #' ',%d0           | Ignore all leading spaces
    beq.s   parseNumber
    cmp.b   #'0',%d0           | Look for hex digits 0-9
    blt.s   invalid
    cmp.b   #'9',%d0
    ble.s   firstdigit1
    cmp.b   #'A',%d0           | Look for hex digits A-F
    blt.s   invalid
    cmp.b   #'F',%d0
    ble.s   firstdigit2
 invalid:
    move.l  #1,%d1             | Invalid character,mark failure and return
    rts
 firstdigit2:
    sub.b   #'7',%d0           | Turn 'A' to 10
    bra.s   1f
 firstdigit1:
    sub.b   #'0',%d0           | Turn '0' to 0
 1:
    move.b  (%a0)+,%d1         | Read in a digit
    cmp.b   #'0',%d1           | Look for hex digits 0-9
    blt.s   2f                 | Any other characters mean we're done reading
    cmp.b   #'9',%d1
    ble.s   digit1
    cmp.b   #'A',%d1           | Look for hex digits A-F
    blt.s   2f
    cmp.b   #'F',%d1
    ble.s   digit2
2:                             | We hit a non-hex digit character,we're done parsing
    subq.l  #1,%a0             | Move the pointer back before the end character we read
    move.l  #0,%d1
    rts
 digit2:
    sub.b   #'7',%d1           | Turn 'A' to 10
    bra.s   digit3
 digit1:
    sub.b   #'0',%d1           | Turn '0' to 0
 digit3:
    lsl.l   #4,%d0             | Shift over to the next nybble
    add.b   %d1,%d0            | Place in our current nybble (could be or.b instead)
    bra.s   1b

****************************************
* Dumps a section of RAM to the screen
* Displays both hex values and ASCII characters
* d0 - Number of bytes to dump
* a0 - Start Address
dumpRAM:
    movem.l %d2-%d4/%a2,-(%sp) | Save registers
    move.l  %a0,%a2            | Save the start address
    move.l  %d0,%d2            | And the number of bytes
 line:
    move.l  %a2,%d0
    bsr.w   printHexAddr        | Starting address of this line
    lea     msgColonSpace,%a5
    jsr     prntStr
    move.l  #16,%d3            | 16 Bytes can be printed on a line
    move.l  %d3,%d4            | Save number of bytes on this line
 hexbyte:
    tst.l   %d2                 | Check if we're out of bytes
    beq.s   endbytesShort
    tst.b   %d3                 | Check if we're done this line
    beq.s   endbytes
    move.b  (%a2)+,%d0         | Read a byte in from RAM
    bsr.w   printHexByte        | Display it
    move.b  #' ',%d0
    jsr     prntChar           | Space out bytes
    subq.l  #1,%d3
    subq.l  #1,%d2
    bra.s   hexbyte
 endbytesShort:
    sub.b   %d3,%d4            | Make d4 the actual number of bytes on this line
    move.b  #' ',%d0
 endbytesShortLoop:
    tst.b   %d3                 | Check if we ended the line
    beq.s   endbytes
    move.b  #' ',%d0
    jsr     prntChar           | Three spaces to pad out
    move.b  #' ',%d0
    jsr     prntChar
    move.b  #' ',%d0
    jsr     prntChar
    subq.b  #1,%d3
    bra.s   endbytesShortLoop
 endbytes:
    suba.l  %d4,%a2            | Return to the start address of this line
 endbytesLoop:
    tst.b   %d4                 | Check if we're done printing ascii
    beq     endline
    subq.b  #1,%d4
    move.b  (%a2)+,%d0         | Read the byte again
    cmp.b   #' ',%d0           | Lowest printable character
    blt.s   unprintable
    cmp.b   #'~',%d0           | Highest printable character
    bgt.s   unprintable
    jsr     prntChar
    bra.s   endbytesLoop
 unprintable:
    move.b  #'.',%d0
    jsr     prntChar
    bra.s   endbytesLoop
 endline:
    lea     msgNewline,%a5
    jsr     prntStr
    tst.l   %d2
    ble.s   1f
    bra.w   line
 1:
    movem.l (%sp)+,%d2-%d4/%a2  | Restore registers
    rts

printNewline:
    lea     msgNewline,%a5
    jsr     prntStr

printHexWord:
    move.l  %d2,-(%sp)          | Save d2
    move.l  %d0,%d2            | Save the address in d2

    rol.l   #8,%d2             | 4321 -> 3214
    rol.l   #8,%d2             | 3214 -> 2143
    bra.s   printHex_wordentry  | Print out the last 16 bits
printHexAddr:
    move.l %d2,-(%sp)           | Save d2
    move.l %d0,%d2             | Save the address in d2
    rol.l   #8,%d2             | 4321 -> 3214
    bra.s   printHex_addrentry  | Print out the last 24 bits
printHexLong:
    move.l  %d2,-(%sp)          | Save d2
    move.l  %d0,%d2            | Save the address in d2
    rol.l   #8,%d2             | 4321 -> 3214 high byte in low
    move.l  %d2,%d0
    bsr.s   printHexByte        | Print the high byte (24-31)
printHex_addrentry:
    rol.l   #8,%d2             | 3214 -> 2143 middle-high byte in low
    move.l  %d2,%d0
    bsr.s   printHexByte        | Print the high-middle byte (16-23)
printHex_wordentry:
    rol.l   #8,%d2             | 2143 -> 1432 Middle byte in low
    move.l  %d2,%d0
    bsr.s   printHexByte        | Print the middle byte (8-15)
    rol.l   #8,%d2
    move.l  %d2,%d0
    bsr.s   printHexByte        | Print the low byte (0-7)
    move.l (%sp)+,%d2           | Restore d2
    rts
printHexByte:
    move.l  %d2,-(%sp)
    move.b  %d0,%d2
    lsr.b   #0x4,%d0
    add.b   #'0',%d0
    cmp.b   #'9',%d0           | Check if the hex number was from 0-9
    ble.s   1f
    add.b   #7,%d0             | Shift 0xA-0xF from ':' to 'A'
1:
    jsr     prntChar           | Print the digit
    andi.b  #0x0F,%d2           | Now we want the lower digit Mask only the lower digit
    add.b   #'0',%d2
    cmp.b   #'9',%d2           | Same as before
    ble.s   end
    add.b   #7,%d2
end:
    move.b  %d2,%d0
    jsr     prntChar           | Print the lower digit
    move.l  (%sp)+,%d2
    rts

.section .rodata

msgBanner:
    .ascii  "\r\nChartreuse's 68000 ROM Monitor\r\n"
    .ascii  "Modified and slightly enhanced for Raven68k\r\n"
    .asciz  "==============================\r\n"
msgHelp:
    .ascii  "Available Commands: \r\n"
    .asciz  " (E)xamine    (D)eposit    (R)un     (H)elp   (Q)uit to Firmware\r\n"
msgDepositPrompt:
    .asciz  ": "
msgPrompt:
    .asciz  "> "
msgInvalidCommand:
    .asciz "Invalid Command\r\n"
msgInvalidAddress:
    .asciz "Invalid Address\r\n"
msgInvalidValue:
    .asciz "Invalid Value\r\n"
msgNewline:
    .asciz "\r\n"
msgColonSpace:
    .asciz ": "
