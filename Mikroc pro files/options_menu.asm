_options_menu:
;options_menu.c,9 :: 		void options_menu(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;options_menu.c,10 :: 		delay_ms(250);
MOVW	R7, #50879
MOVT	R7, #45
NOP
NOP
L_options_menu0:
SUBS	R7, R7, #1
BNE	L_options_menu0
NOP
NOP
NOP
;options_menu.c,11 :: 		while(GPIOC_IDR.B13!=0)        {
L_options_menu2:
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_options_menu3
;options_menu.c,12 :: 		TFT_Fill_Screen(CL_BLUE);
MOVW	R0, #31
BL	_TFT_Fill_Screen+0
;options_menu.c,13 :: 		TFT_Set_Brush(0, CL_RED, 0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #63488
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;options_menu.c,14 :: 		TFT_Write_Text("START", 80, 100);
MOVW	R0, #lo_addr(?lstr1_options_menu+0)
MOVT	R0, #hi_addr(?lstr1_options_menu+0)
MOVS	R2, #100
MOVS	R1, #80
BL	_TFT_Write_Text+0
;options_menu.c,15 :: 		TFT_Write_Text("SCORE", 80, 150);
MOVW	R0, #lo_addr(?lstr2_options_menu+0)
MOVT	R0, #hi_addr(?lstr2_options_menu+0)
MOVS	R2, #150
MOVS	R1, #80
BL	_TFT_Write_Text+0
;options_menu.c,16 :: 		TFT_Write_Text("EXIT", 80, 200);
MOVW	R0, #lo_addr(?lstr3_options_menu+0)
MOVT	R0, #hi_addr(?lstr3_options_menu+0)
MOVS	R2, #200
MOVS	R1, #80
BL	_TFT_Write_Text+0
;options_menu.c,17 :: 		TFT_Set_Brush(0, CL_RED, 0,0,0,0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #63488
MOVS	R0, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;options_menu.c,18 :: 		TFT_Rectangle_Round_Edges(x1, y1, x2, y2, 6);
MOVS	R4, #6
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_x2+0)
MOVT	R0, #hi_addr(_x2+0)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDRSH	R0, [R0, #0]
PUSH	(R4)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
;options_menu.c,19 :: 		if(GPIOD_IDR.B4==0){up_button();}
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_options_menu4
BL	_up_button+0
IT	AL
BAL	L_options_menu5
L_options_menu4:
;options_menu.c,20 :: 		else if(GPIOB_IDR.B5==0){down_button();}
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_options_menu6
BL	_down_button+0
L_options_menu6:
L_options_menu5:
;options_menu.c,21 :: 		}      button_click();}
IT	AL
BAL	L_options_menu2
L_options_menu3:
BL	_button_click+0
L_end_options_menu:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _options_menu
_up_button:
;options_menu.c,24 :: 		void up_button(){
;options_menu.c,25 :: 		y1=y1-50;y2=y2-50;
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDRSH	R0, [R1, #0]
SUBW	R2, R0, #50
SXTH	R2, R2
STRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_y2+0)
MOVT	R1, #hi_addr(_y2+0)
LDRSH	R0, [R1, #0]
SUBS	R0, #50
STRH	R0, [R1, #0]
;options_menu.c,26 :: 		if(y1<90){x1=70;x2=130;y1=90;y2=130;}
CMP	R2, #90
IT	GE
BGE	L_up_button7
MOVS	R1, #70
SXTH	R1, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STRH	R1, [R0, #0]
MOVS	R1, #130
SXTH	R1, R1
MOVW	R0, #lo_addr(_x2+0)
MOVT	R0, #hi_addr(_x2+0)
STRH	R1, [R0, #0]
MOVS	R1, #90
SXTH	R1, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STRH	R1, [R0, #0]
MOVS	R1, #130
SXTH	R1, R1
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
STRH	R1, [R0, #0]
L_up_button7:
;options_menu.c,27 :: 		}
L_end_up_button:
BX	LR
; end of _up_button
_down_button:
;options_menu.c,29 :: 		void down_button(){
;options_menu.c,30 :: 		y1=y1+50;y2=y2+50;
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDRSH	R0, [R1, #0]
ADDW	R2, R0, #50
SXTH	R2, R2
STRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_y2+0)
MOVT	R1, #hi_addr(_y2+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #50
STRH	R0, [R1, #0]
;options_menu.c,31 :: 		if(y1>190){y1=190;y2=230;;}
CMP	R2, #190
IT	LE
BLE	L_down_button8
MOVS	R1, #190
SXTH	R1, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STRH	R1, [R0, #0]
MOVS	R1, #230
SXTH	R1, R1
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
STRH	R1, [R0, #0]
L_down_button8:
;options_menu.c,32 :: 		}
L_end_down_button:
BX	LR
; end of _down_button
_button_click:
;options_menu.c,33 :: 		void button_click(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;options_menu.c,34 :: 		if(y1==90){start_game();}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDRSH	R0, [R0, #0]
CMP	R0, #90
IT	NE
BNE	L_button_click9
BL	_start_game+0
IT	AL
BAL	L_button_click10
L_button_click9:
;options_menu.c,35 :: 		else if(y1==140){score();}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDRSH	R0, [R0, #0]
CMP	R0, #140
IT	NE
BNE	L_button_click11
BL	_score+0
IT	AL
BAL	L_button_click12
L_button_click11:
;options_menu.c,36 :: 		else if(y1==190){main_screen();} }
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDRSH	R0, [R0, #0]
CMP	R0, #190
IT	NE
BNE	L_button_click13
BL	_main_screen+0
L_button_click13:
L_button_click12:
L_button_click10:
L_end_button_click:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _button_click
