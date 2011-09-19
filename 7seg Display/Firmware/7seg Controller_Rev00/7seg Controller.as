opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F876A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 24 "D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\7seg_Rev00.c"
	psect config,class=CONFIG,delta=2 ;#
# 24 "D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\7seg_Rev00.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFFF & 0xFF7F & 0xFFFF & 0xFFFF & 0xFFFF & 0xFFFF ;#
	FNCALL	_main,_init
	FNCALL	_main,_initTMR2
	FNCALL	_main,_initUART
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	main@F1010
	global	main@rxOld
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\7seg_Rev00.c"
	line	82

;initializer for main@F1010
	retlw	040h
	retlw	054h
	retlw	045h
	retlw	053h
	retlw	054h
	retlw	045h
	line	34

;initializer for main@rxOld
	retlw	0FFh
	global	_rx
	global	_rxCount
	global	_scoreA3
	global	_scoreB2
	global	_scoreB3
	global	_display
	global	_scoreA0
	global	_scoreA1
	global	_scoreA2
	global	_scoreB0
	global	_scoreB1
	global	_RCREG
_RCREG	set	26
	global	_TMR2
_TMR2	set	17
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CREN
_CREN	set	196
	global	_FERR
_FERR	set	194
	global	_GIE
_GIE	set	95
	global	_OERR
_OERR	set	193
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA5
_RA5	set	45
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RCIF
_RCIF	set	101
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_T2CKPS0
_T2CKPS0	set	144
	global	_T2CKPS1
_T2CKPS1	set	145
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_TOUTPS0
_TOUTPS0	set	147
	global	_TOUTPS1
_TOUTPS1	set	148
	global	_TOUTPS2
_TOUTPS2	set	149
	global	_TOUTPS3
_TOUTPS3	set	150
	global	_TXIF
_TXIF	set	100
	global	_ADCON1
_ADCON1	set	159
	global	_CMCON
_CMCON	set	156
	global	_SPBRG
_SPBRG	set	153
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_BRGH
_BRGH	set	1218
	global	_RCIE
_RCIE	set	1125
	global	_SYNC
_SYNC	set	1220
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TX9
_TX9	set	1222
	global	_TXEN
_TXEN	set	1221
	global	_nRBPU
_nRBPU	set	1039
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"7seg Controller.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_display:
       ds      1

_scoreA0:
       ds      1

_scoreA1:
       ds      1

_scoreA2:
       ds      1

_scoreB0:
       ds      1

_scoreB1:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_rx:
       ds      6

_rxCount:
       ds      1

_scoreA3:
       ds      1

_scoreB2:
       ds      1

_scoreB3:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\7seg_Rev00.c"
	line	82
main@F1010:
       ds      6

psect	dataBANK0
	file	"D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\7seg_Rev00.c"
	line	34
main@rxOld:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+7)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_initTMR2
?_initTMR2:	; 0 bytes @ 0x0
	global	?_initUART
?_initUART:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	?_isr
?_isr:	; 2 bytes @ 0x0
	ds	6
	global	isr@temp
isr@temp:	; 1 bytes @ 0x6
	ds	1
	global	isr@temp_2657
isr@temp_2657:	; 1 bytes @ 0x7
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_init
??_init:	; 0 bytes @ 0x0
	global	??_initTMR2
??_initTMR2:	; 0 bytes @ 0x0
	global	??_initUART
??_initUART:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	1
	global	main@string
main@string:	; 6 bytes @ 0x1
	ds	6
	global	main@teste
main@teste:	; 2 bytes @ 0x7
	ds	2
	global	main@i
main@i:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 0, constant 0, data 7, bss 16, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      14
;; BANK0           80     10      27
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                10    10      0     118
;;                                              0 BANK0     10    10      0
;;                               _init
;;                           _initTMR2
;;                           _initUART
;; ---------------------------------------------------------------------------------
;; (1) _initUART                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _initTMR2                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _isr                                                  8     8      0     401
;;                                              0 COMMON     8     8      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   _initTMR2
;;   _initUART
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      2A      12        0.0%
;;ABS                  0      0      29       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      A      1B       5       33.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      8       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 32 in file "D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\7seg_Rev00.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  string          6    1[BANK0 ] unsigned char [6]
;;  teste           2    7[BANK0 ] unsigned int 
;;  i               1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  638[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init
;;		_initTMR2
;;		_initUART
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\7seg_Rev00.c"
	line	32
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	37
	
l4797:	
;7seg_Rev00.c: 34: static unsigned char rxOld = 255;
;7seg_Rev00.c: 37: init();
	fcall	_init
	line	38
	
l4799:	
;7seg_Rev00.c: 38: initTMR2();
	fcall	_initTMR2
	line	39
	
l4801:	
;7seg_Rev00.c: 39: initUART();
	fcall	_initUART
	line	42
	
l4803:	
;7seg_Rev00.c: 42: RB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	43
	
l4805:	
;7seg_Rev00.c: 43: RC0 = 0;
	bcf	(56/8),(56)&7
	line	44
	
l4807:	
;7seg_Rev00.c: 44: RB4 = 0;
	bcf	(52/8),(52)&7
	line	45
	
l4809:	
;7seg_Rev00.c: 45: RB3 = 0;
	bcf	(51/8),(51)&7
	line	46
	
l4811:	
;7seg_Rev00.c: 46: RB2 = 0;
	bcf	(50/8),(50)&7
	line	47
	
l4813:	
;7seg_Rev00.c: 47: RB1 = 0;
	bcf	(49/8),(49)&7
	line	49
	
l4815:	
;7seg_Rev00.c: 49: RB0 = 0;
	bcf	(48/8),(48)&7
	line	50
	
l4817:	
;7seg_Rev00.c: 50: RC5 = 0;
	bcf	(61/8),(61)&7
	line	51
	
l4819:	
;7seg_Rev00.c: 51: RC4 = 0;
	bcf	(60/8),(60)&7
	line	52
	
l4821:	
;7seg_Rev00.c: 52: RC3 = 0;
	bcf	(59/8),(59)&7
	line	53
	
l4823:	
;7seg_Rev00.c: 53: RC2 = 0;
	bcf	(58/8),(58)&7
	line	54
	
l4825:	
;7seg_Rev00.c: 54: RC1 = 0;
	bcf	(57/8),(57)&7
	line	57
	
l4827:	
;7seg_Rev00.c: 57: RA0 = 1;
	bsf	(40/8),(40)&7
	line	58
	
l4829:	
;7seg_Rev00.c: 58: RA1 = 1;
	bsf	(41/8),(41)&7
	line	59
	
l4831:	
;7seg_Rev00.c: 59: RA2 = 1;
	bsf	(42/8),(42)&7
	line	60
	
l4833:	
;7seg_Rev00.c: 60: RA3 = 1;
	bsf	(43/8),(43)&7
	line	61
	
l4835:	
;7seg_Rev00.c: 61: RB7 = 1;
	bsf	(55/8),(55)&7
	line	62
	
l4837:	
;7seg_Rev00.c: 62: RA5 = 1;
	bsf	(45/8),(45)&7
	line	63
	
l4839:	
;7seg_Rev00.c: 63: RB5 = 1;
	bsf	(53/8),(53)&7
	line	66
	
l4841:	
;7seg_Rev00.c: 66: display = 0;
	clrf	(_display)
	line	69
	
l4843:	
;7seg_Rev00.c: 69: scoreA0 = 0;
	clrf	(_scoreA0)
	line	70
	
l4845:	
;7seg_Rev00.c: 70: scoreA1 = 0;
	clrf	(_scoreA1)
	line	71
	
l4847:	
;7seg_Rev00.c: 71: scoreA2 = 0;
	clrf	(_scoreA2)
	line	72
	
l4849:	
;7seg_Rev00.c: 72: scoreA3 = 0;
	clrf	(_scoreA3)
	line	73
	
l4851:	
;7seg_Rev00.c: 73: scoreB0 = 0;
	clrf	(_scoreB0)
	line	74
	
l4853:	
;7seg_Rev00.c: 74: scoreB1 = 0;
	clrf	(_scoreB1)
	line	75
	
l4855:	
;7seg_Rev00.c: 75: scoreB2 = 0;
	clrf	(_scoreB2)
	line	76
	
l4857:	
;7seg_Rev00.c: 76: scoreB3 = 0;
	clrf	(_scoreB3)
	line	78
	
l4859:	
;7seg_Rev00.c: 78: TMR2 = 0;
	clrf	(17)	;volatile
	line	79
	
l4861:	
;7seg_Rev00.c: 79: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	81
	
l4863:	
;7seg_Rev00.c: 81: unsigned int teste = 0;
	clrf	(main@teste)
	clrf	(main@teste+1)
	line	82
	
l4865:	
;7seg_Rev00.c: 82: unsigned char string[]={'@','T','E','S','T','E'};
	movlw	(main@string)&0ffh
	movwf	fsr0
	movf	(main@F1010),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(main@F1010)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F1010)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F1010)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F1010)+4,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F1010)+5,w
	movwf	indf
	line	83
	
