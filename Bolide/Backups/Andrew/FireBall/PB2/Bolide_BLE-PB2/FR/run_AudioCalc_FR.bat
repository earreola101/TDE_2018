@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
rem both %CD% and %~dp0 contain current directory of the batch file.
rem however, %CD% might change, such as CD command.
rem %~dp0 does not change, obtained from %0 which is the batch filename.
Set dirPath=%CD%
set outputFile=testOutput_AudioCalc_FR.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"

:START_ACTIONS
echo //////////////////////////////////////////////////////////////////// START OF SCRIPT  

:ACTIONS
echo //////////////////////////////////////////////////////////////////// ACTIONS     
rem -frequencyanalysis 
rem -PCMFileIn <filename>
rem -TimeRange <start in sec>,<length in sec>
rem -DumpWorstTHD <starting freq>,<ending freq>
rem -DumpWorstR&B <starting freq>,<ending freq>
rem -fftsize <power of 2>
rem -windowType <integer>
rem -LeftChannel
rem -RightChannel
rem -TestLimits <filename>
rem -TestHeaders <filename>
rem [ optional parameters ]
rem -sweep : output worst THD&RB rather than averaged THD&RB
rem 
..\AudioCalcConsoleApp2 -frequencyanalysis -PCMFileIn "%~dp012th&3rd Oct Sweep scaled 3.80641E+0  V FSD_cut3dB.wav" -fftsize 8192 -TestLimits "%~dp0testlimit_AudioCalc_FR.txt" -TestHeaders "%~dp0testheader_AudioCalc_FR.csv" -OutputFile "%~dp0testOutput_AudioCalc_FR.txt" -debug
ping 1.1.1.1 -n 1 -w 100 > nul
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
rem create directory and store files there
rem use sequence number to name subfolder
set /p SEQNUM=<C:\tstplan\seqnum.txt
set /p SNO=<C:\tstplan\SerialNum.txt
set BKDIR=%~dp0%SNO%_%SEQNUM%
rem 
if not exist "%BKDIR%" mkdir "%BKDIR%" 
move "%~dp0testOutput_AudioCalc_FR.txt" "%BKDIR%"
move "..\histogram.csv" "%BKDIR%"
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
