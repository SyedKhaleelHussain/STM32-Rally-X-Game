_start_game:
;start_game.c,33 :: 		void start_game(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;start_game.c,104 :: 		int scorevalue=8;
;start_game.c,105 :: 		int startx=180;
; startx start address is: 44 (R11)
MOVW	R11, #180
SXTH	R11, R11
;start_game.c,106 :: 		int starty=210;
; starty start address is: 48 (R12)
MOVW	R12, #210
SXTH	R12, R12
;start_game.c,107 :: 		I2C1_Init();
BL	_I2C1_Init+0
;start_game.c,108 :: 		AdcConfiguration();
BL	_AdcConfiguration+0
;start_game.c,109 :: 		start_posx=startx;
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
STRH	R11, [R0, #0]
; startx end address is: 44 (R11)
;start_game.c,110 :: 		start_posy=starty;
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
STRH	R12, [R0, #0]
; starty end address is: 48 (R12)
;start_game.c,111 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;start_game.c,112 :: 		TFT_Set_Brush(1, CL_BLACK, 0, LEFT_TO_RIGHT, CL_BLUE, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #31
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,113 :: 		TFT_Rectangle_Round_Edges(260,0,320,240,2);
MOVS	R0, #2
PUSH	(R0)
MOVS	R3, #240
MOVW	R2, #320
MOVS	R1, #0
MOVW	R0, #260
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
;start_game.c,115 :: 		TFT_Set_Brush(1, CL_RED, 0, LEFT_TO_RIGHT, CL_BLACK, CL_BLACK);
MOVW	R1, #0
MOVW	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #63488
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,116 :: 		for(i=0;i<=13;i++){
; i start address is: 20 (R5)
MOVS	R5, #0
SXTH	R5, R5
; i end address is: 20 (R5)
L_start_game0:
; i start address is: 20 (R5)
CMP	R5, #13
IT	GT
BGT	L_start_game1
;start_game.c,117 :: 		make_rectangle(coordinatesx1[i],coordinatesy1[i],coordinatesx2[i],coordinatesy2[i]);}
LSLS	R4, R5, #1
MOVW	R0, #lo_addr(_coordinatesy2+0)
MOVT	R0, #hi_addr(_coordinatesy2+0)
ADDS	R0, R0, R4
LDRSH	R0, [R0, #0]
SXTH	R3, R0
MOVW	R0, #lo_addr(_coordinatesx2+0)
MOVT	R0, #hi_addr(_coordinatesx2+0)
ADDS	R0, R0, R4
LDRSH	R0, [R0, #0]
SXTH	R2, R0
MOVW	R0, #lo_addr(_coordinatesy1+0)
MOVT	R0, #hi_addr(_coordinatesy1+0)
ADDS	R0, R0, R4
LDRSH	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_coordinatesx1+0)
MOVT	R0, #hi_addr(_coordinatesx1+0)
ADDS	R0, R0, R4
LDRSH	R0, [R0, #0]
STRH	R5, [SP, #4]
BL	_make_rectangle+0
LDRSH	R5, [SP, #4]
;start_game.c,116 :: 		for(i=0;i<=13;i++){
ADDS	R5, R5, #1
SXTH	R5, R5
;start_game.c,117 :: 		make_rectangle(coordinatesx1[i],coordinatesy1[i],coordinatesx2[i],coordinatesy2[i]);}
; i end address is: 20 (R5)
IT	AL
BAL	L_start_game0
L_start_game1:
;start_game.c,118 :: 		TFT_Set_Brush(1, CL_BLUE, 1, LEFT_TO_RIGHT, CL_BLUE, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #31
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #1
MOVW	R1, #31
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,119 :: 		make_rectangle(coordinatesx1[14],coordinatesy1[14],coordinatesx2[14],coordinatesy2[14]);
MOVW	R0, #lo_addr(_coordinatesy2+28)
MOVT	R0, #hi_addr(_coordinatesy2+28)
LDRSH	R3, [R0, #0]
MOVW	R0, #lo_addr(_coordinatesx2+28)
MOVT	R0, #hi_addr(_coordinatesx2+28)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_coordinatesy1+28)
MOVT	R0, #hi_addr(_coordinatesy1+28)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_coordinatesx1+28)
MOVT	R0, #hi_addr(_coordinatesx1+28)
LDRSH	R0, [R0, #0]
BL	_make_rectangle+0
;start_game.c,120 :: 		flags();
BL	_flags+0
;start_game.c,121 :: 		while(GPIOC_IDR.B13!=0)
L_start_game3:
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_start_game4
;start_game.c,122 :: 		{collision();
BL	_collision+0
;start_game.c,124 :: 		TFT_Image_Jpeg(start_posx, start_posy, car_jpg);
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
MOVW	R2, #lo_addr(start_game_car_jpg_L0+0)
MOVT	R2, #hi_addr(start_game_car_jpg_L0+0)
BL	_TFT_Image_Jpeg+0
;start_game.c,125 :: 		if(GPIOD_IDR.B4==0){move_up();}
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_start_game5
BL	_move_up+0
IT	AL
BAL	L_start_game6
L_start_game5:
;start_game.c,126 :: 		else if(GPIOB_IDR.B5==0){move_down();}
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_start_game7
BL	_move_down+0
IT	AL
BAL	L_start_game8
L_start_game7:
;start_game.c,127 :: 		else if(GPIOD_IDR.B2==0){move_left();}
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_start_game9
BL	_move_left+0
IT	AL
BAL	L_start_game10
L_start_game9:
;start_game.c,128 :: 		else if(GPIOA_IDR.B6==0){move_right();}
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_start_game11
BL	_move_right+0
L_start_game11:
L_start_game10:
L_start_game8:
L_start_game6:
;start_game.c,130 :: 		}
IT	AL
BAL	L_start_game3
L_start_game4:
;start_game.c,131 :: 		options_menu();}
BL	_options_menu+0
L_end_start_game:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _start_game
_move_up:
;start_game.c,134 :: 		void move_up(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;start_game.c,135 :: 		int speed=getAdcReading()/205;
BL	_getAdcReading+0
MOVS	R1, #205
UDIV	R0, R0, R1
STRH	R0, [SP, #4]
;start_game.c,136 :: 		TFT_Set_Brush(1, CL_WHITE, 0, LEFT_TO_RIGHT, CL_BLUE, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #31
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,137 :: 		make_rectangle(start_posx,start_posy,start_posx+10,start_posy+10);
MOVW	R1, #lo_addr(_start_posy+0)
MOVT	R1, #hi_addr(_start_posy+0)
LDRSH	R0, [R1, #0]
ADDW	R4, R0, #10
MOVW	R3, #lo_addr(_start_posx+0)
MOVT	R3, #hi_addr(_start_posx+0)
LDRSH	R0, [R3, #0]
ADDW	R2, R0, #10
MOV	R0, R1
LDRSH	R1, [R0, #0]
MOV	R0, R3
LDRSH	R0, [R0, #0]
SXTH	R3, R4
BL	_make_rectangle+0
;start_game.c,138 :: 		start_posy=start_posy-speed;
LDRSH	R2, [SP, #4]
MOVW	R1, #lo_addr(_start_posy+0)
MOVT	R1, #hi_addr(_start_posy+0)
LDRSH	R0, [R1, #0]
SUB	R0, R0, R2
STRH	R0, [R1, #0]
;start_game.c,139 :: 		delay_ms(150);
MOVW	R7, #30527
MOVT	R7, #27
NOP
NOP
L_move_up12:
SUBS	R7, R7, #1
BNE	L_move_up12
NOP
NOP
NOP
;start_game.c,140 :: 		}
L_end_move_up:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _move_up
_move_down:
;start_game.c,142 :: 		void move_down(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;start_game.c,143 :: 		int speed=getAdcReading()/205;
BL	_getAdcReading+0
MOVS	R1, #205
UDIV	R0, R0, R1
STRH	R0, [SP, #4]
;start_game.c,144 :: 		TFT_Set_Brush(1, CL_WHITE, 0, LEFT_TO_RIGHT, CL_BLUE, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #31
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,145 :: 		make_rectangle(start_posx,start_posy,start_posx+10,start_posy+10);
MOVW	R1, #lo_addr(_start_posy+0)
MOVT	R1, #hi_addr(_start_posy+0)
LDRSH	R0, [R1, #0]
ADDW	R4, R0, #10
MOVW	R3, #lo_addr(_start_posx+0)
MOVT	R3, #hi_addr(_start_posx+0)
LDRSH	R0, [R3, #0]
ADDW	R2, R0, #10
MOV	R0, R1
LDRSH	R1, [R0, #0]
MOV	R0, R3
LDRSH	R0, [R0, #0]
SXTH	R3, R4
BL	_make_rectangle+0
;start_game.c,146 :: 		start_posy=start_posy+speed;
LDRSH	R2, [SP, #4]
MOVW	R1, #lo_addr(_start_posy+0)
MOVT	R1, #hi_addr(_start_posy+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;start_game.c,147 :: 		delay_ms(150);
MOVW	R7, #30527
MOVT	R7, #27
NOP
NOP
L_move_down14:
SUBS	R7, R7, #1
BNE	L_move_down14
NOP
NOP
NOP
;start_game.c,148 :: 		}
L_end_move_down:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _move_down
_move_left:
;start_game.c,149 :: 		void move_left(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;start_game.c,150 :: 		int speed=getAdcReading()/205;
BL	_getAdcReading+0
MOVS	R1, #205
UDIV	R0, R0, R1
STRH	R0, [SP, #4]
;start_game.c,151 :: 		TFT_Set_Brush(1, CL_WHITE, 0, LEFT_TO_RIGHT, CL_BLUE, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #31
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,152 :: 		make_rectangle(start_posx,start_posy,start_posx+10,start_posy+10);
MOVW	R1, #lo_addr(_start_posy+0)
MOVT	R1, #hi_addr(_start_posy+0)
LDRSH	R0, [R1, #0]
ADDW	R4, R0, #10
MOVW	R3, #lo_addr(_start_posx+0)
MOVT	R3, #hi_addr(_start_posx+0)
LDRSH	R0, [R3, #0]
ADDW	R2, R0, #10
MOV	R0, R1
LDRSH	R1, [R0, #0]
MOV	R0, R3
LDRSH	R0, [R0, #0]
SXTH	R3, R4
BL	_make_rectangle+0
;start_game.c,153 :: 		start_posx=start_posx-speed;
LDRSH	R2, [SP, #4]
MOVW	R1, #lo_addr(_start_posx+0)
MOVT	R1, #hi_addr(_start_posx+0)
LDRSH	R0, [R1, #0]
SUB	R0, R0, R2
STRH	R0, [R1, #0]
;start_game.c,154 :: 		delay_ms(150);
MOVW	R7, #30527
MOVT	R7, #27
NOP
NOP
L_move_left16:
SUBS	R7, R7, #1
BNE	L_move_left16
NOP
NOP
NOP
;start_game.c,155 :: 		}
L_end_move_left:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _move_left
_move_right:
;start_game.c,156 :: 		void move_right(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;start_game.c,157 :: 		int speed=getAdcReading()/205;
BL	_getAdcReading+0
MOVS	R1, #205
UDIV	R0, R0, R1
STRH	R0, [SP, #4]
;start_game.c,158 :: 		TFT_Set_Brush(1, CL_WHITE, 0, LEFT_TO_RIGHT, CL_BLUE, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #31
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,159 :: 		make_rectangle(start_posx,start_posy,start_posx+10,start_posy+10);
MOVW	R1, #lo_addr(_start_posy+0)
MOVT	R1, #hi_addr(_start_posy+0)
LDRSH	R0, [R1, #0]
ADDW	R4, R0, #10
MOVW	R3, #lo_addr(_start_posx+0)
MOVT	R3, #hi_addr(_start_posx+0)
LDRSH	R0, [R3, #0]
ADDW	R2, R0, #10
MOV	R0, R1
LDRSH	R1, [R0, #0]
MOV	R0, R3
LDRSH	R0, [R0, #0]
SXTH	R3, R4
BL	_make_rectangle+0
;start_game.c,160 :: 		start_posx=start_posx+speed;
LDRSH	R2, [SP, #4]
MOVW	R1, #lo_addr(_start_posx+0)
MOVT	R1, #hi_addr(_start_posx+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, R2
STRH	R0, [R1, #0]
;start_game.c,161 :: 		delay_ms(150);
MOVW	R7, #30527
MOVT	R7, #27
NOP
NOP
L_move_right18:
SUBS	R7, R7, #1
BNE	L_move_right18
NOP
NOP
NOP
;start_game.c,162 :: 		}
L_end_move_right:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _move_right
_make_rectangle:
;start_game.c,165 :: 		void make_rectangle(int x1,int y1,int x2,int y2){
; y2 start address is: 12 (R3)
; x2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; y2 end address is: 12 (R3)
; x2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 0 (R0)
; y1 start address is: 4 (R1)
; x2 start address is: 8 (R2)
; y2 start address is: 12 (R3)
;start_game.c,166 :: 		TFT_Rectangle_Round_Edges(x1,y1,x2,y2,2);}
MOVS	R4, #2
UXTH	R3, R3
; y2 end address is: 12 (R3)
UXTH	R2, R2
; x2 end address is: 8 (R2)
UXTH	R1, R1
; y1 end address is: 4 (R1)
UXTH	R0, R0
; x1 end address is: 0 (R0)
PUSH	(R4)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
L_end_make_rectangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _make_rectangle
_collision:
;start_game.c,168 :: 		void collision(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;start_game.c,170 :: 		for(i=0;i<=18;i++){
; i start address is: 16 (R4)
MOVS	R4, #0
SXTH	R4, R4
; i end address is: 16 (R4)
L_collision20:
; i start address is: 16 (R4)
CMP	R4, #18
IT	GT
BGT	L_collision21
;start_game.c,171 :: 		collisionx1=coordinatesx1[i];
LSLS	R3, R4, #1
MOVW	R0, #lo_addr(_coordinatesx1+0)
MOVT	R0, #hi_addr(_coordinatesx1+0)
ADDS	R0, R0, R3
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_collisionx1+0)
MOVT	R0, #hi_addr(_collisionx1+0)
STRH	R2, [R0, #0]
;start_game.c,172 :: 		collisiony1=coordinatesy1[i];
MOVW	R0, #lo_addr(_coordinatesy1+0)
MOVT	R0, #hi_addr(_coordinatesy1+0)
ADDS	R0, R0, R3
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
STRH	R1, [R0, #0]
;start_game.c,173 :: 		collisionx2=coordinatesx2[i];
MOVW	R0, #lo_addr(_coordinatesx2+0)
MOVT	R0, #hi_addr(_coordinatesx2+0)
ADDS	R0, R0, R3
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
STRH	R1, [R0, #0]
;start_game.c,174 :: 		collisiony2=coordinatesy2[i];
MOVW	R0, #lo_addr(_coordinatesy2+0)
MOVT	R0, #hi_addr(_coordinatesy2+0)
ADDS	R0, R0, R3
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
STRH	R1, [R0, #0]
;start_game.c,175 :: 		if((start_posx>collisionx1 && start_posx<collisionx2)&& (start_posy>collisiony1 && start_posy<collisiony2)||(start_posx+10>collisionx1 && start_posx+10<collisionx2)&& (start_posy>collisiony1 && start_posy<collisiony2)||(start_posx>collisionx1 && start_posx<collisionx2)&& (start_posy+10>collisiony1 && start_posy+10<collisiony2)||(start_posx+10>collisionx1 && start_posx+10<collisionx2)&& (start_posy+10>collisiony1 && start_posy+10<collisiony2))
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R2
IT	LE
BLE	L__collision176
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__collision175
L__collision172:
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__collision174
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__collision173
L__collision171:
IT	AL
BAL	L__collision160
L__collision176:
L__collision175:
L__collision174:
L__collision173:
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisionx1+0)
MOVT	R0, #hi_addr(_collisionx1+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L__collision180
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L__collision179
L__collision169:
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__collision178
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__collision177
L__collision168:
IT	AL
BAL	L__collision160
L__collision180:
L__collision179:
L__collision178:
L__collision177:
MOVW	R0, #lo_addr(_collisionx1+0)
MOVT	R0, #hi_addr(_collisionx1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__collision184
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__collision183
L__collision166:
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L__collision182
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L__collision181
L__collision165:
IT	AL
BAL	L__collision160
L__collision184:
L__collision183:
L__collision182:
L__collision181:
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisionx1+0)
MOVT	R0, #hi_addr(_collisionx1+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L__collision188
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L__collision187
L__collision163:
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L__collision186
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L__collision185
L__collision162:
IT	AL
BAL	L__collision160
L__collision188:
L__collision187:
L__collision186:
L__collision185:
IT	AL
BAL	L_collision49
L__collision160:
;start_game.c,176 :: 		{if (top_score<scorevalue){top_score=scorevalue;}
MOVW	R0, #lo_addr(_scorevalue+0)
MOVT	R0, #hi_addr(_scorevalue+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_top_score+0)
MOVT	R0, #hi_addr(_top_score+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L_collision50
MOVW	R0, #lo_addr(_scorevalue+0)
MOVT	R0, #hi_addr(_scorevalue+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_top_score+0)
MOVT	R0, #hi_addr(_top_score+0)
STRH	R1, [R0, #0]
L_collision50:
;start_game.c,177 :: 		EEPROM_24C02_WrSingle(1,top_score);
MOVW	R0, #lo_addr(_top_score+0)
MOVT	R0, #hi_addr(_top_score+0)
LDRSH	R0, [R0, #0]
STRH	R4, [SP, #4]
UXTB	R1, R0
MOVS	R0, #1
BL	_EEPROM_24C02_WrSingle+0
;start_game.c,178 :: 		options_menu();
BL	_options_menu+0
LDRSH	R4, [SP, #4]
;start_game.c,179 :: 		}
SXTH	R1, R4
IT	AL
BAL	L_collision51
L_collision49:
;start_game.c,181 :: 		else if(((start_posx>=flagx && start_posx<=flagx+10)&& (start_posy>=flagy && start_posy<=flagy+10))||((start_posx+10>=flagx && start_posx+10<=flagx+10)&& (start_posy>=flagy && start_posy<=flagy+10))||((start_posx>=flagx && start_posx<=flagx+10)&& (start_posy+10>=flagy && start_posy+10<=flagy+10))||((start_posx+10>=flagx && start_posx+10<=flagx+10)&& (start_posy+10>=flagy && start_posy+10<=flagy+10)))
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LT
BLT	L__collision192
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GT
BGT	L__collision191
L__collision159:
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LT
BLT	L__collision190
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GT
BGT	L__collision189
; i end address is: 16 (R4)
L__collision158:
IT	AL
BAL	L__collision147
L__collision192:
; i start address is: 16 (R4)
L__collision191:
L__collision190:
L__collision189:
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LT
BLT	L__collision196
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
ADDS	R0, #10
SXTH	R0, R0
CMP	R1, R0
IT	GT
BGT	L__collision195
L__collision156:
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LT
BLT	L__collision194
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GT
BGT	L__collision193
; i end address is: 16 (R4)
L__collision155:
IT	AL
BAL	L__collision147
L__collision196:
; i start address is: 16 (R4)
L__collision195:
L__collision194:
L__collision193:
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LT
BLT	L__collision200
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GT
BGT	L__collision199
L__collision153:
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LT
BLT	L__collision198
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
ADDS	R0, #10
SXTH	R0, R0
CMP	R1, R0
IT	GT
BGT	L__collision197
; i end address is: 16 (R4)
L__collision152:
IT	AL
BAL	L__collision147
L__collision200:
; i start address is: 16 (R4)
L__collision199:
L__collision198:
L__collision197:
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LT
BLT	L__collision204
MOVW	R0, #lo_addr(_start_posx+0)
MOVT	R0, #hi_addr(_start_posx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
ADDS	R0, #10
SXTH	R0, R0
CMP	R1, R0
IT	GT
BGT	L__collision203
L__collision150:
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LT
BLT	L__collision202
MOVW	R0, #lo_addr(_start_posy+0)
MOVT	R0, #hi_addr(_start_posy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
ADDS	R0, #10
SXTH	R0, R0
CMP	R1, R0
IT	GT
BGT	L__collision201
; i end address is: 16 (R4)
L__collision149:
IT	AL
BAL	L__collision147
L__collision204:
; i start address is: 16 (R4)
L__collision203:
L__collision202:
L__collision201:
SXTH	R1, R4
; i end address is: 16 (R4)
IT	AL
BAL	L_collision78
L__collision147:
;start_game.c,182 :: 		{for(i=0;i<5;i++)
; i start address is: 24 (R6)
MOVS	R6, #0
SXTH	R6, R6
; i end address is: 24 (R6)
L_collision79:
; i start address is: 24 (R6)
CMP	R6, #5
IT	GE
BGE	L_collision80
;start_game.c,183 :: 		{Sound_Play(fre1[i],duration1[i]);}
LSLS	R2, R6, #1
MOVW	R0, #lo_addr(_duration1+0)
MOVT	R0, #hi_addr(_duration1+0)
ADDS	R0, R0, R2
LDRSH	R0, [R0, #0]
UXTH	R1, R0
MOVW	R0, #lo_addr(_fre1+0)
MOVT	R0, #hi_addr(_fre1+0)
ADDS	R0, R0, R2
LDRSH	R0, [R0, #0]
UXTH	R0, R0
BL	_Sound_Play+0
;start_game.c,182 :: 		{for(i=0;i<5;i++)
ADDS	R6, R6, #1
SXTH	R6, R6
;start_game.c,183 :: 		{Sound_Play(fre1[i],duration1[i]);}
IT	AL
BAL	L_collision79
L_collision80:
;start_game.c,184 :: 		TFT_Set_Brush(1, CL_WHITE, 0, LEFT_TO_RIGHT, CL_BLUE, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #31
STRH	R6, [SP, #4]
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,185 :: 		TFT_Rectangle_Round_Edges(flagx,flagy,flagx+10,flagy+10,2);
MOVS	R5, #2
MOVW	R1, #lo_addr(_flagy+0)
MOVT	R1, #hi_addr(_flagy+0)
LDRSH	R0, [R1, #0]
ADDW	R4, R0, #10
MOVW	R3, #lo_addr(_flagx+0)
MOVT	R3, #hi_addr(_flagx+0)
LDRSH	R0, [R3, #0]
ADDW	R2, R0, #10
MOV	R0, R1
LDRSH	R1, [R0, #0]
MOV	R0, R3
LDRSH	R0, [R0, #0]
UXTH	R3, R4
UXTH	R2, R2
PUSH	(R5)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
;start_game.c,186 :: 		scorevalue=scorevalue+8;
MOVW	R1, #lo_addr(_scorevalue+0)
MOVT	R1, #hi_addr(_scorevalue+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #8
STRH	R0, [R1, #0]
;start_game.c,187 :: 		scoreprint();
BL	_scoreprint+0
;start_game.c,188 :: 		flags();}
; i end address is: 24 (R6)
BL	_flags+0
LDRSH	R6, [SP, #4]
SXTH	R1, R6
L_collision78:
; i start address is: 4 (R1)
; i end address is: 4 (R1)
L_collision51:
;start_game.c,170 :: 		for(i=0;i<=18;i++){
; i start address is: 4 (R1)
ADDS	R0, R1, #1
; i end address is: 4 (R1)
; i start address is: 16 (R4)
SXTH	R4, R0
;start_game.c,189 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_collision20
L_collision21:
;start_game.c,190 :: 		}
L_end_collision:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _collision
_flags:
;start_game.c,192 :: 		void flags(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;start_game.c,194 :: 		int nosame=1;
; nosame start address is: 0 (R0)
MOVW	R0, #1
SXTH	R0, R0
; nosame end address is: 0 (R0)
;start_game.c,195 :: 		while(nosame==1){
L_flags82:
; nosame start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_flags83
; nosame end address is: 0 (R0)
;start_game.c,196 :: 		nosame=0;
; nosame start address is: 20 (R5)
MOVS	R5, #0
SXTH	R5, R5
;start_game.c,197 :: 		flagx=rand()/110;
BL	_rand+0
MOVS	R1, #110
SXTH	R1, R1
SDIV	R1, R0, R1
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
STRH	R1, [R0, #0]
;start_game.c,198 :: 		flagy=rand()/150;
BL	_rand+0
MOVS	R1, #150
SXTH	R1, R1
SDIV	R1, R0, R1
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
STRH	R1, [R0, #0]
;start_game.c,199 :: 		for(i=0;i<=18;i++){
; i start address is: 16 (R4)
MOVS	R4, #0
SXTH	R4, R4
; nosame end address is: 20 (R5)
; i end address is: 16 (R4)
L_flags84:
; i start address is: 16 (R4)
; nosame start address is: 20 (R5)
CMP	R4, #18
IT	GT
BGT	L_flags85
;start_game.c,200 :: 		collisionx1=coordinatesx1[i];
LSLS	R3, R4, #1
MOVW	R0, #lo_addr(_coordinatesx1+0)
MOVT	R0, #hi_addr(_coordinatesx1+0)
ADDS	R0, R0, R3
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_collisionx1+0)
MOVT	R0, #hi_addr(_collisionx1+0)
STRH	R2, [R0, #0]
;start_game.c,201 :: 		collisiony1=coordinatesy1[i];
MOVW	R0, #lo_addr(_coordinatesy1+0)
MOVT	R0, #hi_addr(_coordinatesy1+0)
ADDS	R0, R0, R3
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
STRH	R1, [R0, #0]
;start_game.c,202 :: 		collisionx2=coordinatesx2[i];
MOVW	R0, #lo_addr(_coordinatesx2+0)
MOVT	R0, #hi_addr(_coordinatesx2+0)
ADDS	R0, R0, R3
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
STRH	R1, [R0, #0]
;start_game.c,203 :: 		collisiony2=coordinatesy2[i];
MOVW	R0, #lo_addr(_coordinatesy2+0)
MOVT	R0, #hi_addr(_coordinatesy2+0)
ADDS	R0, R0, R3
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
STRH	R1, [R0, #0]
;start_game.c,204 :: 		if((flagx>collisionx1 && flagx<collisionx2)&& (flagy>collisiony1 && flagy<collisiony2)||(flagx+10>collisionx1 && flagx+10<collisionx2)&& (flagy>collisiony1 && flagy<collisiony2)||(flagx>collisionx1 && flagx<collisionx2)&& (flagy+10>collisiony1 && flagy+10<collisiony2)||(flagx+10>collisionx1 && flagx+10<collisionx2)&& (flagy+10>collisiony1 && flagy+10<collisiony2))
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R2
IT	LE
BLE	L__flags134
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__flags133
L__flags130:
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__flags132
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__flags131
; nosame end address is: 20 (R5)
L__flags129:
IT	AL
BAL	L__flags118
L__flags134:
; nosame start address is: 20 (R5)
L__flags133:
L__flags132:
L__flags131:
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisionx1+0)
MOVT	R0, #hi_addr(_collisionx1+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L__flags138
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L__flags137
L__flags127:
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__flags136
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__flags135
; nosame end address is: 20 (R5)
L__flags126:
IT	AL
BAL	L__flags118
L__flags138:
; nosame start address is: 20 (R5)
L__flags137:
L__flags136:
L__flags135:
MOVW	R0, #lo_addr(_collisionx1+0)
MOVT	R0, #hi_addr(_collisionx1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L__flags142
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__flags141
L__flags124:
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L__flags140
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L__flags139
; nosame end address is: 20 (R5)
L__flags123:
IT	AL
BAL	L__flags118
L__flags142:
; nosame start address is: 20 (R5)
L__flags141:
L__flags140:
L__flags139:
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisionx1+0)
MOVT	R0, #hi_addr(_collisionx1+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L__flags146
MOVW	R0, #lo_addr(_flagx+0)
MOVT	R0, #hi_addr(_flagx+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisionx2+0)
MOVT	R0, #hi_addr(_collisionx2+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L__flags145
L__flags121:
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisiony1+0)
MOVT	R0, #hi_addr(_collisiony1+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	LE
BLE	L__flags144
MOVW	R0, #lo_addr(_flagy+0)
MOVT	R0, #hi_addr(_flagy+0)
LDRSH	R0, [R0, #0]
ADDW	R1, R0, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_collisiony2+0)
MOVT	R0, #hi_addr(_collisiony2+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L__flags143
; nosame end address is: 20 (R5)
L__flags120:
IT	AL
BAL	L__flags118
L__flags146:
; nosame start address is: 20 (R5)
L__flags145:
L__flags144:
L__flags143:
; nosame end address is: 20 (R5)
IT	AL
BAL	L_flags113
L__flags118:
;start_game.c,205 :: 		{nosame=1;}}
; nosame start address is: 20 (R5)
MOVS	R5, #1
SXTH	R5, R5
; nosame end address is: 20 (R5)
L_flags113:
;start_game.c,199 :: 		for(i=0;i<=18;i++){
; nosame start address is: 20 (R5)
ADDS	R4, R4, #1
SXTH	R4, R4
;start_game.c,205 :: 		{nosame=1;}}
; i end address is: 16 (R4)
IT	AL
BAL	L_flags84
L_flags85:
;start_game.c,206 :: 		}
SXTH	R0, R5
; nosame end address is: 20 (R5)
IT	AL
BAL	L_flags82
L_flags83:
;start_game.c,207 :: 		TFT_Set_Brush(1, CL_GREEN, 0, LEFT_TO_RIGHT, CL_BLUE, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #31
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #1024
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,208 :: 		TFT_Rectangle_Round_Edges(flagx,flagy,flagx+10,flagy+10,2);
MOVS	R5, #2
MOVW	R1, #lo_addr(_flagy+0)
MOVT	R1, #hi_addr(_flagy+0)
LDRSH	R0, [R1, #0]
ADDW	R4, R0, #10
MOVW	R3, #lo_addr(_flagx+0)
MOVT	R3, #hi_addr(_flagx+0)
LDRSH	R0, [R3, #0]
ADDW	R2, R0, #10
MOV	R0, R1
LDRSH	R1, [R0, #0]
MOV	R0, R3
LDRSH	R0, [R0, #0]
UXTH	R3, R4
UXTH	R2, R2
PUSH	(R5)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
;start_game.c,209 :: 		}
L_end_flags:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _flags
_scoreprint:
;start_game.c,211 :: 		void scoreprint(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;start_game.c,213 :: 		char c=scorevalue;
MOVW	R0, #lo_addr(_scorevalue+0)
MOVT	R0, #hi_addr(_scorevalue+0)
LDRSH	R0, [R0, #0]
STRB	R0, [SP, #4]
;start_game.c,214 :: 		TFT_Set_Brush(1, CL_BLACK, 0, LEFT_TO_RIGHT, CL_BLUE, CL_BLUE);
MOVW	R1, #31
MOVW	R0, #31
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;start_game.c,215 :: 		TFT_Rectangle_Round_Edges(260,0,320,240,2);
MOVS	R0, #2
PUSH	(R0)
MOVS	R3, #240
MOVW	R2, #320
MOVS	R1, #0
MOVW	R0, #260
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
;start_game.c,216 :: 		TFT_Write_Char(c, 270, 20);
MOVS	R2, #20
MOVW	R1, #270
LDRB	R0, [SP, #4]
BL	_TFT_Write_Char+0
;start_game.c,217 :: 		}
L_end_scoreprint:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _scoreprint
_AdcConfiguration:
;start_game.c,219 :: 		void AdcConfiguration(){                   // ADC for PC0
;start_game.c,220 :: 		RCC_APB2ENR |= 1 << 4;                 // Enable PORTC clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;start_game.c,221 :: 		RCC_APB2ENR |= 1 << 9 ;     // Enable ADC1 Clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;start_game.c,222 :: 		GPIOC_CRL &= ~(0xF << 0);        // Configure PC0 as an Analog Input
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;start_game.c,223 :: 		ADC1_SQR1 = (0b0000 << 20);        // 1 conversion
MOVW	R1, #0
MOVW	R0, #lo_addr(ADC1_SQR1+0)
MOVT	R0, #hi_addr(ADC1_SQR1+0)
STR	R1, [R0, #0]
;start_game.c,224 :: 		ADC1_SQR3 = 10;                                // Select Channel 10 as only one in conversion sequence
MOVS	R1, #10
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
STR	R1, [R0, #0]
;start_game.c,225 :: 		ADC1_SMPR1 = 0b100;                        // Set sample time on channel 10
MOVS	R1, #4
MOVW	R0, #lo_addr(ADC1_SMPR1+0)
MOVT	R0, #hi_addr(ADC1_SMPR1+0)
STR	R1, [R0, #0]
;start_game.c,226 :: 		ADC1_CR2 |= (0b111 << 17);         // Set software start as external event for regular group conversion
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;start_game.c,227 :: 		ADC1_CR2.ADON = 1;                        // Enable ADC1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
_SX	[R0, ByteOffset(ADC1_CR2+0)]
;start_game.c,228 :: 		delay_ms(10);}
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_AdcConfiguration114:
SUBS	R7, R7, #1
BNE	L_AdcConfiguration114
NOP
NOP
NOP
L_end_AdcConfiguration:
BX	LR
; end of _AdcConfiguration
_getAdcReading:
;start_game.c,230 :: 		unsigned int getAdcReading(){
;start_game.c,232 :: 		ADC1_CR2 |= (1 << 22) | (1 << 20);
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;start_game.c,233 :: 		while(!(ADC1_SR & 0b10));         // Wait until the ADC conversion has ended
L_getAdcReading116:
MOVW	R0, #lo_addr(ADC1_SR+0)
MOVT	R0, #hi_addr(ADC1_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2
CMP	R0, #0
IT	NE
BNE	L_getAdcReading117
IT	AL
BAL	L_getAdcReading116
L_getAdcReading117:
;start_game.c,234 :: 		return ADC1_DR;                                // Read value from data register. This also clears start bit
MOVW	R0, #lo_addr(ADC1_DR+0)
MOVT	R0, #hi_addr(ADC1_DR+0)
LDR	R0, [R0, #0]
;start_game.c,235 :: 		}
L_end_getAdcReading:
BX	LR
; end of _getAdcReading
