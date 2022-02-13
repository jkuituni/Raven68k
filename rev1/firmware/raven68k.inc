/* Raven68k Include and Definitions file  */
.equ _uarts,     0x200000

/* uarts */
.equ _ua_mra,       0x01
.equ _ua_sra,       0x03
.equ _ua_csra,      0x03
.equ _ua_cra,       0x05
.equ _ua_rba,       0x07
.equ _ua_tba,       0x07
.equ _ua_acr,       0x09
.equ _ua_isr,       0x0b
.equ _ua_imr,       0x0b
.equ _ua_mrb,       0x11
.equ _ua_srb,       0x13
.equ _ua_csrb,      0x13
.equ _ua_crb,       0x15
.equ _ua_rbb,       0x17
.equ _ua_tbb,       0x17
.equ _ua_ivr,       0x19
.equ _ua_opcr,      0x1b

.equ _max_line,     0x80
.equ _bel,          0x07
.equ _bksp,         0x08
.equ _tab,          0x09
.equ _lf,           0x0a
.equ _cr,           0x0d
.equ _esc,          0x1b
.equ _ctrlc,        0x03
.equ _ctrlx,        0x18
.equ _xon,          0x11
.equ _xoff,         0x13

.equ _serBufSize,   0x100

.equ _varCurAddr,  _ram_end-4
.equ _varLineBuf,  _varCurAddr-_max_line-2
.equ _serBufTail,  _varLineBuf-1
.equ _serBufHead,  _serBufTail-(_serBufSize+1)
.equ _varLast,     _serBufHead

.equ _stack_start, _varLast
