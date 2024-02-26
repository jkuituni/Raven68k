*************************************************************************************
*														                            *
*	Enhanced BASIC for the Motorola MC680xx							                *
*														                            *
*	This version adapted for the Raven68k single board computer (rev 1)				*
*														                            *
*************************************************************************************
*														                            *
*	Copyright(C) 2002-12 by Lee Davison. This program may be freely distributed	    *
*	for personal use only. All commercial rights are reserved.				        *
*														                            *
*	More 68000 and other projects can be found on my website at ..			        *
*														                            *
*	 http://mycorner.no-ip.org/index.html							                *
*														                            *
*	mail : leeedavison@googlemail.com								                *
*														                            *
*************************************************************************************

* EASy68k extensions Ver 2.33

* Version 3.xx replaces the fixed RAM addressing from previous versions with a RAM
* pointer in a3. this means that this could now be run as a task on a multitasking
* system where memory resources may change.

* Ver 3.52

* Ver 3.52 stops USING$() from reading beyond the end of the format string
* Ver 3.51 fixes the UCASE$() and LCASE$() functions for null strings
* Ver 3.50 uniary minus in concatenate generates a type mismatch error
* Ver 3.49 doesn't tokenise 'DEF' or 'DEC' within a hex value
* Ver 3.48 allows scientific notstion underflow in the USING$() function
* Ver 3.47 traps the use of array elements as the FOR loop variable
* Ver 3.46 updates function and function variable handling

*************************************************************************************
*
* Ver 3.45 makes the handling of non existant variables consistent and gives the
* option of not returning an error for a non existant variable. If this is the
* behaviour you want just change novar to some non zero value

* .equ    novar  0				| non existant variables cause errors


*************************************************************************************

* Ver 3.44 adds overflow indication to the USING$() function
* Ver 3.43 removes an undocumented feature of concatenating null strings
* Ver 3.42 reimplements backspace so that characters are overwritten with [SPACE]
* Ver 3.41 removes undocumented features of the USING$() function
* Ver 3.40 adds the USING$() function
* Ver 3.33 adds the file requester to LOAD and SAVE
* Ver 3.32 adds the optional ELSE clause to IF .. THEN

*************************************************************************************

* Version 3.25 adds the option to change the behaviour of INPUT so that a null
* response does not cause a program break. If this is the behaviour you want just
* change nobrk to some non zero value.

* .equ    nobrk,  0				| null response to INPUT causes a break


.include "ehbasic.inc"

.section    .text

*************************************************************************************
*
* the following code is simulator specific, change to suit your system

* output character to the console from register d0.b

VEC_OUT:
    jsr     prntChar
	rts

*************************************************************************************
*
* input a character from the console into register d0
* else return Cb=0 if there's no character available

VEC_IN:
    move.b  #0,%d0
    jsr     getChar
    cmpi.b  #0,%d0
    bne     1f
	tst.b	%d0				    | set the z flag on the received byte
	ori.b	#1,%ccr			    | set the carry, flag we got a byte
1:
    rts


*************************************************************************************
*
* LOAD routine not implemented

VEC_LD:
    moveq   #0x2E,%d7           | error code $2E "Not implemented" error
    bra     LAB_XERR            | do error #d7, then warm start

*************************************************************************************
*
* SAVE routine for the Easy68k simulator

VEC_SV:
    moveq   #0x2E,%d7           | error code $2E "Not implemented" error
    bra     LAB_XERR            | do error #d7, then warm start

*************************************************************************************


****************************************************************************************
****************************************************************************************
****************************************************************************************
****************************************************************************************
*
* Register use :- (must improve this !!)
*
*	a6 -	temp Bpntr			* temporary BASIC execute pointer
*	a5 -	Bpntr				* BASIC execute (get byte) pointer
*	a4 -	des_sk				* descriptor stack pointer
*	a3 -	ram_strt			* start of RAM. all RAM references are offsets
*							    * from this value
*

*************************************************************************************
*
* BASIC cold start entry point. assume entry with RAM address in a0 and RAM length
* in d0

LAB_COLD:
	cmp.l	#0x4000,%d0			| compare size with 16k
	bge.s	LAB_sizok			| branch if >= 16k

	moveq	#5,%d0				| error 5 - not enough RAM
	rts						    | just exit. this as stands will never execute
                                | but could be used to exit to an OS

LAB_sizok:
	movea.l	%a0,%a3				| copy RAM base to a3
	adda.l	%d0,%a0				| a0 is top of RAM
	move.l	%a0,Ememl(%a3)		| set end of mem
	lea		ram_base(%a3),%sp   | set stack to RAM start + 1k

	move.w	#0x4EF9,%d0			| jmp opcode
	movea.l	%sp,%a0				| point to start of vector table

	move.w	%d0,(%a0)+			| LAB_WARM
	lea		LAB_COLD(%pc),%a1	| initial warm start vector
	move.l	%a1,(%a0)+			| set vector

	move.w	%d0,(%a0)+			| Usrjmp
	lea		LAB_FCER(%pc),%a1	| initial user function vector
							    | "Function call" error
	move.l	%a1,(%a0)+			| set vector

	move.w	%d0,(%a0)+			| V_INPT jmp opcode
	lea		VEC_IN(%pc),%a1		| get byte from input device vector
	move.l	%a1,(%a0)+			| set vector

	move.w	%d0,(%a0)+			| V_OUTP jmp opcode
	lea		VEC_OUT(%pc),%a1	| send byte to output device vector
	move.l	%a1,(%a0)+			| set vector

	move.w	%d0,(%a0)+			| V_LOAD jmp opcode
	lea		VEC_LD(%pc),%a1		| load BASIC program vector
	move.l	%a1,(%a0)+			| set vector

	move.w	%d0,(%a0)+			| V_SAVE jmp opcode
	lea		VEC_SV(%pc),%a1		| save BASIC program vector
	move.l	%a1,(%a0)+			| set vector

	move.w	%d0,(%a0)+			| V_CTLC jmp opcode
	lea		VEC_CC(%pc),%a1		| save CTRL-C check vector
	move.l	%a1,(%a0)+			| set vector

