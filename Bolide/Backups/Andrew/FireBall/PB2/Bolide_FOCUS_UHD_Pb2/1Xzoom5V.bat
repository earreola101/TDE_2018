echo on
Rem inside file:Test.bat
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%
Set RETRYNUM=0
@Echo EasyVideoCmd Start time: %time%  

LVREG.EXE testxu write 0x0a 0x08
ping -n 2 127.0.0.1>nul

:recheck
set /A RETRYNUM=%RETRYNUM%+1
EasyVideoCmd.exe /Option:Set /Device:"USB Video Device" /Property:"Focus" /Cur:3 /Duration:1000
if %errorlevel% == 0 (
    echo usb device found
) else (
   REM TIMEOUT /T 5
   echo usb device not found
   call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state off"
   ping -n 2 127.0.0.1>nul
   call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state on"
   call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 5"
   call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1.2"
   ping -n 15 127.0.0.1>nul
   REM set /A RETRYNUM=%RETRYNUM%+1
   IF %RETRYNUM% GTR 3 GOTO END
    goto recheck
)
ping -n 2 127.0.0.1>nul
EasyVideoCmd.exe /Option:Set /Device:"USB Video Device" /Property:"ZOOM" /Cur:200 /Duration:1000
Rem timeout /t 1 >nul
ping -n 2 127.0.0.1>nul
Set RETRYNUM=0
:recheck1
set /A RETRYNUM=%RETRYNUM%+1
EasyVideoCmd.exe /Option:Set /Device:"USB Video Device" /Property:"ZOOM" /Cur:100 /Duration:1000
if %errorlevel% == 0 (
    echo usb device found
) else (
   REM TIMEOUT /T 5
   echo usb device not found
   call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state off"
   ping -n 2 127.0.0.1>nul
   call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state on"
   call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 5"
   call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1.2"
   ping -n 15 127.0.0.1>nul
   REM set /A RETRYNUM=%RETRYNUM%+1
   IF %RETRYNUM% GTR 3 GOTO END
    goto recheck1
)
ping -n 2 127.0.0.1>nul


exit 0