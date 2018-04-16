; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

;How do I put my hotkeys and hotstrings into effect automatically every time I start my PC?
;There is a folder in the Start Menu called Startup.  If you put a shortcut to your script in that folder, the script will launch automatically every time you start your PC. To create a shortcut:

;Find the script file, select it, and press Control-C. 
;Right-click the Start button (typically at the lower left corner of the screen) and choose "Explore All Users". 
;Navigate to the Startup folder inside the Programs folder. 
;From the menu bar, choose Edit -> Paste Shortcut.  The shortcut to the script should now be in the Startup folder. 


;F12
F12::


; Win + A
;#a::

; F1 + F2
;F1 & F2::


;Suspend


;FileDelete, c:\WiFiTesting.txt


;send {Enter}
sleep 1000



send rt rxstart2 2441{Enter}
sleep 5000
send rt pause{Enter}
sleep 100
send quit{Enter}







send {Enter}


;Suspend



return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

