@echo off 
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%LvregPath%
setLocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
COLOR 0B
Set Message=Stress Testing EEPROM DDR Ram Bytes.
:MAIN
echo %Message%
rem lvreg eeprom 0x200 0xff
SET Address_m=0x200
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x201 0xff
SET Address_m=0x201
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x202 0xff
SET Address_m=0x202
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x203 0xff
SET Address_m=0x203
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x204 0xff
SET Address_m=0x204
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x205 0xff
SET Address_m=0x205
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x206 0xff
SET Address_m=0x206
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x207 0xff
SET Address_m=0x207
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x208 0xff
SET Address_m=0x208
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x209 0xff
SET Address_m=0x209
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x20a 0xff
SET Address_m=0x20a
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x20b 0xff
SET Address_m=0x20b
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x20c 0xff
SET Address_m=0x20c
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x20d 0xff
SET Address_m=0x20d
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x20e 0xff
SET Address_m=0x20e
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x20f 0xff
SET Address_m=0x20f
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x210 0xff
SET Address_m=0x210
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x211 0xff
SET Address_m=0x211
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x212 0xff
SET Address_m=0x212
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
rem lvreg eeprom 0x213 0xff
SET Address_m=0x213
SET Value_m=0XFF
call VerifyEEPROMWrite %Address_m% %Value_m%
if %ERRORLEVEL% == 0 ( call :ColorText 0a "[OK] Cleared %Address_m%" ) else ( call :ColorText 0C  "[FAILED] Cleared %Address_m%")
echo return %errorlevel%
goto MAIN
exit /b %errorlevel%

 rem ===========================================================================================
:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
Echo.
goto :eof
rem ===========================================================================================
