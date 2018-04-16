@echo off 
setLocal EnableDelayedExpansion
rem Created by: Eduardo Arreola 
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
set btMacpath="C:\tstPlan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt"
cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
rem OK TO MODIFY IN PRODUCTION====================================================
rem remeber to
rem make this a 1 on monday
set VALUE=1
rem OK TO MODIFY IN PRODUCTION====================================================
rem DONOT MODIFY==================================================================
echo nfc process
set READBACKNAME=0
set fileVar=READBACKNAME_NFC.txt
set CMDNAME=bt_nfcstatus
rem if "%lastResult%"=="1" ( 
rem [O].bt_nfcstatus          -gets the NFC status,               Usage: tdebt.exe -g bt_nfcstatus
if exist "%fileVar%" (
del %fileVar%
)
tdebt_127.exe -g %CMDNAME%>>%fileVar%
ksleep 1000
echo.
set /p readval=<%fileVar%
if "%readval%"=="%VALUE%" ( 
set lastResult=0
echo "[OK]"
(ECHO 0)>nfcout.txt
echo  %CMDNAME% EXPECTED "%VALUE%" == "%readval%"
rem
rem NFC_PROGRAM.exe  ---> Colossus
rem ConferenceCamConnect.exe  ---> Mariner
rem NFC_BURN_CC_LIVE.exe ---> ConferenceCam Live
rem ==================================================================================
rem  For NFC_Programming_V3_Tool.exe, the device name is stored in "FriendlyName.txt"
rem ==================================================================================
NFC_Programming_V3_Tool.exe
rem
) else (
set lastResult=1
echo "[FAILED]"
(ECHO 1)>nfcout.txt
echo  %CMDNAME% EXPECTED "%VALUE%" == "%readval%"
)

if exist "%fileVar%" (
del %fileVar%
)
rem DONOT MODIFY===========================================================================================
rem 
echo was %lastResult%
set status=%lastResult%
exit  %status%



