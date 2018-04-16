lvreg testxu write a 08
rem serial number, 4 bytes reserved
lvreg eeprom read 0b
lvreg eeprom read 0c
lvreg eeprom read 0d
lvreg eeprom read 0e
pause
rem test log, 46 bytes
lvreg eeprom read 4f
lvreg eeprom read 50
lvreg eeprom read 51
lvreg eeprom read 52
lvreg eeprom read 53
lvreg eeprom read 54
lvreg eeprom read 55
lvreg eeprom read 56
lvreg eeprom read 57
lvreg eeprom read 58
lvreg eeprom read 59
lvreg eeprom read 5a
lvreg eeprom read 5b
lvreg eeprom read 5c
lvreg eeprom read 5d
lvreg eeprom read 5e
lvreg eeprom read 5f
lvreg eeprom read 60
lvreg eeprom read 61
lvreg eeprom read 62
lvreg eeprom read 63
lvreg eeprom read 64
lvreg eeprom read 65
lvreg eeprom read 66
lvreg eeprom read 67
lvreg eeprom read 68
lvreg eeprom read 69
lvreg eeprom read 6a
lvreg eeprom read 6b
lvreg eeprom read 6c
lvreg eeprom read 6d
lvreg eeprom read 6e
lvreg eeprom read 6f
lvreg eeprom read 70
lvreg eeprom read 71
lvreg eeprom read 72
lvreg eeprom read 73
lvreg eeprom read 74
lvreg eeprom read 75
lvreg eeprom read 76
lvreg eeprom read 77
lvreg eeprom read 78
lvreg eeprom read 79
lvreg eeprom read 7a
lvreg eeprom read 7b
lvreg eeprom read 7c
rem BOM version, 2 bytes reserved
lvreg eeprom read 8c
lvreg eeprom read 8d
pause