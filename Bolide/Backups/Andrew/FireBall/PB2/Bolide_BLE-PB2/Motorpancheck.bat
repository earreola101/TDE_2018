@echo OFF
set Current_STATION=0
set Pass_STATION=0
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%
set PATH="C:\Program Files\Kinetic\kinetic\"
rem ----------------------------------------------- CONFIG MODIFY THIS  ONLY -----------------------------------------------
rem    lorry rui 12.8.2016
rem ----------------------------------------------- DONOT MODIFY BELOW THIS POINT  -----------------------------------

set PMTT_fileVar=motorCheck.txt
set tiltH_file=tilt_H.txt

set pan_readvalfile=pan.txt
set tilt_value=tiltvale.txt

rem ===== 2015.12.19  erro code==========

rem call "UltimatecontrolCmd.exe" /option:AudioVersion /inputfile:"pan.in" /outputfile:"pan.out"
rem call "Ultimatecontrolcmd.bat"
Lvreg eeprom read A9 >%PMTT_fileVar%
Lvreg eeprom read A9 >%PMTT_fileVar%



set /p pmts_readval=<%PMTT_fileVar%
echo %pmts_readval% 
if "%pmts_readval%"=="0X00" (
goto PASS
) else (
goto FAIL
) 


rem ////////////////////////////////////////////////////////////////////



LVREG.exe eeprom read 0xA6
LVREG.exe eeprom read 0xA6
LVREG.exe eeprom read 0xA6





:PASS
echo pass 

echo set tde mode
lvreg testxu write A 8
rem for tilt
rem Lvreg eeprom read A4 >tilt_H.txt
rem Lvreg eeprom read A3 >tilt_L.txt
echo try reading y h and y l
FOR /F "delims=" %%i IN ('LVREG.exe eeprom read 0xA6') DO SET TILT_Y_H=%%i
SET FINALVAL_Y_H=%TILT_Y_H:~2%
ECHO [%FINALVAL_Y_H%]

FOR /F "delims=" %%i IN ('LVREG.exe eeprom read 0xA5') DO SET TILT_Y_L=%%i
SET FINALVAL_Y_L=%TILT_Y_L:~2%
SET FULL_VALUE=%FINALVAL_Y_H%%FINALVAL_Y_L%
 
FOR /F "delims=" %%i IN ('hex2dec.exe %FULL_VALUE%') DO SET FINAL_DEC=%%i
ECHO FINAL_DEC[%FINAL_DEC%]
SET TILT_X_VAL=%FINAL_DEC%


echo /////////////////////////set limit //////////////
set Status=1
set LowLimit=10000
set UpLimit=25000
set TargetLimit=13500


if %TILT_X_VAL% GTR %LowLimit% (
set Status=0
) else (
set Status=1
)

if %TILT_X_VAL% LSS %UpLimit% (
set Status=0
) else (
set Status=1
)


rem echo [iutputs]>>pan.in
rem echo Option=%Status%>>pan.in
rem echo MovingDelay=4000>>pan.in
rem echo outputFile=wifimac.out>>pan.in
rem echo byte1=01>>pan.in
rem echo Headers=pan>>pan.in
rem echo LowLimit=0>>pan.in
rem echo UpLimit=6000>>pan.in
rem echo Values=>>pan.in
rem echo LogFile=test.log>>pan.in
rem echo VarResultSummary^=>>pan.in





echo ////////////////////////////////////////////




rem ////////////////////////////////////////////////////////////////////
Del wifimac.txt
Del wifimac.in
echo %TILT_X_VAL% >wifimac.txt

COPY pan.in wifimac.in
TDEBT-Analyzer.exe wifimac.in wifimac.txt
COPY wifimac.out pan.out

exit %status%


:FAIL
echo fail
klogsend "/////////////////////////////MOTOR CHECK TEST SUMMARY"
klogsend "MOTOR VALUE:%pmts_readval%"
klogsend "motorcheck value is not correct"
exit 1
