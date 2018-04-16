@echo off
REM 'AudioCalcConsoleApp2': WIN32 console application
REM '-advanced': spectrum analysis
REM '-statistics': same description as above
REM '-statistics': basic statistics
REM '-PCMFileIn <wave file>': target on this model of wave 
REM '-TimeRange <start>,<length>': all in unit of a second
REM '-fftsize <samples>': suggest 8192 for sample rate 48kHz, 4096 for 16kHz, etc.
REM '-TestLimits <testlimit_Template.txt modified and renamed>
REM '-LogFile <testheader file name>': header file for given test limits
REM '-debug': display text during process
AudioCalcConsoleApp2 -advanced -statistics -PCMFileIn ".\stimulus\12th&3rd Oct Sweep scaled 3.80641E+0  V FSD_cut3dB.wav" -TimeRange 0.0,0.0 -fftsize 8192 -TestLimits ".\limits\testlimit_AudioCalc_sweep.txt" -LogFile ".\limits\testheader_AudioCalc_sweep.csv" -debug

