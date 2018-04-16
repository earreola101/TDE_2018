@echo off 
rem set PATH=%PATH%;"C:\Windows\System32"%~dp0
rem //////////////////////////////////VARIBLES//////////////////////////////////////
Set dirPath=%CD%
set outputFile=testOutput_AudioCalc_SPK_8L_FR.txt
set STATUS=3
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
AudioCalcConsoleApp2 -frequencyanalysis -PCMFileIn ".\recorded\Meridian_SPK_8L_FR.wav" -TimeRange 0.0,5.0 -fftsize 8192 -TestLimits ".\limits\testlimit_AudioCalc_SPK_8L_FR.txt" -OutputFile "testOutput_AudioCalc_SPK_8L_FR.txt" -TestHeaders ".\limits\testheader_AudioCalc_SPK_8L_FR.csv" -slave
echo [%errorlevel%]

REM AudioCalcConsoleApp2 -frequencyanalysis -PCMFileIn ".\recorded\Meridian_SPK_8L_FR.wav" -TimeRange 0.0,5.0 -fftsize 8192 -TestLimits ".\limits\testlimit_AudioCalc_SPK_8L_FR.txt" -OutputFile "testOutput_AudioCalc_SPK_8L_FR.txt" -TestHeaders ".\limits\testheader_AudioCalc_SPK_8L_FR.csv" -slave
REM MOVE ".\histogram.csv" ".\datalog\C2_SPK_8L_FR_histogram.csv" 
COPY ".\testOutput_AudioCalc_SPK_8L_FR.txt" ".\datalog\histogram_Meridian_SPK_8L_FR.csv"
ping 1.1.1.1 -n 1 -w 100 > nul

COPY ".\histogram.csv" ".\datalog\histogram_Meridian_SPK_8L_FR.csv" 


rem set /p serial=<C:\tstplan\SERIAL_NUMBER.txt
rem echo %serial%
rem mkdir "%~dp0backup\%serial%\"
rem copy "%~dp0recorded\Meridian_SPK_8L_FR.wav" "%~dp0backup\%serial%\Meridian_SPK_8L_FR.wav" /Y
rem copy "%~dp0datalog\histogram_Meridian_SPK_8L_FR.csv" "%~dp0backup\%serial%\" /Y
rem echo [%errorlevel%]





REM IF %SNO%=="" (
REM SET SNO=9999
)
REM ECHO ME[%PAUSE%]
rem set BKNAME=%SNO%_%SEQNUM%

REM PAUSE
REM copy "C:\Users\TE\Desktop\Meridian_audiobt_PB2\recorded\*.*" "C:\Users\TE\Desktop\Meridian_audiobt_PB2\backup\%SNO%\"
REM PAUSE
REM copy "C:\Users\TE\Desktop\Meridian_audiobt_PB2\datalog\*.*" "C:\Users\TE\Desktop\Meridian_audiobt_PB2\backup\%SNO%\"
REM PAUSE
rem C:\Users\TE\Desktop\Meridian_audiobt_PB2\backup

rem echo my["%~dp0recorded\Meridian_SPK_8L_FR.wav" "%~dp0backup\%BKNAME%\Meridian_SPK_8L_FR.wav"]



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



