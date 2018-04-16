@echo
set PATH=%PATH%;"C:\Program Files\Kinetic\kinetic\"

rem relay 1
lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,00
ksleep.exe %delayms%
rem relay 2
lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,10,00
ksleep.exe %delayms%
rem relay 3
lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,20,00

ksleep.exe %delayms%
rem relay 4
lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,40,00
ksleep.exe %delayms%