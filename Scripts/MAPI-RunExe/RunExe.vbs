Dim checkpoint, OfficeVersion, OfficeBitness, ServerSIPUri, PublicMeeting, strDirectory, objFSO, objFSOText, objFolder, objFile, strBitness
strDirectory = WScript.Arguments(0)
strExeName = WScript.Arguments(1)
strArguments = Replace(WScript.Arguments(2),Chr(39), Chr(34))
boolRerun = CBool(WScript.Arguments(3))
Const HKEY_CLASSES_ROOT    = &H80000000
Const HKEY_CURRENT_USER    = &H80000001
Const HKEY_LOCAL_MACHINE   = &H80000002

Function GetOfficeVersion
	Dim strKeyOutlookAppPath, strOutlookPathValue, strOutlookVersionNumber
	Dim oFSO : Set oFSO = CreateObject("Scripting.FileSystemObject") 
	
	'Determine path to outlook.exe
	strKeyOutlookAppPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\OUTLOOK.EXE"
	oReg.GetStringValue HKEY_LOCAL_MACHINE, strKeyOutlookAppPath, "Path", strOutlookPathValue
	
	'Verify that the outlook.exe exist and get version information
	If (Not IsNull(strOutlookPathValue)) Then
		If oFSO.FileExists(oFSO.BuildPath(strOutlookPathValue, "OUTLOOK.exe")) Then
			strOutlookVersionNumber = oFSO.GetFileVersion(oFSO.BuildPath(strOutlookPathValue, "OUTLOOK.exe"))
			GetOfficeVersion = Left(strOutlookVersionNumber, InStr(strOutlookVersionNumber, ".0")+1)
		End If
	End If
End Function

Function GetOutlookBitness
    strTempKeyPath = "SOFTWARE\Microsoft\Office\" & GetOfficeVersion & "\Outlook"
    strTempValueName = "Bitness"
    oReg.GetStringValue HKEY_LOCAL_MACHINE, strTempKeyPath, strTempValueName, strValue
    If (Not IsNull(strValue)) Then
        GetOutlookBitness = strValue
    End If
	
    strTempKeyPath = "SOFTWARE\WOW6432Node\Microsoft\Office\" & GetOfficeVersion & "\Outlook"
    strTempValueName = "Bitness"
    oReg.GetStringValue HKEY_LOCAL_MACHINE, strTempKeyPath, strTempValueName, strValue
    If (Not IsNull(strValue)) Then
        GetOutlookBitness = strValue
    End If
End Function

Function CheckOutlookProfile
	strTempKeyPath = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles"
	strTempValueName = "DefaultProfile"
	oReg.GetStringValue HKEY_LOCAL_MACHINE, strTempKeyPath, strTempValueName, strValue
	If (Not IsNull(strValue)) Then
		' CheckOutlookProfile = strValue
		CheckOutlookProfile = True
		Exit Function
	End If
	
	strTempKeyPath = "SOFTWARE\Microsoft\Office\" & GetOfficeVersion & "\Outlook\Profiles"
	iRet = oReg.EnumKey(HKEY_CURRENT_USER, strTempKeyPath, arrSubKeys)
	If iRet = 0 Then
		If UBound(arrSubKeys) <> -1 Then
			' CheckOutlookProfile = strValue
			CheckOutlookProfile = True
			Exit Function
		End If
	End If
	
	CheckOutlookProfile = False
End Function

Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")
If (Not boolRerun) then
    strKeyPath = "SOFTWARE\Microsoft\Office\" & GetOfficeVersion & "\Outlook"
    strValueName = "checkpoint"
    oReg.GetDWORDValue HKEY_CURRENT_USER, strKeyPath, strValueName, strValue
End if
If ((IsNull(strValue)) or (strValue = 0)) Then
    bOutlookProfile = CheckOutlookProfile
    strBitness = GetOutlookBitness
    If ((bOutlookProfile) And (strBitness <> "")) Then
        cmd = strDirectory & "\" & strBitness & "\" & strExeName & " " & strArguments
        Set oShell = CreateObject("WScript.Shell")
        oShell.Run cmd
        If (Not boolRerun) then
            oReg.SetDWORDValue HKEY_CURRENT_USER, strKeyPath, strValueName, 1
        End if
    End If
End If   
Set oReg = Nothing
