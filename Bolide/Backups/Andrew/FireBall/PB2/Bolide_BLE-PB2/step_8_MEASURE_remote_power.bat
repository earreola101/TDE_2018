@echo off
set status =0
Set CPort=7
set SCPICmd2="UltimateScpiCmd.exe" /option:send  /COMPort:%CPort% /scpicmd=
rem %scpitool% /option:send /COMPort:7 /scpicmd="*IDN?"
REM %scpitool% /option:send /COMPort:7 /scpicmd="ORESULT TEST,0,LEICD"
rem %scpitool% /option:send /COMPort:7 /scpicmd="RUN"
rem ksleep 10000
REM %scpitool% /option:send /COMPort:7 /scpicmd="SCPTCFG 3,LEOP,ON"
rem %scpitool% /option:send /COMPort:7 /scpicmd="LEOPCFG 3,AVGMXLIM,10"
rem %scpitool% /option:send /COMPort:7 /scpicmd="LEOPCFG 3,AVGMNLIM,-75"
rem %scpitool% /option:send /COMPort:7 /scpicmd="LEOPCFG 3,PEAKLIM,10"
rem %scpitool% /option:send /COMPort:7 /scpicmd="LEICDCFG 3,MXPOSLIM,75kHz"
rem %scpitool% /option:send /COMPort:7 /scpicmd="LEICDCFG 3,MXNEGLIM,75kHz"
rem %scpitool% /option:send /COMPort:7 /scpicmd="LEICDCFG 3,DFTBLELIM,75kHz"
rem %scpitool% /option:send /COMPort:7 /scpicmd="LEICDCFG 3,DFTBLERATE,10kHz"
REM %scpitool% /option:send /COMPort:7 /scpicmd="RUN"
%SCPICmd2%"RUN"
ksleep 5000
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

 