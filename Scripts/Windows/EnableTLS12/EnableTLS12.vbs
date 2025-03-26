'-----------------------------------------------------------------------------
' Enable TLS 1.2
'
' This script will enable TLS 1.0/1.1/1.2 and disable SSL 2.0/3.0 for Windows Vista/Server 2008 SP2, Windows 7/Server 2008 R2 SP1 and Windows 8/Server 2012/R2.
'
' Version:
'
' 	1.0.0
'
' Author:
'
'	* Eduardo Mozart de Oliveira (2021)
'
Option Explicit
' On Error Resume Next

Dim objFSO : Set objFSO = CreateObject("Scripting.FileSystemObject")
Dim intSystemFolder, intTempFolder, intWindowsFolder
intWindowsFolder = 0 ' The root folder of the Windows system folder tree (C:\Windows or C:\WINNT)
intSystemFolder = 1 ' The Windows system folder (C:\Windows\system or C:\Windows\system32)
intTempFolder = 2 ' The folder that stores temporary files (%TEMP%)

Dim strScriptDir : strScriptDir = objFSO.GetParentFolderName(WScript.ScriptFullName)

' ---------------------------------
' Declarations
' ---------------------------------
Dim LOG_PATH : LOG_PATH = objFSO.GetSpecialFolder(intTempFolder)
Dim LOGNAME : LOGNAME = objFSO.GetBaseName(WScript.ScriptName)
Dim strComputer : strComputer = "."
Dim strHotFixFolderPath : strHotFixFolderPath = strScriptDir

GetUAC()

If Not objFSO.FolderExists(LOG_PATH) Then
	objFSO.CreateFolder LOG_PATH
End If

Dim strLogFileName : strLogFileName = objFSO.BuildPath(LOG_PATH, objFSO.GetBaseName(LOGNAME) & ".log")
Dim boolLogFileExists : boolLogFileExists = objFSO.FileExists(strLogFileName)
Dim objLogFile : Set objLogFile = objFSO.OpenTextFile(strLogFileName, 8, True)
If boolLogFileExists Then objLogFile.WriteLine vbCrLf & "-------------------------------------------------------------------------------"

Dim objWMIService : Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Dim OSs : Set OSs = objWMIService.ExecQuery ("SELECT * FROM Win32_OperatingSystem")

Dim OS, strWinVer, arrWinVer, strWinVerMajor, strWinVerMinor, strWinVerBuild
Dim boolIsWindows60, boolIsWindows60SP2, boolIsWindows61, boolIsWindows61SP1, boolIsWindows63
For Each OS in OSs
	strWinVer = OS.Version ' Windows Server 2012 R2 = 6.3.9600
	arrWinVer = Split(strWinVer, ".")
	strWinVerMajor = arrWinVer(0) ' 6
	strWinVerMinor = arrWinVer(1) ' 3
	strWinVerBuild = arrWinVer(2) ' 9600

	boolIsWindows60 = CBool(CInt(strWinVerMajor) = 6 And CINt(strWinVerMinor) = 0) ' Windows Vista/Server 2008
	boolIsWindows60SP2 = CBool(boolIsWindows60 And CInt(strWinVerBuild) >= 6002) ' Windows Vista/Server 2008 SP2
	boolIsWindows61 = CBool(CInt(strWinVerMajor) = 6 And CINt(strWinVerMinor) = 1) ' Windows 7/Server 2008 R2
	boolIsWindows61SP1 = CBool(boolIsWindows61 And CInt(strWinVerBuild) >= 7601) ' Windows 7/Server 2008 R2 SP1
	boolIsWindows63 = CBool(CInt(strWinVerMajor) = 6 And CINt(strWinVerMinor) = 3 And CInt(strWinVerBuild) >= 9600) ' Windows Server 2012 R2
Next

objLogFile.WriteLine Now & " - " & "Starting Script: " & WScript.ScriptFullName
objLogFile.WriteLine Now & " - " & "Found Microsoft Windows version " & strWinver

' objLogFile.WriteLine Now & " - " & "strWinVer: " & strWinVer
' objLogFile.WriteLine Now & " - " & "strWinVerMajor: " & strWinVerMajor
' objLogFile.WriteLine Now & " - " & "strWinVerMinor: " & strWinVerMinor
' objLogFile.WriteLine Now & " - " & "strWinVerBuild: " & strWinVerBuild