* set-up start values

LAB_GMEM:
	moveq	#0,%d0			    | clear d0
	move.b	%d0,Nullct(%a3)		| default NULL count
	move.b	%d0,TPos(%a3)	    | clear terminal position
	move.b	%d0,ccflag(%a3)		| allow CTRL-C check
	move.w	%d0,prg_strt-2(%a3)	| clear start word
	move.w	%d0,BHsend(%a3)		| clear value to string end word

	move.b	#0x50,TWidth(%a3)	| default terminal width byte for simulator *##
;	move.b	%d0,TWidth(%a3)		| default terminal width byte

	move.b	#0x0E,TabSiz(%a3)	| save default tab size = 14

	move.b	#0x38,Iclim(%a3)	| default limit for TAB = 14 for simulator *##
;	move.b	#0xf2,Iclim(%a3)	| default limit for TAB = 14

	lea		des_sk(%a3),%a4		| set descriptor stack start

	lea		prg_strt(%a3),%a0	| get start of mem
	move.l	%a0,Smeml(%a3)		| save start of mem

	bsr		LAB_1463			| do "NEW" and "CleaR"
	bsr		LAB_CRLF			| print CR/LF
	move.l	Ememl(%a3),%d0		| get end of mem
	sub.l	Smeml(%a3),%d0		| subtract start of mem

	bsr		LAB_295E			| print d0 as unsigned integer (bytes free)
	lea		LAB_SMSG(%pc),%a0	| point to start message
	bsr		LAB_18C3			| print null terminated string from memory

	lea		LAB_RSED(%pc),%a0	| get pointer to value
	bsr		LAB_UFAC			| unpack memory (a0) into FAC1

	lea		LAB_1274(%pc),%a0	| get warm start vector
	move.l	%a0,Wrmjpv(%a3)		| set warm start vector
	bsr		LAB_RND			    | initialise
	jmp		LAB_WARM(%a3)		| go do warm start


*************************************************************************************
*
* do format error

LAB_FOER:
	moveq	#0x2C,%d7			| error code $2C "Format" error
	bra 	LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do address error

LAB_ADER:
	moveq	#0x2A,%d7			| error code $2A "Address" error
	bra 	LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do wrong dimensions error

LAB_WDER:
	moveq	#0x28,%d7			| error code $28 "Wrong dimensions" error
	bra 	LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do undimensioned array error

LAB_UDER:
	moveq	#0x26,%d7			| error code $26 "undimensioned array" error
	bra 	LAB_XERR			| do error #d7, then warm start

*************************************************************************************
*
* do undefined variable error

LAB_UVER:

* if you do want a non existant variable to return an error then leave the novar
* value at the top of this file set to zero

 .ifdef	novar

	moveq	#0x24,%d7			| error code $24 "undefined variable" error
	bra		LAB_XERR			| do error #d7, then warm start

 .endif

* if you want a non existant variable to return a null value then set the novar
* value at the top of this file to some non zero value

 .ifdef	novar

	add.l		%d0,%d0			| .......$ .......& ........ .......0
	swap		%d0				| ........ .......0 .......$ .......&
	ror.b		#1,%d0			| ........ .......0 .......$ &.......
	lsr.w		#1,%d0			| ........ .......0 0....... $&.....�.
	and.b		#0xC0,%d0		| mask the type bits
	move.b	    %d0,Dtypef(%a3)	| save the data type

	moveq		#0,%d0			| clear d0 and set the zero flag
	movea.l	    %d0,%a0			| return a null address
	rts

 .endif


*************************************************************************************
*
* do loop without do error

LAB_LDER:
	moveq	#0x22,%d7			| error code $22 "LOOP without DO" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do undefined function error

LAB_UFER:
	moveq	#0x20,%d7			| error code $20 "Undefined function" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do can't continue error

LAB_CCER:
	moveq	#0x1E,%d7			| error code $1E "Can't continue" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do string too complex error

LAB_SCER:
	moveq	#0x1C,%d7			| error code $1C "String too complex" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do string too long error

LAB_SLER:
	moveq	#0x1A,%d7			| error code $1A "String too long" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do type missmatch error

LAB_TMER:
	moveq	#0x18,%d7			| error code $18 "Type mismatch" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do illegal direct error

LAB_IDER:
	moveq	#0x16,%d7			| error code $16 "Illegal direct" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do divide by zero error

LAB_DZER:
	moveq	#0x14,%d7			| error code $14 "Divide by zero" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do double dimension error

LAB_DDER:
	moveq	#0x12,%d7			| error code $12 "Double dimension" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do array bounds error

LAB_ABER:
	moveq	#0x10,%d7			| error code $10 "Array bounds" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do undefine satement error

LAB_USER:
	moveq	#0x0E,%d7			| error code $0E "Undefined ststement" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do out of memory error

LAB_OMER:
	moveq	#0x0C,%d7			| error code $0C "Out of memory" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do overflow error

LAB_OFER:
	moveq	#0x0A,%d7			| error code $0A "Overflow" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do function call error

LAB_FCER:
	moveq	#0x08,%d7			| error code $08 "Function call" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do out of data error

LAB_ODER:
	moveq	#0x06,%d7			| error code $06 "Out of DATA" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do return without gosub error

LAB_RGER:
	moveq	#0x04,%d7			| error code $04 "RETURN without GOSUB" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do syntax error

LAB_SNER:
	moveq	#0x02,%d7			| error code $02 "Syntax" error
	bra		LAB_XERR			| do error #d7, then warm start


