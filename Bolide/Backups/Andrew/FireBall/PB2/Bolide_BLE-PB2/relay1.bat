@echo
set PATH=%PATH%;"C:\Program Files\Kinetic\kinetic\"

rem relay 1
lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,08,08
ksleep.exe %delayms%
rem relay 2
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,10,10
ksleep.exe %delayms%
rem relay 3
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,20,20

ksleep.exe %delayms%
rem relay 4
rem lvhidw.exe 0x046d 0xfa01 5 write 10,ff,80,02,03,40,40
ksleep.exe %delayms%