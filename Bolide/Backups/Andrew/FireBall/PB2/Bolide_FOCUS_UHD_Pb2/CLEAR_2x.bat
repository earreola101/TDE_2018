@echo off
Set Kinetic=C:\Program Files\kinetic\kinetic
Set PATH=%PATH%;%Kinetic%
echo GOING INTO TDE MODE
LVREG.EXE testxu write a 8
LVREG.EXE EEPROM WRITE 0X101 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X102 0
timeout /t 1 >nul

exit 0