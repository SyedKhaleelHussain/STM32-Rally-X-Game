// Display score screen
void score(){
  TFT_Fill_Screen(CL_BLACK);           //fill the screen black
  EEPROM_24C02_RdSingle(1);  // Read score from EEPROM
  TFT_Write_Text("WELCOME TO RALLY X GAME", 80, 100);    //print the score
}