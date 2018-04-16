@echo off 
setLocal EnableDelayedExpansion
rem Created by: Eduardo Arreola 
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
set btMacpath="C:\tstPlan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt"
cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
set lastResult=1
echo  device process
set READBACKNAME=0
set fileVar=READBACKNAME_DEV.txt
set CMDNAME=devicename
Rem Mariner=ConferenceCam CC2000e
rem set VALUE="ConferenceCam Live --> Device Name before PB3
set VALUE="Logitech MeetUp"
rem if "%lastResult%"=="1" ( 
rem ===========================================================================================
rem  [O].devicename            -sets or gets the device name       Usage: tdebt.exe -s devicename SL_BT_TST1 ,tdebt.exe -g devicename
echo TESTING  %CMDNAME%
if exist "%fileVar%" (
del %fileVar%
)
rem
rem echo on
rem
Rem by lorry rui=========
tdebt_140.exe -s %CMDNAME% %VALUE%
ksleep 1000
Rem 
rem
rem pause
rem
rem
rem tdebt_140.exe -g devicename
tdebt_140.exe -g %CMDNAME%>>%fileVar%
ksleep 1000
rem
rem
rem pause
rem
echo.
set /p readval=<%fileVar%
if "%readval%"==%VALUE% ( 
set lastResult=0
echo "[OK]"
(ECHO 0)>updatedevicenameout.txt
) else (
set lastResult=1
echo "[FAILED]"
(ECHO 1)>updatedevicenameout.txt
)
echo  %CMDNAME% EXPECTED %VALUE% == "%readval%"
 if exist "%fileVar%" (
del %fileVar%
)
rem )
rem pause
rem ===========================================================================================
echo  was %lastResult%
set status=1
set status=%lastResult%
exit  %status%




