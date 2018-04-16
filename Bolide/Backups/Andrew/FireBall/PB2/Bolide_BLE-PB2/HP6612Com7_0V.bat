@echo off
set status=0
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1.5" /COMPort:4 /avoidreturn:true
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 0.0;output:state on" /COMPort:4 /avoidreturn:true
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state on" /COMPort:7
rem @ping 127.0.0.1 -n 10 -w 3000 > nul

call "UltimateScpiCmd.exe" /inputfile:"HP6612-off.in" /outputfile:"HP6612-off.out"
call "UltimateScpiCmd.bat"
rem pause

if "%Status%"=="1" call AllPowerOff.bat  

exit %Status%