*************************************************************************************
*
* do next without for error

LAB_NFER:
	moveq	#0x00,%d7			| error code $00 "NEXT without FOR" error

*************************************************************************************
*
* do error #d7, then warm start

LAB_XERR:
	bsr		LAB_1491			| flush stack & clear continue flag
	bsr		LAB_CRLF			| print CR/LF
	lea		LAB_BAER(%pc),%a1	| start of error message pointer table
	move.w	(%a1,%d7.w),%d7		| get error message offset
	lea		(%a1,%d7.w),%a0		| get error message address
	bsr		LAB_18C3			| print null terminated string from memory
	lea		LAB_EMSG(%pc),%a0	| point to " Error" message
LAB_1269:
	bsr		LAB_18C3			| print null terminated string from memory
	move.l	Clinel(%a3),%d0		| get current line
	bmi.s	LAB_1274		    | go do warm start if -ve # (was immediate mode)

							    | else print line number
	bsr		LAB_2953			| print " in line [LINE #]"

* BASIC warm start entry point, wait for Basic command

LAB_1274:
	lea		LAB_RMSG(%pc),%a0	| point to "Ready" message
	bsr		LAB_18C3			| go do print string

* wait for Basic command (no "Ready")

LAB_127D:
	moveq	#-1,%d1			    | set to -1
	move.l	%d1,Clinel(%a3)		| set current line #
	move.b	%d1,Breakf(%a3)		| set break flag
	lea		Ibuffs(%a3),%a5		| set BASIC execute pointer ready for new line
LAB_127E:
	bsr		LAB_1357			| call for BASIC input
	bsr		LAB_GBYT			| scan memory
	beq.s	LAB_127E			| loop while null

* got to interpret input line now ....

	bcs 	LAB_1295			| branch if numeric character, handle new
							    | BASIC line

							    | no line number so do immediate mode, a5
							    | points to the buffer start
	bsr		LAB_13A6			| crunch keywords into Basic tokens
							    | crunch from (a5), output to (a0)
							    | returns ..
							    | d2 is length, d1 trashed, d0 trashed,
							    | a1 trashed
	bra		LAB_15F6			| go scan & interpret code

*************************************************************************************
*
* handle a new BASIC line

LAB_1295:
	bsr		LAB_GFPN		    | get fixed-point number into temp integer & d1
	bsr		LAB_13A6		    | crunch keywords into Basic tokens
							    | crunch from (a5), output to (a0)
							    | returns .. d2 is length,
							    | d1 trashed, d0 trashed, a1 trashed
	move.l	Itemp(%a3),%d1	    | get required line #
	bsr		LAB_SSLN		    | search BASIC for d1 line number
							    | returns pointer in a0
	bcs.s	LAB_12E6		    | branch if not found

							    | aroooogah! line # already exists! delete it
	movea.l	(%a0),%a1		    | get start of block (next line pointer)
	move.l	Sfncl(%a3),%d0	    | get end of block (start of functions)
	sub.l	%a1,%d0			    | subtract start of block ( = bytes to move)
	lsr.l	#1,%d0			    | /2 (word move)
	subq.l	#1,%d0			    | adjust for dbf loop
	swap	%d0				    | swap high word to low word
	movea.l	%a0,%a2			    | copy destination
LAB_12AE:
	swap	%d0				    | swap high word to low word
LAB_12B0:
	move.w	(%a1)+,(%a2)+	    | copy word
	dbf		%d0,LAB_12B0	    | decrement low count and loop until done

	swap	%d0				    | swap high word to low word
	dbf		%d0,LAB_12AE		| decrement high count and loop until done

	move.l	%a2,Sfncl(%a3)		| start of functions
	move.l	%a2,Svarl(%a3)		| save start of variables
	move.l	%a2,Sstrl(%a3)		| start of strings
	move.l	%a2,Sarryl(%a3)		| save start of arrays
	move.l	%a2,Earryl(%a3)		| save end of arrays

							    | got new line in buffer and no existing same #
LAB_12E6:
	move.b	Ibuffs(%a3),%d0		| get byte from start of input buffer
	beq 	LAB_1325		    | if null line go do line chaining

							    | got new line and it isn't empty line
	movea.l	Sfncl(%a3),%a1		| get start of functions (end of block to move)
	lea		8(%a1,%d2),%a2		| copy it, add line length and add room for
							    | pointer and line number

	move.l	%a2,Sfncl(%a3)		| start of functions
	move.l	%a2,Svarl(%a3)		| save start of variables
	move.l	%a2,Sstrl(%a3)		| start of strings
	move.l	%a2,Sarryl(%a3)		| save start of arrays
	move.l	%a2,Earryl(%a3)		| save end of arrays
	move.l	Ememl(%a3),Sstorl(%a3)	| copy end of mem to start of strings, clear
							        | strings

	move.l	%a1,%d1				| copy end of block to move
	sub.l	%a0,%d1				| subtract start of block to move
	lsr.l	#1,%d1				| /2 (word copy)
	subq.l	#1,%d1				| correct for loop end on -1
	swap	%d1				    | swap high word to low word
LAB_12FF:
	swap	%d1				    | swap high word to low word
LAB_1301:
	move.w	-(%a1),-(%a2)		| decrement pointers and copy word
	dbf		%d1,LAB_1301		| decrement & loop

	swap	%d1				    | swap high word to low word
	dbf		%d1,LAB_12FF		| decrement high count and loop until done

* space is opened up, now copy the crunched line from the input buffer into the space

	lea		Ibuffs(%a3),%a1		| source is input buffer
	movea.l	%a0,%a2				| copy destination
	moveq	#-1,%d1			    | set to allow re-chaining
	move.l	%d1,(%a2)+			| set next line pointer (allow re-chaining)
	move.l	Itemp(%a3),(%a2)+	| save line number
	lsr.w	#1,%d2				| /2 (word copy)
	subq.w	#1,%d2				| correct for loop end on -1
