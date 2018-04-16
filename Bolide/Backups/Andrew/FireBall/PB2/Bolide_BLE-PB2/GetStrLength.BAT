@echo off
set status=0



rem =============================================================================
rem =============================================================================
SETLOCAL enabledelayedexpansion
rem set myvar="123456789"
set /p myvar=<C:\tstplan\seqnum.txt
rem compute the length of a string
set #=%myvar%
set length=0
:loop
if defined # (
    rem shorten string by one character
    set #=%#:~1%
    rem increment the string count variable %length%
    set /A length += 1
    rem repeat until string is null
    goto loop
)
rem echo myvar is %length% characters long!> String_Len.txt
echo %Length% > String_Len.txt
ENDLOCAL



rem exit 0
exit /b
exit %Status%





