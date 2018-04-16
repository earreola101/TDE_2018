rem This batch is to run on test station %1 and insert at the bottom of Kinetic script
rem If %2 get value 0, meaning a PASS.
rem 
rem TestTrackingMeridianApp 
rem -config "meridian\Meridian.ini" 
rem -onEndOfTestCycle %1,%2
rem 
TestTrackingMeridianApp -config "meridian\Meridian.ini" -onEndOfTestCycle 6,1
ping 1.1.1.1 -n 1 -w 50 > nul
@echo off
rem 
