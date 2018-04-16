@echo off
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1.0" /COMPort:8 /avoidreturn:true
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 12.0;output:state on" /COMPort:8 /avoidreturn:true

rem call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state on" /COMPort:8
rem @ping 127.0.0.1 -n 10 -w 3000 > nul

rem call "UltimateScpiCmd.exe" /inputfile:"HP6612_12V.in" /outputfile:"HP6612_12V.out"

call "UltimateScpiCmd.bat"
rem pause
if not "%Status%"=="0"  call AllPowerOff.bat

exit %Status%
