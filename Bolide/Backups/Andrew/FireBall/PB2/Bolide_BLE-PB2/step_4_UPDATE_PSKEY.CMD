@echo off 
setLocal EnableDelayedExpansion
rem Created by: Eduardo Arreola 
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
set btMacpath="C:\tstPlan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt"
cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
set lastResult=1
echo pskey burn process
rem ===========================================================================================
set READBACKNAME=0
set fileVar=READBACKNAMEPSKEY.txt
set CMDNAME=pskey
set VALUE=7 48060 43707 43690 43690 43690
rem [Reference]:
rem 0x0007 0xbbbc 0xaabb 0xaaaa 0xaaaa 0xaaaa 0xaaaa
rem 0x0007 48060  43707  4369   43690  43690  43690
rem
rem This is how you clear the PSkey
rem tdebt.exe -s pskey 0 00000 00000 00000 00000 00000
rem
rem this is the defualt value that will go into the eeprom
rem tdebt.exe -s pskey 7 48060 43707 43690 43690 43690
rem PSKey_Format:uMixerCTrimChan0 uTxMixerCTrimOffset[0] uTxMixerCTrimOffset[1] uTxMixerCTrimOffset[2]  uTxMixerCTrimOffset[3] uTxMixerCTrimOffset[4]
rem if "%lastResult%"=="1" ( 
rem ===========================================================================================
rem  [O].devicename            -sets or gets the device name       Usage: tdebt.exe -s devicename SL_BT_TST1 ,tdebt.exe -g devicename
echo TESTING  %CMDNAME%
 if exist "%fileVar%" (
del %fileVar%
)
tdebt_127.exe -s %CMDNAME% %VALUE%

tdebt_127.exe -g %CMDNAME%>>%fileVar%

echo.
set /p readval=<%fileVar%
if "%readval%"=="%VALUE%" ( 
set lastResult=0
echo "[OK]"
(ECHO 0)>pskeyout.txt
) else (
set lastResult=1
echo "[FAILED]"
(ECHO 1)>pskeyout.txt
)
echo  %CMDNAME% EXPECTED "%VALUE%" == "%readval%"
 if exist "%fileVar%" (
del %fileVar%
)
rem )
rem ===========================================================================================
echo mac was %lastResult%
set status=1
set status=%lastResult%

exit  %status%