l4867:	
;7seg_Rev00.c: 83: unsigned char i = 0;
	clrf	(main@i)
	goto	l4869
	line	86
;7seg_Rev00.c: 86: while(1)
	
l643:	
	line	89
	
l4869:	
;7seg_Rev00.c: 87: {
;7seg_Rev00.c: 89: if(teste < 20000)
	movlw	high(04E20h)
	subwf	(main@teste+1),w
	movlw	low(04E20h)
	skipnz
	subwf	(main@teste),w
	skipnc
	goto	u2531
	goto	u2530
u2531:
	goto	l644
u2530:
	line	91
	
l4871:	
;7seg_Rev00.c: 90: {
;7seg_Rev00.c: 91: teste++;
	movlw	low(01h)
	addwf	(main@teste),f
	skipnc
	incf	(main@teste+1),f
	movlw	high(01h)
	addwf	(main@teste+1),f
	line	92
;7seg_Rev00.c: 92: }
	goto	l4885
	line	93
	
l644:	
	line	95
;7seg_Rev00.c: 93: else
;7seg_Rev00.c: 94: {
;7seg_Rev00.c: 95: for(i=0;i<6;i++)
	clrf	(main@i)
	
l4873:	
	movlw	(06h)
	subwf	(main@i),w
	skipc
	goto	u2541
	goto	u2540
u2541:
	goto	l648
u2540:
	goto	l4883
	
l4875:	
	goto	l4883
	line	96
	
l646:	
	line	98
;7seg_Rev00.c: 96: {
;7seg_Rev00.c: 98: while(!TXIF)
	goto	l648
	
l649:	
	line	99
;7seg_Rev00.c: 99: continue;
	
l648:	
	line	98
	btfss	(100/8),(100)&7
	goto	u2551
	goto	u2550
u2551:
	goto	l648
u2550:
	goto	l4877
	
l650:	
	line	100
	
l4877:	
;7seg_Rev00.c: 100: TXREG = string[i];
	movf	(main@i),w
	addlw	main@string&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(25)	;volatile
	line	95
	
l4879:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l4881:	
	movlw	(06h)
	subwf	(main@i),w
	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l648
u2560:
	goto	l4883
	
l647:	
	line	102
	
l4883:	
;7seg_Rev00.c: 101: }
;7seg_Rev00.c: 102: teste = 0;
	clrf	(main@teste)
	clrf	(main@teste+1)
	goto	l4885
	line	103
	
l645:	
	line	115
	
l4885:	
;7seg_Rev00.c: 103: }
;7seg_Rev00.c: 115: if(rxOld != rx[1])
	movf	0+(_rx)+01h,w
	xorwf	(main@rxOld),w
	skipnz
	goto	u2571
	goto	u2570
u2571:
	goto	l4869
u2570:
	line	117
	
l4887:	
;7seg_Rev00.c: 116: {
;7seg_Rev00.c: 117: rxOld = rx[1];
	movf	0+(_rx)+01h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@rxOld)
	line	119
;7seg_Rev00.c: 119: switch(rx[1])
	goto	l4899
	line	121
;7seg_Rev00.c: 120: {
;7seg_Rev00.c: 121: case 'D':
	
l653:	
	line	122
;7seg_Rev00.c: 122: TMR2ON = 0;
	bcf	(146/8),(146)&7
	line	124
;7seg_Rev00.c: 124: RB6 = 0;
	bcf	(54/8),(54)&7
	line	125
;7seg_Rev00.c: 125: RC0 = 0;
	bcf	(56/8),(56)&7
	line	126
;7seg_Rev00.c: 126: RB4 = 0;
	bcf	(52/8),(52)&7
	line	127
;7seg_Rev00.c: 127: RB3 = 0;
	bcf	(51/8),(51)&7
	line	128
;7seg_Rev00.c: 128: RB2 = 0;
	bcf	(50/8),(50)&7
	line	129
;7seg_Rev00.c: 129: RB1 = 0;
	bcf	(49/8),(49)&7
	line	130
;7seg_Rev00.c: 130: RB0 = 0;
	bcf	(48/8),(48)&7
	line	131
;7seg_Rev00.c: 131: RC5 = 0;
	bcf	(61/8),(61)&7
	line	132
;7seg_Rev00.c: 132: RC4 = 0;
	bcf	(60/8),(60)&7
	line	133
;7seg_Rev00.c: 133: RC3 = 0;
	bcf	(59/8),(59)&7
	line	134
;7seg_Rev00.c: 134: RC2 = 0;
	bcf	(58/8),(58)&7
	line	135
;7seg_Rev00.c: 135: RC1 = 0;
	bcf	(57/8),(57)&7
	line	136
;7seg_Rev00.c: 136: break;
	goto	l4869
	line	137
;7seg_Rev00.c: 137: case 'L':
	
l655:	
	line	138
	
l4889:	
;7seg_Rev00.c: 138: TMR2 = 0;
	clrf	(17)	;volatile
	line	139
	
l4891:	
;7seg_Rev00.c: 139: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	140
;7seg_Rev00.c: 140: break;
	goto	l4869
	line	141
;7seg_Rev00.c: 141: case 'Z':
	
l656:	
	line	142
;7seg_Rev00.c: 142: scoreA0 = 0;
	clrf	(_scoreA0)
	line	143
;7seg_Rev00.c: 143: scoreA1 = 0;
	clrf	(_scoreA1)
	line	144
;7seg_Rev00.c: 144: scoreA2 = 0;
	clrf	(_scoreA2)
	line	145
;7seg_Rev00.c: 145: scoreA3 = 0;
	clrf	(_scoreA3)
	line	146
;7seg_Rev00.c: 146: scoreB0 = 0;
	clrf	(_scoreB0)
	line	147
;7seg_Rev00.c: 147: scoreB1 = 0;
	clrf	(_scoreB1)
	line	148
;7seg_Rev00.c: 148: scoreB2 = 0;
	clrf	(_scoreB2)
	line	149
;7seg_Rev00.c: 149: scoreB3 = 0;
	clrf	(_scoreB3)
	line	150
;7seg_Rev00.c: 150: break;
	goto	l4869
	line	151
;7seg_Rev00.c: 151: case 'A':
	
l657:	
	line	152
	
l4893:	
;7seg_Rev00.c: 152: scoreA3 = rx[2];
	movf	0+(_rx)+02h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_scoreA3)
	line	153
;7seg_Rev00.c: 153: scoreA2 = rx[3];
	movf	0+(_rx)+03h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_scoreA2)
	line	154
