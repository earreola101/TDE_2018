@echo off 
rem kinetic batch file on how to check  if the USB device  VID PID is on the system
rem usage: 
rem The following batch command takes vid and pid and searches for the USB device
rem FindUSBDevice.bat <VID> <PID>
rem USB\VID_046D&PID_0857\6&2D9CDB8D&0&2

rem ============= Wait Loop 1.5sec x 10 times ======================
rem ================================================================
echo.
SET COUNT=0
:MyLoop

Ksleep 1500
rem ============= Assing VID PID here !!! ============================
rem ==================================================================
call FindUSBDevice 046D 085E
rem call FindUSBDevice 046D 0867

if (%errorlevel%) == (0) (
echo ////////////////////////////////////////////////////// TEST PASSED ////////////////////////////////////////////////////// 
GOTO EndLoop
)

echo ////////////////////////////////////////////////////// VID PID Not Matched ////////////////////////////////////////////////////// 



IF "%COUNT%" == "10" GOTO EndLoop
SET /A COUNT+=1
GOTO MyLoop
:EndLoop

rem pause
rem exit /b %errorlevel%
exit %errorlevel%





    
    
    
    