' objLogFile.WriteLine Now & " - " & "boolIsWindows60: " & boolIsWindows60
' objLogFile.WriteLine Now & " - " & "boolIsWindows60SP2: " & boolIsWindows60SP2
' objLogFile.WriteLine Now & " - " & "boolIsWindows61: " & boolIsWindows61
' objLogFile.WriteLine Now & " - " & "boolIsWindows61SP1: " & boolIsWindows61SP1
' objLogFile.WriteLine Now & " - " & "boolIsWindows63: " & boolIsWindows63

Main

objLogFile.WriteLine Now & " - Ending Script: " & WScript.ScriptFullName

'------------------------------------------------------
'MAIN SUB
'------------------------------------------------------
Sub Main
	Dim boolIsKBInstalled, strHotfixID, strHotFixFileName

	If strComputer = "" Then
		strComputer = "."
	End If
	
	If boolIsWindows63 Then
		EnableTLS12()
	ElseIf boolIsWindows61 Then ' Windows 7/Server 2008 R2
		strHotfixID = "3140245"
		If (CheckOSType() = "x86") Then strHotFixFileName = "windows6.1-kb3140245-x86_cdafb409afbe28db07e2254f40047774a0654f18.msu"
		If (CheckOSType() = "x64") Then strHotFixFileName = "windows6.1-kb3140245-x64_5b067ffb69a94a6e5f9da89ce88c658e52a0dec0.msu"
		If Not boolIsWindows61SP1 Then
			WScript.Echo "[" & WScript.ScriptName & "] Please install Service Pack 1 (SP1) before installing KB" & strHotFixID & "."
			objLogFile.WriteLine Now & " - " & "Please install Service Pack 1 (SP1) before installing KB" & strHotFixID & "."
			WScript.Quit(1)
		End If
	ElseIf boolIsWindows60 Then ' Windows Vista/Server 2008
		strHotfixID = "4056564"
		If (CheckOSType() = "x86") Then strHotFixFileName = "windows6.0-kb4056564-v2-x86_1cf1b27424b4017e5f1341d88b42c463a62e1ac8.msu"
		If (CheckOSType() = "x64") Then strHotFixFileName = "windows6.0-kb4056564-v2-x64_173bf5ef3e4cfba4c43899d8db9f25c6dcccab22.msu"
		If Not boolIsWindows60SP2 Then
			WScript.Echo "[" & WScript.ScriptName & "] Please install Service Pack 2 (SP2) before installing KB" & strHotFixID & "."
			objLogFile.WriteLine Now & " - " & "Please install Service Pack 2 (SP2) before installing KB" & strHotFixID & "."
			WScript.Quit(1)
		End If
	End If
	
	If IsEmpty(strHotFixFileName) And (boolIsWindows60 Or boolIsWindows61) Then
		objLogFile.WriteLine Now & " - " & "ERROR: The system architecture is unknown or not supported."
	End If
	
	If Not IsEmpty(strHotFixID) Then
		boolIsKBInstalled = CheckParticularHotfix(strComputer, strHotfixID)
		objLogFile.WriteLine Now & " - TypeName(boolIsKBInstalled): " & TypeName(boolIsKBInstalled)
		If TypeName(boolIsKBInstalled) = "Boolean" Then
			If boolIsKBInstalled Then
				objLogFile.WriteLine Now & " - The Microsoft KB" & strHotFixID & " IS installed."
			Else
				objLogFile.WriteLine Now & " - The Microsoft KB" & strHotFixID & " is NOT installed."
				Dim intMsuExitCode : intMsuExitCode = InstallMSU(objFSO.BuildPath(strHotFixFolderPath, strHotFixFileName))
				If intMsuExitCode <> 0 And intMsuExitCode <> 3010 And intMsuExitCode <> 3011 And intMsuExitCode <> 2359302 Then
					WScript.Echo "[" & WScript.ScriptName & "] InstallMSU MsuExitCode: " & intMsuExitCode
					WScript.Quit(2)
				End If
			End If
			EnableTLS12()
		Else
			'Error
			WScript.Echo "[" & WScript.ScriptName & "] Error, unable to check for Microsoft KB" & strHotFixID & ". Error is: " & boolIsKBInstalled
		End If
	End If
End Sub

