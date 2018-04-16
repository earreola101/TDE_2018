@echo off 
setLocal 
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
set WorkingPath=0;
cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0

echo MEASURE_POWER SCRIPT

rem = 6Aug2014 Gravity's measurement threads ==============================================================================
call ttt.exe
ksleep 500

call status.bat


rem ========================================

exit %Status%

Rem set status=0
rem (ECHO 0)>measurepower.txt
rem exit %status%
rem )
rem echo the tool was not there
rem set status=1
rem (ECHO 1)>measurepower.txt
rem exit %Status%
rem ================================================================================

 