_EEPROM_24C02_WrSingle:
;eeprom.c,31 :: 		void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData) {
; wData start address is: 4 (R1)
; wAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; wData end address is: 4 (R1)
; wAddr end address is: 0 (R0)
; wAddr start address is: 0 (R0)
; wData start address is: 4 (R1)
;eeprom.c,32 :: 		data_[0] = wAddr;
MOVW	R2, #lo_addr(_data_+0)
MOVT	R2, #hi_addr(_data_+0)
STRB	R0, [R2, #0]
; wAddr end address is: 0 (R0)
;eeprom.c,33 :: 		data_[1] = wData;
MOVW	R2, #lo_addr(_data_+1)
MOVT	R2, #hi_addr(_data_+1)
STRB	R1, [R2, #0]
; wData end address is: 4 (R1)
;eeprom.c,34 :: 		I2C1_Start();
BL	_I2C1_Start+0
;eeprom.c,36 :: 		I2C1_Write(0x50,data_,2,END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #80
BL	_I2C1_Write+0
;eeprom.c,37 :: 		}//~
L_end_EEPROM_24C02_WrSingle:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EEPROM_24C02_WrSingle
_EEPROM_24C02_RdSingle:
;eeprom.c,40 :: 		unsigned short EEPROM_24C02_RdSingle(unsigned short rAddr) {
; rAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; rAddr end address is: 0 (R0)
; rAddr start address is: 0 (R0)
;eeprom.c,41 :: 		data_[0] = rAddr;
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
STRB	R0, [R1, #0]
; rAddr end address is: 0 (R0)
;eeprom.c,42 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;eeprom.c,43 :: 		I2C1_Write(0x50,data_,1,END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #80
BL	_I2C1_Write+0
;eeprom.c,44 :: 		I2C1_Read(0x50,data_,1,END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #80
BL	_I2C1_Read+0
;eeprom.c,46 :: 		return data_[0];
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
LDRB	R0, [R1, #0]
;eeprom.c,47 :: 		}
L_end_EEPROM_24C02_RdSingle:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EEPROM_24C02_RdSingle