'------------------------------------------------------
'EnableTLS1.2
'------------------------------------------------------
Private Function EnableTLS12()
	' Turn on TLS 1.2
	' https://support.microsoft.com/en-us/topic/update-to-enable-tls-1-1-and-tls-1-2-as-default-secure-protocols-in-winhttp-in-windows-c4bd73d2-31d7-761e-0178-11268bb10392#bkmk_easy
	' https://improveandrepeat.com/2019/10/how-to-activate-tls-1-2-on-windows-server-2008-r2-and-iis-7-5/
	' https://support.laserfiche.com/kb/1013919/configuration-information-for-tls-1-2
	RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client\DisabledByDefault", 0, "REG_DWORD"
	RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client\Enabled", 1, "REG_DWORD"
	RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\DisabledByDefault", 0, "REG_DWORD"
	RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\Enabled", 1, "REG_DWORD"
	
	RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client\DisabledByDefault", 0, "REG_DWORD"
	RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client\Enabled", 1, "REG_DWORD"
	RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\DisabledByDefault", 0, "REG_DWORD"
	RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\Enabled", 1, "REG_DWORD"
	
	RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\SecureProtocols", 2688, "REG_DWORD"
	If (CheckOSType() = "x64") Then
		RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\SecureProtocols", 2688, "REG_DWORD"
	End If
	
	' Enable TLS 1.1/1.2 by default for WinHTTP
	' https://support.microsoft.com/en-us/topic/update-to-enable-tls-1-1-and-tls-1-2-as-default-secure-protocols-in-winhttp-in-windows-c4bd73d2-31d7-761e-0178-11268bb10392#bkmk_easy
	' https://support.laserfiche.com/kb/1013919/configuration-information-for-tls-1-2
	RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp\DefaultSecureProtocols", 2560, "REG_DWORD" 
	If (CheckOSType() = "x64") Then
		RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp\DefaultSecureProtocols", 2560, "REG_DWORD"
	End If

	' A value of 1 causes your app to allow the operating system to choose the protocol.
	' A value of 0 causes your app to use protocols picked by the .NET Framework.
	' https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/reference-connect-tls-enforcement
	RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v4.0.30319\SystemDefaultTlsVersions", 1, "REG_DWORD"
	If (CheckOSType() = "x64") Then
		RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319\SystemDefaultTlsVersions", 1, "REG_DWORD"
	End If
	
	' Block RC4 in .NET TLS
	' https://support.laserfiche.com/kb/1013919/configuration-information-for-tls-1-2
	' https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/reference-connect-tls-enforcement
	RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v4.0.30319\SchUseStrongCrypto", 1, "REG_DWORD"
	If (CheckOSType() = "x64") Then
		RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319\SchUseStrongCrypto", 1, "REG_DWORD"
	End If
	
	If boolIsWindows60SP2 Then
		' By default, after installing KB4056564, TLS 1.1/1.2 options are NOT shown into Windows Internet Explorer.
		' Deleting these keys below make TLS 1.1/1.2 options appears at Windows Internet Explorer 'Advanced' tab. 
		On Error Resume Next
		Dim WshShell : Set WshShell = CreateObject("WScript.Shell")
		WshShell.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\TLS1.1\OSVersion"
		WshShell.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\TLS1.2\OSVersion"
		If (CheckOSType() = "x64") Then
			WshShell.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\TLS1.1\OSVersion"
			WshShell.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\TLS1.2\OSVersion"
		End If
		On Error GoTo 0
		
		' Change Windows Internet Explorer settings to disable SSL 2.0/3.0 and enable TLS 1.1/1.2 (REG_DWORD: a80).
		' It's not required on Windows 7/Server 2008 R2 because Internet Explorer 11 is enabled for TLS 1.1/1.2 by default.
		RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\SecureProtocols", 2688, "REG_DWORD"
		
		' Active Setup (Run once on every user logon).
		' https://stackoverflow.com/questions/45758403/active-setup-script-to-edit-file-not-running-working
		
		' Please increase Version value if you change StubPath value.
		' RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\EnableTLS12", "Enable TLS 1.2", "REG_SZ"
		RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\EnableTLS12\DontAsk", 2, "REG_DWORD"
		RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\EnableTLS12\IsInstalled", 1, "REG_DWORD"
		RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\EnableTLS12\Version", "1", "REG_SZ"
		RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\EnableTLS12\StubPath", "reg add ""HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings"" /v SecureProtocols /t REG_DWORD /d 2688 /f", "REG_SZ"
	End If
End Function

