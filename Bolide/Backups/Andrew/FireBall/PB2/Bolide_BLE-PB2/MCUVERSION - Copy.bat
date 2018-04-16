@echo off


Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

rem LVREG testxu write A 1
call "UltimatecontrolCmd.exe" /option:MCU2Version /PID:867 /inputfile:"MCU1FW.in"
rem / /outputfile:"MCU1FW.out"


rem call "Ultimatecontrolcmd.bat"
rem call UltimateControlCmd.exe /Option:MCU1version /PID:867 /inputfile:"MCU1FW.in" /outputfile:"MCU1FW.out" 



rem call UltimateScpiCmd.exe /Option:LED /PID:867 /Value:red


rem lvreg pcxu write 9 0100000000
rem call "UltimateScpiCmd.bat"