LAB_1303:
	move.w	(%a1)+,(%a2)+		| copy word
	dbf		%d2,LAB_1303		| decrement & loop

	bra 	LAB_1325			| go test for end of prog

* rebuild chaining of Basic lines

LAB_132E:
	addq.w	#8,%a0				| point to first code byte of line, there is
							    | always 1 byte + [EOL] as null entries are
							    | deleted
LAB_1330:
	tst.b	(%a0)+				| test byte	
	bne.s	LAB_1330			| loop if not [EOL]

							    | was [EOL] so get next line start
	move.w	%a0,%d1				| past pad byte(s)
	andi.w	#1,%d1				| mask odd bit
	add.w	%d1,%a0				| add back to ensure even
	move.l	%a0,(%a1)			| save next line pointer to current line
LAB_1325:
	movea.l	%a0,%a1				| copy pointer for this line
	tst.l	(%a0)				| test pointer to next line
	bne.s	LAB_132E			| not end of program yet so we must
							    | go and fix the pointers

	bsr		LAB_1477			| reset execution to start, clear variables
							    | and flush stack
	bra		LAB_127D			| now we just wait for Basic command, no "Ready"


*************************************************************************************
*
* receive a line from the keyboard
							    * character $08 as delete key, BACKSPACE on
							    * standard keyboard
LAB_134B:
	bsr		LAB_PRNA			| go print the character
	moveq	#' ',%d0			| load [SPACE]
	bsr		LAB_PRNA			| go print
	moveq	#0x08,%d0			| load [BACKSPACE]
	bsr		LAB_PRNA			| go print
	subQ.w	#0x01,%d1			| decrement the buffer index (delete)
	bra.s	LAB_1359			| re-enter loop

* print "? " and get BASIC input
* return a0 pointing to the buffer start

LAB_INLN:
	bsr		LAB_18E3			| print "?" character
	moveq	#' ',%d0			| load " "
	bsr		LAB_PRNA			| go print

* call for BASIC input (main entry point)
* return a0 pointing to the buffer start

LAB_1357:
	moveq	#0x00,%d1			| clear buffer index
	lea		Ibuffs(%a3),%a0		| set buffer base pointer
LAB_1359:
	jsr		V_INPT(%a3)			| call scan input device
	bcc.s	LAB_1359			| loop if no byte

	beq.s	LAB_1359			| loop if null byte

	cmp.b	#0x07,%d0			| compare with [BELL]
	beq.s	LAB_1378			| branch if [BELL]

	cmp.b	#0x0D,%d0			| compare with [CR]
	beq		LAB_1866			| do CR/LF exit if [CR]

	tst.w	%d1				    | set flags on buffer index
	bne.s	LAB_1374			| branch if not empty

* the next two lines ignore any non printing character and [SPACE] if the input buffer
* is empty

	cmp.b		#' ',%d0			| compare with [SP]+1
	bls.s		LAB_1359			| if < ignore character

*##	cmp.b		#' '+1,%d0			| compare with [SP]+1
*##	bcs.s		LAB_1359			| if < ignore character

LAB_1374:
	cmp.b		#0x08,%d0			| compare with [BACKSPACE]
	beq.s		LAB_134B			| go delete last character

LAB_1378:
	cmp.w		#(Ibuffe-Ibuffs-1),%d1	| compare character count with max-1
	bcc.s		LAB_138E			| skip store & do [BELL] if buffer full

	move.b	    %d0,(%a0,%d1.w)		| else store in buffer
	addq.w	    #0x01,%d1			| increment index
LAB_137F:
	bsr		    LAB_PRNA			| go print the character
	bra.s	    LAB_1359			| always loop for next character

| announce buffer full

LAB_138E:
	moveq		#0x07,%d0			| [BELL] character into d0
	bra.s		LAB_137F			| go print the [BELL] but ignore input character


*************************************************************************************
*
* copy a hex value without crunching

LAB_1392:
	move.b	    %d0,(%a0,%d2.w)		| save the byte to the output
	addq.w	    #1,%d2				| increment the buffer save index

	addq.w	    #1,%d1				| increment the buffer read index
	move.b	    (%a5,%d1.w),%d0		| get a byte from the input buffer
	beq		    LAB_13EC			| if [EOL] go save it without crunching

	cmp.b		#' ',%d0			| compare the character with " "
	beq.s		LAB_1392			| if [SPACE] just go save it and get another

	cmp.b		#'0',%d0			| compare the character with "0"
	bcs.s		LAB_13C6			| if < "0" quit the hex save loop

	cmp.b		#'9',%d0			| compare with "9"
	bls.s		LAB_1392			| if it is "0" to "9" save it and get another

	moveq		#-33,%d5			| mask xx0x xxxx, ASCII upper case
	and.b		%d0,%d5				| mask the character

	cmp.b		#'A',%d5			| compare with "A"
	bcs.s		LAB_13CC			| if < "A" quit the hex save loop

	cmp.b		#'F',%d5			| compare with "F"
	bls.s		LAB_1392			| if it is "A" to "F" save it and get another

	bra.s		LAB_13CC			| else continue crunching

* crunch keywords into Basic tokens
* crunch from (a5), output to (a0)
* returns ..
* d4 trashed
* d3 trashed
* d2 is length
* d1 trashed
* d0 trashed
| a1 trashed

* this is the improved BASIC crunch routine and is 10 to 100 times faster than the
* old list search

LAB_13A6:
	moveq		#0,%d1				| clear the read index
	move.l	    %d1,%d2				| clear the save index
	move.b	    %d1,Oquote(%a3)		| clear the open quote/DATA flag
