@echo off 
setLocal EnableDelayedExpansion
rem Created by: Eduardo Arreola 
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"

rem  Kinetic command: Input_MessageBox(BLUETOOTH_MACADDRESS_PROGRAMMING,SCAN_BARCODE,************); 
rem  --> Keyboard input of 12 ASCII code will be saved as C:\tstPan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt, it is a pre-defined Kinetic feature !!!!!
set btMacpath="C:\tstPlan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt"
cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
set lastResult=1
echo macburn process
set READBACKNAME=0
set fileVar=READBACKNAMEMAC.txt
set CMDNAME=macaddress 

rem macAddress = C:\tstPlan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt
set macpathName=%btMacpath%
echo %macpathName%
set /p macAddress=<%macpathName%
set VALUE=%macAddress%





echo debug2
rem ===========================================================================================

set BDAddrFile=bdmac.txt


set /p readval=<%BDAddrFile%
set cmp=%readval%
echo %cmp%

if "%cmp%"=="%VALUE%" (
echo  %CMDNAME% EXPECTED "%VALUE%" == "%cmp%"
if exist "%BDAddrFile%" del %BDAddrFile%
set lastResult=0
echo "[OK]"
echo PASS!!! Label Addr=="%Value%", EEPROM value="%cmp%")>mac_check.txt
echo  %CMDNAME% EXPECTED "%VALUE%" == "%cmp%"
if exist "%BDAddrFile%" del %BDAddrFile%
echo test return code %lastResult% 
REM pause
exit %lastResult% 
)
else 
（ 
echo  %CMDNAME% UNEXPECTED "%VALUE%" == "%cmp%"
if exist "%BDAddrFile%" del %BDAddrFile%
set lastResult=1
echo "[FAILED]"
echo （FAIL!!! Label Addr=="%Value%", EEPROM value="%cmp%")>mac_check.txt
echo test return code %lastResult% 
）
rem )
rem ===========================================================================================
rem echo The result was %lastResult%
rem set status=1
rem set status=%lastResult%
ksleep 1000
echo %lastResult% 
exit %lastResult% 




