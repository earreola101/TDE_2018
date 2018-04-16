rem Status=1 == FAIL
Set Status = 1

rem 04: Birch boot mode for CSR Tool USB access  01: Normal user mode
rem cd /d %~dp0BirchModeSet

rem Birchsetmode 04  -- by Henry 25-Feb-2015 trying for stable issue

rem wait 1 sec
rem Timeout 1
rem ksleep 1000

rem To keep btcli.log under d:\Logitech\Video\Video Sync\FY14\Mariner\TDE\BT\
cd /d %~dp0

Set Path=c:\Program Files\CSR\BlueSuite 2.5.0\
rem btcli USB -l -t

rem To open 2'nd command window
rem START "title" [/D path] [options] "command" [parameters]  
rem Options: /w:  Start application and wait for it to terminate.  /low: low/idle priority class
rem Options: /l:  btcli.log  /t: with time-stamp
START "Btcli" /w /low "btcli" USB -l -t


rem ============== external sequence by barcode reader as a keyboard input
rem Btcli command 1: "rt rxstart2 2441" by KeyBaord input through bar-code reader
rem wait 5 sec
rem Btcli command 1: "rt deep_sleep" OR "rt pause" by KeyBaord input through bar-code reader
rem Btcli command 1: "quit" to exit btcli by KeyBaord input through bar-code reader
rem ============================================================


rem wait 2 sec for passing barcode "ENTER" key input
rem Timeout 2

rem Status=0 == PASS
Set Status=0
exit %Status%
