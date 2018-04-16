@echo off


Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

rem LVREG testxu write A 1

call UltimateControlCmd.exe /option:AudioVersion /PID:867 /inputfile:"av.in"
rem /outputfile:"av.out"

rem call UltimateScpiCmd.exe /Option:LED /PID:867 /Value:red
rem 

rem lvreg pcxu write 9 0100000000
rem call "UltimateScpiCmd.bat"


exit %errorlevel%


