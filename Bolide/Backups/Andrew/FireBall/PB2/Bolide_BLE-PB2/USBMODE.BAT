@echo off 

tdebt.exe -s device_mode 1 1
ksleep 500
tdebt.exe -s device_mode 2 0
ksleep 500
tdebt.exe -s device_mode 4 1

exit 0