@echo off
rem set status=0
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%



rem add from PB2
lvreg pcxu write 0x09 0100012002
rem //Saturation OFF
rem control by UVC saturation to 0



