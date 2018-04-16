@echo off 
SET MarinerSPK="Echo Cancelling Speakerphone",0x46d,0x84c
SET MarinerMIC="Echo Cancelling Speakerphone",0x46d,0x84c
SET FixtureSPK="Echo Cancelling Speakerphone",0x46d,0x846
SET FixtureMIC="Microphone USB Audio Device",0x46d,0x80c
REM 
REM 'AudioCapConsoleApp': WIN32 console application
REM '-test speaker': or '-test microphone'
REM '-playdev %MarinerSPK%': speaker friendlyname 
REM '-recdev %FixtureMIC%': microphone friendlyname
REM '-soundsource <wave file>': stimulus wave filename
REM '-PCMFileOut <wave file>': record wave filename
REM '-recvol <floating value>': microphone volume, 0=min, 1.0=max
REM '-playvol <floating value>': speaker volume, 0=min, 1.0=max 
REM '-samfreq <sample frequency>': sample frequency support by microphone
REM '-bps <integer>': bit depth support by microphone, either 16 or 8
REM '-channels <integer>': number of channels support by microphone, 1=mono, 2=stereo
REM '-sampleTime <float value>': sample length in second
REM '-OutputFile <file name>': status output file
REM '-debug : display text during process
AudioCapConsoleApp -test speaker -playdev %MarinerSPK% -recdev %FixtureMIC% -soundsource ".\stimulus\12th&3rd Oct Sweep scaled 3.80641E+0  V FSD_cut3dB.wav" -PCMFileOut ".\recorded\SPK_12th&3rd Oct Sweep scaled 3.80641E+0  V FSD.wav" -recvol 0.7 -playvol 0.9 -samfreq 48000 -bps 16 -channels 1 -sampleTime 2.60 -OutputFile "testOutput_AudioCap_SPK_sweep.txt" -debug 
