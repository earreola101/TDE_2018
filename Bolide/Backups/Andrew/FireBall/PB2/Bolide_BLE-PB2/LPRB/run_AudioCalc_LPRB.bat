@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
Set dirPath=%CD%
set outputFile=testOutput_AudioCalc_LPRB.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"

:START_ACTIONS
echo //////////////////////////////////////////////////////////////////// START OF SCRIPT  

:ACTIONS
echo //////////////////////////////////////////////////////////////////// ACTIONS     
AudioFilterConsoleApp -PCMFileIn ".\recorded\Meridian_LPRB.wav" -highpass -butterworth -loCut 50 -order 5 -OutputFile ".\testOutput_AudioFilter_LPRB_HiPass_50hz.txt" -slave 
MOVE ".\Meridian_LPRB_filtered.wav" ".\recorded\Meridian_LPRB_HiPass_50hz.wav"
ping 1.1.1.1 -n 1 -w 500 > nul
rem 
AudioCalcConsoleApp2 -noise 50,1000 -KernelRange 1500,10000 -fftSize 1024 -PCMFileIn ".\recorded\Meridian_LPRB_HiPass_50Hz.wav" -TestLimits ".\limits\testlimit_AudioCalc_LPRB.csv" -OutputFile "testOutput_AudioCalc_LPRB.txt" -slave
ping 1.1.1.1 -n 1 -w 500 > nul
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

rem ===========================================================
set /p SEQNUM=<C:\tstplan\seqnum.txt
set /p SNO=<C:\tstplan\SerialNum.txt
set BKDIR=%SNO%_%SEQNUM%
rem 
if not exist "%~dp0backup\%BKDIR%" mkdir "%~dp0backup\%BKDIR%" 
copy ".\testOutput_AudioCalc_LPRB.txt" "%~dp0backup\%BKDIR%"
move ".\recorded\Meridian_LPRB.wav" "%~dp0backup\%BKDIR%"
move ".\recorded\Meridian_LPRB_HiPass_50hz.wav" "%~dp0backup\%BKDIR%"
move ".\testOutput_AudioFilter_LPRB.txt" "%~dp0backup\%BKDIR%\testOutput_AudioFilter_LPRB.csv"
move "%~dp0backup\%BKDIR%\testOutput_AudioCalc_LPRB.txt" "%~dp0backup\%BKDIR%\testOutput_AudioCalc_LPRB.csv"
move ".\RubNoiseIndex.csv" "%~dp0backup\%BKDIR%"
move ".\NoiseProfile.csv" "%~dp0backup\%BKDIR%"
rem ===========================================================

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



