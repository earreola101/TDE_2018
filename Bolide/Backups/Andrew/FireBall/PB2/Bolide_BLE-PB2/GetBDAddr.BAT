@echo off
set status=1
rem ================================================
rem Keep file names xxxxx.txt, wifimac.in, wifimac.out
rem ===============================================

tdebt_140.exe -g macaddress >bdmac.txt
ksleep 500


TDEBT-Analyzer.exe wifimac.in bdmac.txt



call status.bat

exit %Status%