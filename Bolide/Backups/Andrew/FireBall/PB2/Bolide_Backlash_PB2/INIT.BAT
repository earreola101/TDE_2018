lvreg.exe testxu write a 8
timeout /t 1
lvreg.exe eeprom write 0xc7 0x00
lvreg.exe eeprom write 0xc6 0x00