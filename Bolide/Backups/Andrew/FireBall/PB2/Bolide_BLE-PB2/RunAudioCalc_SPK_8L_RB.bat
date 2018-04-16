@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
Set dirPath=%CD%
set outputFile=testOutput_AudioCalc_SPK_8L_RB.txt
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
AudioCalcConsoleApp2 -advanced -PCMFileIn ".\recorded\Meridian_SPK_8L_RB.wav" -TimeRange 0.0,5.0 -fftsize 8192 -TestLimits ".\limits\testlimit_AudioCalc_SPK_8L_RB.txt" -OutputFile "testOutput_AudioCalc_SPK_8L_RB.txt" -TestHeaders ".\limits\testheader_AudioCalc_SPK_8L_RB.csv" -slave
COPY ".\histogram.csv" ".\datalog\histogram_Meridian_SPK_8L_RB.csv" 
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


rem ===== Beging 30-Dec-2014 Henry: Data collection only for Rub and Buzz test
set STATUS=0
rem ===== End 30-Dec-2014 Henry


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



