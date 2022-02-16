.include "raven68k.inc"

.section    .bss

* This lot is in RAM

ram_strt:	ds.l	0x100		    | allow 1K for the stack, this should be plenty
						            | for any BASIC program that doesn't do something
						            | silly, it could even be much less.

ram_base:
LAB_WARM:	ds.w	1			| BASIC warm start entry point
Wrmjpv: 	ds.l	1			| BASIC warm start jump vector

Usrjmp: 	ds.w	1			| USR function JMP address
Usrjpv: 	ds.l	1			| USR function JMP vector

* system dependant i/o vectors
* these are in RAM and are set at start-up

V_INPT:	    ds.w	1			| non halting scan input device entry point
V_INPTv:	ds.l	1			| non halting scan input device jump vector

V_OUTP: 	ds.w	1			| send byte to output device entry point
V_OUTPv:	ds.l	1			| send byte to output device jump vector

V_LOAD:	    ds.w	1			| load BASIC program entry point
V_LOADv:	ds.l	1			| load BASIC program jump vector

V_SAVE: 	ds.w	1			| save BASIC program entry point
V_SAVEv:	ds.l	1			| save BASIC program jump vector

V_CTLC:	    ds.w	1			| save CTRL-C check entry point
V_CTLCv:   	ds.l	1			| save CTRL-C check jump vector

Itemp:		ds.l	1			| temporary integer	(for GOTO etc)

Smeml:		ds.l	1			| start of memory		(start of program)

* the program is stored as a series of lines each line having the following format
*
*		ds.l	1			| pointer to the next line or 0x00000000 if [EOT]
*		ds.l	1			| line number
*		ds.b	n			| program bytes
*		dc.b	0x00		| [EOL] marker, there will be a second 0x00 byte, if
*						    | needed, to pad the line to an even number of bytes

Sfncl:		ds.l	1			| start of functions	(end of Program)

* the functions are stored as function name, function execute pointer and function
* variable name
*
*		ds.l	1			| name
*		ds.l	1			| execute pointer
*		ds.l	1			| function variable

Svarl:		ds.l	1			| start of variables	(end of functions)

* the variables are stored as variable name, variable value
*
*		ds.l	1			| name
*		ds.l	1			| packed float or integer value

Sstrl:		ds.l	1			| start of strings	(end of variables)

* the strings are stored as string name, string pointer and string length
*
*		ds.l	1			| name
*		ds.l	1			| string pointer
*		ds.w	1			| string length

Sarryl: 	ds.l	1		    | start of arrays		(end of strings)

* the arrays are stored as array name, array size, array dimensions count, array
* dimensions upper bounds and array elements
*
*		ds.l	1			| name
*		ds.l	1			| size including this header
*		ds.w	1			| dimensions count
*		ds.w	1			| 1st dimension upper bound
*		ds.w	1			| 2nd dimension upper bound
*		...				| ...
*		ds.w	1			| nth dimension upper bound
*
* then (i1+1)|(i2+1)...|(in+1) of either ..
*
*		ds.l	1			| packed float or integer value
*
* .. if float or integer, or ..
*
*		ds.l	1			| string pointer
*		ds.w	1			| string length
*
* .. if string

Earryl: 	ds.l	1			| end of arrays		(start of free mem)
Sstorl: 	ds.l	1			| string storage		(moving down)
Ememl:		ds.l	1			| end of memory		(upper bound of RAM)
Sutill: 	ds.l	1			| string utility ptr
Clinel: 	ds.l	1			| current line		(Basic line number)
Blinel: 	ds.l	1			| break line		(Basic line number)

Cpntrl: 	ds.l	1			| continue pointer
Dlinel: 	ds.l	1			| current DATA line
Dptrl:		ds.l	1			| DATA pointer
Rdptrl: 	ds.l	1			| read pointer
Varname:    ds.l	1			| current var name
Cvaral: 	ds.l	1			| current var address
Lvarpl: 	ds.l	1			| variable pointer for LET and FOR/NEXT

des_sk_e:	ds.l	6			| descriptor stack end address
des_sk:  	ds.w	1		    | descriptor stack start address
						        | use a4 for the descriptor pointer
		    			
Ibuffs: 	ds.l	0x40		| start of input buffer
Ibuffe:
		        				| end of input buffer

FAC1_m: 	ds.l	1			| FAC1 mantissa1
FAC1_e: 	ds.w	1			| FAC1 exponent
.equ        FAC1_s, FAC1_e+1    | FAC1 sign (b7)
		

FAC2_m:	    ds.l	1			| FAC2 mantissa1
FAC2_e:	    ds.l	1			| FAC2 exponent
.equ        FAC2_s, FAC2_e+1    | FAC2 sign (b7)
.equ        FAC_sc, FAC2_e+2    | FAC sign comparison, Acc#1 vs #2
.equ        flag,   FAC2_e+3    | flag byte for divide routine

PRNlword:	ds.l	1			| PRNG seed long word

ut1_pl: 	ds.l	1			| utility pointer 1

Asptl:		ds.l	1			| array size/pointer
Astrtl: 	ds.l	1			| array start pointer

.equ        numexp,	Astrtl		| string to float number exponent count
.equ        expcnt, Astrtl+1	| string to float exponent count

.equ        expneg, Astrtl+3	| string to float eval exponent -ve flag

func_l: 	ds.l	1			| function pointer


		        				| these two need to be a word aligned pair !
Defdim: 	ds.w	1			| default DIM flag
.equ        cosout, Defdim		| flag which CORDIC output (re-use byte)
.equ        Dtypef, Defdim+1	| data type flag, 0x80=string, 0x40=integer, 0x00=float


Binss:		ds.l	4			| number to bin string start (32 chrs)

Decss:		ds.l	1			| number to decimal string start (16 chrs)

Usdss:		ds.w	1			| unsigned decimal string start (10 chrs)

Hexss:		ds.l	2			| number to hex string start (8 chrs)

BHsend: 	ds.w	1			| bin/decimal/hex string end


prstk:		ds.b	1			| stacked function index

tpower: 	ds.b	1			| remember CORDIC power

Asrch:		ds.b	1			| scan-between-quotes flag, alt search character

Dimcnt: 	ds.b	1			| # of dimensions

Breakf: 	ds.b	1			| break flag, 0x00=END else=break
Oquote: 	ds.b	1			| open quote flag (Flag: DATA; LIST; memory)
Gclctd: 	ds.b	1			| garbage collected flag
Sufnxf: 	ds.b	1			| subscript/FNX flag, 1xxx xxx = FN(0xxx xxx)
Imode:		ds.b	1			| input mode flag, 0x00=INPUT, 0x98=READ

Cflag:		ds.b	1			| comparison evaluation flag

TabSiz: 	ds.b	1			| TAB step size

comp_f: 	ds.b	1			| compare function flag, bits 0,1 and 2 used
		    		    		| bit 2 set if >
			    		    	| bit 1 set if =
				    		    | bit 0 set if <

Nullct: 	ds.b	1			| nulls output after each line
TPos:		ds.b	1			| BASIC terminal position byte
TWidth: 	ds.b	1			| BASIC terminal width byte
Iclim:		ds.b	1			| input column limit
ccflag: 	ds.b	1			| CTRL-C check flag
ccbyte: 	ds.b	1			| CTRL-C last received byte
ccnull: 	ds.b	1			| CTRL-C last received byte 'life' timer

* these variables for simulator load/save routines

file_byte: 	ds.b	1			| load/save data byte
file_id:    ds.l	1			| load/save file ID


prg_strt:

.equ ram_addr, 0x1000	    	| RAM start address
.equ ram_size, 0x80000		    | RAM size

*************************************************************************************

* token values needed for BASIC

.equ 	TK_END,		0x80			| 0x80
.equ 	TK_FOR,		TK_END+1		| 0x81
.equ 	TK_NEXT,	TK_FOR+1		| 0x82
.equ 	TK_DATA,	TK_NEXT+1		| 0x83
.equ 	TK_INPUT,	TK_DATA+1		| 0x84
.equ 	TK_DIM,		TK_INPUT+1		| 0x85
.equ 	TK_READ,	TK_DIM+1		| 0x86
.equ 	TK_LET,		TK_READ+1		| 0x87
.equ 	TK_DEC,		TK_LET+1		| 0x88
.equ 	TK_GOTO,	TK_DEC+1		| 0x89
.equ 	TK_RUN,		TK_GOTO+1		| 0x8A
.equ 	TK_IF,		TK_RUN+1		| 0x8B
.equ 	TK_RESTORE,	TK_IF+1			| 0x8C
.equ 	TK_GOSUB,	TK_RESTORE+1	| 0x8D
.equ 	TK_RETURN,	TK_GOSUB+1		| 0x8E
.equ 	TK_REM,		TK_RETURN+1		| 0x8F
.equ 	TK_STOP,	TK_REM+1		| 0x90
.equ 	TK_ON,		TK_STOP+1		| 0x91
.equ 	TK_NULL,	TK_ON+1			| 0x92
.equ 	TK_INC,		TK_NULL+1		| 0x93
.equ 	TK_WAIT,	TK_INC+1		| 0x94
.equ 	TK_LOAD,	TK_WAIT+1		| 0x95
.equ 	TK_SAVE,	TK_LOAD+1		| 0x96
.equ 	TK_DEF,		TK_SAVE+1		| 0x97
.equ 	TK_POKE,	TK_DEF+1		| 0x98
.equ 	TK_DOKE,	TK_POKE+1		| 0x99
.equ 	TK_LOKE,	TK_DOKE+1		| 0x9A
.equ 	TK_CALL,	TK_LOKE+1		| 0x9B
.equ 	TK_DO	,	TK_CALL+1		| 0x9C
.equ 	TK_LOOP,	TK_DO+1			| 0x9D
.equ 	TK_PRINT,	TK_LOOP+1		| 0x9E
.equ 	TK_CONT,	TK_PRINT+1		| 0x9F

