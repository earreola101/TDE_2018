@echo OFF

Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\


lvreg.exe testxu write a 8
timeout /t 1
lvreg.exe eeprom write 0xc6 0x00

call "EasyLensMotorCmd.exe" /inputfile:"focus2.in"  /outputFile:"focus2.out"  
call "EasyLensMotorCmd.bat"
echo %errorlevel%
pause
if not "%Status%"=="0"  exit %Status%
if %VarResultSummary% LSS 0 set VarResultSummary=0
lvreg.exe eeprom write 0xc6 %VarResultSummary%
lvreg.exe eeprom read 0xc6 >tmpFile
set /p val2= < tmpFile
del tmpFile
if not "%VarResultSummary%"=="%val2%"  exit 3

exit %Status%

rem Home position
lvreg.exe eeprom write 0xc6 %VarResultSummary%
lvreg.exe eeprom read 0xc6 >tmpFile

set /p val2= < tmpFile
del tmpFile
exit %Status%