'------------------------------------------------------
'RegWrite
'------------------------------------------------------
Private Function RegWrite(strKeyValue, anyValue, strValueType)
	objLogFile.WriteLine Now & " - " & "Starting RegWrite(" & strKeyValue & ", " & anyValue & ", " & strValueType & ")."

	Dim strKeyValueRead
	Dim WshShell : Set WshShell = CreateObject("WScript.Shell")
	
	WshShell.RegWrite strKeyValue, anyValue, strValueType
	
	strKeyValueRead = WshShell.RegRead(strKeyValue)
	
	objLogFile.WriteLine Now & " - " & strKeyValue & " (" & WshShell.RegRead(strKeyValue) & ")"
	
	objLogFile.WriteLine Now & " - " & "Ending RegWrite()."
	
	If (strKeyValueRead <> anyValue) Then
		RegWrite = False
	Else
		RegWrite = True
	End If
End Function

'------------------------------------------------------
'CheckParticularHotfix
'------------------------------------------------------
Private Function CheckParticularHotfix(strComputer, strHotfixID)
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
	' Version 1.0
	' Pat Fiannaca
	' Checks if a particular hotfix is installed or not. 
	' This function has these 3 return options:
	' TRUE, FALSE, <error description> 
	' https://community.spiceworks.com/scripts/show/349-check-if-a-windows-update-is-installed-on-a-pc-vbs
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
	On Error Resume Next
	objLogFile.WriteLine Now & " - Starting CheckParticularHotfix(" & strComputer & ", " & strHotfixID & ")."
	
	Dim objWMIService, strWMIforesp, colQuickFixes 
	
	Set objWMIService = GetObject("winmgmts:" _
	    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
	If Err.Number <> 0 Then
		objLogFile.WriteLine Now & " - " & "ERROR: WMI could not connect to computer: '" & strComputer & "' (" & Err.Number & ")."
		objLogFile.WriteLine Now & " - " & "Ending CheckParticularHotfix()."
		CheckParticularHotfix = "WMI could not connect to computer: '" & strComputer & "' (" & Err.Number & ")."
		Exit Function 'No reason to continue
	End If
	
	strWMIforesp = "Select * from Win32_QuickFixEngineering where HotFixID = 'Q" & strHotfixID &_ 
    "' OR HotFixID = 'KB" & strHotfixID & "'"
	Set colQuickFixes = objWMIService.ExecQuery (strWMIforesp)
	If Err.Number <> 0 Then	'if an error occurs
		objLogFile.WriteLine Now & " - " & "Unable to get WMI hotfix information."
		CheckParticularHotfix = "Unable to get WMI hotfix information."
	Else 'Error number 0 meaning no error occured 
		If colQuickFixes.Count > 0 Then
			objLogFile.WriteLine Now & " - Ending CheckParticularHotfix(). [True]"
			CheckParticularHotfix = True	'HF installed
		Else 
			objLogFile.WriteLine Now & " - Ending CheckParticularHotfix(). [False]"
			CheckParticularHotfix = False	'HF not installed
		End If
	End If
	Set colQuickFixes = Nothing
	
	Err.Clear
	On Error GoTo 0
End Function

'------------------------------------------------------
'GetUAC
'------------------------------------------------------
Function GetUAC()
	Dim WshShell, strErrorCode, strSystemRoot
	Dim iRet
	Dim i
	
	Set WshShell = Wscript.CreateObject("WScript.Shell")
	
	' ////////////////////

	ReDim arr(WScript.Arguments.Count-1)
	'For i = 1 To WScript.Arguments.Count-1: arr(i) = WScript.Arguments(i): Next
	For i = 0 To WScript.Arguments.Count-1: arr(i) = WScript.Arguments(i): Next
	
	strSystemRoot = WshShell.ExpandEnvironmentStrings( "%SystemRoot%" )
	strErrorCode = WshShell.Run(Chr(34) & strSystemRoot & "\system32\cacls.exe" & Chr(34) & " " & Chr(34) & strSystemRoot & "\system32\config\system" & Chr(34),0,True)
	
    If strErrorCode <> 0 Then
		Dim UAC : Set UAC = CreateObject("Shell.Application")
		UAC.ShellExecute WScript.FullName, Chr(34) & WScript.ScriptFullName & Chr(34) & " " & Join(arr), "", "runas", 1
		WScript.Quit
	End If
End Function

'------------------------------------------------------
'CheckOSType
'------------------------------------------------------
Function CheckOSType()
    ' objLogFile.WriteLine Now & " - Starting CheckOSType()"
	Dim msOSType
	Dim WshShell : Set WshShell = CreateObject("WScript.Shell")
	Dim WsProcEnv : Set WsProcEnv = WshShell.Environment("Process")
	
	Dim PROCESS_ARCHITECTURE : PROCESS_ARCHITECTURE = WsProcEnv("PROCESSOR_ARCHITECTURE")
	
	If PROCESS_ARCHITECTURE = "x86" Then    
        msOSType = WsProcEnv("PROCESSOR_ARCHITEW6432")

        If msOSType = "" Then    
			' objLogFile.WriteLine Now & " - " & "32-bit OS detected."
            msOSType = "x86"
        End if    
    Else    
        ' objLogFile.WriteLine Now & " - " & "64-bit OS detected."
		msOSType = "x64"
    End If
    
	' objLogFile.WriteLine Now & " - Ending CheckOSType(). [" & msOSType & "]"
	CheckOSType = msOSType
End Function

'------------------------------------------------------
'InstallMSU
' Parameter is the MSU file name (use folder\filename if necessary).
'------------------------------------------------------
Function InstallMSU(strMsuName)
    objLogFile.WriteLine Now & " - Starting InstallMSU(" & strMsuName & ")."
	Dim WshShell : Set WshShell = CreateObject("WScript.Shell")

	If StartService("wuauserv") Then
	    Dim strWusaCmd : strWusaCmd = "wusa.exe """ & strMsuName & """ /quiet /norestart"
	    If boolIsWindows61 Then strWusaCmd = strWusaCmd & " /log:""" & LOG_PATH & "\" & LOGNAME & "-install_msu.log"""
	    objLogFile.WriteLine Now & " - Command line launched: " & strWusaCmd	    

	    Dim intMsuExitCode : intMsuExitCode = WshShell.Run(strWusaCmd, 0, TRUE)
	    
	    ' If Err.Number <> 0 Then
	    '    objLogFile.WriteLine Now & " - " & "InstallMSU Errorlevel: " & Err.Description & "(" & Err.Number & ")."
	    ' End If
	Else
		objLogFile.WriteLine Now & " - " & "ERROR: Service ""Windows Update"" (wuauserv) is disabled." & "Please enable it and try again."
		intMsuExitCode = 1058
	End If
    	
	' 3010/3011 = Reboot required.
	' 2359302 = Update already installed.
	objLogFile.WriteLine Now & " - Ending InstallMSU(). [" & intMsuExitCode & "]"
    
	InstallMSU = intMsuExitCode
End Function

'------------------------------------------------------
'StopService
'------------------------------------------------------
Function StopService(strServiceName)
    objLogFile.WriteLine Now & " - Starting StopService(" & strServiceName & ")."
    
    Dim objWMIService, colListOfServices, objService
    
    Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CimV2") 

    Set colListOfServices = objWMIService.ExecQuery ("Select * From Win32_Service Where Name ='" & strServiceName & "'")

    For Each objService in colListOfServices
        If objService.Started Then
            objService.StopService
        End If
        ' objService.ChangeStartMode("Disabled")
        Wscript.Sleep 5000
	If objService.Stopped Then
		objLogFile.WriteLine Now & " - Ending StopService(" & strServiceName & "). [True]"
		StopService = True
	Else
		objLogFile.WriteLine Now & " - Ending StopService(" & strServiceName & "). [False]"
		StopService = False
	End If
    Next
End Function

'------------------------------------------------------
'StartService
'------------------------------------------------------
Function StartService(strServiceName)
    objLogFile.WriteLine Now & " - Starting StartService(" & strServiceName & ")."
    
    Dim objWMIService, colListOfServices, objService
    
    Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CimV2") 

    Set colListOfServices = objWMIService.ExecQuery ("Select * From Win32_Service Where Name ='" & strServiceName & "'")

    For Each objService in colListOfServices
        If Not objService.Started Then
            objService.StartService
        End If
        ' objService.ChangeStartMode("Manual")
        Wscript.Sleep 5000
	If objService.Started Then
		objLogFile.WriteLine Now & " - Ending StartService(" & strServiceName & "). [True]"
		StartService = True
	Else
		objLogFile.WriteLine Now & " - Ending StartService(" & strServiceName & "). [False]"
		StartService = False
	End If
    Next
End Function
