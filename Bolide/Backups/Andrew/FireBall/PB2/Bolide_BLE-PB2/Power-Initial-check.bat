@echo off
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /inputfile:"power-Initial-check.in" /outputfile:"power-Initial-check.out"

call "UltimateScpiCmd.bat"

REM IF not "%Status%"=="0" (
REM call HP6612Com7_0V.bat
REM ksleep 1000
REM call "Battery Powered Mode.bat"
REM ksleep 1000
rem call "UltimateScpiCmd.exe" /inputfile:"power-Initial-check.in" /outputfile:"power-Initial-check.out"
rem call "UltimateScpiCmd.bat"
REM )


IF "%Status%"=="1" call AllPowerOff.bat

exit %Status%
