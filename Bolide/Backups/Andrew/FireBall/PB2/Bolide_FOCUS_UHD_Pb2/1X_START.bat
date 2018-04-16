Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;"C:\Program Files\Kinetic\kinetic\"

lvreg testxu write 0x0a 0x08
ksleep 250

lvreg testxu write 0x0a 0x08
ksleep 250

lvreg testxu write 0x0a 0x08
ksleep 250
lvreg eeprom write 0xc8 0x00
ksleep 250
lvreg eeprom read 0xc8
ksleep 250
lvreg videoxu write 2 1
ksleep 250
lvreg videoxu write 2 1
ksleep 250
lvreg videoxu write 2 1
ksleep 250
exit 0





