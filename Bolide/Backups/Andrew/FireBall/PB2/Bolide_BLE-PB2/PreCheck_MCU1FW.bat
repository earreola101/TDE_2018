@echo off
rem Set EasyAVRuntimeEnginePath=c:\Program Files (X86)\Common Files\Logitech\EasyAVRuntimeEngine\
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%
set status=1

rem call "Ultimatecontrolcmd.exe" /option:GetButtonEvent /LowLimit=0xA /UpLimit=0xA /TargetLimit=0xA
rem call "Ultimatecontrolcmd.exe" /option:GetButtonEvent
call "UltimatecontrolCmd.exe" /option:MCU1Version /inputfile:"PreMCU1FW.in" /outputfile:"PreMCU1FW.out"
pause

call "Ultimatecontrolcmd.bat"
rem pause

exit %Status%
