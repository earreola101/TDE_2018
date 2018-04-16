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
set PMTT_fileVar=eeVer.txt
lvreg.exe infoxu read 03
ksleep 500
lvreg.exe infoxu read 03
ksleep 500
FOR /F "delims=" %%i IN ('lvreg.exe infoxu read 03') DO SET ee_VER=%%i
SET ee_VER1=%ee_VER:~17%
ECHO [%ee_VER1%]
echo %ee_VER1% >eeVer.txt

ksleep 500
rem ////////////////////////////////////
set limit=1.6
rem ////////////////////////////////////
if %ee_VER1% == %Limit% (
set Status=0
) else (
set Status=1
)



set /p eeVer=<%PMTT_fileVar%
set Str=%eeVer%
Echo %Str% 

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
COPY eeVer.in wifimac.in
TDEBT-Analyzer.exe wifimac.in wifimac.txt
COPY wifimac.out eeVer.out

rem call status.bat
echo %status%
exit %status%