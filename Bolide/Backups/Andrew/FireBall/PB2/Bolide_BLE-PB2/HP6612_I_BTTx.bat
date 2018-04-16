@echo off
set status=1
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1.0" /COMPort:7 /avoidreturn:true
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 12.0;output:state on" /COMPort:7 /avoidreturn:true

rem call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state on" /COMPort:7
rem @ping 127.0.0.1 -n 10 -w 3000 > nul

call "UltimateScpiCmd.exe" /inputfile:"HP6612_I_BTTx.in" /outputfile:"HP6612_I_BTTx.out"

call "UltimateScpiCmd.bat"
pause
if "%Status%"=="0"  exit 0
call AllPowerOff.bat
exit 1
