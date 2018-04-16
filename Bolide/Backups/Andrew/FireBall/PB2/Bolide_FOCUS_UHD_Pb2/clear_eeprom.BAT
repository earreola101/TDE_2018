@echo on 
rem This script will save the mtf steps to eeprom
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%
set TDEBYTE=0X08
set returnb=1

echo GOING INTO TDE MODE
LVREG.EXE testxu write a 8
timeout /t 1 >nul
LVREG.EXE testxu read a >> temp.txt
set /p TDESTATUS= < temp.txt
del temp.txt


IF (%TDESTATUS%)==(%TDEBYTE%) goto Start

:FAIL
set returnb=1
goto end
:START
set returnb=0


echo GOING INTO TDE MODE
LVREG.EXE testxu write a 8
LVREG.EXE EEPROM READ 0X66
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X66 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X66 0
LVREG.EXE EEPROM WRITE 0X64 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X65 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X68 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X69 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X69 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X6a 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X6e 0
timeout /t 1 >nul
rem Clear address 0x68, 0x69, 0x101, 0x102, 0x103, 0x104 (set them to 0).
LVREG.EXE EEPROM WRITE 0X68 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X69 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X101 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X102 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X103 0
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0X104 0
timeout /t 1 >nul
rem JIC
LVREG.EXE EEPROM WRITE 0X100 3a
timeout /t 1 >nul
LVREG.EXE EEPROM WRITE 0xdf 0x00


:end

exit %returnb%