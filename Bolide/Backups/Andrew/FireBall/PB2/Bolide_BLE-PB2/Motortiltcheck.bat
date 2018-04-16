@echo OFF
set Current_STATION=0
set Pass_STATION=0
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%
set PATH="C:\Program Files\Kinetic\kinetic\"
rem ----------------------------------------------- CONFIG MODIFY THIS  ONLY -----------------------------------------------
rem    lorry rui 12.8.2016
rem ----------------------------------------------- DONOT MODIFY BELOW THIS POINT  -----------------------------------
set Statusx=1
set PMTT_fileVar=motorCheck.txt
set tiltH_file=tilt_H.txt

set pan_readvalfile=pan.txt
set tilt_value=tiltvale.txt

rem ===== 2015.12.19  erro code==========

rem call "UltimatecontrolCmd.exe" /option:AudioVersion /inputfile:"pan.in" /outputfile:"pan.out"
rem call "Ultimatecontrolcmd.bat"

echo reading values A9 to file
Lvreg eeprom read A9 >%PMTT_fileVar%
Lvreg eeprom read A9 >%PMTT_fileVar%

echo checking values from file.
set /p pmts_readval=<%PMTT_fileVar%
echo %pmts_readval% 
if "%pmts_readval%"=="0X00" (
goto PASS
) else (
goto FAIL
) 
PAUSE

rem ////////////////////////////////////////////////////////////////////
echo try reading many times
LVREG.exe eeprom read 0xA4
LVREG.exe eeprom read 0xA4
LVREG.exe eeprom read 0xA4




set PATH=%PATH%;""
:PASS
echo pass 

echo set tde mode
lvreg testxu write A 8
rem for tilt
rem Lvreg eeprom read A4 >tilt_H.txt
rem Lvreg eeprom read A3 >tilt_L.txt
echo try reading y h and y l
FOR /F "delims=" %%i IN ('LVREG.exe eeprom read 0xA4') DO SET TILT_Y_H=%%i
SET FINALVAL_Y_H=%TILT_Y_H:~2%
ECHO [%FINALVAL_Y_H%]

FOR /F "delims=" %%i IN ('LVREG.exe eeprom read 0xA3') DO SET TILT_Y_L=%%i
SET FINALVAL_Y_L=%TILT_Y_L:~2%
SET FULL_VALUE=%FINALVAL_Y_H%%FINALVAL_Y_L%
 
FOR /F "delims=" %%i IN ('hex2dec.exe %FULL_VALUE%') DO SET FINAL_DEC=%%i
ECHO FINAL_DEC[%FINAL_DEC%]
SET TILT_X_VAL=%FINAL_DEC%



REM FOR /F "delims=" %%i IN ('LVREG.exe eeprom read 0xA4') DO SET TILT_X_H=%%i
REM FOR /F "delims=" %%i IN ('LVREG.exe eeprom read 0xA3') DO SET TILT_X_L=%%i
REM FOR /F "delims=" %%i IN ('hex2dec.exe %TILT_X_H%) DO SET TILT_X_VAL1=%%i
REM FOR /F "delims=" %%i IN ('hex2dec.exe %TILT_X_L%) DO SET TILT_X_VAL2=%%i
REM SET FINALVAL_X=%TILT_X_VAL1%%TILT_X_VAL2%


REM FOR /F "delims=" %%i IN ('twoByteToInt.exe %TILT_Y_H%') DO SET TILT_X_VAL=%%i


rem klogsend "motocheck value is correct [%TILT_Y_H% %TILT_Y_L%]"



ECHO %FINALVAL_Y%
echo done.

echo /////////////////////////set limit //////////////

set LowLimit=2000
set UpLimit=10000
set TargetLimit=3500


if %TILT_X_VAL% GTR %LowLimit% (
set Statusx=0
) else (
set Statusx=1
)

if %TILT_X_VAL% LSS %UpLimit% (
set Statusx=0
) else (
set Statusx=1
)


rem echo [Outputs]>>wifimac.txt
rem echo Status=%Status%>>wifimac.txt
rem echo ReturnCode=0>>wifimac.txt
rem echo Message=OK!>>wifimac.txt
rem echo Headers=wifimac>>wifimac.txt
rem echo Values=%TILT_X_VAL%>>wifimac.txt

echo ////////////////////////////////////////////



Del wifimac.txt
Del wifimac.in
echo %TILT_X_VAL% >wifimac.txt

COPY tilt.in wifimac.in
TDEBT-Analyzer.exe wifimac.in wifimac.txt
COPY wifimac.out tilt.out
rem call status.bat


exit %statusx%

rem ////////////////////////////////////////////////////////////////////



:FAIL
echo fail
klogsend "/////////////////////////////MOTOR CHECK TEST SUMMARY"
klogsend "MOTOR VALUE:%pmts_readval%"
klogsend "motorcheck value is not correct"
exit 1
