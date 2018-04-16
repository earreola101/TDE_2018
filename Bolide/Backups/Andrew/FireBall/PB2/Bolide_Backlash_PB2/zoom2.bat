lvreg.exe testxu write a 8
timeout /t 1
lvreg.exe eeprom write 0xc7 0x00

call "EasyLensMotorCmd.exe" /inputfile:"zoom2.in"  /outputFile:"zoom2.out"  
call "EasyLensMotorCmd.bat"

if %VarResultSummary% LSS 0 set VarResultSummary=0

rem Home position
lvreg.exe eeprom write 0xc7 %VarResultSummary%
lvreg.exe eeprom read 0xc7 >tmpFile

set /p val2= < tmpFile
del tmpFile
exit %status%
