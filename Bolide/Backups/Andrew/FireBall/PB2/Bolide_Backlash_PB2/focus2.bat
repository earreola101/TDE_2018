lvreg.exe testxu write a 8
timeout /t 1
lvreg.exe eeprom write 0xc6 0x00

call "EasyLensMotorCmd.exe" /inputfile:"focus2.in"  /outputFile:"focus2.out"  
call "EasyLensMotorCmd.bat"

if %VarResultSummary% LSS 0 set VarResultSummary=0

lvreg.exe eeprom write 0xc6 %VarResultSummary%
lvreg.exe eeprom read 0xc6 >tmpFile

set /p val2= < tmpFile
del tmpFile
exit %status%