@echo off
SET PATH="%CD%\HDMI_4K_Volt_LineTest\";"%CD%\HDMI_4K_Volt_LineTest\tool\";"%CD%\HDMI_4K_Volt_LineTest\inout\";"C:\Python27\";"C:\Program Files\Kinetic\kinetic\";
echo %PATH%
echo "Generating UHD frames"
StartStream.exe 6 0 output 28 0
HDMI_TestModule.py
set res=%errorlevel%
ksleep.exe 5000
exit %res%

