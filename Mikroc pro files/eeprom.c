// EEPROM read/write functions for 24C02 chip
char data_[256];  // I2C data buffer

// Write single byte to EEPROM at specified address
void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData) {
  data_[0] = wAddr;
  data_[1] = wData;
  I2C1_Start();
  I2C1_Write(0x50, data_, 2, END_MODE_STOP);
}

// Read single byte from EEPROM at specified address
unsigned short EEPROM_24C02_RdSingle(unsigned short rAddr) {
  data_[0] = rAddr;
  I2C1_Start();
  I2C1_Write(0x50, data_, 1, END_MODE_RESTART);
  I2C1_Read(0x50, data_, 1, END_MODE_STOP);
  return data_[0];
}