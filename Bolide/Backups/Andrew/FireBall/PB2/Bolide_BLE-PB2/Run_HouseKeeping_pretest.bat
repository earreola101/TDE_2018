@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
REM path="C:\Program Files\Kinetic\kinetic","C:\Program Files\Kinetic\TestModules\AudioTest"
REM 
REM MicArraycontrol.exe 0 false
REM KSLEEP 100
REM MicArraycontrol.exe 1 true
REM KSLEEP 100
REM MicArraycontrol.exe 2 false
REM KSLEEP 100
REM MicArraycontrol.exe 3 false
REM KSLEEP 100
REM MicArraycontrol.exe 4 false
REM KSLEEP 100
REM MicArraycontrol.exe 5 false
REM KSLEEP 100
REM MicArraycontrol.exe 6 false
REM KSLEEP 100
REM MicArraycontrol.exe 7 false
REM ksleep 1000

rem tdebt120.exe -s device_mode 0 0
rem KSLEEP 100
rem tdebt120.exe -s device_mode 1 1

lvreg register write 2909 1E

lvreg register write 2908 8

rem 
KSLEEP 1000
rem exit /b 0
exit 0