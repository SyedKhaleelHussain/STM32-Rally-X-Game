# 🚗 STM32 Rally-X Game  
*A classic arcade remake for STM32F107VC*  

## 📌 Features  
- Joystick-controlled car movement (`GPIO/ADC`)  
- Dynamic map with collision detection  
- Score saving to **EEPROM** (I2C)  
- Real-time debugging via **UART**  
- Sound effects (Buzzer/PWM)  
- Grad Requirement: Potentiometer-controlled speed  

## 🛠️ Hardware Setup  
- **MCU**: STM32F107VC  
- **Display**: ILI9341 TFT (320x240)  
- **Controls**: Analog joystick + Potentiometer  
- **Storage**: 24C02 EEPROM  
- **Audio**: Piezo buzzer  

## 🔧 How to Build  
1. Open project in **Keil uVision/STM32CubeIDE**  
2. Compile & flash to board  
3. Use joystick to move, collect flags for points!  

## 📸 Screenshots  
![Gameplay](Images/gameplay.png)  

## 📜 License  
MIT License - Free for academic use.  