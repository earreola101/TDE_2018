@echo off 

rem Status=1 == FAIL
Set Status = 1
SET PATH=%PATH%;
SET LOCALPATH=%~dp0
SET LOCALDIR=%~d0
setlocal EnableDelayedExpansion
echo [%LOCALPATH%]

if exist "SNtoAU.txt" (
del SNtoAU.txt
)
if exist "testtracking.log" (
copy "testtracking.log" "SNtoAU.log"
rename "SNtoAU.log" "SNtoAU.txt"
)

set "xprvar1="
for /F "skip=5 delims=" %%i in (SNtoAU.txt) do if not defined xprvar1 set "xprvar1=%%i"   
echo %xprvar1%
rem set /p var="%xprvar%"
set var1=%xprvar1:~13%
echo %Var1%


set CMDNAME=serialnumber

set VALUE=%Var1%

rem if "%lastResult%"=="1" ( 
rem ===========================================================================================
rem  [O].devicename            -sets or gets the device name       Usage: tdebt.exe -s devicename SL_BT_TST1 ,tdebt.exe -g devicename
echo TESTING  %CMDNAME%
if exist "%fileVar%" (
del %fileVar%
)
rem
rem echo on
rem
Rem by lorry rui=========
tdebt_143.exe -s %CMDNAME% %VALUE%
ksleep 1000