;7seg_Rev00.c: 154: scoreA1 = rx[4];
	movf	0+(_rx)+04h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_scoreA1)
	line	155
;7seg_Rev00.c: 155: scoreA0 = rx[5];
	movf	0+(_rx)+05h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_scoreA0)
	line	156
;7seg_Rev00.c: 156: break;
	goto	l4869
	line	157
;7seg_Rev00.c: 157: case 'B':
	
l658:	
	line	158
	
l4895:	
;7seg_Rev00.c: 158: scoreB3 = rx[2];
	movf	0+(_rx)+02h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_scoreB3)
	line	159
;7seg_Rev00.c: 159: scoreB2 = rx[3];
	movf	0+(_rx)+03h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_scoreB2)
	line	160
;7seg_Rev00.c: 160: scoreB1 = rx[4];
	movf	0+(_rx)+04h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_scoreB1)
	line	161
;7seg_Rev00.c: 161: scoreB0 = rx[5];
	movf	0+(_rx)+05h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_scoreB0)
	line	162
;7seg_Rev00.c: 162: break;
	goto	l4869
	line	163
;7seg_Rev00.c: 163: default:
	
l659:	
	line	164
;7seg_Rev00.c: 164: break;
	goto	l4869
	line	165
	
l4897:	
;7seg_Rev00.c: 165: }
	goto	l4869
	line	119
	
l652:	
	
l4899:	
	movf	0+(_rx)+01h,w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 65 to 90
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           89    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	65^0	; case 65
	skipnz
	goto	l4893
	xorlw	66^65	; case 66
	skipnz
	goto	l4895
	xorlw	68^66	; case 68
	skipnz
	goto	l653
	xorlw	76^68	; case 76
	skipnz
	goto	l4889
	xorlw	90^76	; case 90
	skipnz
	goto	l656
	goto	l4869
	opt asmopt_on

	line	165
	
l654:	
	goto	l4869
	line	166
	
l651:	
	goto	l4869
	line	167
	
l660:	
	line	86
	goto	l4869
	
l661:	
	line	168
	
l662:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_initUART
psect	text173,local,class=CODE,delta=2
global __ptext173
__ptext173:

;; *************** function _initUART *****************
;; Defined at:
;;		line 49 in file "D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\Routines_Rev00.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text173
	file	"D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\Routines_Rev00.c"
	line	49
	global	__size_of_initUART
	__size_of_initUART	equ	__end_of_initUART-_initUART
	
_initUART:	
	opt	stack 6
; Regs used in _initUART: [wreg]
	line	52
	
l4675:	
;Routines_Rev00.c: 52: TX9 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1222/8)^080h,(1222)&7
	line	53
;Routines_Rev00.c: 53: TXEN = 1;
	bsf	(1221/8)^080h,(1221)&7
	line	54
;Routines_Rev00.c: 54: SYNC = 0;
	bcf	(1220/8)^080h,(1220)&7
	line	55
;Routines_Rev00.c: 55: BRGH = 1;
	bsf	(1218/8)^080h,(1218)&7
	line	60
;Routines_Rev00.c: 60: SPEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	61
;Routines_Rev00.c: 61: RX9 = 0;
	bcf	(198/8),(198)&7
	line	62
;Routines_Rev00.c: 62: FERR = 0;
	bcf	(194/8),(194)&7
	line	63
;Routines_Rev00.c: 63: OERR = 0;
	bcf	(193/8),(193)&7
	line	64
;Routines_Rev00.c: 64: CREN = 1;
	bsf	(196/8),(196)&7
	line	66
	
