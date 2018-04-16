echo "123">btcli.log


rem Added by Henry 6Aug2014 Status=1 == FAIL
set status=1

@echo off 
setLocal EnableDelayedExpansion
rem Created by: Eduardo Arreola 
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
set btMacpath="C:\tstPlan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt"
cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
set lastResult=1

rem ===========================================================================================
rem [O].radiotxdata           -sets radio tx data,                Usage: tdebt.exe -s radiotxdata
set READBACKNAME=0
set fileVar=READBACKNAME.txt
set CMDNAME=radiotxdata
set VALUE=[OK]

if exist "%fileVar%" (
del %fileVar%
)
tdebt_140.exe -s pskey 36 0 26146 34833 52428 52428
ksleep 10000
tdebt_140.exe -s %CMDNAME%>>%fileVar%

rem 6Aug2014 Henry remaked below ==============================================
rem echo.
rem set /p readval=<%fileVar%
rem if "%readval%"=="%VALUE%" ( 
rem set lastResult=0
rem echo "[OK]"
rem (ECHO 0)>txstartout.txt
rem ) else (
rem set lastResult=1
rem echo "[FAILED]"
rem (ECHO 1)>txstartout.txt
rem )
rem echo  %CMDNAME% EXPECTED "%VALUE%" == "%readval%"
rem  if exist "%fileVar%" (
rem del %fileVar%
rem )
rem rem  =================================================
rem echo was %lastResult%
rem set status=2
rem set status=%lastResult%
rem 6Aug2014 Henry remarked above  =================================================

rem Added by Henry 6Aug2014 Status=0 == PASS
rem TDEBT_140 is for meridian by lorry rui
set status=0


exit  %status%





