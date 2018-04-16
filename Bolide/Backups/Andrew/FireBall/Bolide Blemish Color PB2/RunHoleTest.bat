@echo off 
rem set userName=tsoperator
rem Cleaned by Edward Arreola in 2017,Jan11
rem Used in Merdian Build PB1. 
rem Blemish Test Hole Analysis
set userName=tsoperator
Set dirPath="C:\Program Files\Kinetic\TestModules\SensorDPD"
set outputFile=teststatus_sensorholes.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"
set IMAGE_TARGET="C:\tstPlan\SSD\BayerFrameCOLD.bmp"
:START_ACTIONS

:ACTIONS      
SensorChipDPDConsoleApp -BMPFileIn %IMAGE_TARGET% -TestSettings testconfig_sensorholes.txt -TestLimits testlimit_sensorholes.txt -OutputFile teststatus_sensorholes.txt -LogFile datalog_sensorholes.txt -slave
copy AllClusters.csv AllClusters_HOLES.csv
del AllClusters.csv
copy Worst64Pixels.csv Worst64Pixels_HOLES.csv
del Worst64Pixels.csv
rem call replacehole.bat

set /p SEQNUM=<C:\tstplan\seqnum.txt
set /p SNO=<C:\tstplan\SerialNum.txt
set BKDIR=%SEQNUM%

if not exist "%BKDIR%" mkdir "%BKDIR%" 
copy "%IMAGE_TARGET%" "%BKDIR%"
del %IMAGE_TARGET%
copy Worst64Pixels_HOLES.csv "%BKDIR%"
copy AllClusters_HOLES.csv "%BKDIR%"

:END_ACTIONS

:OUTPUT_HANDLER
rem now collect and process the results 
call:getvalue %INIFILE% "Status" "" STATUS
call:getvalue %INIFILE% "ReturnCode" "" RETURNCODE
call:getvalue %INIFILE% "Message" "" MESSAGE
call:getvalue %INIFILE% "LogFile" "" LOGFILE
echo status: %STATUS%
echo ReturnCode: %RETURNCODE%
echo Message: %MESSAGE%
echo LogFile: %LOGFILE%
echo RETURN IS: %STATUS%
IF (%STATUS%)==(0) call:PASS_MSG
rem 
IF (%STATUS%)==(1) call:FAIL_MSG
rem
exit %STATUS%
rem END

:getvalue
FOR /F "eol=; eol=[ tokens=1,2* delims==" %%i in ('findstr /b /l /i %~2= %1') DO set %~4=%%~j
goto:eof

:PASS_MSG
echo //////////// TEST PASSED
goto:eof

:FAIL_MSG
echo //////////// TEST FAILED
goto:eof




