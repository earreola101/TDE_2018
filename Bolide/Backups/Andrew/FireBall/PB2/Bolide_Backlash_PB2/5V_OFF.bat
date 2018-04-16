Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;"C:\Program Files\Kinetic\kinetic\"
call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state OFF"
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 0"
call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1" 
ksleep 5000
exit %Status%
