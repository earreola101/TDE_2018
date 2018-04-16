@echo off
rem Status=1 == FAIL
Set Status = 1
SET PATH=%PATH%;"\meridian BT -PB1\bt\"
SET LOCALPATH=%~dp0
SET LOCALDIR=%~d0

echo [%LOCALPATH%]

START start_test.vbs
Set Status=%errorlevel%%
rem pause
exit %Status%

rem 04: Birch boot mode for CSR Tool USB access  01: Normal user mode
rem cd /d %~dp0BirchModeSet

rem Birchsetmode 04  -- by Henry 25-Feb-2015 trying for stable issue

rem wait 1 sec
rem Timeout 1
rem ksleep 1000

rem To keep btcli.log under d:\Logitech\Video\Video Sync\FY14\Mariner\TDE\BT\

rem btcli USB -l -t

rem To open 2'nd command window
rem START "title" [/D path] [options] "command" [parameters]  
rem Options: /w:  Start application and wait for it to terminate.  /low: low/idle priority class
rem Options: /l:  btcli.log  /t: with time-stamp

rem START "Btcli" /w /low "btcli" USB -l -t
rem START "Btcli" /w "btcli" USB -l -t
REM btcli USB -l -t -x btcli_script.btcli
rem if exist "btcli.log" ( del btcli.log )
rem START "btcli" "%LOCALPATH%\bt\btcli.exe" USB -l -t -x"%LOCALPATH%\bt\btcli_script1.btcli"
rem timeout /t 2



rem echo done
rem timeout /t 3
rem del pidid.txt
rem tasklist /v /fo csv | findstr /i "A2A">>pidid.txt

rem "btcli.exe","5880","Console","1","4,500 K","Running","TDE11\tsoperator","0:00:00","Btcli1"

rem set /p btresultvalues=<"%LOCALPATH%\pidid.txt"

rem for /F "tokens=2 delims==," %%G IN ("%btresultvalues%") DO set pidout=%%G

rem echo %pidout%

rem START "killer" ctrlc.exe %pidout%

rem echo %indent% ^|==^>[%errorlevel%] Center_Luma:%Center_Luma% centerLowlim[%centerLowlim%]

rem START "Btcli2" "%LOCALPATH%\bt\btcli.exe" USB -l -t -x"%LOCALPATH%\bt\btcli_script2.btcli"
rem timeout /t 5
rem START "Btcli3" "%LOCALPATH%\bt\btcli.exe" USB -l -t -x"%LOCALPATH%\bt\btcli_script3.btcli"

rem ============== external sequence by barcode reader as a keyboard input
rem Btcli command 1: "rt rxstart2 2441" by KeyBaord input through bar-code reader
rem wait 5 sec
rem Btcli command 1: "rt deep_sleep" OR "rt pause" by KeyBaord input through bar-code reader
rem Btcli command 1: "quit" to exit btcli by KeyBaord input through bar-code reader
rem ============================================================


rem wait 2 sec for passing barcode "ENTER" key input
rem Timeout 2

rem Status=0 == PASS

