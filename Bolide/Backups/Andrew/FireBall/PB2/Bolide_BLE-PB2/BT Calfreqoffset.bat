@echo off 
Set EasyeAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
rem Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
rem set btMacpath="C:\tstPlan\BLUETOOTH_MACADDRESS_PROGRAMMING.txt"
rem cd /d %~dp0
rem Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0
rem set lastResult=1
rem echo pskey burn process
rem ===========================================================================================
rem set READBACKNAME=0
rem set fileVar=READBACKNAMEPSKEY.txt
rem set CMDNAME=pskey
rem set VALUE=7 48060 43707 43690 43690 43690
rem set VALUE=40 0 26146 34833 52428 52428
rem set VALUE=7 0 0 0 0 0
rem [Reference]:
rem 0x0007 0xbbbc 0xaabb 0xaaaa 0xaaaa 0xaaaa 0xaaaa
rem 0x0007 48060  43707  4369   43690  43690  43690
rem
rem This is how you clear the PSkey
rem tdebt.exe -s pskey 0 00000 00000 00000 00000 00000
rem
rem this is the defualt value that will go into the eeprom
rem tdebt.exe -s pskey 7 48060 43707 43690 43690 43690
rem PSKey_Format:uMixerCTrimChan0 uTxMixerCTrimOffset[0] uTxMixerCTrimOffset[1] uTxMixerCTrimOffset[2]  uTxMixerCTrimOffset[3] uTxMixerCTrimOffset[4]
rem if "%lastResult%"=="1" ( 
rem ===========================================================================================
rem  [O].devicename            -sets or gets the device name       Usage: tdebt.exe -s devicename SL_BT_TST1 ,tdebt.exe -g devicename
rem echo TESTING  %CMDNAME%
rem if exist "%fileVar%" (
rem del %fileVar%
rem )
rem tdebt_140.exe -s %CMDNAME% %VALUE%
rem ksleep 10000
rem tdebt_140.exe -s radiotxdata
rem tdebt_140.exe -g %CMDNAME%>>%fileVar%
set scpitool="%EasyAVRuntimeEnginePath%UltimateScpiCmd.exe"
SET /a Para=36
rem SET /a ParaUp=60
tdebt_140.exe -s pskey 36 0 26146 34833 52428 52428
ksleep 10000
tdebt_140.exe -s radiotxdata
:Start
DEL BTResultX.out
%scpitool% /option:send /COMPort:7 /scpicmd="OPMD CWMEAS"
%scpitool% /option:send /COMPort:7 /scpicmd="CWMEAS FREQ,2441e6,3e-3"
%scpitool% /inputfile:"BTResultX.in" /outputfile:"BTResultX.out"
call ultimateScpiCmd.bat
:Tunning
set /a delta1=%Values%
set /a "delta=%delta1%-%UpLimit%"
set /a Para1=%Para%+%delta%/1000
set /a Parafinal=%Para1%+2
rem if %Parafinal% > %ParaUp%  GOTO FAIL
tdebt_140.exe -s pskey %Parafinal% 0 26146 34833 52428 52428
ksleep 10000
tdebt_140.exe -s radiotxdata
GOTO Start
rem if %status%==1  GOTO Tunning
rem GOTO END
rem if %status%==0 GOTO PASS
rem GOTO END
:FAIL
SET status=1
:PASS
SET status=0
:END  
