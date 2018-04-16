Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
set WorkingPath=0;
cd /d %~dp0
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%,%~dp0

set status=1
echo bluetooth pairing test
tdebt_127.exe -s btclear_paired_dev

set status=0

exit %status%