LAB_13AC:
	moveq		#0,%d0				| clear word
	move.b	    (%a5,%d1.w),%d0		| get byte from input buffer
	beq.s		LAB_13EC			| if null save byte then continue crunching

	cmp.b		#'_',%d0			| compare with "_"
	bcc.s		LAB_13EC			| if >= "_" save byte then continue crunching

	cmp.b		#'<',%d0			| compare with "<"
	bcc.s		LAB_13CC			| if >= "<" go crunch

	cmp.b		#'0',%d0			| compare with "0"
	bcc.s		LAB_13EC			| if >= "0" save byte then continue crunching

	move.b	    %d0,Asrch(%a3)		| save buffer byte as search character
	cmp.b		#0x22,%d0			| is it quote character?
	beq.s		LAB_1410			| branch if so (copy quoted string)

	cmp.b		#'$',%d0			| is it the hex value character?
	beq.s		LAB_1392			| if so go copy a hex value

LAB_13C6:
	cmp.b		#'*',%d0			| compare with "*"
	bcs.s		LAB_13EC			| if <= "*" save byte then continue crunching

				        			| crunch rest
LAB_13CC:
	btst.b	    #6,Oquote(%a3)		| test open quote/DATA token flag
	bne.s		LAB_13EC			| branch if b6 of Oquote set (was DATA)
						        	| go save byte then continue crunching

	sub.b		#0x2A,%d0			| normalise byte
	add.w		%d0,%d0				| *2 makes word offset (high byte=$00)
	lea		    TAB_CHRT(%pc),%a1	| get keyword offset table address
	move.w	    (%a1,%d0.w),%d0		| get offset into keyword table
	bmi.s		LAB_141F			| branch if no keywords for character

	lea		    TAB_STAR(%pc),%a1	| get keyword table address
	ADDA.w	    %d0,%a1				| add keyword offset
	moveq		#-1,%d3			    | clear index
	move.w	    %d1,%d4				| copy read index
LAB_13D6:
	addq.w	    #1,%d3				| increment table index
	move.b	    (%a1,%d3.w),%d0		| get byte from table
LAB_13D8:
	bmi.s		LAB_13EA			| branch if is token, save token and continue
							        | crunching

	addq.w	    #1,%d4				| increment read index
	cmp.b		(%a5,%d4.w),%d0		| compare byte from input buffer
	beq.s		LAB_13D6			| loop if character match

	bra.s		LAB_1417			| branch if no match

LAB_13EA:
	move.w	    %d4,%d1				| update read index
LAB_13EC:
	move.b	    %d0,(%a0,%d2.w)		| save byte to output
	addq.w	    #1,%d2				| increment buffer save index
	addq.w	    #1,%d1				| increment buffer read index
	tst.b		%d0				    | set flags
	beq.s		LAB_142A			| branch if was null [EOL]

							        | d0 holds token or byte here
	sub.b		#0x3A,%d0			| subtract ":"
	beq.s		LAB_13FF			| branch if it was ":" (is now $00)

							        | d0 now holds token-$3A
	cmp.b		#(TK_DATA-0x3A),%d0	| compare with DATA token - $3A
	bne.s		LAB_1401			| branch if not DATA

							        	| token was : or DATA
LAB_13FF:
	move.b	    %d0,Oquote(%a3)			| save token-$3A ($00 for ":", TK_DATA-$3A for
							        	| DATA)
LAB_1401:
	sub.b		#(TK_REM-0x3A),%d0		| subtract REM token offset
	BNE		    LAB_13AC				| If wasn't REM then go crunch rest of line

	move.b		%d0,Asrch(%a3)			| else was REM so set search for [EOL]

										| loop for REM, "..." etc.
LAB_1408:
	move.b		(%a5,%d1.w),%d0			| get byte from input buffer
	beq.s		LAB_13EC				| branch if null [EOL]

	cmp.b		Asrch(%a3),%d0			| compare with stored character
	beq.s		LAB_13EC				| branch if match (end quote, REM, :, or DATA)

										| entry for copy string in quotes, don't crunch
LAB_1410:
	move.b		%d0,(%a0,%d2.w)			| save byte to output
	addq.w		#1,%d2					| increment buffer save index
	addq.w		#1,%d1					| increment buffer read index
	bra.s		LAB_1408				| loop

* not found keyword this go so find the end of this word in the table

LAB_1417:
	move.w		%d1,%d4					| reset read pointer
LAB_141B:
	addq.w		#1,%d3					| increment keyword table pointer, flag
										| unchanged
	move.b		(%a1,%d3.w),%d0			| get keyword table byte
	BPL.s		LAB_141B				| if not end of keyword go do next byte

	addq.w		#1,%d3					| increment keyword table pointer flag
										| unchanged
	move.b		(%a1,%d3.w),%d0			| get keyword table byte
	bne.s		LAB_13D8				| go test next word if not zero byte (table end)

										| reached end of table with no match
LAB_141F:
	move.b		(%a5,%d1.w),%d0			| restore byte from input buffer
	bra.s		LAB_13EC				| go save byte in output and continue crunching

										| reached [EOL]
LAB_142A:
	moveq		#0,%d0					| ensure longword clear
	btst		%d0,%d2					| test odd bit (fastest)
	beq.s		LAB_142C				| branch if no bytes to fill

	move.b		%d0,(%a0,%d2.w)			| clear next byte
	addq.w		#1,%d2					| increment buffer save index
LAB_142C:
	move.l		%d0,(%a0,%d2.w)			| clear next line pointer, EOT in immediate mode
	rts

*************************************************************************************
*
* search Basic for d1 line number from start of mem

LAB_SSLN:
	movea.l		Smeml(%a3),%a0		| get start of program mem
	bra.s		LAB_SCLN			| go search for required line from a0

LAB_145F:
	movea.l		%d0,%a0				| copy next line pointer

