rem @echo OFF
set status=0
set Current_STATION=2
set Pass_STATION=0

rem ----------------------------------------------- CONFIG MODIFY THIS  ONLY -----------------------------------------------
rem
rem ----------------------------------------------- DONOT MODIFY BELOW THIS POINT  -----------------------------------

set PMTT_fileVar=%testtracking.txt


rem ===== 2014.8.1 ==========

set /a Pass_STATION=%Current_STATION%+1

tdebt.exe -s mfgstr %Pass_STATION%



exit %status%