@echo off
set status =0
Set CPort=7
set SCPICmd2="UltimateScpiCmd.exe" /option:send  /COMPort:%CPort% /scpicmd=
rem %SCPICmd2%"*IDN?"
REM %scpitool% /option:send /COMPort:7 /scpicmd="ORESULT TEST,0,LEICD"
rem %scpitool% /option:send /COMPort:7 /scpicmd="RUN"
rem ksleep 10000
REM %scpitool% /option:send /COMPort:7 /scpicmd="SCPTCFG 3,LEOP,ON"
tdebt_140.exe -s bt_uartdisable
ksleep 2000
REM %SCPICmd2%"LEOPCFG 3,AVGMXLIM,10"
REM %SCPICmd2%"LEOPCFG 3,AVGMNLIM,-75"
REM %SCPICmd2%"LEOPCFG 3,PEAKLIM,10"
REM %SCPICmd2%"LEICDCFG 3,MXPOSLIM,75kHz"
REM %SCPICmd2%"LEICDCFG 3,MXNEGLIM,75kHz"
REM %SCPICmd2%"LEICDCFG 3,DFTBLELIM,75kHz"
REM %SCPICmd2%"LEICDCFG 3,DFTBLERATE,10kHz"
REM %SCPICmd2%"LEOPCFG 3,LFREQSEL,OFF"
REM %SCPICmd2%"LEOPCFG 3,MFREQSEL,ON"
REM %SCPICmd2%"LEOPCFG 3,HFREQSEL,OFF"
REM %SCPICmd2%"LEICDCFG 3,LFREQSEL,OFF"
REM %SCPICmd2%"LEICDCFG 3,MFREQSEL,ON"
REM %SCPICmd2%"LEICDCFG 3,HFREQSEL,OFF"
%SCPICmd2%"RUN"
ksleep 2000
REM %scpitool% /option:send /COMPort:7 /scpicmd="ORESULT TEST,0,LEOP"
REM %scpitool% /option:send /COMPort:7 /scpicmd="ORESULT TEST,0,LEICD"
rem %scpitool% /option:send /COMPort:7 /scpicmd="OPMD CWMEAS"
rem %scpitool% /option:send /COMPort:7 /scpicmd="CWMEAS FREQ,2441e6,3e-3"
call "UltimateScpiCmd.exe" /inputfile:"BTRemote.in"

rem call ultimateScpiCmd.bat
rem wait for power measurement to complete
rem pause
REM ksleep 1000
exit %Status%

Rem set status=0
rem (ECHO 0)>measurepower.txt
rem exit %status%
rem )
rem echo the tool was not there
rem set status=1
rem (ECHO 1)>measurepower.txt
rem exit %Status%
rem ================================================================================

 