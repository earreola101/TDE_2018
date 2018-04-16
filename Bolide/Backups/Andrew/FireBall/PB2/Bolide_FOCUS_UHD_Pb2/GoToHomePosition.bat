Set EasyAVRuntimeEnginePath="c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%
EasyVideoCmd.exe /Option:Set /Device:"Logitech BRIO"  /Property:"ZOOM" /Cur:100 /Duration:1000
rem pause
Exit %errorLevel%%