@echo off
set status=1
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

:MAIN

tdebt_144.exe -g blerssi
rem TIMEOUT /T 1 >>log.txt
echo.
goto MAIN