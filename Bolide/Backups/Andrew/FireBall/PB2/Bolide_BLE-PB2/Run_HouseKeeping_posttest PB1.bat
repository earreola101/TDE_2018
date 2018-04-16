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
rem 
rem create directory and store files there
rem 
mkdir backup\%SEQNUM%

copy recorded\*.wav backup\%SEQNUM%
copy datalog\histogram*.csv backup\%SEQNUM%





rem 
rem exit /b 0
exit 0