@echo off
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="current 0.8" /COMPort:1 /avoidreturn:true
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 5.0;output:state on" /COMPort:1 /avoidreturn:true

rem call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state on" /COMPort:1
rem @ping 127.0.0.1 -n 10 -w 3000 > nul

call "UltimateScpiCmd.exe" /inputfile:"USB-Curr-check.in" /outputfile:"USB-Curr-check.out"

call "UltimateScpiCmd.bat"
pause
if not "%Status%"=="0"  call AllPowerOff.bat

exit %Status%
