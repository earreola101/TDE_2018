@echo off
Set Kinetic=C:\Program Files\kinetic\kinetic
Set PATH=%PATH%;%Kinetic%
echo GOING INTO TDE MODE

lvreg.exe eeprom write 0x100 3a
LVREG.EXE testxu write a 8
LVREG.EXE EEPROM WRITE 0X103 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X104 0
timeout /t 1 >nul

exit 0