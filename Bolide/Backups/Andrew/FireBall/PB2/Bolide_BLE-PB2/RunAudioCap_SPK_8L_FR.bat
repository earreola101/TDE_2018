@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
Set dirPath=%CD%
set outputFile=testOutput_AudioCap_SPK_8L_FR.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"

SET MeridianSPK="Echo Cancelling Speakerphone (2- USB Audio Device)",0x46d,0x867
SET MeridianMIC="Echo Cancelling Speakerphone (2- USB Audio Device)",0x46d,0x867
SET FixtureSPK="Echo Cancelling Speakerphone (2- USB Audio Device)",0x46d,0x867
SET FixtureMIC="Echo Cancelling Speakerphone (2- USB Audio Device)",0x46d,0x867

:START_ACTIONS
echo //////////////////////////////////////////////////////////////////// START OF SCRIPT  

:ACTIONS
echo //////////////////////////////////////////////////////////////////// ACTIONS    
tdebt_135 -s audio_dsp 2
ping 1.1.1.1 -n 1 -w 100 > nul
tdebt_135 -s audio_ch 1
ping 1.1.1.1 -n 1 -w 100 > nul    
REM AudioCapConsoleApp 
REM -test speaker 
REM -playdev %MeridianSPK% 
REM -recdev %FixtureMIC% 
REM -soundsource ".\stimulus\SweepTone SPKR THD R&B _6000Hz_100Hz_-3dBFS_5s.wav" 
REM -PCMFileOut ".\recorded\Meridian_SPK_8L.wav" 
REM -recvol 0.05 
REM -playvol 0.5 
REM -samfreq 48000 
REM -bps 16 
REM -channels 1 
REM -sampleTime 5.0 
REM -OutputFile "testOutput_AudioCap_SPK_8L.txt" 
REM -slave 


AudioCapConsoleApp -test speaker -playdev %MeridianSPK% -recdev %FixtureMIC% -soundsource ".\stimulus\SweepTone SPKR FR THD_18000Hz_100Hz_-3dBFS_5s.wav" -PCMFileOut ".\recorded\Meridian_SPK_8L_FR.wav" -recvol 0.3 -playvol 0.3 -samfreq 32000 -bps 16 -channels 2 -sampleTime 5.0 -OutputFile "testOutput_AudioCap_SPK_8L_FR.txt" -slave 

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



