rem This batch is to run on test station %1 and insert at the bottom of Kinetic script
rem If %2 get value 0, meaning a PASS.
rem 
rem ..\TestTrackingConsoleApp 
rem -config "%~dp0bolide.ini" 
rem -onEndOfTestCycle %1,%2,%3
rem 
..\TestTrackingConsoleApp -config "%~dp0bolide.ini" -onEndOfTestCycle %1,%2,%3
@echo off
rem 
