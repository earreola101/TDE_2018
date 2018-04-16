@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
Set dirPath=%CD%
set outputFile=testOutput_AudioCalc_SPKR_BuzzNoise.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"

:START_ACTIONS
echo //////////////////////////////////////////////////////////////////// START OF SCRIPT  

:ACTIONS
echo //////////////////////////////////////////////////////////////////// ACTIONS     
rem AudioFilterConsoleApp 
rem -PCMFileIn ".\recorded\C2_SPKR_LPRB.wav" 
rem -highpass 
rem -butterworth 
rem -loCut 4000 
rem -order 5 
rem -OutputFile ".\testOutput_AudioFilter_SPKR_HiPass_4000hz.txt" 
rem -slave 
AudioFilterConsoleApp -PCMFileIn ".\recorded\C2_SPKR_LPRB.wav" -highpass -butterworth -loCut 4000 -order 5 -OutputFile ".\testOutput_AudioFilter_SPKR_HiPass_4000hz.txt" -slave 
MOVE ".\C2_SPKR_LPRB_filtered.wav" ".\recorded\C2_SPKR_LPRB_HiPass_4000hz.wav"
ping 1.1.1.1 -n 1 -w 500 > nul
rem 
rem AudioCalcConsoleApp2 
rem -buzz 50,4000 
rem -KernelRange 4000,10000 
rem -fftSize 1024 
rem -PCMFileIn ".\recorded\C2_SPKR_LPRB_HiPass_4000hz.wav" 
rem -TestLimits ".\limits\testlimit_SPKR_BuzzNoise.csv" 
rem -OutputFile "testOutput_AudioCalc_SPKR_BuzzNoise.txt" 
rem -slave
AudioCalcConsoleApp2 -buzz 50,4000 -KernelRange 4000,10000 -fftSize 1024 -PCMFileIn ".\recorded\C2_SPKR_LPRB_HiPass_4000hz.wav" -TestLimits ".\limits\testlimit_SPKR_BuzzNoise.csv" -OutputFile "testOutput_AudioCalc_SPKR_BuzzNoise.txt" -slave
MOVE ".\BuzzNoiseIndex.CSV" ".\datalog\C2_SPKR_BuzzNoise.csv" 
COPY ".\testOutput_AudioCalc_SPKR_BuzzNoise.txt" ".\datalog\"
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


rem ===== Added by Henry for completed test tracking by removing post-housekeeping============
set /p SEQNUM=<C:\tstplan\seqnum.txt
set /p SNO=<C:\tstplan\SerialNum.txt
rem 
rem create directory and store files there
rem 
rem use sequence number to name subfolder
rem mkdir backup\%SEQNUM%
rem copy recorded\*.wav backup\%SEQNUM%
rem copy datalog\histogram*.csv backup\%SEQNUM%
rem
rem use serial number and date&time stamp to name subfolder
rem set BKNAME=%SNO%_%date:~4,2%%date:~7,2%%date:~12,2%-%time:~0,2%%time:~3,2%%time:~6,2%
set BKNAME=%SNO%_%SEQNUM%
rem mkdir backup\%BKNAME%

rem echo %SNO%
rem echo %BKNAME%
rem pause
copy recorded\C2_SPKR_LPRB_HiPass_4000hz.wav backup\%BKNAME%
copy testOutput_AudioFilter_SPKR_HiPass_4000hz.txt backup\%BKNAME%
copy datalog\testOutput_AudioCalc_SPKR_BuzzNoise.txt backup\%BKNAME%
copy datalog\C2_SPKR_BuzzNoise.csv backup\%BKNAME%
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



