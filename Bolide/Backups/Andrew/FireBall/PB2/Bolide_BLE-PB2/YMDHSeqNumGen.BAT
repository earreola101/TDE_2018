@echo off

set fileDateTime=DateTime.txt


if exist "%fileDateTime%" (
del %fileDateTime%
)
 if exist "%Day%" (
del %Day%
)
 if exist "%Mon%" (
del %Mon%
)
 if exist "%year%" (
del %Year%
)
 if exist "%Hour%" (
del %Hour%
)
 if exist "%Min%" (
del %Min%
)
 if exist "%Sec%" (
del %Sec%
)
 if exist "%Sec100%" (
del %Sec100%
)
 if exist "%Y_MonHex%" (
del %Y_MonHex%
)
 if exist "%SEQNUM%" (
del %SEQNUM%
)

rem ====================================================================================================
rem  DOS command %DATE% --> "31/01/2015 ", with a Blank at the end 
rem  DOS coomad %Time% ---> "TUE16:23:22:27"
rem  DOS command %Date%%Time% --> "07/24/2015 TUE16:23:22:27" --> Lenovo Laptop Format
rem  DOS command %Date%%Time% --> "TUE 31/01/201516:23:22:27" --> Production Line Dell Desktop Format
rem                                Mon 07/25/2016 9:53:15.00 
rem  
rem  Babylon USB UID Address: 0x1B  0x1C  0x1C 0x1D, 4Bytes
rem  
rem  Data Structure needed:  0x1B: Year(Last Digit, Bit7-Bit4) + Month (HEX, Bit3-Bit 0)
rem                          0x1C: Date, Digit
rem                          0x1D: Hour, Digit
rem                          0x1F: Seq_num sotred under C:/Test, least 2 digits, 
rem  where XX is for the Test Flow Test Tracking, following characters are for serial number tracking  
rem ====================================================================================================


echo %DATE%%Time% > DATETime.txt
set /p str=<%fileDateTime%

rem ===== For Lenovo Laptop Format =============
rem set Month=%str:~0,2%
rem set Day=%str:~3,2%
rem set Year=%str:~6,4%
rem set Year=%Str:~9,1%
rem ===== For Production Line Dell Desktop Format =============
set Month=%str:~4,2%
set Day=%str:~7,2%
rem set Year=%str:~10,4%  //For C2
rem ====== Below is for Babylon
set Year=%Str:~13,1%



if "%Month%" == "01" (
Set MonHex=A
goto End_YearMonth
)
if "%Month%" == "02" (
Set MonHex=B
goto End_YearMonth
)
if "%Month%" == "03" (
Set MonHex=C
goto End_YearMonth
)
if "%Month%" == "04" (
Set MonHex=D
goto End_YearMonth
)
if "%Month%" == "05" (
Set MonHex=E
goto End_YearMonth
)
if "%Month%" == "06" (
Set MonHex=F
goto End_YearMonth
)
if "%Month%" == "07" (
Set MonHex=G
goto End_YearMonth
)
if "%Month%" == "08" (
Set MonHex=H
goto End_YearMonth
)
if "%Month%" == "09" (
Set MonHex=I
goto End_YearMonth
)
if "%Month%" == "10" (
Set MonHex=J
goto End_YearMonth
)
if "%Month%" == "11" (
Set MonHex=K
goto End_YearMonth
)
if "%Month%" == "12" (
Set MonHex=L
goto End_YearMonth
)
Set MonHex=%Month:~0,1%

:End_YearMonth
Set Y_MonHex=%Year%%MonHex%







rem ==================================================================================================
rem  Single character can not be treated as a "string", string comparison command can not be applied
rem  use the "numeric comparison" command instead of "string comparison" command
rem  However, the empty space can not be identified by "numeric comparison, 
rem  So finally go back to the dirty codes of "string comparison" seqentially
rem ==================================================================================================
if "%str:~14,2%" == " 0" (
goto HourMorning
)
if "%str:~14,2%" == " 1" (
goto HourMorning
)
if "%str:~14,2%" == " 2" (
goto HourMorning
)
if "%str:~14,2%" == " 3" (
goto HourMorning
)
if "%str:~14,2%" == " 4" (
goto HourMorning
)
if "%str:~14,2%" == " 5" (
goto HourMorning
)
if "%str:~14,2%" == " 6" (
goto HourMorning
)
if "%str:~14,2%" == " 7" (
goto HourMorning
)
if "%str:~14,2%" == " 8" (
goto HourMorning
)
if "%str:~14,2%" == " 9" (
goto HourMorning
)

set Hour=%str:~14,2%
goto SetMin

:HourMorning
set Hour=0%str:~15,1%
goto SetMin



:SetMin
set Min=%str:~17,2%
set Sec=%str:~20,2%
set sec100=%str:~23,2%

rem =============================================================================
rem =============================================================================
rem SETLOCAL
rem rem set myvar="123456789"
set /p myvar=<C:\tstplan\seqnum.txt
rem rem compute the length of a string
rem set #=%myvar%
rem set length=0
rem :loop
rem if defined # (
rem    rem shorten string by one character
rem    set #=%#:~1%
rem    rem increment the string count variable %length%
rem    set /A length += 1
rem    rem repeat until string is null
rem    goto loop
rem)
rem echo myvar is %length% characters long!> String_Len.txt
rem ENDLOCAL


Call GetStrLength.bat
rem echo myvar is %length% characters long!> String_Len.txt
set /p length=<String_Len.txt
echo myvar is %length% characters long!> String_Len.txt





if %length% == 0 (
   set SEQNUM=00
)
if %length% == 1 (
   set SEQNUM=0%myvar%
)
if %length% == 2 (
   set SEQNUM=%myvar%
)
if %length% == 3 (
   set SEQNUM=%myvar:~1,2%
)
if %length% == 4 (
   set SEQNUM=%myvar:~2,2%
)
if %length% == 5 (
   set SEQNUM=%myvar:~3,2%
)
if %length% == 6 (
   set SEQNUM=%myvar:~4,2%
)
if %length% == 7 (
   set SEQNUM=%myvar:~5,2%
)
if %length% == 8 (
   set SEQNUM=%myvar:~6,2%
)
if %length% == 9 (
   set SEQNUM=%myvar:~7,2%
)

rem ==============================================================================
rem =============================================================================

del wifimax.txt
echo %Y_MonHex%%Day%%Hour%%SEQNUM% >wifimac.txt

lvreg testxu write A 8
lvreg eeprom write 6E %Y_MonHex%
lvreg eeprom write 6F %Day%
lvreg eeprom write 70 %Hour%
lvreg eeprom write 71 %SEQNUM%


rem ====================================================================================================
rem   wifimac.txt, wifimac.in are hard coded in TDEBT-Analyzer.exe, DO NOT change their file names !!!
rem   
rem ====================================================================================================
COPY UID.in wifimac.in 
TDEBT-Analyzer.exe wifimac.in wifimac.txt
COPY wifimac.out UID.out

set status=0
call status.bat
exit /b
exit %Status%




