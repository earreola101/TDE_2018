@echo off 
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%




SET Address=0x66
call VerifyEEPROMWrite %Address% 0X00
if %ERRORLEVEL% == 0 ( echo [OK]  Cleared %Address%) else ( echo [FAILED] Cleared %Address%)

SET Address=0X64
call VerifyEEPROMWrite %Address% 0X00
if %ERRORLEVEL% == 0 ( echo [OK]  Cleared %Address%) else ( echo [FAILED] Cleared %Address%)

SET Address=0X65
call VerifyEEPROMWrite %Address% 0X00
if %ERRORLEVEL% == 0 ( echo [OK]  Cleared %Address%) else ( echo [FAILED] Cleared %Address%)

SET Address=0X68
call VerifyEEPROMWrite %Address% 0X00
if %ERRORLEVEL% == 0 ( echo [OK]  Cleared %Address%) else ( echo [FAILED] Cleared %Address%)

SET Address=0X69
call VerifyEEPROMWrite %Address% 0X00
if %ERRORLEVEL% == 0 ( echo [OK]  Cleared %Address%) else ( echo [FAILED] Cleared %Address% )

SET Address=0X6a
call VerifyEEPROMWrite %Address% 0X00
if %ERRORLEVEL% == 0 ( echo [OK]  Cleared %Address%) else ( echo [FAILED] Cleared %Address%)
 

echo return %errorlevel%
pause
exit /b %errorlevel%