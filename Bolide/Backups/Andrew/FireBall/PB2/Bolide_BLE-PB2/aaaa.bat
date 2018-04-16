rem @echo off 
rem setLocal EnableDelayedExpansion
rem Created by: Eduardo Arreola 
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
rem set btMacpath="C:\tstPlan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt"
rem cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
rem set lastResult=1
rem echo pskey burn process

rem del triminglog.txt


rem ===========================================================================================
set fileVar=READPSKEY.txt
set scpitool="%EasyAVRuntimeEnginePath%UltimateScpiCmd.exe"
SET /a Para=30
rem tdebt_140.exe -s pskey 36 0 26146 34833 52428 52428
rem ksleep 10000
:Start
DEL BTResultX.out
%scpitool% /option:send /COMPort:7 /scpicmd="OPMD CWMEAS"
ksleep 2000
%scpitool% /option:send /COMPort:7 /scpicmd="CWMEAS FREQ,2441e6,3e-3"
ksleep 2000
%scpitool% /inputfile:"BTResultX.in" /outputfile:"BTResultX.out"
call ultimateScpiCmd.bat
set /a values=6000
REM if %Values% GEQ 70000 GOTO FAIL
echo %time% >>triminglog.txt
echo %Para% >>triminglog.txt
echo %values% >>triminglog.txt
echo %values%
echo %status%

if %status%==1 (
GOTO Tunning
) 

if %status%==0 (
GOTO PASS
)

:Tunning

if %values% LSS 0 (
echo direction back
goto tunning2
) 

SET /a Para=%Para%+3
if %Para%==66 (
GOTO FAIL
) 
echo pskey %Para%
pause
tdebt_140.exe -s pskey %Para% 0 26146 34833 52428 52428
del READPSKEY.txt
echo %Para%>%fileVar%
rem copy %fileVar% rpskey.out
ksleep 10000
tdebt_140.exe -s radiotxdata
GOTO Start

:tunning2
echo triming2

SET /a Para=%Para%-3
if %Para%==0 (
GOTO FAIL
) 
echo pskey_%Para%
pause
tdebt_140.exe -s pskey %Para% 0 26146 34833 52428 52428
del READPSKEY.txt
echo %Para%>%fileVar%
rem copy %fileVar% rpskey.out
ksleep 10000
tdebt_140.exe -s radiotxdata
GOTO Start


:FAIL
rem SET status=1
del failtrimlog.txt
copy triminglog.txt failtrimlog.txt
echo timeout
exit 0
:PASS
SET status=0

exit 0
:END  
