rem This batch is to run on test station %1 and insert at the bottom of Kinetic script
rem If %2 get value 0, meaning a PASS.
rem 
rem ..\TestTrackingConsoleApp 
rem -config "%CD%\Krypto.ini" 
rem -onEndOfTestCycle %1,%2
rem 
..\TestTrackingConsoleApp -config "%CD%\Krypto.ini" -onEndOfTestCycle %1,%2
@echo off
rem 