.equ 	TK_BUFFER,	TK_CONT+1		| 0xA0 EASy68k graphics extension
.equ 	TK_CLS,		TK_BUFFER+1		| 0xA1 EASy68k graphics extension
.equ 	TK_CURSOR,	TK_CLS+1		| 0xA2 EASy68k graphics extension
.equ 	TK_LINE,	TK_CURSOR+1		| 0xA3 EASy68k graphics extension
.equ 	TK_FILL,	TK_LINE+1		| 0xA4 EASy68k graphics extension
.equ 	TK_MOVE,	TK_FILL+1		| 0xA5 EASy68k graphics extension
.equ 	TK_POINT,	TK_MOVE+1		| 0xA6 EASy68k graphics extension
.equ 	TK_RECT,	TK_POINT+1		| 0xA7 EASy68k graphics extension
.equ 	TK_FRECT,	TK_RECT+1		| 0xA8 EASy68k graphics extension
.equ 	TK_ELLIPSE,	TK_FRECT+1		| 0xA9 EASy68k graphics extension
.equ 	TK_FELLIPSE,TK_ELLIPSE+1	| 0xAA EASy68k graphics extension
.equ 	TK_MODE,	TK_FELLIPSE+1	| 0xAB EASy68k graphics extension
.equ 	TK_SIZE,	TK_MODE+1		| 0xAC EASy68k graphics extension

.equ 	TK_LIST,	TK_SIZE+1		| 0xAD
.equ 	TK_CLEAR,	TK_LIST+1		| 0xAE
.equ 	TK_NEW,		TK_CLEAR+1		| 0xAF
.equ 	TK_WIDTH,	TK_NEW+1		| 0xB0
.equ 	TK_GET,		TK_WIDTH+1		| 0xB1
.equ 	TK_SWAP,	TK_GET+1		| 0xB2
.equ 	TK_BITSET,	TK_SWAP+1		| 0xB3
.equ 	TK_BITCLR,	TK_BITSET+1		| 0xB4
.equ 	TK_TAB,		TK_BITCLR+1		| 0xB5
.equ 	TK_ELSE,	TK_TAB+1		| 0xB6
.equ 	TK_TO,		TK_ELSE+1		| 0xB7
.equ 	TK_FN,		TK_TO+1			| 0xB8
.equ 	TK_SPC,		TK_FN+1			| 0xB9
.equ 	TK_THEN,	TK_SPC+1		| 0xBA
.equ 	TK_NOT,		TK_THEN+1		| 0xBB
.equ 	TK_STEP,	TK_NOT+1		| 0xBC
.equ 	TK_UNTIL,	TK_STEP+1		| 0xBD
.equ 	TK_WHILE,	TK_UNTIL+1		| 0xBE
.equ 	TK_PLUS,	TK_WHILE+1		| 0xBF
.equ 	TK_MINUS,	TK_PLUS+1		| 0xC0
.equ 	TK_MULT,	TK_MINUS+1		| 0xC1
.equ 	TK_DIV,		TK_MULT+1		| 0xC2
.equ 	TK_POWER,	TK_DIV+1		| 0xC3
.equ 	TK_AND,		TK_POWER+1		| 0xC4
.equ 	TK_EOR,		TK_AND+1		| 0xC5
.equ 	TK_OR,		TK_EOR+1		| 0xC6
.equ 	TK_RSHIFT,	TK_OR+1			| 0xC7
.equ 	TK_LSHIFT,	TK_RSHIFT+1		| 0xC8
.equ 	TK_GT,		TK_LSHIFT+1		| 0xC9
.equ 	TK_EQUAL,	TK_GT+1			| 0xCA
.equ 	TK_LT,		TK_EQUAL+1		| 0xCB
.equ 	TK_SGN,		TK_LT+1			| 0xCC
.equ 	TK_INT,		TK_SGN+1		| 0xCD
.equ 	TK_ABS,		TK_INT+1		| 0xCE
.equ 	TK_USR,		TK_ABS+1		| 0xCF
.equ 	TK_FRE,		TK_USR+1		| 0xD0
.equ 	TK_POS,		TK_FRE+1		| 0xD1
.equ 	TK_SQR,		TK_POS+1		| 0xD2
.equ 	TK_RND,		TK_SQR+1		| 0xD3
.equ 	TK_LOG,		TK_RND+1		| 0xD4
.equ 	TK_EXP,		TK_LOG+1		| 0xD5
.equ 	TK_COS,		TK_EXP+1		| 0xD6
.equ 	TK_SIN,		TK_COS+1		| 0xD7
.equ 	TK_TAN,		TK_SIN+1		| 0xD8
.equ 	TK_ATN,		TK_TAN+1		| 0xD9
.equ 	TK_PEEK,	TK_ATN+1		| 0xDA
.equ 	TK_DEEK,	TK_PEEK+1		| 0xDB
.equ 	TK_LEEK,	TK_DEEK+1		| 0xDC
.equ 	TK_LEN,		TK_LEEK+1		| 0xDD
.equ 	TK_STRS,	TK_LEN+1		| 0xDE
.equ 	TK_VAL,		TK_STRS+1		| 0xDF
.equ 	TK_ASC,		TK_VAL+1		| 0xE0
.equ 	TK_UCASES,	TK_ASC+1		| 0xE1
.equ 	TK_LCASES,	TK_UCASES+1		| 0xE2
.equ 	TK_CHRS,	TK_LCASES+1		| 0xE3
.equ 	TK_HEXS,	TK_CHRS+1		| 0xE4
.equ 	TK_BINS,	TK_HEXS+1		| 0xE5
.equ 	TK_BITTST,	TK_BINS+1		| 0xE6
.equ 	TK_MAX,		TK_BITTST+1		| 0xE7
.equ 	TK_MIN,		TK_MAX+1		| 0xE8
.equ 	TK_RAM,		TK_MIN+1		| 0xE9
.equ 	TK_KEYS,	TK_RAM+1		| 0xEA EASy68k simulator extension
.equ 	TK_TI,		TK_KEYS+1		| 0xEB EASy68k simulator extension
.equ 	TK_PI,		TK_TI+1			| 0xEC
.equ 	TK_TWOPI,	TK_PI+1			| 0xED
.equ 	TK_VPTR,	TK_TWOPI+1		| 0xEE
.equ 	TK_SADD,	TK_VPTR+1		| 0xEF
.equ 	TK_LEFTS,	TK_SADD+1		| 0xF0
.equ 	TK_RIGHTS,	TK_LEFTS+1		| 0xF1
.equ 	TK_MIDS,	TK_RIGHTS+1		| 0xF2
.equ 	TK_USINGS,	TK_MIDS+1		| 0xF3


.section .rodata

************************************************************************************
*
* binary to unsigned decimal table

Bin2dec:
	dc.l	0x3B9ACA00				| 1000000000
	dc.l	0x05F5E100				| 100000000
	dc.l	0x00989680				| 10000000
	dc.l	0x000F4240				| 1000000
	dc.l	0x000186A0				| 100000
	dc.l	0x00002710				| 10000
	dc.l	0x000003E8				| 1000
	dc.l	0x00000064				| 100
	dc.l	0x0000000A				| 10
	dc.l	0x00000000				| 0 end marker

LAB_RSED:
	dc.l	0x332E3232				| 858665522

* string to value exponent table

	dc.w	255<<8				| 10**38
	dc.l	0x96769951
	dc.w	251<<8				| 10**37
	dc.l	0xF0BDC21B
	dc.w	248<<8				| 10**36
	dc.l	0xC097CE7C
	dc.w	245<<8				| 10**35
	dc.l	0x9A130B96
	dc.w	241<<8				| 10**34
	dc.l	0xF684DF57
	dc.w	238<<8				| 10**33
	dc.l	0xC5371912
	dc.w	235<<8				| 10**32
	dc.l	0x9DC5ADA8
	dc.w	231<<8				| 10**31
	dc.l	0xFC6F7C40
	dc.w	228<<8				| 10**30
	dc.l	0xC9F2C9CD
	dc.w	225<<8				| 10**29
	dc.l	0xA18F07D7
	dc.w	222<<8				| 10**28
	dc.l	0x813F3979
	dc.w	218<<8				| 10**27
	dc.l	0xCECB8F28
	dc.w	215<<8				| 10**26
	dc.l	0xA56FA5BA
	dc.w	212<<8				| 10**25
	dc.l	0x84595161
	dc.w	208<<8				| 10**24
	dc.l	0xD3C21BCF
	dc.w	205<<8				| 10**23
	dc.l	0xA968163F
	dc.w	202<<8				| 10**22
	dc.l	0x87867832
	dc.w	198<<8				| 10**21
	dc.l	0xD8D726B7
	dc.w	195<<8				| 10**20
	dc.l	0xAD78EBC6
	dc.w	192<<8				| 10**19
	dc.l	0x8AC72305
	dc.w	188<<8				| 10**18
	dc.l	0xDE0B6B3A
	dc.w	185<<8				| 10**17
	dc.l	0xB1A2BC2F
	dc.w	182<<8				| 10**16
	dc.l	0x8E1BC9BF
	dc.w	178<<8				| 10**15
	dc.l	0xE35FA932
	dc.w	175<<8				| 10**14
	dc.l	0xB5E620F5
	dc.w	172<<8				| 10**13
	dc.l	0x9184E72A
	dc.w	168<<8				| 10**12
	dc.l	0xE8D4A510
	dc.w	165<<8				| 10**11
	dc.l	0xBA43B740
	dc.w	162<<8				| 10**10
	dc.l	0x9502F900
	dc.w	158<<8				| 10**9
	dc.l	0xEE6B2800
	dc.w	155<<8				| 10**8
	dc.l	0xBEBC2000
	dc.w	152<<8				| 10**7
	dc.l	0x98968000
	dc.w	148<<8				| 10**6
	dc.l	0xF4240000
	dc.w	145<<8				| 10**5
	dc.l	0xC3500000
	dc.w	142<<8				| 10**4
	dc.l	0x9C400000
	dc.w	138<<8				| 10**3
	dc.l	0xFA000000
	dc.w	135<<8				| 10**2
	dc.l	0xC8000000
	dc.w	132<<8				| 10**1
	dc.l	0xA0000000
