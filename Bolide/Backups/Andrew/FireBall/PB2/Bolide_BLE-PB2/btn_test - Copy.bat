@echo OFF
SETLOCAL EnableDelayedExpansion
set _SCRIPT_DRIVE=%~d0
set _SCRIPT_PATH=%~p0
echo Drive:%_SCRIPT_DRIVE%
echo Path:%_SCRIPT_DRIVE%%_SCRIPT_PATH%
set _SCRIPT_PATH=%_SCRIPT_DRIVE%%_SCRIPT_PATH%
SET PATH="C:\Windows\System32";"C:\Program Files\Kinetic\kinetic\";"%_SCRIPT_PATH%";"%_SCRIPT_PATH%Tools";"%_SCRIPT_PATH%Analysis";"%_SCRIPT_PATH%ImageUniformity";"C:\Windows\System32"
echo.
rem kinetic batch file on how to check  if the USB device  VID PID is on the system
rem usage: 
rem The following batch command takes vid and pid and searches for the USB device
rem FindUSBDevice.bat <VID> <PID>
rem USB\VID_046D&PID_0857\6&2D9CDB8D&0&2

rem ============= Wait Loop 1.5sec x 10 times ======================
rem ================================================================
echo.
SET /a COUNT=0
:MyLoop
Ksleep 1500
FOR /F "delims=" %%i IN ('tdebt_135 -g bt_nfcstatus') DO SET btn_status=%%i
set /a count+=1
if %btn_status%==1 
( goto MyLoop
) else GOTO pass

rem ============= Assing VID PID here !!! ============================
rem ==================================================================

if (%errorlevel%) == (0) (
echo  TEST PASSED ////////////////////////////////////////////////////// 
GOTO pass
)

:pass
pause
exit 0

:fail
pause
exit 1


