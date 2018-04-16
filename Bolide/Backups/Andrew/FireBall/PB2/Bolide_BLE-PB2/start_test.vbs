Set WshShell = WScript.CreateObject("WScript.Shell")

WshShell.Run "StartBTCli_quick.bat"
WScript.Sleep 1000
WshShell.AppActivate "Btcli"
WshShell.SendKeys "rt rxstart2 2441"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 5000
WshShell.SendKeys "rt pause"
WshShell.SendKeys "{ENTER}"
WshShell.SendKeys "quit"
WshShell.SendKeys "{ENTER}"