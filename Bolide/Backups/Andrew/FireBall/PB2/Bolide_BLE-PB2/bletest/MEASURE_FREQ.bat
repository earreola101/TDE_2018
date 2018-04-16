@echo off 
setLocal 
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
set WorkingPath=0;
cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
set status=1
echo MEASURE_POWER SCRIPT
rem ================================================================================
rem strike put your power measurement commands here
rem C:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\BT functional Test\BlueToothStationScript
rem HERE
Rem set measure=measurepower.txt
set scpitool="%EasyAVRuntimeEnginePath%UltimateScpiCmd.exe"
rem if exist "%scpitool%" (
Del BTResultX.out

%scpitool% /option:send /COMPort:7 /scpicmd="*IDN?"
REM %scpitool% /option:send /COMPort:7 /scpicmd="OPMD CWMEAS"
REM %scpitool% /option:send /COMPort:7 /scpicmd="CWMEAS FREQ,2441e6,3e-3"
REM %scpitool% /inputfile:"BTResultX.in" /outputfile:"BTResultX.out"
REM %scpitool% /option:send /COMPort:7 /scpicmd="OPMD SCRIPT"

call ultimateScpiCmd.bat
rem wait for power measurement to complete
pause
ksleep 1000
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

 