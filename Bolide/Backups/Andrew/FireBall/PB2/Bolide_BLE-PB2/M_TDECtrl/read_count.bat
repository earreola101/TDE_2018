echo off
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%
set status=0
Lvreg eeprom read A9
Lvreg eeprom read A9
Lvreg eeprom read A9
Lvreg eeprom read A9 >>log.txt


echo.>>log.txt    
lvreg eeprom read A3 >>log.txt

echo.>>log.txt 
lvreg eeprom read A4 >>log.txt

echo.>>log.txt 
echo.>>log.txt
lvreg eeprom read A5 >>log.txt
echo.>>log.txt 
lvreg eeprom read A6 >>log.txt


exit %Status%