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
AudioCalcConsoleApp2 -advanced -statistics -PCMFileIn ".\stimulus\Sinewave_1000Hz.wav" -TimeRange 0.0,0.0 -fftsize 8192 -TestLimits ".\limits\testlimit_AudioCalc_1000Hz.txt" -LogFile ".\limits\testheader_AudioCalc_1000Hz.csv" -debug
