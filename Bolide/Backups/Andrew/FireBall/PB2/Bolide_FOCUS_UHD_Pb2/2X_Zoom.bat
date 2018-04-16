Rem inside file:Test.bat
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
rem Set EasyAVRuntimeEnginePath=m:\video\Tools\Windows\VideoOnly\DirectShowDLL-Multiple\EasyVideoCOM\Tools\EasyVideoCmd\Build\Debug-Unicode\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%
@Echo EasyVideoCmd Start time: %time%  

EasyVideoCmd.exe /Option:Set /Device:"USB Video Device"  /Property:"Focus" /Cur:3 /Duration:1000
echo GOING INTO TDE MODE
LVREG.EXE testxu write 0x0a 0x08
timeout /t 1 >nul
LVREG.EXE testxu write 0x0a 0x08
timeout /t 1 >nul
EasyVideoCmd.exe /Option:Set /Device:"USB Video Device"  /Property:"ZOOM" /Cur:200 /Duration:1000

Echo EasyVideoCmd Finished time: %time%  
rem EasyVideoCmd.exe /Option:Run /Device:"USB Video Device"  /ExitPause:False /Property:"PanRelative" /SetCur:1 /Duration:2000
@Echo UltimateSCPICmd Start time: %time%  
rem UltimateSCPICmd.exe 
rem ================================================================================
rem EasyVideoCmd.exe /Option:Run /Device:"USB Video Device"   /InputFile:"EasyDAQCmd.in" /outputFile:"EasyDAQCmd.out"

