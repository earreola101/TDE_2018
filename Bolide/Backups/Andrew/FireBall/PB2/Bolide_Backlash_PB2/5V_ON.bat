Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;"C:\Program Files\Kinetic\kinetic\"

call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state On"
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 12"
call "UltimateScpiCmd.exe" /option:send /scpicmd="current 2"


exit %Status%