LAB_P_10:
	dc.w	129<<8				| 10**0
	dc.l	0x80000000
	dc.w	125<<8				| 10**-1
	dc.l	0xCCCCCCCD
	dc.w	122<<8				| 10**-2
	dc.l	0xA3D70A3D
	dc.w	119<<8				| 10**-3
	dc.l	0x83126E98
	dc.w	115<<8				| 10**-4
	dc.l	0xD1B71759
	dc.w	112<<8				| 10**-5
	dc.l	0xA7C5AC47
	dc.w	109<<8				| 10**-6
	dc.l	0x8637BD06
	dc.w	105<<8				| 10**-7
	dc.l	0xD6BF94D6
	dc.w	102<<8				| 10**-8
	dc.l	0xABCC7712
	dc.w	99<<8				| 10**-9
	dc.l	0x89705F41
	dc.w	95<<8				| 10**-10
	dc.l	0xDBE6FECF
	dc.w	92<<8				| 10**-11
	dc.l	0xAFEBFF0C
	dc.w	89<<8				| 10**-12
	dc.l	0x8CBCCC09
	dc.w	85<<8				| 10**-13
	dc.l	0xE12E1342
	dc.w	82<<8				| 10**-14
	dc.l	0xB424DC35
	dc.w	79<<8				| 10**-15
	dc.l	0x901D7CF7
	dc.w	75<<8				| 10**-16
	dc.l	0xE69594BF
	dc.w	72<<8				| 10**-17
	dc.l	0xB877AA32
	dc.w	69<<8				| 10**-18
	dc.l	0x9392EE8F
	dc.w	65<<8				| 10**-19
	dc.l	0xEC1E4A7E
	dc.w	62<<8				| 10**-20
	dc.l	0xBCE50865
	dc.w	59<<8				| 10**-21
	dc.l	0x971DA050
	dc.w	55<<8				| 10**-22
	dc.l	0xF1C90081
	dc.w	52<<8				| 10**-23
	dc.l	0xC16D9A01
	dc.w	49<<8				| 10**-24
	dc.l	0x9ABE14CD
	dc.w	45<<8				| 10**-25
	dc.l	0xF79687AE
	dc.w	42<<8				| 10**-26
	dc.l	0xC6120625
	dc.w	39<<8				| 10**-27
	dc.l	0x9E74D1B8
	dc.w	35<<8				| 10**-28
	dc.l	0xFD87B5F3
	dc.w	32<<8				| 10**-29
	dc.l	0xCAD2F7F5
	dc.w	29<<8				| 10**-30
	dc.l	0xA2425FF7
	dc.w	26<<8				| 10**-31
	dc.l	0x81CEB32C
	dc.w	22<<8				| 10**-32
	dc.l	0xCFB11EAD
	dc.w	19<<8				| 10**-33
	dc.l	0xA6274BBE
	dc.w	16<<8				| 10**-34
	dc.l	0x84EC3C98
	dc.w	12<<8				| 10**-35
	dc.l	0xD4AD2DC0
	dc.w	9<<8				| 10**-36
	dc.l	0xAA242499
	dc.w	6<<8				| 10**-37
	dc.l	0x881CEA14
	dc.w	2<<8				| 10**-38
	dc.l	0xD9C7DCED


*************************************************************************************
*
* table of constants for cordic SIN/COS/TAN calculations
* constants are un normalised fractions and are atn(2^-i)/2pi

	dc.l	0x4DBA76D4				| SIN/COS multiply constant
TAB_SNCO:
	dc.l	0x20000000				| atn(2^0)/2pi
	dc.l	0x12E4051E				| atn(2^1)/2pi
	dc.l	0x09FB385C				| atn(2^2)/2pi
	dc.l	0x051111D5				| atn(2^3)/2pi
	dc.l	0x028B0D44				| atn(2^4)/2pi
	dc.l	0x0145D7E2				| atn(2^5)/2pi
	dc.l	0x00A2F61F				| atn(2^6)/2pi
	dc.l	0x00517C56				| atn(2^7)/2pi
	dc.l	0x0028BE54				| atn(2^8)/2pi
	dc.l	0x00145F2F				| atn(2^9)/2pi
	dc.l	0x000A2F99				| atn(2^10)/2pi
	dc.l	0x000517CD				| atn(2^11)/2pi
	dc.l	0x00028BE7				| atn(2^12)/2pi
	dc.l	0x000145F4				| atn(2^13)/2pi
	dc.l	0x0000A2FA				| atn(2^14)/2pi
	dc.l	0x0000517D				| atn(2^15)/2pi
	dc.l	0x000028BF				| atn(2^16)/2pi
	dc.l	0x00001460				| atn(2^17)/2pi
	dc.l	0x00000A30				| atn(2^18)/2pi
	dc.l	0x00000518				| atn(2^19)/2pi
	dc.l	0x0000028C				| atn(2^20)/2pi
	dc.l	0x00000146				| atn(2^21)/2pi
	dc.l	0x000000A3				| atn(2^22)/2pi
	dc.l	0x00000052				| atn(2^23)/2pi
	dc.l	0x00000029				| atn(2^24)/2pi
	dc.l	0x00000015				| atn(2^25)/2pi
	dc.l	0x0000000B				| atn(2^26)/2pi
	dc.l	0x00000006				| atn(2^27)/2pi
	dc.l	0x00000003				| atn(2^28)/2pi
	dc.l	0x00000002				| atn(2^29)/2pi
	dc.l	0x00000001				| atn(2^30)/2pi
	dc.l	0x00000001				| atn(2^31)/2pi


*************************************************************************************
*
* table of constants for cordic ATN calculation
* constants are normalised to two integer bits and are atn(2^-i)

TAB_ATNC:
	dc.l	0x1DAC6705				| atn(2^-1)
	dc.l	0x0FADBAFD				| atn(2^-2)
	dc.l	0x07F56EA7				| atn(2^-3)
	dc.l	0x03FEAB77				| atn(2^-4)
	dc.l	0x01FFD55C				| atn(2^-5)
	dc.l	0x00FFFAAB				| atn(2^-6)
	dc.l	0x007FFF55				| atn(2^-7)
	dc.l	0x003FFFEB				| atn(2^-8)
	dc.l	0x001FFFFD				| atn(2^-9)
	dc.l	0x00100000				| atn(2^-10)
	dc.l	0x00080000				| atn(2^-11)
	dc.l	0x00040000				| atn(2^-12)
	dc.l	0x00020000				| atn(2^-13)
	dc.l	0x00010000				| atn(2^-14)
	dc.l	0x00008000				| atn(2^-15)
	dc.l	0x00004000				| atn(2^-16)
	dc.l	0x00002000				| atn(2^-17)
	dc.l	0x00001000				| atn(2^-18)
	dc.l	0x00000800				| atn(2^-19)
	dc.l	0x00000400				| atn(2^-20)
	dc.l	0x00000200				| atn(2^-21)
	dc.l	0x00000100				| atn(2^-22)
	dc.l	0x00000080				| atn(2^-23)
	dc.l	0x00000040				| atn(2^-24)
	dc.l	0x00000020				| atn(2^-25)
	dc.l	0x00000010				| atn(2^-26)
	dc.l	0x00000008				| atn(2^-27)
	dc.l	0x00000004				| atn(2^-28)
	dc.l	0x00000002				| atn(2^-29)
	dc.l	0x00000001				| atn(2^-30)
LAB_1D96:
	dc.l	0x00000000				| atn(2^-31)
	dc.l	0x00000000				| atn(2^-32)

* constants are normalised to n integer bits and are tanh(2^-i)
.equ 	n, 2
TAB_HTHET:
	dc.l	0x8C9F53D0>>n			| atnh(2^-1)	.549306144
	dc.l	0x4162BBE8>>n			| atnh(2^-2)	.255412812
	dc.l	0x202B1238>>n			| atnh(2^-3)
	dc.l	0x10055888>>n			| atnh(2^-4)
	dc.l	0x0800AAC0>>n			| atnh(2^-5)
	dc.l	0x04001550>>n			| atnh(2^-6)
	dc.l	0x020002A8>>n			| atnh(2^-7)
	dc.l	0x01000050>>n			| atnh(2^-8)
	dc.l	0x00800008>>n			| atnh(2^-9)
	dc.l	0x00400000>>n			| atnh(2^-10)
	dc.l	0x00200000>>n			| atnh(2^-11)
	dc.l	0x00100000>>n			| atnh(2^-12)
	dc.l	0x00080000>>n			| atnh(2^-13)
	dc.l	0x00040000>>n			| atnh(2^-14)
	dc.l	0x00020000>>n			| atnh(2^-15)
	dc.l	0x00010000>>n			| atnh(2^-16)
	dc.l	0x00008000>>n			| atnh(2^-17)
	dc.l	0x00004000>>n			| atnh(2^-18)
	dc.l	0x00002000>>n			| atnh(2^-19)
	dc.l	0x00001000>>n			| atnh(2^-20)
	dc.l	0x00000800>>n			| atnh(2^-21)
	dc.l	0x00000400>>n			| atnh(2^-22)
	dc.l	0x00000200>>n			| atnh(2^-23)
	dc.l	0x00000100>>n			| atnh(2^-24)
	dc.l	0x00000080>>n			| atnh(2^-25)
	dc.l	0x00000040>>n			| atnh(2^-26)
	dc.l	0x00000020>>n			| atnh(2^-27)
	dc.l	0x00000010>>n			| atnh(2^-28)
	dc.l	0x00000008>>n			| atnh(2^-29)
	dc.l	0x00000004>>n			| atnh(2^-30)
	dc.l	0x00000002>>n			| atnh(2^-31)
	dc.l	0x00000001>>n			| atnh(2^-32)

.equ KFCTSEED,	0x9A8F4441>>n		| 0x26A3D110


*************************************************************************************
*
* command vector table

