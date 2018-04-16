@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
Set dirPath=%CD%
set outputFile=testOutput_AudioCap_MIC_8L.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"

SET MeridianSPK="Echo Cancelling Speakerphone",0x46d,0x867
SET MeridianMIC="Echo Cancelling Speakerphone",0x46d,0x867
SET FixtureSPK="Echo Cancelling Speakerphone",0x46d,0x867
SET FixtureMIC="Microphone (3- USB Audio Device)",0x8bb,0x29b0

rem SET FixtureSPK="Speakers (JBL Pebbles)",0x05fc,0x0231
rem SET DeviceMIC="Microphone (C922 Pro Stream Webcam)",0x046d,0x085c
rem SET DeviceMIC="Microphone (Logitech MeetUp Speakerphone)",0x046d,0x0867


:START_ACTIONS
echo //////////////////////////////////////////////////////////////////// START OF SCRIPT  

:ACTIONS
echo //////////////////////////////////////////////////////////////////// ACTIONS        
REM 
tdebt120 -s audio_dsp 1
REM 
REM AudioCapConsoleApp 
REM -test microphone 
REM -playdev %FixtureSPK% 
REM -recdev %MarinerMIC% 
REM -soundsource ".\stimulus\SweepTone SPKR THD R&B _6000Hz_100Hz_-3dBFS_5s.wav" 
REM -PCMFileOut ".\recorded\Mariner_MIC_8L.wav" 
REM -recvol 0.5 
REM -playvol 0.5 
REM -samfreq 32000 
REM -bps 16 
REM -channels 2 
REM -sampleTime 5.0 
REM -OutputFile "testOutput_AudioCap_MIC_8L.txt" 
REM -slave 
AudioCapConsoleApp -test microphone -playdev %FixtureSPK% -recdev %MarinerMIC% -soundsource ".\stimulus\SweepTone MIC FR THD_10000Hz_100Hz_-3dBFS_3s.wav" -PCMFileOut ".\recorded\Mariner_MIC_8L.wav" -recvol 0.4 -playvol 0.4 -samfreq 32000 -bps 16 -channels 2 -sampleTime 3.0 -OutputFile "testOutput_AudioCap_MIC_8L.txt" -slave 

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



