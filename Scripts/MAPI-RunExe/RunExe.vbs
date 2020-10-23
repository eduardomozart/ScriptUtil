Dim checkpoint, OfficeVersion, OfficeBitness, ServerSIPUri, PublicMeeting, strDirectory, objFSO, objFSOText, objFolder, objFile, strBitness
strDirectory = WScript.Arguments(0)
strExeName = WScript.Arguments(1)
strArguments = Replace(WScript.Arguments(2),Chr(39), Chr(34))
boolRerun = CBool(WScript.Arguments(3))
Const HKEY_CLASSES_ROOT    = &H80000000
Const HKEY_CURRENT_USER    = &H80000001
Const HKEY_LOCAL_MACHINE   = &H80000002

Function GetOfficeVersion
    strTempKeyPath = "Outlook.Application\CurVer"
    strTempValueName = ""
    oReg.GetStringValue HKEY_CLASSES_ROOT, strTempKeyPath, strTempValueName, strValue
    If (Not IsNull(strValue)) Then
        Select Case strValue
             Case "Outlook.Application.16"
                GetOfficeVersion = "16.0"
             Case "Outlook.Application.15"
                GetOfficeVersion = "15.0"
             Case "Outlook.Application.14"
                GetOfficeVersion = "14.0"                                                      
        End Select
    End If
End Function

Function GetOutlookBitness
    strTempKeyPath = "SOFTWARE\Microsoft\Office\" & GetOfficeVersion & "\Outlook"
    strTempValueName = "Bitness"
    oReg.GetStringValue HKEY_LOCAL_MACHINE, strTempKeyPath, strTempValueName, strValue
    If (Not IsNull(strValue)) Then
        GetOutlookBitness = strValue
    End If
End Function

Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")
If (Not boolRerun) then
    strKeyPath = "SOFTWARE\Microsoft\Office\" & GetOfficeVersion & "\Outlook"
    strValueName = "checkpoint"
    oReg.GetDWORDValue HKEY_CURRENT_USER, strKeyPath, strValueName, strValue
End if
If ((IsNull(strValue)) or (strValue = 0)) Then
    strBitness = GetOutlookBitness
    If (strBitness <> "") Then
        cmd = strDirectory & "\" & strBitness & "\" & strExeName & " " & strArguments
        Set oShell = CreateObject("WScript.Shell")
        oShell.Run cmd
        If (Not boolRerun) then
            oReg.SetDWORDValue HKEY_CURRENT_USER, strKeyPath, strValueName, 1
        End if
    End If
End If   
Set oReg = Nothing