* search Basic for d1 line number from a0
* returns Cb=0 if found
* returns a0 pointer to found or next higher (not found) line

LAB_SCLN:
	move.l		(%a0)+,%d0			| get next line pointer and point to line #
	beq.s		LAB_145E			| is end marker so we're done, do 'no line' exit

	cmp.l		(%a0),%d1			| compare this line # with required line #
	bgt.s		LAB_145F			| loop if required # > this #

	subq.w		#4,%a0				| adjust pointer, flags not changed
	rts

LAB_145E:
	subq.w		#4,%a0				| adjust pointer, flags not changed
	subq.l		#1,%d0				| make end program found = -1, set carry
	rts


*************************************************************************************
*
* perform NEW

LAB_NEW:
	bne.s		RTS_005				| exit if not end of statement (do syntax error)

LAB_1463:
	movea.l		Smeml(%a3),%a0		| point to start of program memory
	moveq		#0,%d0				| clear longword
	move.l		%d0,(%a0)+			| clear first line, next line pointer
	move.l		%a0,Sfncl(%a3)		| set start of functions

* reset execution to start, clear variables and flush stack

LAB_1477:
	movea.l		Smeml(%a3),%a5		| reset BASIC execute pointer
	subq.w		#1,%a5				| -1 (as end of previous line)

* "CLEAR" command gets here

LAB_147A:
	move.l		Ememl(%a3),Sstorl(%a3)	| save end of mem as bottom of string space
	move.l		Sfncl(%a3),%d0		| get start of functions
	move.l		%d0,Svarl(%a3)		| start of variables
	move.l		%d0,Sstrl(%a3)		| start of strings
	move.l		%d0,Sarryl(%a3)		| set start of arrays
	move.l		%d0,Earryl(%a3)		| set end of arrays
	moveq		#0,%d0				| set Zb
	move.b		%d0,ccnull(%a3)		| clear get byte countdown
	bsr			LAB_RESTORE			| perform RESTORE command

* flush stack & clear continue flag

LAB_1491:
	lea			des_sk(%a3),%a4		| reset descriptor stack pointer

	move.l		(%sp)+,%d0			| pull return address
	lea			ram_base(%a3),%sp	| set stack to RAM start + 1k, flush stack
	move.l		%d0,-(%sp)			| restore return address

	moveq		#0,%d0				| clear longword
	move.l		%d0,Cpntrl(%a3)		| clear continue pointer
	move.b		%d0,Sufnxf(%a3)		| clear subscript/FNX flag
RTS_005:
	rts


*************************************************************************************
*
* perform CLEAR

LAB_CLEAR:
	beq.s		LAB_147A			| if no following byte go do "CLEAR"

	rts								| was following byte (go do syntax error)

*************************************************************************************
*
* perform LIST [n][-m]

LAB_LIST:
	bcs.s		LAB_14BD			| branch if next character numeric (LIST n...)

	moveq		#-1,%d1				| set end to $FFFFFFFF
	move.l		%d1,Itemp(%a3)		| save to Itemp

	moveq		#0,%d1				| set start to $00000000
	tst.b		%d0					| test next byte
	beq.s		LAB_14C0			| branch if next character [NULL] (LIST)

	cmp.b		#TK_MINUS,%d0		| compare with token for -
	bne.s		RTS_005				| exit if not - (LIST -m)

									| LIST [[n]-[m]] this sets the n, if present,
									| as the start and end
LAB_14BD:
	bsr			LAB_GFPN			| get fixed-point number into temp integer & d1
LAB_14C0:
	bsr			LAB_SSLN			| search BASIC for d1 line number
									| (pointer in a0)
	bsr			LAB_GBYT			| scan memory
	beq.s		LAB_14D4			| branch if no more characters

									| this bit checks the - is present
	cmp.b		#TK_MINUS,%d0		| compare with token for -
	bne.s		RTS_005				| return if not "-" (will be Syntax error)

	moveq		#-1,%d1				| set end to $FFFFFFFF
	move.l		%d1,Itemp(%a3)		| save Itemp

									| LIST [n]-[m] the - was there so see if
									| there is an m to set as the end value
	bsr			LAB_IGBY			| increment & scan memory
	beq.s		LAB_14D4			| branch if was [NULL] (LIST n-)

	bsr			LAB_GFPN			| get fixed-point number into temp integer & d1
LAB_14D4:
	move.b		#0x00,Oquote(%a3)	| clear open quote flag
	bsr			LAB_CRLF			| print CR/LF
	move.l		(%a0)+,%d0			| get next line pointer
	beq.s		RTS_005				| if null all done so exit

	movea.l		%d0,%a1				| copy next line pointer
	bsr			LAB_1629			| do CRTL-C check vector

	move.l		(%a0)+,%d0			| get this line #
	cmp.l		Itemp(%a3),%d0		| compare end line # with this line #
	bhi.s		RTS_005				| if this line greater all done so exit

LAB_14E2:
	movem.l		%a0-%a1,-(%sp)		| save registers
	bsr			LAB_295E			| print d0 as unsigned integer
	movem.l		(%sp)+,%a0-%a1		| restore registers
	moveq		#0x20,%d0			| space is the next character
LAB_150C:
	bsr			LAB_PRNA			| go print the character
	cmp.b		#0x22,%d0			| was it " character
	bne.s		LAB_1519			| branch if not

									| we're either entering or leaving quotes
	eor.b		#0xFF,Oquote(%a3)	| toggle open quote flag
LAB_1519:
	move.b		(%a0)+,%d0			| get byte and increment pointer
	bne.s		LAB_152E			| branch if not [EOL] (go print)

									| was [EOL]
	movea.l		%a1,%a0				| copy next line pointer
	move.l		%a0,%d0				| copy to set flags
	bne.s		LAB_14D4			| go do next line if not [EOT]

	rts

