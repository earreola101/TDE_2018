@echo off 

tdebt.exe -s device_mode 1 0
ksleep 500
tdebt.exe -s device_mode 2 1
ksleep 500
tdebt.exe -s device_mode 4 1

ksleep 500
exit 0