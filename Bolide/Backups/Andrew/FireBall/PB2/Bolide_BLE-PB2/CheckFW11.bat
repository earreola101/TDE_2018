@echo OFF
SETLOCAL EnableDelayedExpansion
set _SCRIPT_DRIVE=%~d0
set _SCRIPT_PATH=%~p0
echo Drive:%_SCRIPT_DRIVE%
echo Path:%_SCRIPT_DRIVE%%_SCRIPT_PATH%
set _SCRIPT_PATH=%_SCRIPT_DRIVE%%_SCRIPT_PATH%
SET PATH="C:\Windows\System32";"C:\Program Files\Kinetic\kinetic\";"%_SCRIPT_PATH%";"%_SCRIPT_PATH%Tools";"%_SCRIPT_PATH%Analysis";"%_SCRIPT_PATH%ImageUniformity";"C:\Windows\System32"
echo.

set status=0
set PMTT_fileVar=FWVer.txt
lvreg.exe infoxu read 01
ksleep 500
lvreg.exe infoxu read 01
ksleep 500
FOR /F "delims=" %%i IN ('lvreg.exe infoxu read 01') DO SET FW_VER=%%i
SET FW_VER1=%FW_VER:~17%
ECHO [%FW_VER1%]
echo %FW_VER1% >FWVer.txt

ksleep 500
set limit=120
if %FW_VER1% == %Limit% (
set Status=0
) else (
set Status=1
)



set /p FWVer=<%PMTT_fileVar%
set Str=%FWVer%


rem ====================================================================================================
rem   wifimac.txt, wifimac.in are hard coded in TDEBT-Analyzer.exe, DO NOT change their file names !!!
rem   command "call status.bat" is necessary for storing Sno in csv file
rem   VC2005/vcredist_x86.exe needed to be executed for needed VC libraies for TDEBT-Analyzer.exe
rem
rem   Not able to compare String !!!
rem ====================================================================================================
Del wifimac.txt
Del wifimac.in
Echo %Str% >wifimac.txt
rem COPY FWver.txt wifimac.txt
COPY FWVer.in wifimac.in
TDEBT-Analyzer.exe wifimac.in wifimac.txt
COPY wifimac.out FWVer.out

rem call status.bat
echo %status%
exit %status%