LAB_152E:
	bpl.s		LAB_150C			| just go print it if not token byte

									| else it was a token byte so maybe uncrunch it
	tst.b		Oquote(%a3)			| test the open quote flag
	bmi.s		LAB_150C			| just go print character if open quote set

									| else uncrunch BASIC token
	lea			LAB_KEYT(%pc),%a2	| get keyword table address
	moveq		#0x7F,%d1			| mask into d1
	and.b		%d0,%d1				| copy and mask token
	lsl.w		#2,%d1				| *4
	lea			(%a2,%d1.w),%a2		| get keyword entry address
	move.b		(%a2)+,%d0			| get byte from keyword table
	bsr			LAB_PRNA			| go print the first character
	moveq		#0,%d1				| clear d1
	move.b		(%a2)+,%d1			| get remaining length byte from keyword table
	bmi.s		LAB_1519			| if -ve done so go get next byte

	move.w		(%a2),%d0			| get offset to rest
	lea			TAB_STAR(%pc),%a2	| get keyword table address
	lea			(%a2,%d0.w),%a2		| get address of rest
LAB_1540:
	move.b		(%a2)+,%d0			| get byte from keyword table
	bsr			LAB_PRNA			| go print the character
	dbf			%d1,LAB_1540		| decrement and loop if more to do

	bra.s		LAB_1519			| go get next byte

*************************************************************************************
*
* perform FOR

LAB_FOR:
	bsr			LAB_LET				| go do LET

	move.l		Lvarpl(%a3),%d0		| get the loop variable pointer
	cmp.l		Sstrl(%a3),%d0		| compare it with the end of vars memory
	bge			LAB_TMER			| if greater go do type mismatch error

* test for not less than the start of variables memory if needed
*
*	cmp.l		Svarl(%a3),%d0		| compare it with the start of variables memory
*	blt			LAB_TMER			| if not variables memory do type mismatch error

*	moveq		#28,%d0				| we need 28 bytes !
*	bsr.s		LAB_1212			| check room on stack for d0 bytes
	bsr			LAB_SNBS			| scan for next BASIC statement ([:] or [EOL])
									| returns a0 as pointer to [:] or [EOL]
	move.l		%a0,(%sp)			| push onto stack (and dump the return address)
	move.l		Clinel(%a3),-(%sp)	| push current line onto stack
.equ 	TK_TO, 0xB7
	moveq		#TK_TO-0x100,%d0	| set "TO" token
	bsr			LAB_SCCA			| scan for CHR$(d0) else syntax error/warm start
	bsr			LAB_CTNM			| check if source is numeric, else type mismatch
	move.b		Dtypef(%a3),-(%sp)	| push the FOR variable data type onto stack
	bsr			LAB_EVNM			| evaluate expression and check is numeric else
									| do type mismatch

	move.l		FAC1_m(%a3),-(%sp)	| push TO value mantissa
	move.w		FAC1_e(%a3),-(%sp)	| push TO value exponent and sign

	move.l		#0x80000000,FAC1_m(%a3)	| set default STEP size mantissa
	move.w		#0x8100,FAC1_e(%a3)		| set default STEP size exponent and sign

	bsr			LAB_GBYT			| scan memory
	cmp.b		#TK_STEP,%d0		| compare with STEP token
	bne.s		LAB_15B3			| jump if not "STEP"

									| was STEP token so ....
	bsr			LAB_IGBY			| increment & scan memory
	bsr			LAB_EVNM			| evaluate expression & check is numeric
									| else do type mismatch
LAB_15B3:
	move.l		FAC1_m(%a3),-(%sp)	| push STEP value mantissa
	move.w		FAC1_e(%a3),-(%sp)	| push STEP value exponent and sign

	move.l		Lvarpl(%a3),-(%sp)	| push variable pointer for FOR/NEXT
	move.w		#TK_FOR,-(%sp)		| push FOR token on stack

	bra.s		LAB_15C2			| go do interpreter inner loop

LAB_15DC:							| have reached [EOL]+1
	move.w		%a5,%d0				| copy BASIC execute pointer
	and.w		#1,%d0				| and make line start address even
	add.w		%d0,%a5				| add to BASIC execute pointer
	move.l		(%a5)+,%d0			| get next line pointer
	beq			LAB_1274			| if null go to immediate mode, no "BREAK"
									| message (was immediate or [EOT] marker)

	move.l		(%a5)+,Clinel(%a3)	| save (new) current line #
LAB_15F6:
	bsr			LAB_GBYT			| get BASIC byte
	bsr			LAB_15FF			| go interpret BASIC code from (a5)

* interpreter inner loop (re)entry point

LAB_15C2:
	bsr			LAB_1629			| do CRTL-C check vector
	tst.b		Clinel(%a3)			| test current line #, is -ve for immediate mode
	bmi.s		LAB_15D1			| branch if immediate mode

	move.l		%a5,Cpntrl(%a3)		| save BASIC execute pointer as continue pointer
LAB_15D1:
	move.b		(%a5)+,%d0			| get this byte & increment pointer
	beq.s		LAB_15DC			| loop if [EOL]

	cmp.b		#0x3A,%d0			| compare with ":"
	beq.s		LAB_15F6			| loop if was statement separator

	bra			LAB_SNER			| else syntax error, then warm start

*************************************************************************************
*
* interpret BASIC code from (a5)

LAB_15FF:
	beq			RTS_006				| exit if zero [EOL]

LAB_1602:
	eori.b		#0x80,%d0			| normalise token
	bmi			LAB_LET				| if not token, go do implied LET

	cmp.b		#(TK_TAB-0x80),%d0	| compare normalised token with TAB
	bcc			LAB_SNER			| branch if d0>=TAB, syntax error/warm start
									| only tokens before TAB can start a statement

	ext.w		%d0					| byte to word (clear high byte)
	add.w		%d0,%d0				| *2
	lea			LAB_CTBL(%pc),%a0	| get vector table base address
	move.w		(%a0,%d0.w),%d0		| get offset to vector
	pea			(%a0,%d0.w)			| push vector
	bra			LAB_IGBY			| get following byte & execute vector


