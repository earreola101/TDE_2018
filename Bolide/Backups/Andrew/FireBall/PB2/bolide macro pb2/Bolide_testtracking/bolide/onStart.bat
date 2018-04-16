rem This batch is to run on test station %1 and insert at the top of Kinetic script
rem 
rem ..\TestTrackingConsoleApp 
rem -config "%~dp0bolide.ini" 
rem -onStartOfTestCycle %1
rem 
..\TestTrackingConsoleApp -config "%~dp0bolide.ini" -onStartOfTestCycle %1
@echo off
rem 
if %errorlevel% equ 0 echo Success.
if %errorlevel% equ 1 echo Enumeration issue.
if %errorlevel% equ 2 echo Error R/W device.
if %errorlevel% equ 3 echo Invalid arguments due to parsing error or invalid config file content.
if %errorlevel% equ 4 echo Error writing test log file.
if %errorlevel% equ 5 echo Test log is full.
if %errorlevel% equ 6 echo Test nodes or test stations exceed range.
if %errorlevel% equ 7 echo Software not initialized before use.
if %errorlevel% equ 8 echo Undefined error.
rem EQU: equal
rem NEQ: not equal
rem LSS: less than
rem LEQ: less than or equal
rem GTR: greater than
rem GEQ: greater than or equal
if %errorlevel% geq 127 echo error level %errorlevel%
