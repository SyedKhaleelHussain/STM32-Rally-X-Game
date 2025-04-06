_score:
;score.c,2 :: 		void score(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;score.c,3 :: 		TFT_Fill_Screen(CL_BLACK);
MOVW	R0, #0
BL	_TFT_Fill_Screen+0
;score.c,4 :: 		EEPROM_24C02_RdSingle(1);
MOVS	R0, #1
BL	_EEPROM_24C02_RdSingle+0
;score.c,5 :: 		TFT_Fill_Screen(CL_BLACK);
MOVW	R0, #0
BL	_TFT_Fill_Screen+0
;score.c,6 :: 		TFT_Write_Text("WELCOME TO  RALLY  X  GAME", 80, 100);}
MOVW	R0, #lo_addr(?lstr1_score+0)
MOVT	R0, #hi_addr(?lstr1_score+0)
MOVS	R2, #100
MOVS	R1, #80
BL	_TFT_Write_Text+0
L_end_score:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _score
