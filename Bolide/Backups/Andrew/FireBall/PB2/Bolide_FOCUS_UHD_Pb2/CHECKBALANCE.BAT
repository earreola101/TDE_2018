@echo on 
rem This script will save the mtf steps to eeprom
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%

rem inputs
set EEPROM_ADDRESS_MTFFAR=0x00
set /p MTF_FAR_VAL=<C:\tstPlan\VCM\MTF_FAR.txt

set EEPROM_ADDRESS_MTFNEAR=0x01
set /p MTF_NEAR_VAL=<C:\tstPlan\VCM\MTF_NEAR.txt
exit 0
rem do the writing and reading if zero fail
lvreg.exe eeprom write %EEPROM_ADDRESS_MTFFAR% %MTF_FAR_VAL%
lvreg.exe eeprom write %EEPROM_ADDRESS_MTFFAR% %MTF_FAR_VAL%
lvreg.exe eeprom read %EEPROM_ADDRESS_MTFFAR% >tmpFile
lvreg.exe eeprom read %EEPROM_ADDRESS_MTFFAR% >tmpFile
set /p val2=<tmpFile
del tmpFile
Echo val2=%val2%

lvreg.exe eeprom write %EEPROM_ADDRESS_MTFNEAR% %MTF_NEAR_VAL%
lvreg.exe eeprom write %EEPROM_ADDRESS_MTFNEAR% %MTF_NEAR_VAL%
lvreg.exe eeprom read %EEPROM_ADDRESS_MTFNEAR% >tmpFile
lvreg.exe eeprom read %EEPROM_ADDRESS_MTFNEAR% >tmpFile
set /p val2=<tmpFile
del tmpFile
Echo val2=%val2%
set status=0









rem Set Value=6
rem if not "%Status%"=="0"  exit %status%
