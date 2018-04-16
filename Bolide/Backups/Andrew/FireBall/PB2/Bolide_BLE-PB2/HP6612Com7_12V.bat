@echo off
set status=0
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1.5" /COMPort:4 /avoidreturn:true 
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 12;output:state on" /COMPort:4 /avoidreturn:true 


call "UltimateScpiCmd.exe" /inputfile:"HP6612Com7I_12V.in" /outputfile:"HP6612Com7I_12V.out"

call "UltimateScpiCmd.bat"
if "%Status%"=="1" call AllPowerOff.bat  

exit %Status%

