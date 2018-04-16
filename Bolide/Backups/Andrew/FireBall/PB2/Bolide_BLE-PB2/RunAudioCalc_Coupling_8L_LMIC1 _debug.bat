@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
Set dirPath=%CD%
set outputFile=testOutput_AudioCalc_Coupling_8L_LMIC1.txt
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
pause
AudioCalcConsoleApp2 -frequencyanalysis -PCMFileIn ".\recorded\Meridian_Coupling_8L_MIC1.wav" -LeftChannel -TimeRange 0.0,5.0 -fftsize 8192 -TestLimits ".\limits\testlimit_AudioCalc_Coupling_8L_LMIC1.txt" -OutputFile "testOutput_AudioCalc_Coupling_8L_LMIC1.txt" -TestHeaders ".\limits\testheader_AudioCalc_Coupling_8L_LMIC1.csv" -slave
pause
COPY ".\histogram.csv" ".\datalog\histogram_Meridian_Coupling_8L_MIC1_L.csv" 
pause
rem pause
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
rem pause
IF (%STATUS%)==(0) call:PASS_MSG
rem 
IF (%STATUS%)==(1) call:FAIL_MSG
rem

set /p SEQNUM=<C:\tstplan\seqnum.txt
REM set /p SNO=<C:\tstplan\SerialNum.txt
REM set BKDIR=%~dp0backup\%SNO%_%SEQNUM%
set BKDIR=%~dp0backup\%SEQNUM%
REM set BKDIR=%~dp0backup\%SNO%
rem echo %BKDIR%
if not exist "%BKDIR%" mkdir "%BKDIR%" 
rem MOVE ".\recorded\Meridian_SPKR_LPRB.wav" "%BKDIR%"
rem MOVE ".\recorded\Meridian_SPKR_LPRB_HiPass_50hz.wav" "%BKDIR%"
rem MOVE ".\RubNoiseIndex.CSV" "%BKDIR%" 
rem MOVE ".\NoiseProfile.CSV" "%BKDIR%"
pause 
COPY ".\recorded\Meridian_Coupling_8L_MIC1.wav" "%BKDIR%"
COPY ".\datalog\histogram_Meridian_Coupling_8L_MIC1_L.csv" "%BKDIR%"
rem MOVE "%BKDIR%\testOutput_AudioFilter_SPKR_HiPass_50hz.txt" "%BKDIR%\testOutput_AudioFilter_SPKR_HiPass_50hz.csv"
rem MOVE "%BKDIR%\testOutput_AudioCalc_SPK_LPRB.txt" "%BKDIR%\testOutput_AudioCalc_SPK_LPRB.csv"
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



