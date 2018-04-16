@echo off
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%


rem call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state off" /COMPort:8



call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1.5" /COMPort:4 /avoidreturn:true
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 0.0;output:state off" /COMPort:4 /avoidreturn:true




set status=1
exit %Status%

