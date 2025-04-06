#line 1 "C:/Users/UCHIHA/Desktop/embedded system project/score.c"
unsigned short EEPROM_24C02_RdSingle(unsigned short rAddr);
void score(){
TFT_Fill_Screen(CL_BLACK);
EEPROM_24C02_RdSingle(1);
TFT_Fill_Screen(CL_BLACK);
TFT_Write_Text("WELCOME TO  RALLY  X  GAME", 80, 100);}
