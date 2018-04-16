Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;"C:\Program Files\Kinetic\kinetic\"

rem call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state On"
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 5"
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="current 1"
lvreg testxu write 0x0a 0x08
ksleep 250
lvreg testxu write 0x0a 0x08
ksleep 250
lvreg testxu write 0x0a 0x08
ksleep 250
lvreg testxu write 0x0a 0x08
ksleep 250

lvreg eeprom write 0xc0 0x00
ksleep 250
lvreg eeprom write 0xc1 0x00
ksleep 250
lvreg eeprom write 0xc2 0x00
ksleep 250
lvreg eeprom write 0xc3 0x00
ksleep 250
lvreg eeprom write 0xc4 0x00
ksleep 250
lvreg eeprom write 0xc5 0x00
ksleep 250
lvreg eeprom write 0xc8 0x00
ksleep 250







exit %Status%