*************************************************************************************
*
* CTRL-C check jump. this is called as a subroutine but exits back via a jump if a
* key press is detected.

LAB_1629:
	jmp			V_CTLC(%a3)			| ctrl c check vector

* if there was a key press it gets back here .....

LAB_1636:
	cmp.b		#3,%d0				| compare with CTRL-C
	beq			LAB_163B			| STOP if was CTRL-C

LAB_1639:
	rts

*************************************************************************************
*
* perform END

LAB_END:
	bne.s		LAB_1639			| exit if something follows STOP
	move.b		#0,Breakf(%a3)		| clear break flag, indicate program end


*************************************************************************************
*
* perform STOP

LAB_STOP:
	bne.s		LAB_1639			| exit if something follows STOP

LAB_163B:
	lea			Ibuffe(%a3),%a1		| get buffer end
	cmpa.l		%a1,%a5				| compare execute address with buffer end
	bcs.s		LAB_164F			| branch if BASIC pointer is in buffer
									| can't continue in immediate mode

									| else...
	move.l		%a5,Cpntrl(%a3)		| save BASIC execute pointer as continue pointer
LAB_1647:
	move.l		Clinel(%a3),Blinel(%a3)	| save break line
LAB_164F:
	addq.w		#4,%sp				| dump return address, don't return to execute
									| loop
	move.b		Breakf(%a3),%d0		| get break flag
	beq			LAB_1274			| go do warm start if was program end

	lea			LAB_BMSG(%pc),%a0	| point to "Break"
	bra			LAB_1269			| print "Break" and do warm start


*************************************************************************************
*
* perform RESTORE

LAB_RESTORE:
	movea.l		Smeml(%a3),%a0		| copy start of memory
	beq.s		LAB_1624			| branch if next character null (RESTORE)

	bsr			LAB_GFPN			| get fixed-point number into temp integer & d1
	CMP.l		Clinel(%a3),%d1		| compare current line # with required line #
	bls.s		LAB_GSCH			| branch if >= (start search from beginning)

	movea.l		%a5,%a0				| copy BASIC execute pointer
LAB_RESs:
	tst.b		(%a0)+				| test next byte & increment pointer
	bne.s		LAB_RESs			| loop if not EOL

	move.w		%a0,%d0				| copy pointer
	and.w		#1,%d0				| mask odd bit
	add.w		%d0,%a0				| add pointer
									| search for line in Itemp from (a0)
LAB_GSCH:
	bsr			LAB_SCLN			| search for d1 line number from a0
									| returns Cb=0 if found
	bcs			LAB_USER			| go do "Undefined statement" error if not found

LAB_1624:
	tst.b		-(%a0)				| decrement pointer (faster)
	move.l		%a0,Dptrl(%a3)		| save DATA pointer
RTS_006:
	rts


*************************************************************************************
*
* perform NULL

LAB_NULL:
	bsr		LAB_GTBY				| get byte parameter, result in d0 and Itemp
	move.b	%d0,Nullct(%a3)			| save new NULL count
	rts

*************************************************************************************
*
* perform CONT

LAB_CONT:
	bne			LAB_SNER			| if following byte exit to do syntax error

	tst.b		Clinel(%a3)			| test current line #, is -ve for immediate mode
	bpl			LAB_CCER			| if running go do can't continue error

	move.l		Cpntrl(%a3),%d0		| get continue pointer
	beq			LAB_CCER			| go do can't continue error if we can't

									| we can continue so ...
	movea.l		%d0,%a5				| save continue pointer as BASIC execute pointer
	move.l		Blinel(%a3),Clinel(%a3)	| set break line as current line
	RTS


*************************************************************************************
*
* perform RUN

LAB_RUN:
	bne.s		LAB_RUNn			| if following byte do RUN n

	bsr			LAB_1477			| execution to start, clear vars & flush stack
	move.l		%a5,Cpntrl(%a3)		| save as continue pointer
	bra			LAB_15C2			| go do interpreter inner loop
									| (can't RTS, we flushed the stack!)

LAB_RUNn:
	bsr			LAB_147A			| go do "CLEAR"
	bra.s		LAB_16B0			| get n and do GOTO n


*************************************************************************************
*
* perform DO

LAB_DO:
*	move.l		#0x05,%d0			| need 5 bytes for DO 
*	bsr.s		LAB_1212			| check room on stack for A bytes
	move.l		%a5,-(%sp)			| push BASIC execute pointer on stack
	move.l		Clinel(%a3),-(%sp)	| push current line on stack
	move.w		#TK_DO,-(%sp)		| push token for DO on stack
	pea			LAB_15C2(%pc)		| set return address
	bra			LAB_GBYT			| scan memory and return to interpreter inner
									| loop


*************************************************************************************
*
* perform GOSUB

LAB_GOSUB:
*	move.l		#10,%d0				| need 10 bytes for GOSUB 
*	bsr.s		LAB_1212			| check room on stack for d0 bytes
	move.l		%a5,-(%sp)			| push BASIC execute pointer
	move.l		Clinel(%a3),-(%sp)	| push current line
	move.w		#TK_GOSUB,-(%sp)	| push token for GOSUB
LAB_16B0:
	bsr			LAB_GBYT			| scan memory
	pea			LAB_15C2(%pc)		| return to interpreter inner loop after GOTO n

* this PEA is needed because either we just cleared the stack and have nowhere to return
* to or, in the case of GOSUB, we have just dropped a load on the stack and the address
* we whould have returned to is buried. This burried return address will be unstacked by
* the corresponding RETURN command
