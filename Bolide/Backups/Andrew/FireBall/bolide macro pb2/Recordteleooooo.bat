@echo on
AudioCapConsoleApp.exe -OutputFile teststatus_AudioCapTele10s.txt -recdev "Microphone (USB Audio CODEC )",0x08bb,0x29b0 -samfreq 16000 -bps 16 -channels 2 -size 160000 -PCMFileOut RecordedTele10s.wav -recvol 0.5 -slave

set oldname=RecordedTele10s.wav
Set FileFolderDate=MOTOR_%time:~0,2%%time:~3,2%%time:~6,2%_%date:~-10,2%%date:~-7,2%%date:~-4,4% 

ECHO Making the copy...

copy C:\tstPlan\seqNum.xml C:\Users\tsoperator\Desktop\COMBINED_UTESTS\DATA\seqNum.xml
copy /y "%oldname%" C:\Users\tsoperator\Desktop\COMBINED_UTESTS\DATA\"%FileFolderDate%"%oldname%
del "%oldname%"
exit