_port_set:
;port_set.c,1 :: 		void port_set(){
;port_set.c,2 :: 		RCC_APB2ENR.IOPAEN=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
_SX	[R0, ByteOffset(RCC_APB2ENR+0)]
;port_set.c,3 :: 		RCC_APB2ENR.IOPBEN=1;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
_SX	[R0, ByteOffset(RCC_APB2ENR+0)]
;port_set.c,4 :: 		RCC_APB2ENR.IOPCEN=1;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
_SX	[R0, ByteOffset(RCC_APB2ENR+0)]
;port_set.c,5 :: 		RCC_APB2ENR.IOPDEN=1;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
_SX	[R0, ByteOffset(RCC_APB2ENR+0)]
;port_set.c,6 :: 		RCC_APB2ENR.IOPEEN=1;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
_SX	[R0, ByteOffset(RCC_APB2ENR+0)]
;port_set.c,7 :: 		GPIOA_CRL=0X44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;port_set.c,8 :: 		GPIOA_CRH=0X44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;port_set.c,9 :: 		GPIOB_CRL=0X44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
;port_set.c,10 :: 		GPIOB_CRH=0X44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;port_set.c,11 :: 		GPIOC_CRL=0X44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;port_set.c,12 :: 		GPIOC_CRH=0X44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;port_set.c,13 :: 		GPIOD_CRL=0X44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOD_CRL+0)
MOVT	R0, #hi_addr(GPIOD_CRL+0)
STR	R1, [R0, #0]
;port_set.c,14 :: 		GPIOD_CRH=0X44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;port_set.c,15 :: 		GPIOE_CRL=0X33333333;
MOV	R1, #858993459
MOVW	R0, #lo_addr(GPIOE_CRL+0)
MOVT	R0, #hi_addr(GPIOE_CRL+0)
STR	R1, [R0, #0]
;port_set.c,16 :: 		GPIOE_CRH=0X33333333; }
MOV	R1, #858993459
MOVW	R0, #lo_addr(GPIOE_CRH+0)
MOVT	R0, #hi_addr(GPIOE_CRH+0)
STR	R1, [R0, #0]
L_end_port_set:
BX	LR
; end of _port_set
