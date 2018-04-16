@echo OFF
set Current_STATION=0
set Pass_STATION=0
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%
set PATH="C:\Program Files\Kinetic\kinetic\"
rem ----------------------------------------------- CONFIG MODIFY THIS  ONLY -----------------------------------------------
rem    lorry rui 12.8.2016
rem ----------------------------------------------- DONOT MODIFY BELOW THIS POINT  -----------------------------------

set PMTT_fileVar=PTcode.txt


rem ===== 2015.12.19  erro code lorry rui==========

rem call "UltimatecontrolCmd.exe" /option:AudioVersion /inputfile:"pan.in" /outputfile:"pan.out"
rem call "Ultimatecontrolcmd.bat"
rem Lvreg eeprom read A9 > ptcode.txt
Lvreg eeprom read A9 >%PMTT_fileVar%
Lvreg eeprom read A9 >%PMTT_fileVar%



set /p pmts_readval=<%PMTT_fileVar%
echo %pmts_readval% 

Del wifimac.txt
Del wifimac.in
echo %pmts_readval% >wifimac.txt

COPY ptcode.in wifimac.in
TDEBT-Analyzer.exe wifimac.in wifimac.txt
COPY wifimac.out ptcode.out
rem call status.bat



if "%pmts_readval%"=="0X00" (
goto PASS
)
if "%pmts_readval%"=="0X01" (
goto tilt1
)
if "%pmts_readval%"=="0X02" (
goto tilt2
)
if "%pmts_readval%"=="0X10" (
goto pan1
)
if "%pmts_readval%"=="0X20" (
goto pan2
) 
if "%pmts_readval%"=="0X03" (
goto tilt3
) 
if "%pmts_readval%"=="0X32" (
goto tilt4
) 
if "%pmts_readval%"=="0X33" (
goto tilt5
) 

if "%pmts_readval%"=="0X30" (
goto pan3
) else (
goto fail
)



rem ////////////////////////////////////////////////////////////////////






:PASS
echo pass 
klogsend "/////////////////////////////MOTOR good"

exit 0

:tilt1
echo fail
klogsend "/////////////////////////////MOTOR tilt down error"
exit 1

:tilt2
echo fail
klogsend "/////////////////////////////MOTOR tilt Up error"
exit 1

:tilt3
echo fail
klogsend "/////////////////////////////MOTOR tilt up and down both error"
exit 1

:tilt4
echo fail
klogsend "/////////////////////////////MOTOR tilt up ,pan left and right both error"
exit 1

:tilt5
echo fail
klogsend "/////////////////////////////MOTOR tilt up & down,pan left and right both error"
exit 1

:pan1
echo fail
klogsend "/////////////////////////////MOTOR pan right error"
pasue
exit 1

:pan2
echo fail
klogsend "/////////////////////////////MOTOR pan left error"
exit 1

:pan3
echo fail
klogsend "/////////////////////////////MOTOR pan left and right  error"
exit 1

:FAIL
echo fail
klogsend "/////////////////////////////MOTOR CHECK TEST SUMMARY"
klogsend "MOTOR error the value is VALUE:%pmts_readval%"
klogsend "motorcheck value is not correct"
exit 1
