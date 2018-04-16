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




set zero=0
echo debug2
rem ===========================================================================================

set BDAddrFile=bdmac.txt


set /p readval=<%BDAddrFile%
set cmp=%readval%
echo %cmp%

if "%cmp%"=="%VALUE%" (
echo  %CMDNAME% EXPECTED "%VALUE%" == "%cmp%"
if exist "%BDAddrFile%" (
del %BDAddrFile%
)
				
set lastResult=0
set status=0
echo "[OK]"
set status=%lastResult%
(echo PASS!!! Label Addr=="%Value%", EEPROM value="%cmp%")>mac_check.txt
) else (
echo  %CMDNAME% EXPECTED "%VALUE%" == "%cmp%"
 if exist "%BDAddrFile%" (
del %BDAddrFile%
)

pause
set lastResult=1
echo "[FAILED]"
set status=1
set status=%lastResult%
(echo FAIL!!! Label Addr=="%Value%", EEPROM value="%cmp%")>mac_check.txt
)
rem )
rem ===========================================================================================
echo The result was %lastResult%
set status=1
set status=%lastResult%
ksleep 1000
exit %status%




