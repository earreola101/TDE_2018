rem @echo off 
rem setLocal EnableDelayedExpansion
rem Created by: Eduardo Arreola 
rem modify by Lorry rui 2017.6.28

Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
rem set btMacpath="C:\tstPlan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt"
rem cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
rem set lastResult=1
rem echo pskey burn process

del triminglog.txt


rem ===========================================================================================
set fileVar=READPSKEY.txt
set scpitool="%EasyAVRuntimeEnginePath%UltimateScpiCmd.exe"
SET /a Para=36
set /a times1=0
rem tdebt_140.exe -s pskey 36 0 26146 34833 52428 52428
rem ksleep 5000

:Start
DEL BTResultX.out
%scpitool% /option:send /COMPort:7 /scpicmd="OPMD CWMEAS"
ksleep 2000
%scpitool% /option:send /COMPort:7 /scpicmd="CWMEAS FREQ,2441e6,3e-3"
ksleep 2000
%scpitool% /inputfile:"BTResultX.in" /outputfile:"BTResultX.out"
call ultimateScpiCmd.bat
REM if %Values% GEQ 70000 GOTO FAIL
echo %time%_%times1% >>triminglog.txt
echo %Para% >>triminglog.txt
echo %values% >>triminglog.txt
echo %values%
set /a tune=%values%
if %status%==1 (
GOTO Tunning
) 

if %status%==0 (
GOTO PASS
)

:Tunning

if %tune% LSS 0  (
echo direction back

goto tunning2
) 

SET /a times1=%times1%+1
if %times1%==12 (
GOTO FAIL
) 



SET /a Para=%Para%+3
if %Para%==66 (
GOTO FAIL
) 
tdebt_140.exe -s pskey %Para% 0 26146 34833 52428 52428
del READPSKEY.txt
echo %Para%>%fileVar%
rem copy %fileVar% rpskey.out
ksleep 5000
tdebt_140.exe -s radiotxdata
GOTO Start

:tunning2
echo triming2

SET /a times1=%times1%+1
if %times1%==12 (
GOTO FAIL
) 
SET /a Para=%Para%-2
if %Para%==0 (
GOTO FAIL
) 
echo pskey_%Para%

tdebt_140.exe -s pskey %Para% 0 26146 34833 52428 52428
del READPSKEY.txt
echo %Para%>%fileVar%
rem copy %fileVar% rpskey.out
ksleep 5000
tdebt_140.exe -s radiotxdata
GOTO Start



:FAIL
rem SET status=1
del Failtrim_log.txt
copy triminglog.txt Failtrim_log.txt
echo timeout
exit 0
:PASS
SET status=0

exit 0
:END  
