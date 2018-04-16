@echo off


Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

rem LVREG testxu write A 1

call UltimateControlCmd.exe /Option:LED /PID:867 /Value:RED

rem call UltimateScpiCmd.exe /Option:LED /PID:867 /Value:red



