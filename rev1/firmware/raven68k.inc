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

.equ _SRingSize,   0xFF

.equ _varCurAddr,     _ram_end-4
.equ _varLineBuf,     _varCurAddr-_max_line-2
.equ _varSerialRing,  _varLineBuf-_SRingSize
.equ _varSRingStart,  _varSerialRing-1
.equ _varSRingEnd,    _varSRingStart-1
.equ _varLast,        _varSRingEnd

.equ _stack_start, _varLast
