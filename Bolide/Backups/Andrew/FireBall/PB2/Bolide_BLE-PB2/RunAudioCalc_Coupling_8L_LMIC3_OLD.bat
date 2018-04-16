@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
Set dirPath=%CD%
set outputFile=testOutput_AudioCalc_Coupling_8L_LMIC3.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"

:START_ACTIONS
echo //////////////////////////////////////////////////////////////////// START OF SCRIPT  

:ACTIONS
echo //////////////////////////////////////////////////////////////////// ACTIONS     
REM AudioCalcConsoleApp2 
REM -advanced 
REM -PCMFileIn ".\recorded\Meridian_SPK_module.wav" 
REM -TimeRange 0.0,0.0 
REM -fftsize 8192 
REM -TestLimits ".\limits\testlimit_AudioCalc_SPK_module_1of2.txt" 
REM -OutputFile "testOutput_AudioCalc_SPK_module_1of2.txt" 
REM -slave
AudioCalcConsoleApp2 -frequencyanalysis -PCMFileIn ".\recorded\Meridian_Coupling_8L_MIC3.wav" -LeftChannel -TimeRange 0.0,2.0 -fftsize 8192 -TestLimits ".\limits\testlimit_AudioCalc_Coupling_8L_LMIC3.txt" -OutputFile "testOutput_AudioCalc_Coupling_8L_LMIC3.txt" -TestHeaders ".\limits\testheader_AudioCalc_Coupling_8L_LMIC3.csv" -slave

COPY ".\histogram.csv" ".\datalog\histogram_Meridian_Coupling_8L_MIC3_L.csv" 
pause
:END_ACTIONS
echo ////////////////////////////////////////////////////////////////////  END_ACTIONS   

rem //////////////////////////////////////////////////////////////////// OUTPUT HANDLER
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
echo ////////////////////////////////////////////////////// TEST PASSED //////////////////////////////////////////////////////
goto:eof

:FAIL_MSG
echo ////////////////////////////////////////////////////// TEST FAILED //////////////////////////////////////////////////////
goto:eof
rem //////////////////////////////////OUTPUT HANDLER//////////////////////////////////////
 
rem //////////////////////////////////END OF SCRIPT//////////////////////////////////////



