@echo on
AudioCapConsoleApp.exe -OutputFile teststatus_AudioCapWide10s.txt -recdev "(Umik-1  Gain: 12dB ",0x2752,0x0007 -samfreq 16000 -bps 16 -channels 2 -size 160000 -PCMFileOut RecordedWide10s.wav -recvol 0.5 -slave

rem set oldname=RecordedWide10s.wav
rem Set FileFolderDate=MOTOR_%time:~0,2%%time:~3,2%%time:~6,2%_%date:~-10,2%%date:~-7,2%%date:~-4,4%
 
ECHO Making the copy...
 
rem copy C:\tstPlan\seqNum.xml C:\Users\tsoperator\Desktop\COMBINED_UTESTS\DATA\seqNum.xml
rem copy /y "%oldname%" C:\Users\tsoperator\Desktop\COMBINED_UTESTS\DATA\"%FileFolderDate%"%oldname%
rem del "%oldname%"
exit