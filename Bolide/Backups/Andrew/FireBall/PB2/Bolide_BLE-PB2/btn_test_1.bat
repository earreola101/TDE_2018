@echo OFF
SETLOCAL EnableDelayedExpansion
set _SCRIPT_DRIVE=%~d0
set _SCRIPT_PATH=%~p0
echo Drive:%_SCRIPT_DRIVE%
echo Path:%_SCRIPT_DRIVE%%_SCRIPT_PATH%
set _SCRIPT_PATH=%_SCRIPT_DRIVE%%_SCRIPT_PATH%
SET PATH="C:\Windows\System32";"C:\Program Files\Kinetic\kinetic\";"%_SCRIPT_PATH%";"%_SCRIPT_PATH%Tools";"%_SCRIPT_PATH%Analysis";"%_SCRIPT_PATH%ImageUniformity";"C:\Windows\System32"
echo.


rem ============= Wait Loop  Lorry RUi======================
rem ================================================================
echo.
SET counter=0

FOR /F "delims=" %%i IN ('tdebt_143 -g bt_nfcstatus') DO SET btn_status=%%i
echo %btn_status%
pause
if %btn_status%==1 goto fail


:MyLoop
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,08
Ksleep 1000
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,00
FOR /F "delims=" %%i IN ('tdebt_143 -g bt_nfcstatus') DO SET btn_status=%%i
echo %btn_status%
if %btn_status%==1 goto pass
pause
SET /A counter= %counter% +1
if %counter% LSS 1000 (
GOTO Myloop) 
else (
echo too long waiting
GOTO fail)


rem ==================================================================

if (%errorlevel%) == (0) (
echo  TEST PASSED ////////////////////////////////////////////////////// 
GOTO pass
)

:pass
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,00
echo pass
pause
exit 0

:fail
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,00 
echo fail
pause
exit 1