l4677:	
;Routines_Rev00.c: 66: SPBRG = 64;
	movlw	(040h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	68
	
l4679:	
;Routines_Rev00.c: 68: RCIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(101/8),(101)&7
	line	69
	
l4681:	
;Routines_Rev00.c: 69: RCIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	70
	
l2577:	
	return
	opt stack 0
GLOBAL	__end_of_initUART
	__end_of_initUART:
;; =============== function _initUART ends ============

	signat	_initUART,88
	global	_initTMR2
psect	text174,local,class=CODE,delta=2
global __ptext174
__ptext174:

;; *************** function _initTMR2 *****************
;; Defined at:
;;		line 79 in file "D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\Routines_Rev00.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text174
	file	"D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\Routines_Rev00.c"
	line	79
	global	__size_of_initTMR2
	__size_of_initTMR2	equ	__end_of_initTMR2-_initTMR2
	
_initTMR2:	
	opt	stack 6
; Regs used in _initTMR2: []
	line	81
	
l4673:	
;Routines_Rev00.c: 81: T2CKPS1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(145/8),(145)&7
	line	82
;Routines_Rev00.c: 82: T2CKPS0 = 0;
	bcf	(144/8),(144)&7
	line	85
;Routines_Rev00.c: 85: TOUTPS3 = 0;
	bcf	(150/8),(150)&7
	line	86
;Routines_Rev00.c: 86: TOUTPS2 = 1;
	bsf	(149/8),(149)&7
	line	87
;Routines_Rev00.c: 87: TOUTPS1 = 0;
	bcf	(148/8),(148)&7
	line	88
;Routines_Rev00.c: 88: TOUTPS0 = 0;
	bcf	(147/8),(147)&7
	line	90
;Routines_Rev00.c: 90: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	91
;Routines_Rev00.c: 91: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	94
	
l2580:	
	return
	opt stack 0
GLOBAL	__end_of_initTMR2
	__end_of_initTMR2:
;; =============== function _initTMR2 ends ============

	signat	_initTMR2,88
	global	_init
psect	text175,local,class=CODE,delta=2
global __ptext175
__ptext175:

;; *************** function _init *****************
;; Defined at:
;;		line 24 in file "D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\Routines_Rev00.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text175
	file	"D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\Routines_Rev00.c"
	line	24
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 6
; Regs used in _init: [wreg+status,2]
	line	26
	
l4661:	
;Routines_Rev00.c: 26: TRISA = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	27
;Routines_Rev00.c: 27: TRISB = 0;
	clrf	(134)^080h	;volatile
	line	28
;Routines_Rev00.c: 28: TRISC = 0;
	clrf	(135)^080h	;volatile
	line	31
	
l4663:	
;Routines_Rev00.c: 31: CMCON = 7;
	movlw	(07h)
	movwf	(156)^080h	;volatile
	line	32
	
l4665:	
;Routines_Rev00.c: 32: ADCON1 = 7;
	movlw	(07h)
	movwf	(159)^080h	;volatile
	line	34
	
l4667:	
;Routines_Rev00.c: 34: nRBPU = 1;
	bsf	(1039/8)^080h,(1039)&7
	line	36
	
l4669:	
;Routines_Rev00.c: 36: PEIE = 1;
	bsf	(94/8),(94)&7
	line	37
	
l4671:	
;Routines_Rev00.c: 37: GIE = 1;
	bsf	(95/8),(95)&7
	line	39
	
l2574:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_isr
psect	text176,local,class=CODE,delta=2
global __ptext176
__ptext176:

;; *************** function _isr *****************
;; Defined at:
;;		line 25 in file "D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\Interrupts_Rev00.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            1    7[COMMON] volatile unsigned char 
;;  temp            1    6[COMMON] volatile unsigned char 
;; Return value:  Size  Location     Type
;;                  2  1924[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          6       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text176
	file	"D:\Dropbox\PhoenixArcade\Arduino\PIC\Desenvolvimento\7seg Controller_Rev00\Interrupts_Rev00.c"
	line	25
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 6
; Regs used in _isr: [wreg-fsr0h+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_isr+2)
	movf	fsr0,w
	movwf	(??_isr+3)
	movf	pclath,w
	movwf	(??_isr+4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr+5)
	ljmp	_isr
psect	text176
	line	28
	
i1l4683:	
;Interrupts_Rev00.c: 28: if(RCIF && RCIE)
	btfss	(101/8),(101)&7
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l4705
u240_20:
	
i1l4685:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1125/8)^080h,(1125)&7
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l4705
u241_20:
	line	30
	
i1l4687:	
;Interrupts_Rev00.c: 29: {
;Interrupts_Rev00.c: 30: volatile unsigned char temp = 0;
	clrf	(isr@temp)	;volatile
	line	32
	
i1l4689:	
;Interrupts_Rev00.c: 32: temp = RCREG;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(26),w	;volatile
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp)	;volatile
	line	35
;Interrupts_Rev00.c: 35: if(temp == '@')
	movf	(isr@temp),w	;volatile
	xorlw	040h
	skipz
	goto	u242_21
	goto	u242_20
u242_21:
	goto	i1l4697
u242_20:
	line	37
	
i1l4691:	
;Interrupts_Rev00.c: 36: {
;Interrupts_Rev00.c: 37: rxCount = 0;
	clrf	(_rxCount)
	line	38
	
i1l4693:	
;Interrupts_Rev00.c: 38: rx[rxCount] = temp;
	movf	(isr@temp),w	;volatile
	movwf	(??_isr+0)+0
	movf	(_rxCount),w
	addlw	_rx&0ffh
	movwf	fsr0
	movf	(??_isr+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	39
	
i1l4695:	
;Interrupts_Rev00.c: 39: rxCount++;
	movlw	(01h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	addwf	(_rxCount),f
	line	40
;Interrupts_Rev00.c: 40: }
	goto	i1l1928
	line	41
	
i1l1926:	
	line	43
	
i1l4697:	
;Interrupts_Rev00.c: 41: else
;Interrupts_Rev00.c: 42: {
;Interrupts_Rev00.c: 43: rx[rxCount] = temp;
	movf	(isr@temp),w	;volatile
	movwf	(??_isr+0)+0
	movf	(_rxCount),w
	addlw	_rx&0ffh
	movwf	fsr0
	movf	(??_isr+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	44
	
i1l4699:	
;Interrupts_Rev00.c: 44: rxCount++;
	movlw	(01h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	addwf	(_rxCount),f
	goto	i1l1928
	line	45
	
i1l1927:	
	line	47
;Interrupts_Rev00.c: 45: }
;Interrupts_Rev00.c: 47: while(!TXIF);
	goto	i1l1928
	
i1l1929:	
	
i1l1928:	
	btfss	(100/8),(100)&7
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l1928
u243_20:
	goto	i1l4701
	
i1l1930:	
	line	48
	
i1l4701:	
;Interrupts_Rev00.c: 48: TXREG = temp;
	movf	(isr@temp),w	;volatile
	movwf	(25)	;volatile
	line	50
	
i1l4703:	
;Interrupts_Rev00.c: 50: RCIF = 0;
	bcf	(101/8),(101)&7
	goto	i1l4705
	line	51
	
i1l1925:	
	line	55
	
i1l4705:	
;Interrupts_Rev00.c: 51: }
;Interrupts_Rev00.c: 55: if(TMR2IF && TMR2IE)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u244_21
	goto	u244_20
u244_21:
	goto	i1l1961
u244_20:
	
i1l4707:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l1961
u245_20:
	line	57
	
i1l4709:	
;Interrupts_Rev00.c: 56: {
;Interrupts_Rev00.c: 57: volatile unsigned char temp = 0;
	clrf	(isr@temp_2657)	;volatile
	line	60
;Interrupts_Rev00.c: 60: RB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(54/8),(54)&7
	line	61
;Interrupts_Rev00.c: 61: RC0 = 0;
	bcf	(56/8),(56)&7
	line	62
;Interrupts_Rev00.c: 62: RB4 = 0;
	bcf	(52/8),(52)&7
	line	63
;Interrupts_Rev00.c: 63: RB3 = 0;
	bcf	(51/8),(51)&7
	line	64
;Interrupts_Rev00.c: 64: RB2 = 0;
	bcf	(50/8),(50)&7
	line	65
;Interrupts_Rev00.c: 65: RB1 = 0;
	bcf	(49/8),(49)&7
	line	67
;Interrupts_Rev00.c: 67: RB0 = 0;
	bcf	(48/8),(48)&7
	line	68
;Interrupts_Rev00.c: 68: RC5 = 0;
	bcf	(61/8),(61)&7
	line	69
;Interrupts_Rev00.c: 69: RC4 = 0;
	bcf	(60/8),(60)&7
	line	70
;Interrupts_Rev00.c: 70: RC3 = 0;
	bcf	(59/8),(59)&7
	line	71
;Interrupts_Rev00.c: 71: RC2 = 0;
	bcf	(58/8),(58)&7
	line	72
;Interrupts_Rev00.c: 72: RC1 = 0;
	bcf	(57/8),(57)&7
	line	74
;Interrupts_Rev00.c: 74: switch(display)
	goto	i1l4785
	line	76
;Interrupts_Rev00.c: 75: {
;Interrupts_Rev00.c: 76: case 0:
	
i1l1933:	
	line	77
	
i1l4711:	
;Interrupts_Rev00.c: 77: temp = scoreA0;
	movf	(_scoreA0),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	78
	
i1l4713:	
;Interrupts_Rev00.c: 78: temp = temp & 0x0F;
	movf	(isr@temp_2657),w
	andlw	0Fh
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	79
	
i1l4715:	
;Interrupts_Rev00.c: 79: RB6 = 1;
	bsf	(54/8),(54)&7
	line	80
;Interrupts_Rev00.c: 80: break;
	goto	i1l4789
	line	81
;Interrupts_Rev00.c: 81: case 1:
	
i1l1935:	
	line	82
	
i1l4717:	
;Interrupts_Rev00.c: 82: temp = scoreA0;
	movf	(_scoreA0),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	83
	
i1l4719:	
;Interrupts_Rev00.c: 83: temp = (temp & 0xF0)>>4;
	movf	(isr@temp_2657),w
	movwf	(??_isr+0)+0
	movlw	04h
u246_25:
	clrc
	rrf	(??_isr+0)+0,f
	addlw	-1
	skipz
	goto	u246_25
	movf	0+(??_isr+0)+0,w
	andlw	0Fh
	movwf	(??_isr+1)+0
	movf	(??_isr+1)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	84
	
i1l4721:	
;Interrupts_Rev00.c: 84: RC0 = 1;
	bsf	(56/8),(56)&7
	line	85
;Interrupts_Rev00.c: 85: break;
	goto	i1l4789
	line	86
;Interrupts_Rev00.c: 86: case 2:
	
i1l1936:	
	line	87
	
i1l4723:	
;Interrupts_Rev00.c: 87: temp = scoreA1;
	movf	(_scoreA1),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	88
	
i1l4725:	
;Interrupts_Rev00.c: 88: temp = temp & 0x0F;
	movf	(isr@temp_2657),w
	andlw	0Fh
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	89
	
i1l4727:	
;Interrupts_Rev00.c: 89: RB4 = 1;
	bsf	(52/8),(52)&7
	line	90
;Interrupts_Rev00.c: 90: break;
	goto	i1l4789
	line	91
;Interrupts_Rev00.c: 91: case 3:
	
i1l1937:	
	line	92
	
i1l4729:	
;Interrupts_Rev00.c: 92: temp = scoreA1;
	movf	(_scoreA1),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	93
	
i1l4731:	
;Interrupts_Rev00.c: 93: temp = (temp & 0xF0)>>4;
	movf	(isr@temp_2657),w
	movwf	(??_isr+0)+0
	movlw	04h
u247_25:
	clrc
	rrf	(??_isr+0)+0,f
	addlw	-1
	skipz
	goto	u247_25
	movf	0+(??_isr+0)+0,w
	andlw	0Fh
	movwf	(??_isr+1)+0
	movf	(??_isr+1)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	94
	
i1l4733:	
;Interrupts_Rev00.c: 94: RB3 = 1;
	bsf	(51/8),(51)&7
	line	95
;Interrupts_Rev00.c: 95: break;
	goto	i1l4789
	line	96
;Interrupts_Rev00.c: 96: case 4:
	
i1l1938:	
	line	97
	
i1l4735:	
;Interrupts_Rev00.c: 97: temp = scoreA2;
	movf	(_scoreA2),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	98
	
i1l4737:	
;Interrupts_Rev00.c: 98: temp = temp & 0x0F;
	movf	(isr@temp_2657),w
	andlw	0Fh
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	99
	
i1l4739:	
;Interrupts_Rev00.c: 99: RB2 = 1;
	bsf	(50/8),(50)&7
	line	100
;Interrupts_Rev00.c: 100: break;
	goto	i1l4789
	line	101
;Interrupts_Rev00.c: 101: case 5:
	
i1l1939:	
	line	102
	
i1l4741:	
;Interrupts_Rev00.c: 102: temp = scoreA2;
	movf	(_scoreA2),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	103
	
i1l4743:	
;Interrupts_Rev00.c: 103: temp = (temp & 0xF0)>>4;
	movf	(isr@temp_2657),w
	movwf	(??_isr+0)+0
	movlw	04h
u248_25:
	clrc
	rrf	(??_isr+0)+0,f
	addlw	-1
	skipz
	goto	u248_25
	movf	0+(??_isr+0)+0,w
	andlw	0Fh
	movwf	(??_isr+1)+0
	movf	(??_isr+1)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	104
	
i1l4745:	
;Interrupts_Rev00.c: 104: RB1 = 1;
	bsf	(49/8),(49)&7
	line	105
;Interrupts_Rev00.c: 105: break;
	goto	i1l4789
	line	106
;Interrupts_Rev00.c: 106: case 6:
	
i1l1940:	
	line	107
	
i1l4747:	
;Interrupts_Rev00.c: 107: temp = scoreB0;
	movf	(_scoreB0),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	108
	
i1l4749:	
;Interrupts_Rev00.c: 108: temp = temp & 0x0F;
	movf	(isr@temp_2657),w
	andlw	0Fh
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	109
	
i1l4751:	
;Interrupts_Rev00.c: 109: RB0 = 1;
	bsf	(48/8),(48)&7
	line	110
;Interrupts_Rev00.c: 110: break;
	goto	i1l4789
	line	111
;Interrupts_Rev00.c: 111: case 7:
	
i1l1941:	
	line	112
	
i1l4753:	
;Interrupts_Rev00.c: 112: temp = scoreB0;
	movf	(_scoreB0),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	113
	
i1l4755:	
;Interrupts_Rev00.c: 113: temp = (temp & 0xF0)>>4;
	movf	(isr@temp_2657),w
	movwf	(??_isr+0)+0
	movlw	04h
u249_25:
	clrc
	rrf	(??_isr+0)+0,f
	addlw	-1
	skipz
	goto	u249_25
	movf	0+(??_isr+0)+0,w
	andlw	0Fh
	movwf	(??_isr+1)+0
	movf	(??_isr+1)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	114
	
i1l4757:	
;Interrupts_Rev00.c: 114: RC5 = 1;
	bsf	(61/8),(61)&7
	line	115
;Interrupts_Rev00.c: 115: break;
	goto	i1l4789
	line	116
;Interrupts_Rev00.c: 116: case 8:
	
i1l1942:	
	line	117
	
i1l4759:	
;Interrupts_Rev00.c: 117: temp = scoreB1;
	movf	(_scoreB1),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	118
	
i1l4761:	
;Interrupts_Rev00.c: 118: temp = temp & 0x0F;
	movf	(isr@temp_2657),w
	andlw	0Fh
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	119
	
i1l4763:	
;Interrupts_Rev00.c: 119: RC4 = 1;
	bsf	(60/8),(60)&7
	line	120
;Interrupts_Rev00.c: 120: break;
	goto	i1l4789
	line	121
;Interrupts_Rev00.c: 121: case 9:
	
i1l1943:	
	line	122
	
i1l4765:	
;Interrupts_Rev00.c: 122: temp = scoreB1;
	movf	(_scoreB1),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	123
	
i1l4767:	
;Interrupts_Rev00.c: 123: temp = (temp & 0xF0)>>4;
	movf	(isr@temp_2657),w
	movwf	(??_isr+0)+0
	movlw	04h
u250_25:
	clrc
	rrf	(??_isr+0)+0,f
	addlw	-1
	skipz
	goto	u250_25
	movf	0+(??_isr+0)+0,w
	andlw	0Fh
	movwf	(??_isr+1)+0
	movf	(??_isr+1)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	124
	
i1l4769:	
;Interrupts_Rev00.c: 124: RC3 = 1;
	bsf	(59/8),(59)&7
	line	125
;Interrupts_Rev00.c: 125: break;
	goto	i1l4789
	line	126
;Interrupts_Rev00.c: 126: case 10:
	
i1l1944:	
	line	127
	
i1l4771:	
;Interrupts_Rev00.c: 127: temp = scoreB2;
	movf	(_scoreB2),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	128
	
i1l4773:	
;Interrupts_Rev00.c: 128: temp = temp & 0x0F;
	movf	(isr@temp_2657),w
	andlw	0Fh
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	129
	
i1l4775:	
;Interrupts_Rev00.c: 129: RC2 = 1;
	bsf	(58/8),(58)&7
	line	130
;Interrupts_Rev00.c: 130: break;
	goto	i1l4789
	line	131
;Interrupts_Rev00.c: 131: case 11:
	
i1l1945:	
	line	132
	
i1l4777:	
;Interrupts_Rev00.c: 132: temp = scoreB2;
	movf	(_scoreB2),w
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	133
	
i1l4779:	
;Interrupts_Rev00.c: 133: temp = (temp & 0xF0)>>4;
	movf	(isr@temp_2657),w
	movwf	(??_isr+0)+0
	movlw	04h
u251_25:
	clrc
	rrf	(??_isr+0)+0,f
	addlw	-1
	skipz
	goto	u251_25
	movf	0+(??_isr+0)+0,w
	andlw	0Fh
	movwf	(??_isr+1)+0
	movf	(??_isr+1)+0,w
	movwf	(isr@temp_2657)	;volatile
	line	134
	
i1l4781:	
;Interrupts_Rev00.c: 134: RC1 = 1;
	bsf	(57/8),(57)&7
	line	135
;Interrupts_Rev00.c: 135: break;
	goto	i1l4789
	line	136
;Interrupts_Rev00.c: 136: default:
	
i1l1946:	
	line	137
;Interrupts_Rev00.c: 137: break;
	goto	i1l4789
	line	138
	
i1l4783:	
;Interrupts_Rev00.c: 138: }
	goto	i1l4789
	line	74
	
i1l1932:	
	
i1l4785:	
	movf	(_display),w
	; Switch size 1, requested type "space"
; Number of cases is 12, Range of values is 0 to 11
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           37    19 (average)
; direct_byte           44     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            16     6 (fixed)
; spacedrange           30     9 (fixed)
; locatedrange          12     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l4711
	xorlw	1^0	; case 1
	skipnz
	goto	i1l4717
	xorlw	2^1	; case 2
	skipnz
	goto	i1l4723
	xorlw	3^2	; case 3
	skipnz
	goto	i1l4729
	xorlw	4^3	; case 4
	skipnz
	goto	i1l4735
	xorlw	5^4	; case 5
	skipnz
	goto	i1l4741
	xorlw	6^5	; case 6
	skipnz
	goto	i1l4747
	xorlw	7^6	; case 7
	skipnz
	goto	i1l4753
	xorlw	8^7	; case 8
	skipnz
	goto	i1l4759
	xorlw	9^8	; case 9
	skipnz
	goto	i1l4765
	xorlw	10^9	; case 10
	skipnz
	goto	i1l4771
	xorlw	11^10	; case 11
	skipnz
	goto	i1l4777
	goto	i1l4789
	opt asmopt_on

	line	138
	
i1l1934:	
	line	140
;Interrupts_Rev00.c: 140: switch(temp)
	goto	i1l4789
	line	142
;Interrupts_Rev00.c: 141: {
;Interrupts_Rev00.c: 142: case 0:
	
i1l1948:	
	line	143
;Interrupts_Rev00.c: 143: RA0 = 0;
	bcf	(40/8),(40)&7
	line	144
;Interrupts_Rev00.c: 144: RA1 = 0;
	bcf	(41/8),(41)&7
	line	145
;Interrupts_Rev00.c: 145: RA2 = 0;
	bcf	(42/8),(42)&7
	line	146
;Interrupts_Rev00.c: 146: RA3 = 0;
	bcf	(43/8),(43)&7
	line	147
;Interrupts_Rev00.c: 147: RB7 = 0;
	bcf	(55/8),(55)&7
	line	148
;Interrupts_Rev00.c: 148: RA5 = 0;
	bcf	(45/8),(45)&7
	line	149
;Interrupts_Rev00.c: 149: RB5 = 1;
	bsf	(53/8),(53)&7
	line	150
;Interrupts_Rev00.c: 150: break;
	goto	i1l4791
	line	151
;Interrupts_Rev00.c: 151: case 1:
	
i1l1950:	
	line	152
;Interrupts_Rev00.c: 152: RA0 = 1;
	bsf	(40/8),(40)&7
	line	153
;Interrupts_Rev00.c: 153: RA1 = 0;
	bcf	(41/8),(41)&7
	line	154
;Interrupts_Rev00.c: 154: RA2 = 0;
	bcf	(42/8),(42)&7
	line	155
;Interrupts_Rev00.c: 155: RA3 = 1;
	bsf	(43/8),(43)&7
	line	156
;Interrupts_Rev00.c: 156: RB7 = 1;
	bsf	(55/8),(55)&7
	line	157
;Interrupts_Rev00.c: 157: RA5 = 1;
	bsf	(45/8),(45)&7
	line	158
;Interrupts_Rev00.c: 158: RB5 = 1;
	bsf	(53/8),(53)&7
	line	159
;Interrupts_Rev00.c: 159: break;
	goto	i1l4791
	line	160
;Interrupts_Rev00.c: 160: case 2:
	
i1l1951:	
	line	161
;Interrupts_Rev00.c: 161: RA0 = 0;
	bcf	(40/8),(40)&7
	line	162
;Interrupts_Rev00.c: 162: RA1 = 0;
	bcf	(41/8),(41)&7
	line	163
;Interrupts_Rev00.c: 163: RA2 = 1;
	bsf	(42/8),(42)&7
	line	164
;Interrupts_Rev00.c: 164: RA3 = 0;
	bcf	(43/8),(43)&7
	line	165
;Interrupts_Rev00.c: 165: RB7 = 0;
	bcf	(55/8),(55)&7
	line	166
;Interrupts_Rev00.c: 166: RA5 = 1;
	bsf	(45/8),(45)&7
	line	167
;Interrupts_Rev00.c: 167: RB5 = 0;
	bcf	(53/8),(53)&7
	line	168
;Interrupts_Rev00.c: 168: break;
	goto	i1l4791
	line	169
;Interrupts_Rev00.c: 169: case 3:
	
i1l1952:	
	line	170
;Interrupts_Rev00.c: 170: RA0 = 0;
	bcf	(40/8),(40)&7
	line	171
;Interrupts_Rev00.c: 171: RA1 = 0;
	bcf	(41/8),(41)&7
	line	172
;Interrupts_Rev00.c: 172: RA2 = 0;
	bcf	(42/8),(42)&7
	line	173
;Interrupts_Rev00.c: 173: RA3 = 0;
	bcf	(43/8),(43)&7
	line	174
;Interrupts_Rev00.c: 174: RB7 = 1;
	bsf	(55/8),(55)&7
	line	175
;Interrupts_Rev00.c: 175: RA5 = 1;
	bsf	(45/8),(45)&7
	line	176
;Interrupts_Rev00.c: 176: RB5 = 0;
	bcf	(53/8),(53)&7
	line	177
;Interrupts_Rev00.c: 177: break;
	goto	i1l4791
	line	178
;Interrupts_Rev00.c: 178: case 4:
	
i1l1953:	
	line	179
;Interrupts_Rev00.c: 179: RA0 = 1;
	bsf	(40/8),(40)&7
	line	180
;Interrupts_Rev00.c: 180: RA1 = 0;
	bcf	(41/8),(41)&7
	line	181
;Interrupts_Rev00.c: 181: RA2 = 0;
	bcf	(42/8),(42)&7
	line	182
;Interrupts_Rev00.c: 182: RA3 = 1;
	bsf	(43/8),(43)&7
	line	183
;Interrupts_Rev00.c: 183: RB7 = 1;
	bsf	(55/8),(55)&7
	line	184
;Interrupts_Rev00.c: 184: RA5 = 0;
	bcf	(45/8),(45)&7
	line	185
;Interrupts_Rev00.c: 185: RB5 = 0;
	bcf	(53/8),(53)&7
	line	186
;Interrupts_Rev00.c: 186: break;
	goto	i1l4791
	line	187
;Interrupts_Rev00.c: 187: case 5:
	
i1l1954:	
	line	188
;Interrupts_Rev00.c: 188: RA0 = 0;
	bcf	(40/8),(40)&7
	line	189
;Interrupts_Rev00.c: 189: RA1 = 1;
	bsf	(41/8),(41)&7
	line	190
;Interrupts_Rev00.c: 190: RA2 = 0;
	bcf	(42/8),(42)&7
	line	191
;Interrupts_Rev00.c: 191: RA3 = 0;
	bcf	(43/8),(43)&7
	line	192
;Interrupts_Rev00.c: 192: RB7 = 1;
	bsf	(55/8),(55)&7
	line	193
;Interrupts_Rev00.c: 193: RA5 = 0;
	bcf	(45/8),(45)&7
	line	194
;Interrupts_Rev00.c: 194: RB5 = 0;
	bcf	(53/8),(53)&7
	line	195
;Interrupts_Rev00.c: 195: break;
	goto	i1l4791
	line	196
;Interrupts_Rev00.c: 196: case 6:
	
i1l1955:	
	line	197
;Interrupts_Rev00.c: 197: RA0 = 0;
	bcf	(40/8),(40)&7
	line	198
;Interrupts_Rev00.c: 198: RA1 = 1;
	bsf	(41/8),(41)&7
	line	199
;Interrupts_Rev00.c: 199: RA2 = 0;
	bcf	(42/8),(42)&7
	line	200
;Interrupts_Rev00.c: 200: RA3 = 0;
	bcf	(43/8),(43)&7
	line	201
;Interrupts_Rev00.c: 201: RB7 = 0;
	bcf	(55/8),(55)&7
	line	202
;Interrupts_Rev00.c: 202: RA5 = 0;
	bcf	(45/8),(45)&7
	line	203
;Interrupts_Rev00.c: 203: RB5 = 0;
	bcf	(53/8),(53)&7
	line	204
;Interrupts_Rev00.c: 204: break;
	goto	i1l4791
	line	205
;Interrupts_Rev00.c: 205: case 7:
	
i1l1956:	
	line	206
;Interrupts_Rev00.c: 206: RA0 = 0;
	bcf	(40/8),(40)&7
	line	207
;Interrupts_Rev00.c: 207: RA1 = 0;
	bcf	(41/8),(41)&7
	line	208
;Interrupts_Rev00.c: 208: RA2 = 0;
	bcf	(42/8),(42)&7
	line	209
;Interrupts_Rev00.c: 209: RA3 = 1;
	bsf	(43/8),(43)&7
	line	210
;Interrupts_Rev00.c: 210: RB7 = 1;
	bsf	(55/8),(55)&7
	line	211
;Interrupts_Rev00.c: 211: RA5 = 1;
	bsf	(45/8),(45)&7
	line	212
;Interrupts_Rev00.c: 212: RB5 = 1;
	bsf	(53/8),(53)&7
	line	213
;Interrupts_Rev00.c: 213: break;
	goto	i1l4791
	line	214
;Interrupts_Rev00.c: 214: case 8:
	
i1l1957:	
	line	215
;Interrupts_Rev00.c: 215: RA0 = 0;
	bcf	(40/8),(40)&7
	line	216
;Interrupts_Rev00.c: 216: RA1 = 0;
	bcf	(41/8),(41)&7
	line	217
;Interrupts_Rev00.c: 217: RA2 = 0;
	bcf	(42/8),(42)&7
	line	218
;Interrupts_Rev00.c: 218: RA3 = 0;
	bcf	(43/8),(43)&7
	line	219
;Interrupts_Rev00.c: 219: RB7 = 0;
	bcf	(55/8),(55)&7
	line	220
;Interrupts_Rev00.c: 220: RA5 = 0;
	bcf	(45/8),(45)&7
	line	221
;Interrupts_Rev00.c: 221: RB5 = 0;
	bcf	(53/8),(53)&7
	line	222
;Interrupts_Rev00.c: 222: break;
	goto	i1l4791
	line	223
;Interrupts_Rev00.c: 223: case 9:
	
i1l1958:	
	line	224
;Interrupts_Rev00.c: 224: RA0 = 0;
	bcf	(40/8),(40)&7
	line	225
;Interrupts_Rev00.c: 225: RA1 = 0;
	bcf	(41/8),(41)&7
	line	226
;Interrupts_Rev00.c: 226: RA2 = 0;
	bcf	(42/8),(42)&7
	line	227
;Interrupts_Rev00.c: 227: RA3 = 0;
	bcf	(43/8),(43)&7
	line	228
;Interrupts_Rev00.c: 228: RB7 = 1;
	bsf	(55/8),(55)&7
	line	229
;Interrupts_Rev00.c: 229: RA5 = 0;
	bcf	(45/8),(45)&7
	line	230
;Interrupts_Rev00.c: 230: RB5 = 0;
	bcf	(53/8),(53)&7
	line	231
;Interrupts_Rev00.c: 231: break;
	goto	i1l4791
	line	232
;Interrupts_Rev00.c: 232: default:
	
i1l1959:	
	line	233
;Interrupts_Rev00.c: 233: break;
	goto	i1l4791
	line	234
	
i1l4787:	
;Interrupts_Rev00.c: 234: }
	goto	i1l4791
	line	140
	
i1l1947:	
	
i1l4789:	
	movf	(isr@temp_2657),w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 10, Range of values is 0 to 9
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           31    16 (average)
; direct_byte           38     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            14     6 (fixed)
; spacedrange           26     9 (fixed)
; locatedrange          10     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l1948
	xorlw	1^0	; case 1
	skipnz
	goto	i1l1950
	xorlw	2^1	; case 2
	skipnz
	goto	i1l1951
	xorlw	3^2	; case 3
	skipnz
	goto	i1l1952
	xorlw	4^3	; case 4
	skipnz
	goto	i1l1953
	xorlw	5^4	; case 5
	skipnz
	goto	i1l1954
	xorlw	6^5	; case 6
	skipnz
	goto	i1l1955
	xorlw	7^6	; case 7
	skipnz
	goto	i1l1956
	xorlw	8^7	; case 8
	skipnz
	goto	i1l1957
	xorlw	9^8	; case 9
	skipnz
	goto	i1l1958
	goto	i1l4791
	opt asmopt_on

	line	234
	
i1l1949:	
	line	236
	
i1l4791:	
;Interrupts_Rev00.c: 236: display++;
	movlw	(01h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	addwf	(_display),f
	line	237
	
i1l4793:	
;Interrupts_Rev00.c: 237: if(display > 11)
	movlw	(0Ch)
	subwf	(_display),w
	skipc
	goto	u252_21
	goto	u252_20
u252_21:
	goto	i1l1960
u252_20:
	line	239
	
i1l4795:	
;Interrupts_Rev00.c: 238: {
;Interrupts_Rev00.c: 239: display = 0;
	clrf	(_display)
	line	240
	
i1l1960:	
	line	242
;Interrupts_Rev00.c: 240: }
;Interrupts_Rev00.c: 242: TMR2IF = 0;
	bcf	(97/8),(97)&7
	goto	i1l1961
	line	243
	
i1l1931:	
	line	244
	
i1l1961:	
	movf	(??_isr+5),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	movf	(??_isr+4),w
	movwf	pclath
	movf	(??_isr+3),w
	movwf	fsr0
	swapf	(??_isr+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,90
psect	text177,local,class=CODE,delta=2
global __ptext177
__ptext177:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
