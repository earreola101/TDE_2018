@echo off
del CHECKPSKEY.txt
set fileVar=CHECKPSKEY.txt
set stauts=0
rem set filered=READPSKEY.txt
rem set fileCre=CREATEPSKEY.txt
for /f %%a in (.\READPSKEY.txt) do (
REM tdebt_140.exe -s pskey %%a 0 26146 34833 52428 5242
echo %%a
set /a c=%%a
) 
echo %c%

ksleep 400
tdebt_140.exe -g pskey
tdebt_140.exe -g pskey>>%fileVar%
ksleep 400
echo %fileVar% 
rem copy %fileVar% cpskey.out

set xprvar=
for /f "delims=" %%i in (%fileVar%) do if not defined xprvar set "xprvar=%%i"   
set /a bb=%xprvar:~0,2%
ksleep 400
echo %bb%

if %c%==%bb% (
GOTO PASS
)
GOTO FAIL
:FAIL
SET status=1
echo fail

exit 1
:PASS
SET status=0

exit 0
