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

tdebt_140.exe -s %CMDNAME%>>%fileVar%

echo.
set /p readval=<%fileVar%
if "%readval%"=="%VALUE%" ( 
set lastResult=0
echo "[OK]"
(ECHO 0)>txstartout.txt
) else (
set lastResult=1
echo "[FAILED]"
(ECHO 1)>txstartout.txt
)
echo  %CMDNAME% EXPECTED "%VALUE%" == "%readval%"
 if exist "%fileVar%" (
del %fileVar%
)
rem ===========================================================================================
echo was %lastResult%
set status=2
set status=%lastResult%

exit  %status%





