@echo OFF
SETLOCAL EnableDelayedExpansion
set _SCRIPT_DRIVE=%~d0
set _SCRIPT_PATH=%~p0
echo Drive:%_SCRIPT_DRIVE%
echo Path:%_SCRIPT_DRIVE%%_SCRIPT_PATH%
set _SCRIPT_PATH=%_SCRIPT_DRIVE%%_SCRIPT_PATH%
SET PATH="C:\Windows\System32";"C:\Program Files\Kinetic\kinetic\";"%_SCRIPT_PATH%";"%_SCRIPT_PATH%Tools";"%_SCRIPT_PATH%Analysis";"%_SCRIPT_PATH%ImageUniformity";"C:\Windows\System32"
echo. LORRR RUI



:MAIN
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,08
REM Ksleep 2000
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,00
echo. >>log_BLElog.txt
echo %date% %time% >>log_BLElog.txt
Ksleep 1000
tdebt_144.exe -g blerssi >>log_BLElog.txt
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,08
Ksleep 1000
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,00
FOR /F "delims=" %%i IN ('tdebt_144.exe -g blerssi') DO SET BLE=%%i
SET BLER=%BLE:~1%
SET BLEP=%BLER%
ECHO [%BLEp%]

echo /////////////////////////set limit //////////////

set LowLimit= 25
set UpLimit= 100
set TargetLimit=40


if %BLEp% GTR %LowLimit% (
set Statusx=0
ECHO GTR
) else (
set Statusx=1
GOTO FAIL
)

if %BLEp% LSS %UpLimit% (
set Statusx=0
ECHO LSS
) else (
set Statusx=1
)


echo ////////////////////////////////////////////



Del wifimac.txt
Del wifimac.in
DEL wifimac.out
echo %BLEp% >wifimac.txt

COPY BLEp.in wifimac.in
TDEBT-Analyzer.exe wifimac.in wifimac.txt
COPY wifimac.out BLEp.out
rem call status.bat



: FAIL
echo %Statusx%
PAUSE
exit %Statusx%
