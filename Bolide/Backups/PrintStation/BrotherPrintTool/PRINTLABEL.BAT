@echo off
Set PATH=%PATH%;"C:\Program Files\Kinetic\kinetic\";%CD%;"C:\tstPlan\";"C:\Python27\"
echo "Printing Label"
set /p Ethernet_Macaddress=<"C:\tstPlan\ETHERNET_MACADDRESS.txt"

python run.py %Ethernet_Macaddress%

echo -------[%Ethernet_Macaddress%]
rem /////// add print label command below /////
echo -------[START]-------
rem TDE_PrintLabel.exe Fireball_03.lbx "SN:1711CE0006EF,MAC:%Ethernet_Macaddress%"
rem ///////////////////////////////////////////
echo -------[END]-------
exit %errorlevel%