LAB_CTBL:
	dc.w	LAB_END-LAB_CTBL			| END
	dc.w	LAB_FOR-LAB_CTBL			| FOR
	dc.w	LAB_NEXT-LAB_CTBL			| NEXT
	dc.w	LAB_DATA-LAB_CTBL			| DATA
	dc.w	LAB_INPUT-LAB_CTBL			| INPUT
	dc.w	LAB_DIM-LAB_CTBL			| DIM
	dc.w	LAB_READ-LAB_CTBL			| READ
	dc.w	LAB_LET-LAB_CTBL			| LET
	dc.w	LAB_DEC-LAB_CTBL			| DEC	
	dc.w	LAB_GOTO-LAB_CTBL			| GOTO
	dc.w	LAB_RUN-LAB_CTBL			| RUN
	dc.w	LAB_IF-LAB_CTBL				| IF
	dc.w	LAB_RESTORE-LAB_CTBL		| RESTORE
	dc.w	LAB_GOSUB-LAB_CTBL			| GOSUB
	dc.w	LAB_RETURN-LAB_CTBL			| RETURN
	dc.w	LAB_REM-LAB_CTBL			| REM
	dc.w	LAB_STOP-LAB_CTBL			| STOP
	dc.w	LAB_ON-LAB_CTBL				| ON
	dc.w	LAB_NULL-LAB_CTBL			| NULL
	dc.w	LAB_INC-LAB_CTBL			| INC	
	dc.w	LAB_WAIT-LAB_CTBL			| WAIT
	dc.w	LAB_LOAD-LAB_CTBL			| LOAD
	dc.w	LAB_SAVE-LAB_CTBL			| SAVE
	dc.w	LAB_DEF-LAB_CTBL			| DEF
	dc.w	LAB_POKE-LAB_CTBL			| POKE
	dc.w	LAB_DOKE-LAB_CTBL			| DOKE
	dc.w	LAB_LOKE-LAB_CTBL			| LOKE
	dc.w	LAB_CALL-LAB_CTBL			| CALL
	dc.w	LAB_DO-LAB_CTBL				| DO	
	dc.w	LAB_LOOP-LAB_CTBL			| LOOP
	dc.w	LAB_PRINT-LAB_CTBL			| PRINT
	dc.w	LAB_CONT-LAB_CTBL			| CONT

	dc.w	LAB_BUFFER-LAB_CTBL			| BUFFER
	dc.w	LAB_CLS-LAB_CTBL			| CLS
	dc.w	LAB_CURSOR-LAB_CTBL			| CURSOR
	dc.w	LAB_LINE-LAB_CTBL			| LINE
	dc.w	LAB_FILL-LAB_CTBL			| FILL
	dc.w	LAB_MOVE-LAB_CTBL			| MOVE
	dc.w	LAB_POINT-LAB_CTBL			| POINT
	dc.w	LAB_RECT-LAB_CTBL			| RECT
	dc.w	LAB_FRECT-LAB_CTBL			| FRECT
	dc.w	LAB_ELLIPSE-LAB_CTBL		| ELLIPSE
	dc.w	LAB_FELLIPSE-LAB_CTBL		| FELLIPSE
	dc.w	LAB_MODE-LAB_CTBL			| MODE
	dc.w	LAB_SIZE-LAB_CTBL			| SIZE

	dc.w	LAB_LIST-LAB_CTBL			| LIST
	dc.w	LAB_CLEAR-LAB_CTBL			| CLEAR
	dc.w	LAB_NEW-LAB_CTBL			| NEW
	dc.w	LAB_WDTH-LAB_CTBL			| WIDTH
	dc.w	LAB_GET-LAB_CTBL			| GET
	dc.w	LAB_SWAP-LAB_CTBL			| SWAP
	dc.w	LAB_BITSET-LAB_CTBL			| BITSET
	dc.w	LAB_BITCLR-LAB_CTBL			| BITCLR


*************************************************************************************
*
* function pre process routine table

