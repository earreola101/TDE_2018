@echo off
rem Status=1 == FAIL
Set Status = 1
SET PATH=%PATH%;
SET LOCALPATH=%~dp0
SET LOCALDIR=%~d0
setlocal EnableDelayedExpansion
echo [%LOCALPATH%]

Set Status=%errorlevel%

if exist "pskey.txt" (
del pskey.txt
)

)
if exist "ps.txt" (
del ps.txt
)
if exist "ps.out" (
del ps.out
)
tdebt_140.exe -g pskey 
tdebt_140.exe -g pskey > pskey.txt



rem for /F "skip=4 delims=," %i in ("%LOCALPATH%"Meridian.txt) Do set /p xprvar= <Meridian.txt

rem echo %xprvar%
  
set "xprvar="
for /F "delims=" %%i in (pskey.txt) do if not defined xprvar set "xprvar=%%i"   
echo %xprvar%
rem set /p var="%xprvar%"
set var=%xprvar:~0,2%
echo %var%

rem set var=%xprvar:~0%
echo [outputs]>>ps.txt
echo Status^=0>>ps.txt
echo ReturnCode^=0>>ps.txt
echo Message^=Ok!>>ps.txt
echo Headers^=pskey>>ps.txt
echo Values=%var%>>ps.txt
echo LowLimit^=>>ps.txt
echo UpLimit^= >>ps.txt
rem echo Values=>>pan.in
rem echo LogFile=test.log>>pan.in
rem echo VarResultSummary^=>>pan.in

copy ps.txt ps.out
rem pause

rem for /F "tokens=1 delims==," %%G IN (%xprvar%) DO set serout=<%%G
rem set serout
rem echo sr:%serout%

rem set /p SnVer=<%var%
rem set Str=%SnVer%


rem Del wifimac.txt
rem Del wifimac.in
rem Echo %Str% >wifimac.txt
rem COPY FWver.txt wifimac.txt
rem COPY sn.in wifimac.in
rem TDEBT-Analyzer.exe wifimac.in wifimac.txt
rem COPY wifimac.out sn.out

rem call status.bat
rem echo %status%
exit %status%



rem set /p btresultvalues=<"%LOCALPATH%\m.txt"
rem echo %btresultvalues%
