@echo off


Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

rem LVREG testxu write A 1

call UltimateControlCmd.exe /Option:LED /PID:867 /Value:Blink


rem call UltimateScpiCmd.exe /Option:LED /PID:867 /Value:red


rem lvreg pcxu write 9 0100000000
rem call "UltimateScpiCmd.bat"
