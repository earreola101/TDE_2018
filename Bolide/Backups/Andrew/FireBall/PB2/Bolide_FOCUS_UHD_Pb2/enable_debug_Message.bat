@echo off
Set Kinetic=C:\Program Files\kinetic\kinetic
Set PATH=%PATH%;%Kinetic%

lvreg register write 0x70c4 1
exit 0