rem @echo off 
setLocal 
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
set WorkingPath=0;
cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
set status=1
echo MEASURE_POWER SCRIPT
SET COUNT=0
:Retest
rem ================================================================================
rem strike put your power measurement commands here
rem C:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\BT functional Test\BlueToothStationScript
rem HERE
Rem set measure=measurepower.txt
tdebt_140.exe -s bt_uartdisable
ksleep 2000
set scpitool="%EasyAVRuntimeEnginePath%UltimateScpiCmd.exe"
rem if exist "%scpitool%" (
Del Blepower.out
REM %scpitool% /option:send /COMPort:7 /scpicmd="*IDN?"
%scpitool% /option:send /COMPort:7 /scpicmd="OPMD CWMEAS"
ksleep 2000
%scpitool% /option:send /COMPort:7 /scpicmd="CWMEAS FREQ,2442e6,3e-3"
ksleep 2000
%scpitool% /inputfile:"Blepower.in" /outputfile:"Blepower.out"

call ultimateScpiCmd.bat
rem wait for power measurement to finish
REM pause
ksleep 1000

echo ************************************%count%
IF "%COUNT%" == "3" GOTO EndLoop
SET /A COUNT=%Count%+1     
if %Status% == 1 goto Retest
exit %Status%
:EndLoop
Rem set status=0
rem (ECHO 0)>measurepower.txt
rem exit %status%
rem )
rem echo the tool was not there
rem set status=1
rem (ECHO 1)>measurepower.txt
rem exit %Status%
rem ================================================================================

 