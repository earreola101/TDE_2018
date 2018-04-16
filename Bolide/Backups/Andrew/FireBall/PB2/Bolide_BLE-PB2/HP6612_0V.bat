@echo off
set status=0
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1.5" /COMPort:8 /avoidreturn:true
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 0.0;output:state off" /COMPort:8 /avoidreturn:true

call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state on" /COMPort:8
rem @ping 127.0.0.1 -n 10 -w 3000 > nul

rem call "UltimateScpiCmd.exe" /inputfile:"HP6612-off.in" /outputfile:"HP6612-off.out"
rem call "UltimateScpiCmd.bat"
pause

if "%Status%"=="0" exit 0  

satrt AllPowerOff.bat
exit 1





