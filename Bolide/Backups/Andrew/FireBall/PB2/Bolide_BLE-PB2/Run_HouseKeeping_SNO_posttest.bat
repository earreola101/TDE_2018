@echo off
rem 
rem set _my_datetime=%date%_%time%
rem echo %_my_datetime%
rem pause
rem 
rem extract sequence number
rem http://stackoverflow.com/questions/3068929/how-to-read-file-contents-into-a-variable-in-a-batch-file
rem 
set /p SEQNUM=<C:\tstplan\seqnum.txt
set /p SNO=<C:\tstplan\SerialNumber.txt
rem 
rem create directory and store files there
rem 
rem use sequence number to name subfolder
rem mkdir backup\%SEQNUM%
rem 
rem use serial number and date&time stamp to name subfolder
set BKNAME=%SNO%_%date:~4,2%%date:~7,2%%date:~12,2%-%time:~0,2%%time:~3,2%%time:~6,2%
mkdir backup\%BKNAME%

copy recorded\*.wav backup\%BKNAME%
copy datalog\histogram*.csv backup\%BKNAME%

tdebt120.exe -s shipmode



rem 
rem exit /b 0
exit 0