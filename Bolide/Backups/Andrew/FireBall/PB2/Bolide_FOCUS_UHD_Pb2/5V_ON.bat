Set PATH=%PATH%;"C:\Program Files\Kinetic\kinetic\"
RS232V6_line.exe COM1 "VOLT 12;CURR 1.5"
ksleep 10000

lvreg testxu write 0x0a 0x08
ksleep 250
lvreg testxu write 0x0a 0x08
ksleep 250

lvreg eeprom write 0x86 0x00
ksleep 250
lvreg eeprom write 0x87 0x00
ksleep 250




rem //Gamma OFF
lvreg testxu write 0x10 0


exit %Status%
