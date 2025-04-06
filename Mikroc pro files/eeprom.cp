#line 1 "C:/Users/UCHIHA/Desktop/embedded system project/eeprom.c"
#line 27 "C:/Users/UCHIHA/Desktop/embedded system project/eeprom.c"
char data_[256];



void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData) {
 data_[0] = wAddr;
 data_[1] = wData;
 I2C1_Start();

 I2C1_Write(0x50,data_,2,END_MODE_STOP);
}


unsigned short EEPROM_24C02_RdSingle(unsigned short rAddr) {
 data_[0] = rAddr;
 I2C1_Start();
 I2C1_Write(0x50,data_,1,END_MODE_RESTART);
 I2C1_Read(0x50,data_,1,END_MODE_STOP);

 return data_[0];
}
