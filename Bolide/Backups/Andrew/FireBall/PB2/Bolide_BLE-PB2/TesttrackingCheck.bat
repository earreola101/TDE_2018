@echo OFF
set status=0
set Current_STATION=2

rem ----------------------------------------------- CONFIG MODIFY THIS  ONLY -----------------------------------------------
rem
rem ----------------------------------------------- DONOT MODIFY BELOW THIS POINT  -----------------------------------

set PMTT_fileVar=%testtracking.txt


rem ===== 2014.8.1 ==========


tdebt.exe -g mfgstr>%PMTT_fileVar%

set /p pmts_readval=<%PMTT_fileVar%

if "%pmts_readval%" == "%Current_STATION%" (
exit %status%
) else if "%pmts_readval%" == "2" (
exit %status%
) else if "%pmts_readval%" == "3" (
exit %status%
) else if "%pmts_readval%" == "4" (
exit %status%
) else if "%pmts_readval%" == "5" (
exit %status%
) else if "%pmts_readval%" == "6" (
exit %status%
)

AllPowerOff.bat
exit 1