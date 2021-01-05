Dim strScriptPath : strScriptPath = Left(WScript.ScriptFullName,(Len(WScript.ScriptFullName) - (Len(WScript.ScriptName) + 1)))
Dim WshShell : Set WshShell = WScript.CreateObject("WScript.shell")
	
Dim strOSVer, strRunLevel
strOSVer = WshShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\CurrentVersion")
' https://superuser.com/questions/243605/how-do-i-specify-run-with-highest-privileges-in-schtasks
intOSVer = CInt(Left(strOSVer, Replace(strOSVer, ".", "")))
If intOSVer > 62 Then
	WshShell.Run Chr(34) & strScriptPath & "\win10\uvnc2me.exe" & Chr(34), 1, True
'ElseIf intOSVer >= 61 Then
'	WshShell.Run Chr(34) & strScriptPath & "\win7\uvnc2me.exe" & Chr(34), 1, True
Else
	WshShell.Run Chr(34) & strScriptPath & "\XP\uvnc2me.exe" & Chr(34), 1, True
End If