LAB_FTPP:
	dc.w	LAB_PPFN-LAB_FTPP			| SGN(n)	process numeric expression in ()
	dc.w	LAB_PPFN-LAB_FTPP			| INT(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| ABS(n)		"
	dc.w	LAB_EVEZ-LAB_FTPP			| USR(x)	process any expression
	dc.w	LAB_1BF7-LAB_FTPP			| FRE(x)	process any expression in ()
	dc.w	LAB_1BF7-LAB_FTPP			| POS(x)		"
	dc.w	LAB_PPFN-LAB_FTPP			| SQR(n)	process numeric expression in ()
	dc.w	LAB_PPFN-LAB_FTPP			| RND(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| LOG(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| EXP(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| COS(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| SIN(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| TAN(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| ATN(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| PEEK(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| DEEK(n)		"
	dc.w	LAB_PPFN-LAB_FTPP			| LEEK(n)		"
	dc.w	LAB_PPFS-LAB_FTPP			| LEN($)	process string expression in ()
	dc.w	LAB_PPFN-LAB_FTPP			| STR$(n)	process numeric expression in ()
	dc.w	LAB_PPFS-LAB_FTPP			| VAL($)	process string expression in ()
	dc.w	LAB_PPFS-LAB_FTPP			| ASC($)		"
	dc.w	LAB_PPFS-LAB_FTPP			| UCASE$($)		"
	dc.w	LAB_PPFS-LAB_FTPP			| LCASE$($)		"
	dc.w	LAB_PPFN-LAB_FTPP			| CHR$(n)	process numeric expression in ()
	dc.w	LAB_BHSS-LAB_FTPP			| HEX$()	bin/hex pre process
	dc.w	LAB_BHSS-LAB_FTPP			| BIN$()		"
	dc.w	0x0000						| BITTST()	none
	dc.w	0x0000						| MAX()		"
	dc.w	0x0000						| MIN()		"
	dc.w	LAB_PPBI-LAB_FTPP			| RAMBASE	advance pointer
	dc.w	LAB_1BF7-LAB_FTPP			| KEYS(x)	process any expression in ()
	dc.w	LAB_PPBI-LAB_FTPP			| TI		advance pointer
	dc.w	LAB_PPBI-LAB_FTPP			| PI			"
	dc.w	LAB_PPBI-LAB_FTPP			| TWOPI		"
	dc.w	0x0000						| VARPTR()	none
	dc.w	0x0000						| SADD()		"
	dc.w	LAB_LRMS-LAB_FTPP			| LEFT$()	process string expression
	dc.w	LAB_LRMS-LAB_FTPP			| RIGHT$()		"
	dc.w	LAB_LRMS-LAB_FTPP			| MID$()		"
	dc.w	LAB_EVEZ-LAB_FTPP			| USING$(x)	process any expression


*************************************************************************************
*
* action addresses for functions

LAB_FTBL:
	dc.w	LAB_SGN-LAB_FTBL			| SGN()
	dc.w	LAB_INT-LAB_FTBL			| INT()
	dc.w	LAB_ABS-LAB_FTBL			| aBS()
	dc.w	LAB_USR-LAB_FTBL			| USR()
	dc.w	LAB_FRE-LAB_FTBL			| FRE()
	dc.w	LAB_POS-LAB_FTBL			| POS()
	dc.w	LAB_SQR-LAB_FTBL			| SQR()
	dc.w	LAB_RND-LAB_FTBL			| RND()
	dc.w	LAB_LOG-LAB_FTBL			| LOG()
	dc.w	LAB_EXP-LAB_FTBL			| EXP()
	dc.w	LAB_COS-LAB_FTBL			| COS()
	dc.w	LAB_SIN-LAB_FTBL			| SIN()
	dc.w	LAB_TAN-LAB_FTBL			| TAN()
	dc.w	LAB_ATN-LAB_FTBL			| aTN()
	dc.w	LAB_PEEK-LAB_FTBL			| PEEK()
	dc.w	LAB_DEEK-LAB_FTBL			| DEEK()
	dc.w	LAB_LEEK-LAB_FTBL			| LEEK()
	dc.w	LAB_LENS-LAB_FTBL			| LEN()
	dc.w	LAB_STRS-LAB_FTBL			| STR$()
	dc.w	LAB_VAL-LAB_FTBL			| VAL()
	dc.w	LAB_ASC-LAB_FTBL			| aSC()
	dc.w	LAB_UCASE-LAB_FTBL			| UCASE$()
	dc.w	LAB_LCASE-LAB_FTBL			| LCASE$()
	dc.w	LAB_CHRS-LAB_FTBL			| CHR$()
	dc.w	LAB_HEXS-LAB_FTBL			| HEX$()
	dc.w	LAB_BINS-LAB_FTBL			| BIN$()
	dc.w	LAB_BTST-LAB_FTBL			| BITTST()
	dc.w	LAB_MAX-LAB_FTBL			| MAX()
	dc.w	LAB_MIN-LAB_FTBL			| MIN()
	dc.w	LAB_RAM-LAB_FTBL			| RAMBASE
	dc.w	LAB_KEYS-LAB_FTBL			| KEYS()
	dc.w	LAB_TI-LAB_FTBL				| TI
	dc.w	LAB_PI-LAB_FTBL				| PI
	dc.w	LAB_TWOPI-LAB_FTBL			| TWOPI
	dc.w	LAB_VARPTR-LAB_FTBL			| VARPTR()
	dc.w	LAB_SADD-LAB_FTBL			| SADD()
	dc.w	LAB_LEFT-LAB_FTBL			| LEFT$()
	dc.w	LAB_RIGHT-LAB_FTBL			| RIGHT$()
	dc.w	LAB_MIDS-LAB_FTBL			| MID$()
	dc.w	LAB_USINGS-LAB_FTBL			| USING$()


*************************************************************************************
*
* hierarchy and action addresses for operator

LAB_OPPT:
	dc.w	0x0079					| +
	dc.w	LAB_ADD-LAB_OPPT
	dc.w	0x0079					| -
	dc.w	LAB_SUBTRACT-LAB_OPPT
	dc.w	0x007B					| *
	dc.w	LAB_MULTIPLY-LAB_OPPT
	dc.w	0x007B					| /
	dc.w	LAB_DIVIDE-LAB_OPPT
	dc.w	0x007F					| ^
	dc.w	LAB_POWER-LAB_OPPT
	dc.w	0x0050					| AND
	dc.w	LAB_AND-LAB_OPPT
	dc.w	0x0046					| EOR
	dc.w	LAB_EOR-LAB_OPPT
	dc.w	0x0046					| OR
	dc.w	LAB_OR-LAB_OPPT
	dc.w	0x0056					| >>
	dc.w	LAB_RSHIFT-LAB_OPPT
	dc.w	0x0056					| <<
	dc.w	LAB_LSHIFT-LAB_OPPT
	dc.w	0x007D					| >
	dc.w	LAB_GTHAN-LAB_OPPT		| used to evaluate -n
	dc.w	0x005A					| =
	dc.w	LAB_EQUAL-LAB_OPPT		| used to evaluate NOT
	dc.w	0x0064					| <
	dc.w	LAB_LTHAN-LAB_OPPT


*************************************************************************************
*
* misc constants

* This table is used in converting numbers to ASCII.

LAB_2A9A:
	dc.l	0xFFF0BDC0				| -1000000
	dc.l	0x000186A0				| 100000
	dc.l	0xFFFFD8F0				| -10000
	dc.l	0x000003E8				| 1000
	dc.l	0xFFFFFF9C				| -100
	dc.l	0x0000000A				| 10
	dc.l	0xFFFFFFFF				| -1
LAB_2A9B:


*************************************************************************************
*
* new keyword tables

* offsets to keyword tables

TAB_CHRT:
	dc.w	TAB_STAR-TAB_STAR			| "*"	$2A
	dc.w	TAB_PLUS-TAB_STAR			| "+"	$2B
	dc.w	-1							| "," $2C no keywords
	dc.w	TAB_MNUS-TAB_STAR			| "-"	$2D
	dc.w	-1							| "." $2E no keywords
	dc.w	TAB_SLAS-TAB_STAR			| "/"	$2F
	dc.w	-1							| "0" $30 no keywords
	dc.w	-1							| "1" $31 no keywords
	dc.w	-1							| "2" $32 no keywords
	dc.w	-1							| "3" $33 no keywords
	dc.w	-1							| "4" $34 no keywords
	dc.w	-1							| "5" $35 no keywords
	dc.w	-1							| "6" $36 no keywords
	dc.w	-1							| "7" $37 no keywords
	dc.w	-1							| "8" $38 no keywords
	dc.w	-1							| "9" $39 no keywords
	dc.w	-1							| ";" $3A no keywords
	dc.w	-1							| ":" $3B no keywords
	dc.w	TAB_LESS-TAB_STAR			| "<"	$3C
	dc.w	TAB_EQUL-TAB_STAR			| "="	$3D
	dc.w	TAB_MORE-TAB_STAR			| ">"	$3E
	dc.w	TAB_QEST-TAB_STAR			| "?"	$3F
	dc.w	-1							| "@" $40 no keywords
	dc.w	TAB_ASCA-TAB_STAR			| "A"	$41
	dc.w	TAB_ASCB-TAB_STAR			| "B"	$42
	dc.w	TAB_ASCC-TAB_STAR			| "C"	$43
	dc.w	TAB_ASCD-TAB_STAR			| "D"	$44
	dc.w	TAB_ASCE-TAB_STAR			| "E"	$45
	dc.w	TAB_ASCF-TAB_STAR			| "F"	$46
	dc.w	TAB_ASCG-TAB_STAR			| "G"	$47
	dc.w	TAB_ASCH-TAB_STAR			| "H"	$48
	dc.w	TAB_ASCI-TAB_STAR			| "I"	$49
	dc.w	-1							| "J" $4A no keywords
	dc.w	TAB_ASCK-TAB_STAR			| "K" $4B
	dc.w	TAB_ASCL-TAB_STAR			| "L"	$4C
	dc.w	TAB_ASCM-TAB_STAR			| "M"	$4D
	dc.w	TAB_ASCN-TAB_STAR			| "N"	$4E
	dc.w	TAB_ASCO-TAB_STAR			| "O"	$4F
	dc.w	TAB_ASCP-TAB_STAR			| "P"	$50
	dc.w	-1							| "Q" $51 no keywords
	dc.w	TAB_ASCR-TAB_STAR			| "R"	$52
	dc.w	TAB_ASCS-TAB_STAR			| "S"	$53
	dc.w	TAB_ASCT-TAB_STAR			| "T"	$54
	dc.w	TAB_ASCU-TAB_STAR			| "U"	$55
	dc.w	TAB_ASCV-TAB_STAR			| "V"	$56
	dc.w	TAB_ASCW-TAB_STAR			| "W"	$57
	dc.w	-1							| "X" $58 no keywords
	dc.w	-1							| "Y" $59 no keywords
	dc.w	-1							| "Z" $5A no keywords
	dc.w	-1							| "[" $5B no keywords
	dc.w	-1							| "\" $5C no keywords
	dc.w	-1							| "]" $5D no keywords
	dc.w	TAB_POWR-TAB_STAR			| "^"	$5E


*************************************************************************************
*
* Table of Basic keywords for LIST command
* [byte]first character,[byte]remaining length -1
* [word]offset from table start

LAB_KEYT:
	dc.b	'E',1
	dc.w	KEY_END-TAB_STAR			| END
	dc.b	'F',1
	dc.w	KEY_FOR-TAB_STAR			| FOR
	dc.b	'N',2
	dc.w	KEY_NEXT-TAB_STAR			| NEXT
	dc.b	'D',2
	dc.w	KEY_DATA-TAB_STAR			| DATA
	dc.b	'I',3
	dc.w	KEY_INPUT-TAB_STAR			| INPUT
	dc.b	'D',1
	dc.w	KEY_DIM-TAB_STAR			| DIM
	dc.b	'R',2
	dc.w	KEY_READ-TAB_STAR			| READ
	dc.b	'L',1
	dc.w	KEY_LET-TAB_STAR			| LET
	dc.b	'D',1
	dc.w	KEY_DEC-TAB_STAR			| DEC
	dc.b	'G',2
	dc.w	KEY_GOTO-TAB_STAR			| GOTO
	dc.b	'R',1
	dc.w	KEY_RUN-TAB_STAR			| RUN
	dc.b	'I',0
	dc.w	KEY_IF-TAB_STAR				| IF
	dc.b	'R',5
	dc.w	KEY_RESTORE-TAB_STAR		| RESTORE
	dc.b	'G',3
	dc.w	KEY_GOSUB-TAB_STAR			| GOSUB
	dc.b	'R',4
	dc.w	KEY_RETURN-TAB_STAR			| RETURN
	dc.b	'R',1
	dc.w	KEY_REM-TAB_STAR			| REM
	dc.b	'S',2
	dc.w	KEY_STOP-TAB_STAR			| STOP
	dc.b	'O',0
	dc.w	KEY_ON-TAB_STAR				| ON
	dc.b	'N',2
	dc.w	KEY_NULL-TAB_STAR			| NULL
	dc.b	'I',1
	dc.w	KEY_INC-TAB_STAR			| INC
	dc.b	'W',2
	dc.w	KEY_WAIT-TAB_STAR			| WAIT
	dc.b	'L',2
	dc.w	KEY_LOAD-TAB_STAR			| LOAD
	dc.b	'S',2
	dc.w	KEY_SAVE-TAB_STAR			| SAVE
	dc.b	'D',1
	dc.w	KEY_DEF-TAB_STAR			| DEF
	dc.b	'P',2
	dc.w	KEY_POKE-TAB_STAR			| POKE
	dc.b	'D',2
	dc.w	KEY_DOKE-TAB_STAR			| DOKE
	dc.b	'L',2
	dc.w	KEY_LOKE-TAB_STAR			| LOKE
	dc.b	'C',2
	dc.w	KEY_CALL-TAB_STAR			| CALL
	dc.b	'D',0
	dc.w	KEY_DO-TAB_STAR				| DO
	dc.b	'L',2
	dc.w	KEY_LOOP-TAB_STAR			| LOOP
	dc.b	'P',3
	dc.w	KEY_PRINT-TAB_STAR			| PRINT
	dc.b	'C',2
	dc.w	KEY_CONT-TAB_STAR			| CONT

	dc.b	'B',4
	dc.w	KEY_BUFFER-TAB_STAR			| BUFFER
	dc.b	'C',1
	dc.w	KEY_CLS-TAB_STAR			| CLS
	dc.b	'C',4
	dc.w	KEY_CURSOR-TAB_STAR			| CURSOR
	dc.b	'L',2
	dc.w	KEY_LINE-TAB_STAR			| LINE
	dc.b	'F',2
	dc.w	KEY_FILL-TAB_STAR			| FILL
	dc.b	'M',2
	dc.w	KEY_MOVE-TAB_STAR			| MOVE
	dc.b	'P',3
	dc.w	KEY_POINT-TAB_STAR			| POINT
	dc.b	'R',2
	dc.w	KEY_RECT-TAB_STAR			| RECT
	dc.b	'R',3
	dc.w	KEY_FRECT-TAB_STAR			| RECTF
	dc.b	'E',5
	dc.w	KEY_ELLIPSE-TAB_STAR		| ELLIPSE
	dc.b	'E',6
	dc.w	KEY_FELLIPSE-TAB_STAR		| ELLIPSEF
	dc.b	'M',2
	dc.w	KEY_MODE-TAB_STAR			| MODE
	dc.b	'S',2
	dc.w	KEY_SIZE-TAB_STAR			| SIZE

	dc.b	'L',2
	dc.w	KEY_LIST-TAB_STAR			| LIST
	dc.b	'C',3
	dc.w	KEY_CLEAR-TAB_STAR			| CLEAR
	dc.b	'N',1
	dc.w	KEY_NEW-TAB_STAR			| NEW
	dc.b	'W',3
	dc.w	KEY_WIDTH-TAB_STAR			| WIDTH
	dc.b	'G',1
	dc.w	KEY_GET-TAB_STAR			| GET
	dc.b	'S',2
	dc.w	KEY_SWAP-TAB_STAR			| SWAP
	dc.b	'B',4
	dc.w	KEY_BITSET-TAB_STAR			| BITSET
	dc.b	'B',4
	dc.w	KEY_BITCLR-TAB_STAR			| BITCLR
	dc.b	'T',2
	dc.w	KEY_TAB-TAB_STAR			| TAB(
	dc.b	'E',2
	dc.w	KEY_ELSE-TAB_STAR			| ELSE
	dc.b	'T',0
	dc.w	KEY_TO-TAB_STAR				| TO
	dc.b	'F',0
	dc.w	KEY_FN-TAB_STAR				| FN
	dc.b	'S',2
	dc.w	KEY_SPC-TAB_STAR			| SPC(
	dc.b	'T',2
	dc.w	KEY_THEN-TAB_STAR			| THEN
	dc.b	'N',1
	dc.w	KEY_NOT-TAB_STAR			| NOT
	dc.b	'S',2
	dc.w	KEY_STEP-TAB_STAR			| STEP
	dc.b	'U',3
	dc.w	KEY_UNTIL-TAB_STAR			| UNTIL
	dc.b	'W',3
	dc.w	KEY_WHILE-TAB_STAR			| WHILE

	dc.b	'+',-1
	dc.w	KEY_PLUS-TAB_STAR			| +
	dc.b	'-',-1
	dc.w	KEY_MINUS-TAB_STAR			| -
	dc.b	'*',-1
	dc.w	KEY_MULT-TAB_STAR			| *
	dc.b	'/',-1
	dc.w	KEY_DIV-TAB_STAR			| /
	dc.b	'^',-1
	dc.w	KEY_POWER-TAB_STAR			| ^
	dc.b	'A',1
	dc.w	KEY_AND-TAB_STAR			| aND
	dc.b	'E',1
	dc.w	KEY_EOR-TAB_STAR			| EOR
	dc.b	'O',0
	dc.w	KEY_OR-TAB_STAR				| OR
	dc.b	'>',0
	dc.w	KEY_RSHIFT-TAB_STAR			| >>
	dc.b	'<',0
	dc.w	KEY_LSHIFT-TAB_STAR			| <<
	dc.b	'>',-1
	dc.w	KEY_GT-TAB_STAR				| >
	dc.b	'=',-1
	dc.w	KEY_EQUAL-TAB_STAR			| =
	dc.b	'<',-1
	dc.w	KEY_LT-TAB_STAR				| <

	dc.b	'S',2
	dc.w	KEY_SGN-TAB_STAR			| SGN(
	dc.b	'I',2
	dc.w	KEY_INT-TAB_STAR			| INT(
	dc.b	'A',2
	dc.w	KEY_ABS-TAB_STAR			| aBS(
	dc.b	'U',2
	dc.w	KEY_USR-TAB_STAR			| USR(
	dc.b	'F',2
	dc.w	KEY_FRE-TAB_STAR			| FRE(
	dc.b	'P',2
	dc.w	KEY_POS-TAB_STAR			| POS(
	dc.b	'S',2
	dc.w	KEY_SQR-TAB_STAR			| SQR(
	dc.b	'R',2
	dc.w	KEY_RND-TAB_STAR			| RND(
	dc.b	'L',2
	dc.w	KEY_LOG-TAB_STAR			| LOG(
	dc.b	'E',2
	dc.w	KEY_EXP-TAB_STAR			| EXP(
	dc.b	'C',2
	dc.w	KEY_COS-TAB_STAR			| COS(
	dc.b	'S',2
	dc.w	KEY_SIN-TAB_STAR			| SIN(
	dc.b	'T',2
	dc.w	KEY_TAN-TAB_STAR			| TAN(
	dc.b	'A',2
	dc.w	KEY_ATN-TAB_STAR			| aTN(
	dc.b	'P',3
	dc.w	KEY_PEEK-TAB_STAR			| PEEK(
	dc.b	'D',3
	dc.w	KEY_DEEK-TAB_STAR			| DEEK(
	dc.b	'L',3
	dc.w	KEY_LEEK-TAB_STAR			| LEEK(
	dc.b	'L',2
	dc.w	KEY_LEN-TAB_STAR			| LEN(
	dc.b	'S',3
	dc.w	KEY_STRS-TAB_STAR			| STR$(
	dc.b	'V',2
	dc.w	KEY_VAL-TAB_STAR			| VAL(
	dc.b	'A',2
	dc.w	KEY_ASC-TAB_STAR			| aSC(
	dc.b	'U',5
	dc.w	KEY_UCASES-TAB_STAR			| UCASE$(
	dc.b	'L',5
	dc.w	KEY_LCASES-TAB_STAR			| LCASE$(
	dc.b	'C',3
	dc.w	KEY_CHRS-TAB_STAR			| CHR$(
	dc.b	'H',3
	dc.w	KEY_HEXS-TAB_STAR			| HEX$(
	dc.b	'B',3
	dc.w	KEY_BINS-TAB_STAR			| BIN$(
	dc.b	'B',5
	dc.w	KEY_BITTST-TAB_STAR			| BITTST(
	dc.b	'M',2
	dc.w	KEY_MAX-TAB_STAR			| MAX(
	dc.b	'M',2
	dc.w	KEY_MIN-TAB_STAR			| MIN(
	dc.b	'R',5
	dc.w	KEY_RAM-TAB_STAR			| RAMBASE
	dc.b	'K',3
	dc.w	KEY_KEYS-TAB_STAR			| KEYS(
	dc.b	'T',0
	dc.w	KEY_TI-TAB_STAR				| TI
	dc.b	'P',0
	dc.w	KEY_PI-TAB_STAR				| PI
	dc.b	'T',3
	dc.w	KEY_TWOPI-TAB_STAR			| TWOPI
	dc.b	'V',5
	dc.w	KEY_VPTR-TAB_STAR			| VARPTR(
	dc.b	'S',3
	dc.w	KEY_SADD-TAB_STAR			| SADD(
	dc.b	'L',4
	dc.w	KEY_LEFTS-TAB_STAR			| LEFT$(
	dc.b	'R',5
	dc.w	KEY_RIGHTS-TAB_STAR			| RIGHT$(
	dc.b	'M',3
	dc.w	KEY_MIDS-TAB_STAR			| MID$(
	dc.b	'U',5
	dc.w	KEY_USINGS-TAB_STAR			| USING$(


*************************************************************************************
*
* BASIC error messages

LAB_BAER:
	dc.w	LAB_NF-LAB_BAER			| 0x00 NEXT without FOR
	dc.w	LAB_SN-LAB_BAER			| 0x02 syntax
	dc.w	LAB_RG-LAB_BAER			| 0x04 RETURN without GOSUB
	dc.w	LAB_OD-LAB_BAER			| 0x06 out of data
	dc.w	LAB_FC-LAB_BAER			| 0x08 function call
	dc.w	LAB_OV-LAB_BAER			| 0x0A overflow
	dc.w	LAB_OM-LAB_BAER			| 0x0C out of memory
	dc.w	LAB_US-LAB_BAER			| 0x0E undefined statement
	dc.w	LAB_BS-LAB_BAER			| 0x10 array bounds
	dc.w	LAB_DD-LAB_BAER			| 0x12 double dimension array
	dc.w	LAB_D0-LAB_BAER			| 0x14 divide by 0
	dc.w	LAB_ID-LAB_BAER			| 0x16 illegal direct
	dc.w	LAB_TM-LAB_BAER			| 0x18 type mismatch
	dc.w	LAB_LS-LAB_BAER			| 0x1A long string
	dc.w	LAB_ST-LAB_BAER			| 0x1C string too complex
	dc.w	LAB_CN-LAB_BAER			| 0x1E continue error
	dc.w	LAB_UF-LAB_BAER			| 0x20 undefined function
	dc.w	LAB_LD-LAB_BAER			| 0x22 LOOP without DO
	dc.w	LAB_UV-LAB_BAER			| 0x24 undefined variable
	dc.w	LAB_UA-LAB_BAER			| 0x26 undimensioned array
	dc.w	LAB_WD-LAB_BAER			| 0x28 wrong dimensions
	dc.w	LAB_AD-LAB_BAER			| 0x2A address
	dc.w	LAB_FO-LAB_BAER			| 0x2C format

LAB_NF:		.asciz	"NEXT without FOR"
LAB_SN:		.asciz	"Syntax"
LAB_RG:		.asciz	"RETURN without GOSUB"
LAB_OD:		.asciz	"Out of DATA"
LAB_FC:		.asciz	"Function call"
LAB_OV:		.asciz	"Overflow"
LAB_OM:		.asciz	"Out of memory"
LAB_US:		.asciz	"Undefined statement"
LAB_BS:		.asciz	"Array bounds"
LAB_DD:		.asciz	"Double dimension"
LAB_D0:		.asciz	"Divide by zero"
LAB_ID:		.asciz	"Illegal direct"
LAB_TM:		.asciz	"Type mismatch"
LAB_LS:		.asciz	"String too long"
LAB_ST:		.asciz	"String too complex"
LAB_CN:		.asciz	"Can""t continue"
LAB_UF:		.asciz	"Undefined function"
LAB_LD:		.asciz	"LOOP without DO"
LAB_UV:		.asciz	"Undefined variable"
LAB_UA:		.asciz	"Undimensioned array"
LAB_WD:		.asciz	"Wrong dimensions"
LAB_AD:		.asciz	"Address"
LAB_FO:		.asciz	"Format"


*************************************************************************************
*
* keyword table for line (un)crunching

* [keyword,token
* [keyword,token]]
* end marker (#$00)

TAB_STAR:
KEY_MULT:
	dc.b TK_MULT,0x00				| *
TAB_PLUS:
KEY_PLUS:
	dc.b TK_PLUS,0x00				| +
TAB_MNUS:
KEY_MINUS:
	dc.b TK_MINUS,0x00				| -
TAB_SLAS:
KEY_DIV:
	dc.b TK_DIV,0x00				| /
TAB_LESS:
KEY_LSHIFT:
	dc.b	'<',TK_LSHIFT			| <<
KEY_LT:
	dc.b TK_LT,0x00					| <
TAB_EQUL:
KEY_EQUAL:
	dc.b TK_EQUAL,0x00				| =
TAB_MORE:
KEY_RSHIFT:
	dc.b	'>',TK_RSHIFT			| >>
KEY_GT:
	dc.b TK_GT,0x00					| >
TAB_QEST:
	dc.b TK_PRINT,0x00				| ?
TAB_ASCA:
KEY_ABS:
	dc.b	"BS(",TK_ABS			| ABS(
KEY_AND:
	dc.b	"ND",TK_AND				| AND
KEY_ASC:
	dc.b	"SC(",TK_ASC			| ASC(
KEY_ATN:
	dc.b	"TN(",TK_ATN			| ATN(
	dc.b	0x00
TAB_ASCB:
KEY_BINS:
	dc.b	"IN0x(",TK_BINS			| BIN0x(
KEY_BITCLR:
	dc.b	"ITCLR",TK_BITCLR		| BITCLR
KEY_BITSET:
	dc.b	"ITSET",TK_BITSET		| BITSET
KEY_BITTST:
	dc.b	"ITTST(",TK_BITTST		| BITTST(
KEY_BUFFER:
	dc.b	"UFFER",TK_BUFFER		| BUFFER
	dc.b	0x00
TAB_ASCC:
KEY_CALL:
	dc.b	"ALL",TK_CALL			| CALL
KEY_CHRS:
	dc.b	"HR0x(",TK_CHRS			| CHR0x(
KEY_CLEAR:
	dc.b	"LEAR",TK_CLEAR			| CLEAR
KEY_CLS:
	dc.b	"LS",TK_CLS				| CLS
KEY_CONT:
	dc.b	"ONT",TK_CONT			| CONT
KEY_COS:
	dc.b	"OS(",TK_COS			| COS(
KEY_CURSOR:
	dc.b	"URSOR",TK_CURSOR			| CURSOR
	dc.b	0x00
TAB_ASCD:
KEY_DATA:
	dc.b	"ATA",TK_DATA			| DATA
KEY_DEC:
	dc.b	"EC",TK_DEC				| DEC
KEY_DEEK:
	dc.b	"EEK(",TK_DEEK			| DEEK(
KEY_DEF:
	dc.b	"EF",TK_DEF				| DEF
KEY_DIM:
	dc.b	"IM",TK_DIM				| DIM
KEY_DOKE:
	dc.b	"OKE",TK_DOKE			| DOKE
KEY_DO:
	dc.b	"O",TK_DO				| DO
	dc.b	0x00
TAB_ASCE:
KEY_ELSE:
	dc.b	"LSE",TK_ELSE			| ELSE
KEY_END:
	dc.b	"ND",TK_END				| END
KEY_FELLIPSE:
	dc.b	"LLIPSEF",TK_FELLIPSE		| ELLIPSEF
KEY_ELLIPSE:
	dc.b	"LLIPSE",TK_ELLIPSE		| ELLIPSE
KEY_EOR:
	dc.b	"OR",TK_EOR				| EOR
KEY_EXP:
	dc.b	"XP(",TK_EXP			| EXP(
	dc.b	0x00
TAB_ASCF:
KEY_FILL:
	dc.b	"ILL",TK_FILL			| FILL
KEY_FOR:
	dc.b	"OR",TK_FOR				| FOR
KEY_FN:
	dc.b	"N",TK_FN				| FN
KEY_FRE:
	dc.b	"RE(",TK_FRE			| FRE(
	dc.b	0x00
TAB_ASCG:
KEY_GET:
	dc.b	"ET",TK_GET				| GET
KEY_GOTO:
	dc.b	"OTO",TK_GOTO			| GOTO
KEY_GOSUB:
	dc.b	"OSUB",TK_GOSUB			| GOSUB
	dc.b	0x00
TAB_ASCH:
KEY_HEXS:
	dc.b	"EX0x(",TK_HEXS,0x00		| HEX0x(
TAB_ASCI:
KEY_IF:
	dc.b	"F",TK_IF				| IF
KEY_INC:
	dc.b	"NC",TK_INC				| INC
KEY_INPUT:
	dc.b	"NPUT",TK_INPUT			| INPUT
KEY_INT:
	dc.b	"NT(",TK_INT			| INT(
	dc.b	0x00
TAB_ASCK:
KEY_KEYS:
	dc.b	"EYS(",TK_KEYS			| KEYS(
	dc.b	0x00
TAB_ASCL:
KEY_LCASES:
	dc.b	"CASE0x(",TK_LCASES		| LCASE0x(
KEY_LEEK:
	dc.b	"EEK(",TK_LEEK			| LEEK(
KEY_LEFTS:
	dc.b	"EFT0x(",TK_LEFTS			| LEFT0x(
KEY_LEN:
	dc.b	"EN(",TK_LEN			| LEN(
KEY_LET:
	dc.b	"ET",TK_LET				| LET
KEY_LINE:
	dc.b	"INE",TK_LINE			| LINE
KEY_LIST:
	dc.b	"IST",TK_LIST			| LIST
KEY_LOAD:
	dc.b	"OAD",TK_LOAD			| LOAD
KEY_LOG:
	dc.b	"OG(",TK_LOG			| LOG(
KEY_LOKE:
	dc.b	"OKE",TK_LOKE			| LOKE
KEY_LOOP:
	dc.b	"OOP",TK_LOOP			| LOOP
	dc.b	0x00
TAB_ASCM:
KEY_MAX:
	dc.b	"AX(",TK_MAX			| MAX(
KEY_MIDS:
	dc.b	"ID0x(",TK_MIDS			| MID0x(
KEY_MIN:
	dc.b	"IN(",TK_MIN			| MIN(
KEY_MODE:
	dc.b	"ODE",TK_MODE			| MODE
KEY_MOVE:
	dc.b	"OVE",TK_MOVE			| MOVE
	dc.b	0x00
TAB_ASCN:
KEY_NEW:
	dc.b	"EW",TK_NEW				| NEW
KEY_NEXT:
	dc.b	"EXT",TK_NEXT			| NEXT
KEY_NOT:
	dc.b	"OT",TK_NOT				| NOT
KEY_NULL:
	dc.b	"ULL",TK_NULL			| NULL
	dc.b	0x00
TAB_ASCO:
KEY_ON:
	dc.b	"N",TK_ON				| ON
KEY_OR:
	dc.b	"R",TK_OR				| OR
	dc.b	0x00
TAB_ASCP:
KEY_PEEK:
	dc.b	"EEK(",TK_PEEK			| PEEK(
KEY_PI:
	dc.b	"I",TK_PI				| PI
KEY_POINT:
	dc.b	"OINT",TK_POINT			| POINT
KEY_POKE:
	dc.b	"OKE",TK_POKE			| POKE
KEY_POS:
	dc.b	"OS(",TK_POS			| POS(
KEY_PRINT:
	dc.b	"RINT",TK_PRINT			| PRINT
	dc.b	0x00
TAB_ASCR:
KEY_RAM:
	dc.b	"AMBASE",TK_RAM			| RAMBASE
KEY_READ:
	dc.b	"EAD",TK_READ			| READ
KEY_FRECT:
	dc.b	"ECTF",TK_FRECT			| RECTF
KEY_RECT:
	dc.b	"ECT",TK_RECT			| RECT
KEY_REM:
	dc.b	"EM",TK_REM				| REM
KEY_RESTORE:
	dc.b	"ESTORE",TK_RESTORE		| RESTORE
KEY_RETURN:
	dc.b	"ETURN",TK_RETURN			| RETURN
KEY_RIGHTS:
	dc.b	"IGHT0x(",TK_RIGHTS		| RIGHT0x(
KEY_RND:
	dc.b	"ND(",TK_RND			| RND(
KEY_RUN:
	dc.b	"UN",TK_RUN				| RUN
	dc.b	0x00
TAB_ASCS:
KEY_SADD:
	dc.b	"ADD(",TK_SADD			| SADD(
KEY_SAVE:
	dc.b	"AVE",TK_SAVE			| SAVE
KEY_SGN:
	dc.b	"GN(",TK_SGN			| SGN(
KEY_SIN:
	dc.b	"IN(",TK_SIN			| SIN(
KEY_SIZE:
	dc.b	"IZE",TK_SIZE			| SIZE
KEY_SPC:
	dc.b	"PC(",TK_SPC			| SPC(
KEY_SQR:
	dc.b	"QR(",TK_SQR			| SQR(
KEY_STEP:
	dc.b	"TEP",TK_STEP			| STEP
KEY_STOP:
	dc.b	"TOP",TK_STOP			| STOP
KEY_STRS:
	dc.b	"TR0x(",TK_STRS			| STR0x(
KEY_SWAP:
	dc.b	"WAP",TK_SWAP			| SWAP
	dc.b	0x00
TAB_ASCT:
KEY_TAB:
	dc.b	"AB(",TK_TAB			| TAB(
KEY_TAN:
	dc.b	"AN(",TK_TAN			| TAN
KEY_THEN:
	dc.b	"HEN",TK_THEN			| THEN
KEY_TI:
	dc.b	"I",TK_TI				| TI
KEY_TO:
	dc.b	"O",TK_TO				| TO
KEY_TWOPI:
	dc.b	"WOPI",TK_TWOPI			| TWOPI
	dc.b	0x00
TAB_ASCU:
KEY_UCASES:
	dc.b	"CASE0x(",TK_UCASES		| UCASE0x(
KEY_UNTIL:
	dc.b	"NTIL",TK_UNTIL			| UNTIL
KEY_USINGS:
	dc.b	"SING0x(",TK_USINGS		| USING0x(
KEY_USR:
	dc.b	"SR(",TK_USR			| USR(
	dc.b	0x00
TAB_ASCV:
KEY_VAL:
	dc.b	"AL(",TK_VAL			| VAL(
KEY_VPTR:
	dc.b	"ARPTR(",TK_VPTR			| VARPTR(
	dc.b	0x00
TAB_ASCW:
KEY_WAIT:
	dc.b	"AIT",TK_WAIT			| WAIT
KEY_WHILE:
	dc.b	"HILE",TK_WHILE			| WHILE
KEY_WIDTH:
	dc.b	"IDTH",TK_WIDTH			| WIDTH
	dc.b	0x00
TAB_POWR:
KEY_POWER:
	dc.b	TK_POWER,0x00			| ^


*************************************************************************************
*
* just messages

LAB_BMSG:
	.asciz	"\r\nBreak"
LAB_EMSG:
	.asciz	" Error"
LAB_LMSG:
	.asciz	" in line "
LAB_IMSG:
	.asciz	"Extra ignored\r\n"
LAB_REDO:
	.asciz	"Redo from start\r\n"
LAB_RMSG:
	.asciz	"\r\nReady\r\n"
LAB_SMSG:
	.ascii	" Bytes free\r\n\n"
	.ascii	"Enhanced 68k BASIC Version 3.52\r\n"
	.ascii	"for the Raven68k computing project\r\n"
	.asciz	"(Build: 0.0.2-rev1, 2021-02-29)\r\n"

*************************************************************************************
* EhBASIC keywords quick reference list								*
*************************************************************************************

* glossary

*		<.>		  required
*		{.|.}		  one of required
*		[.]		  optional
*		...		  may repeat as last

*		any		= anything
*		num		= number
*		state		= statement
*		pint		= positive integer
*		str		= string
*		var		= variable
*		nvar		= numeric variable
*		svar		= string variable
*		expr		= expression
*		nexpr		= numeric expression
*		sexpr		= string expression

* statement separator

* :		. [<state>] : [<state>]						* done

* number bases

* %		. %<binary num>							* done
* $		. $<hex num>							* done

* commands

* END		. END									* done
* FOR		. FOR <nvar>=<nexpr> TO <nexpr> [STEP <nexpr>]		* done
* NEXT	. NEXT [<nvar>[,<nvar>]...]					* done
* DATA	. DATA [{num|["]str["]}[,{num|["]str["]}]...]		* done
* INPUT	. INPUT [<">str<">;] <var>[,<var>[,<var>]...]		* done
* DIM		. DIM <var>(<nexpr>[,<nexpr>[,<nexpr>]])			* done
* READ	. READ <var>[,<var>[,<var>]...]				* done
* LET		. [LET] <var>=<expr>						* done
* DEC		. DEC <nvar>[,<nvar>[,<nvar>]...]				* done
* GOTO	. GOTO <pint>							* done
* RUN		. RUN [pint]							* done
* IF		. IF <expr>{GOTO<n>|THEN<{n|comm}>}[ELSE <{n|comm}>]	* done
* RESTORE	. RESTORE [pint]							* done
* GOSUB	. GOSUB <pint>							* done
* RETURN	. RETURN								* done
* REM		. REM [any]								* done
* STOP	. STOP								* done
* ON		. ON <nexpr> {GOTO|GOSUB} <pint>[,<pint>[,<pint>]...]	* done
* NULL	. NULL <nexpr>							* done
* INC		. INC <nvar>[,<nvar>[,<nvar>]...]				* done
* WAIT	. WAIT <nexpr>,<nexpr>[,<nexpr>]				* done
* LOAD	. LOAD [<sexpr>]							* done for simulator
* SAVE	. SAVE [<sexpr>][,[<n>][-<n>]]				* done for simulator
* DEF		. DEF FN<var>(<var>)=<expr>					* done
* POKE	. POKE <nexpr>,<nexpr>						* done
* DOKE	. DOKE <nexpr>,<nexpr>						* done
* LOKE	. LOKE <nexpr>,<nexpr>						* done
* CALL	. CALL <nexpr>							* done
* DO		. DO									* done
* LOOP	. LOOP [{WHILE|UNTIL}<nexpr>]					* done
* PRINT	. PRINT [{;|,}][expr][{;|,}[expr][{;|,}[expr]]...]	* done
* CONT	. CONT								* done
* LIST	. LIST [pint][-pint]						* done
* CLEAR	. CLEAR								* done
* NEW		. NEW									* done
* WIDTH	. WIDTH [<pint>][,<pint>]					* done
* GET		. GET <var>								* done
* SWAP	. SWAP <var>,<var>						* done
* BITSET	. BITSET <nexpr>,<nexpr>					* done
* BITCLR	. BITCLR <nexpr>,<nexpr>					* done

* new graphics commands for EASy68k

* BUFFER	. BUFFER								* done
* CLS		. CLS									* done
* CURSOR	. CURSOR <nexpr>,<nexpr>					* done
* LINE	. LINE <nexpr>,<nexpr>[,<nexpr>,<nexpr>][,][<nexpr>]	* done
* FILL	. FILL <nexpr>,<nexpr>[,][<nexpr>]				* done
* MOVE	. MOVE <nexpr>,<nexpr>						* done
* POINT	. POINT <nexpr>,<nexpr>[,][<nexpr>]				* done
* RECT	. RECT <nexpr>,<nexpr>[,<nexpr>,<nexpr>][,<nexpr>[,<nexpr>]]	* done
* RECTF	. RECTF <nexpr>,<nexpr>[,<nexpr>,<nexpr>][,<nexpr>[,<nexpr>]]	* done
* ELLIPSE	. ELLIPSE <nexpr>,<nexpr>[,<nexpr>,<nexpr>][,<nexpr>[,<nexpr>]]	* done
* ELLIPSEF	. ELLIPSEF <nexpr>,<nexpr>[,<nexpr>,<nexpr>][,<nexpr>[,<nexpr>]]	* done
* MODE	. MODE <pint>							* done
* SIZE	. SIZE <pint>							* done

* sub commands (may not start a statement)

* TAB		. TAB(<nexpr>)							* done
* ELSE	. IF <expr>{GOTO<n>|THEN<{n|comm}>}[ELSE <{n|comm}>]	* done
* TO		. FOR <nvar>=<nexpr> TO <nexpr> [STEP <nexpr>]		* done
* FN		. FN<var>(<expr>)							* done
* SPC		. SPC(<nexpr>)							* done
* THEN	. IF <nexpr> {THEN {pint|comm}|GOTO <pint>}		* done
* NOT		. NOT <nexpr>							* done
* STEP	. FOR <nvar>=<nexpr> TO <nexpr> [STEP <nexpr>]		* done
* UNTIL	. LOOP [{WHILE|UNTIL}<nexpr>]					* done
* WHILE	. LOOP [{WHILE|UNTIL}<nexpr>]					* done

* operators

* +		. [expr] + <expr>							* done
* -		. [nexpr] - <nexpr>						* done
* *		. <nexpr> * <nexpr>						* done fast hardware
* /		. <nexpr> / <nexpr>						* done fast hardware
* ^		. <nexpr> ^ <nexpr>						* done
* AND		. <nexpr> AND <nexpr>						* done
* EOR		. <nexpr> EOR <nexpr>						* done
* OR		. <nexpr> OR <nexpr>						* done
* >>		. <nexpr> >> <nexpr>						* done
* <<		. <nexpr> << <nexpr>						* done

* compare functions

* <		. <expr> < <expr>							* done
* =		. <expr> = <expr>							* done
* >		. <expr> > <expr>							* done

* functions

* SGN		. SGN(<nexpr>)							* done
* INT		. INT(<nexpr>)							* done
* ABS		. ABS(<nexpr>)							* done
* USR		. USR(<expr>)							* done
* FRE		. FRE(<expr>)							* done
* POS		. POS(<expr>)							* done
* SQR		. SQR(<nexpr>)							* done fast shift/sub
* RND		. RND(<nexpr>)							* done 32 bit PRNG
* LOG		. LOG(<nexpr>)							* done fast cordic
* EXP		. EXP(<nexpr>)							* done fast cordic
* COS		. COS(<nexpr>)							* done fast cordic
* SIN		. SIN(<nexpr>)							* done fast cordic
* TAN		. TAN(<nexpr>)							* done fast cordic
* ATN		. ATN(<nexpr>)							* done fast cordic
* PEEK	. PEEK(<nexpr>)							* done
* DEEK	. DEEK(<nexpr>)							* done
* LEEK	. LEEK(<nexpr>)							* done
* LEN		. LEN(<sexpr>)							* done
* STR$	. STR$(<nexpr>)							* done
* VAL		. VAL(<sexpr>)							* done
* ASC		. ASC(<sexpr>)							* done
* UCASE$	. UCASE$(<sexpr>)							* done
* LCASE$	. LCASE$(<sexpr>)							* done
* CHR$	. CHR$(<nexpr>)							* done
* HEX$	. HEX$(<nexpr>)							* done
* BIN$	. BIN$(<nexpr>)							* done
* BTST	. BTST(<nexpr>,<nexpr>)						* done
* MAX		. MAX(<nexpr>[,<nexpr>[,<nexpr>]...])			* done
* MIN		. MIN(<nexpr>[,<nexpr>[,<nexpr>]...])			* done
* KEYS	. KEYS(<expr>)							* done for simulator
* TI		. TI									* done for simulator
* PI		. PI									* done
* TWOPI	. TWOPI								* done
* VARPTR	. VARPTR(<var>)							* done
* SADD	. SADD(<svar>)							* done
* LEFT$	. LEFT$(<sexpr>,<nexpr>)					* done
* RIGHT$	. RIGHT$(<sexpr>,<nexpr>)					* done
* MID$	. MID$(<sexpr>,<nexpr>[,<nexpr>])				* done
* USING$	. USING$(<sexpr>,<nexpr>[,<nexpr>]...])			* done

* New functions for EASy68k

* POINT	. POINT(<nexpr>,<nexpr>)					* done

