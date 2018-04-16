@echo off 
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%
rem Address:
rem      0x68: LSB of 4.8x calibration data (this is the same address)
rem      0x69: MSB of 4.8x calibration data (this is the same address)
rem      0x100: Flag to change algorithm ( value is 0x3a means use new one, others should be old one).
rem      0x101: LSB of 2x calibration data
rem      0x102: MSB of 2x calibration data
rem      0x103: LSB of 3x calibration data
rem      0x104: MSB of 3x calibration data

rem lvreg eeprom 0x200 0xff
SET Address_m=0x200
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( echo [OK]  Cleared %Address_m%) else ( echo [FAILED] Cleared %Address_m%)

echo return %errorlevel%
exit /b %errorlevel%