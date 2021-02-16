'
'  ------------------------------------------------------------------------
'  fusioninventory-agent-deployment.vbs
'  Copyright (C) 2010-2017 by the FusionInventory Development Team.
'
'  http://www.fusioninventory.org/ http://forge.fusioninventory.org/
'  ------------------------------------------------------------------------
'
'  LICENSE
'
'  This file is part of FusionInventory project.
'
'  This file is free software; you can redistribute it and/or modify it
'  under the terms of the GNU General Public License as published by the
'  Free Software Foundation; either version 2 of the License, or (at your
'  option) any later version.
'
'
'  This file is distributed in the hope that it will be useful, but WITHOUT
'  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
'  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
'  more details.
'
'  You should have received a copy of the GNU General Public License
'  along with this program; if not, write to the Free Software Foundation,
'  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
'  or see <http://www.gnu.org/licenses/>.
'
'  ------------------------------------------------------------------------
'
'  @package   FusionInventory Agent
'  @file      .\contrib\windows\fusioninventory-agent-deployment.vbs
'  @author(s) Benjamin Accary <meldrone@orange.fr>
'             Christophe Pujol <chpujol@gmail.com>
'             Marc Caissial <marc.caissial@zenitique.fr>
'             Tomas Abad <tabadgp@gmail.com>
'             Guillaume Bougard <gbougard@teclib.com>
'  @copyright Copyright (c) 2010-2017 FusionInventory Team
'  @license   GNU GPL version 2 or (at your option) any later version
'             http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
'  @link      http://www.fusioninventory.org/
'  @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
'  @since     2012
'
'  ------------------------------------------------------------------------
'

'
'
' Purpose:
'     FusionInventory Agent Unatended Deployment.
'
'

Option Explicit
Dim Force, Verbose
Dim Setup, SetupArchitecture, SetupLocation, SetupOptions, SetupVersion

GetUAC()

Dim arrArgs, strArg
Set arrArgs = Wscript.Arguments
For Each strArg In arrArgs
  	Select Case LCase(strArg)
		Case "/force"
			Force = "True"
		Case "/verbose"
			Verbose = "True"
	End Select
Next

'
'
' USER SETTINGS
'
'

' SetupVersion
'    Setup version with the pattern <major>.<minor>.<release>[-<package>]
'
SetupVersion = "2.6"

' SetupLocation
'    Depending on your needs or your environment, you can use either a HTTP or
'    CIFS/SMB.
'
'    If you use HTTP, please, set to SetupLocation a URL:
'
'       SetupLocation = "http://host[:port]/[absolut_path]" or
'       SetupLocation = "https://host[:port]/[absolut_path]"
'
'    If you use CIFS, please, set to SetupLocation a UNC path name:
'
'       SetupLocation = "\\host\share\[path]"
'
'       You also must be sure that you have removed the "Open File Security Warning"
'       from programs accessed from that UNC.
'
' Location for Release Candidates
' SetupLocation = "https://github.com/TECLIB/fusioninventory-agent-windows-installer/releases/download/" & SetupVersion
'SetupLocation = "https://github.com/fusioninventory/fusioninventory-agent/releases/download/" & SetupVersion
SetupLocation = "\\ad.example.com\SYSVOL\ad.example.com\Policies\{421703F7-008B-4105-AA4F-6D133FA3C131}\Machine\Scripts\Startup\FusionInventory-Agent"
RemoveCIFSSetupLocationOpenFileSecurityWarning()

' SetupArchitecture
'    The setup architecture can be 'x86', 'x64' or 'Auto'
'
'    If you set SetupArchitecture = "Auto" be sure that both installers are in
'    the same SetupLocation.
'
SetupArchitecture = "Auto"

' SetupOptions
'    Consult the installer documentation to know its list of options.
'
'    You should use simple quotes (') to set between quotation marks those values
'    that require it; double quotes (") doesn't work with UNCs.
'
SetupOptions = "/acceptlicense /runnow /execmode=service /add-firewall-exception /server='https://glpi.example.com/plugins/fusioninventory/' /debug=2 /installtasks=collect,deploy,inventory /no-p2p /ca-cert-file='" & DeployFIServerCACert() & "' /S"

' Setup
'    The installer file name. You should not have to modify this variable ever.
'
Setup = "fusioninventory-agent_windows-" & SetupArchitecture & "_" & SetupVersion & ".exe"

' Force
'    Force the installation even whether Setup is previously installed.
'
If Len(Force) = 0 Then
	Force = "No"
End If

' Verbose
'    Enable or disable the information messages.
'
'    It's advisable to use Verbose = "Yes" with 'cscript //nologo ...'.
'
If Len(Verbose) = 0 Then
	Verbose = "No"
End If

'
'
' DO NOT EDIT BELOW
'
'

Function AdvanceTime(nMinutes, dtmTimeFormat)
   Dim nMinimalMinutes, dtmTimeFuture
   ' As protection
   nMinimalMinutes = 5
   If nMinutes < nMinimalMinutes Then
      nMinutes = nMinimalMinutes
   End If
   ' Add nMinutes to the current time
   dtmTimeFuture = DateAdd ("n", nMinutes, Now)
   ' Format the result value
   '    The command AT accepts 'HH:MM' values only
   If dtmTimeFormat = "HH:MM" Then
      ' https://stackoverflow.com/questions/19829002/how-to-add-zero-in-front-of-single-digit-values-using-regex-in-pentaho
      Dim regEx, ret
      Set regEx = New RegExp
      regEx.Global = True
      regEx.IgnoreCase = True
      regEx.Pattern = "\b([0-9])\b"
      AdvanceTime = regEx.Replace(Hour(dtmTimeFuture) & ":" & Minute(dtmTimeFuture),"0$1")
   ElseIf dtmTimeFormat = "DD/MM/YYYY" Then
      AdvanceTime = Day(dtmTimeFuture) & "/" & Month(dtmTimeFuture) & "/" & Year(dtmTimeFuture)
   End If
End Function

Function baseName (strng)
   Dim regEx, ret
   Set regEx = New RegExp
   regEx.Global = True
   regEx.IgnoreCase = True
   regEx.Pattern = ".*[/\\]([^/\\]+)$"
   baseName = regEx.Replace(strng,"$1")
End Function

Function GetSystemArchitecture()
   Dim strSystemArchitecture
   Err.Clear
   ' Get operative system architecture
   On Error Resume Next
   strSystemArchitecture = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%PROCESSOR_ARCHITECTURE%")
   If Err.Number = 0 Then
      ' Check the operative system architecture
      Select Case strSystemArchitecture
         Case "x86"
            ' The system architecture is 32-bit
            GetSystemArchitecture = "x86"
         Case "AMD64"
            ' The system architecture is 64-bit
            GetSystemArchitecture = "x64"
         Case Else
            ' The system architecture is not supported
            GetSystemArchitecture = "NotSupported"
      End Select
   Else
      ' It has been not possible to get the system architecture
      GetSystemArchitecture = "Unknown"
   End If
End Function

Function isHttp(strng)
   Dim regEx, matches
   Set regEx = New RegExp
   regEx.Global = true
   regEx.IgnoreCase = True
   regEx.Pattern = "^(http(s?)).*"
   If regEx.Execute(strng).count > 0 Then
      isHttp = True
   Else
      isHttp = False
   End If
   Exit Function
End Function

Function IsInstallationNeeded(strSetupVersion, strSetupArchitecture, strSystemArchitecture)
   Dim strCurrentSetupVersion
   ' Compare the current version, whether it exists, with strSetupVersion
   If strSystemArchitecture = "x86" Then
      ' The system architecture is 32-bit
      ' Check if the subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory Agent' exists
      '    This subkey is now deprecated
      On error resume next
      strCurrentSetupVersion = WshShell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory Agent\DisplayVersion")
      If Err.Number = 0 Then
      ' The subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory Agent' exists
         If strCurrentSetupVersion <> strSetupVersion Then
            ShowMessage("Installation needed: " & strCurrentSetupVersion & " -> " & strSetupVersion)
            IsInstallationNeeded = True
         End If
         Exit Function
      Else
         ' The subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory Agent' doesn't exist
         Err.Clear
         ' Check if the subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent' exists
         On error resume next
         strCurrentSetupVersion = WshShell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent\DisplayVersion")
         If Err.Number = 0 Then
         ' The subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent' exists
            If strCurrentSetupVersion <> strSetupVersion Then
               ShowMessage("Installation needed: " & strCurrentSetupVersion & " -> " & strSetupVersion)
               IsInstallationNeeded = True
            End If
            Exit Function
         Else
            ' The subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent' doesn't exist
            Err.Clear
            ShowMessage("Installation needed: " & strSetupVersion)
            IsInstallationNeeded = True
         End If
      End If
   Else
      ' The system architecture is 64-bit
      ' Check if the subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory Agent' exists
      '    This subkey is now deprecated
      On error resume next
      strCurrentSetupVersion = WshShell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory Agent\DisplayVersion")
      If Err.Number = 0 Then
      ' The subkey 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory Agent' exists
         If strCurrentSetupVersion <> strSetupVersion Then
            ShowMessage("Installation needed: " & strCurrentSetupVersion & " -> " & strSetupVersion)
            IsInstallationNeeded = True
         End If
         Exit Function
      Else
         ' The subkey 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory Agent' doesn't exist
         Err.Clear
         ' Check if the subkey 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent' exists
         On error resume next
         strCurrentSetupVersion = WshShell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent\DisplayVersion")
         If Err.Number = 0 Then
         ' The subkey 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent' exists
            If strCurrentSetupVersion <> strSetupVersion Then
               ShowMessage("Installation needed: " & strCurrentSetupVersion & " -> " & strSetupVersion)
               IsInstallationNeeded = True
            End If
            Exit Function
         Else
            ' The subkey 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent' doesn't exist
            Err.Clear
            ' Check if the subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent' exists
            On error resume next
            strCurrentSetupVersion = WshShell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent\DisplayVersion")
            If Err.Number = 0 Then
            ' The subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent' exists
               If strCurrentSetupVersion <> strSetupVersion Then
                  ShowMessage("Installation needed: " & strCurrentSetupVersion & " -> " & strSetupVersion)
                  IsInstallationNeeded = True
               End If
               Exit Function
            Else
               ' The subkey 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent' doesn't exist
               Err.Clear
               ShowMessage("Installation needed: " & strSetupVersion)
               IsInstallationNeeded = True
            End If
         End If
      End If
   End If
End Function

Function IsSelectedForce()
   If LCase(Force) <> "no" Then
      ShowMessage("Installation forced: " & SetupVersion)
      IsSelectedForce = True
   Else
      IsSelectedForce = False
   End If
End Function

' http://www.ericphelps.com/scripting/samples/wget/index.html
Function SaveWebBinary(strSetupLocation, strSetup)
   Const adTypeBinary = 1
   Const adSaveCreateOverWrite = 2
   Const ForWriting = 2
   Dim web, varByteArray, strData, strBuffer, lngCounter, ado, strUrl
   strUrl = strSetupLocation & "/" & strSetup
   'On Error Resume Next
   'Download the file with any available object
   Err.Clear
   Set web = Nothing
   Set web = CreateObject("WinHttp.WinHttpRequest.5.1")
   If web Is Nothing Then Set web = CreateObject("WinHttp.WinHttpRequest")
   If web Is Nothing Then Set web = CreateObject("MSXML2.ServerXMLHTTP")
   If web Is Nothing Then Set web = CreateObject("Microsoft.XMLHTTP")
   web.Open "GET", strURL, False
   web.Send
   If Err.Number <> 0 Then
      SaveWebBinary = False
      Set web = Nothing
      Exit Function
   End If
   If web.Status <> "200" Then
      SaveWebBinary = False
      Set web = Nothing
      Exit Function
   End If
   varByteArray = web.ResponseBody
   Set web = Nothing
   'Now save the file with any available method
   On Error Resume Next
   Set ado = Nothing
   Set ado = CreateObject("ADODB.Stream")
   If ado Is Nothing Then
      Set fs = CreateObject("Scripting.FileSystemObject")
      Set ts = fs.OpenTextFile(baseName(strUrl), ForWriting, True)
      strData = ""
      strBuffer = ""
      For lngCounter = 0 to UBound(varByteArray)
         ts.Write Chr(255 And Ascb(Midb(varByteArray,lngCounter + 1, 1)))
      Next
      ts.Close
   Else
      ado.Type = adTypeBinary
      ado.Open
      ado.Write varByteArray
      ado.SaveToFile CreateObject("WScript.Shell").ExpandEnvironmentStrings("%TEMP%") & "\" & strSetup, adSaveCreateOverWrite
      ado.Close
   End If
   SaveWebBinary = True
End Function

Function ShowMessage(strMessage)
   If LCase(Verbose) <> "no" Then
      WScript.Echo strMessage
   End If
End Function

Function RemoveCIFSSetupLocationOpenFileSecurityWarning()
	Dim strRangeOrDomain
	If Not IsEmpty(GetSetupLocationNetworkPath) Then
		Dim regEx, colMatches, objMatch
		Set regEx = New RegExp
		With regEx
			.Global = True
			.MultiLine = True
			.IgnoreCase = True
			.Pattern = "[^/\\\:\*\?\<\>\|]+"
		End With
		
		If regEx.Test(GetSetupLocationNetworkPath) Then
			Set colMatches = regEx.Execute(GetSetupLocationNetworkPath)
			'\\192.168.2.8\NETLOGON\scripts
			'0 = 192.168.2.8
			'1 = NETLOGON
			'2 = scripts
			'Dim i
			'For i = 0 To colMatches.Count-1
			'	WScript.Echo colMatches.Item(i)
			'Next
			strRangeOrDomain = colMatches.Item(0)
		End If
			
		If Not IsEmpty(strRangeOrDomain) Then
			Dim objReg, strComputer
			strComputer = "."
			Set objReg = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")
			Const HKEY_CLASSES_ROOT    = &H80000000
			Const HKEY_CURRENT_USER    = &H80000001
			Const HKEY_LOCAL_MACHINE   = &H80000002

			Dim strKeyPath
			
			Set regEx = New RegExp
			With regEx
				.Global = True
				.MultiLine = True
				.IgnoreCase = True
				.Pattern = "^(([0-9a-f]{0,4}:){1,7}[0-9a-f]{1,4}|([0-9]{1,3}\.){3}[0-9]{1,3})$"
			End With
			
			' Detect IPv4/IPv6 addresses.
			If regEx.Test(strRangeOrDomain) Then
				strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" _
					& "ZoneMap\Ranges"
				
				Dim arrSubKeysPath, strSubKeyPath
				Dim strCurrentRangeKey, strCurrentRangeKeyValue
				
				objReg.EnumKey HKEY_CURRENT_USER, strKeyPath, arrSubKeysPath
				' arrSubKeysPath(0) = Range1
				' arrSubKeysPath(1) = Range2
				' ...
				If Not IsNull(arrSubKeysPath) Then
					For Each strSubKeyPath in arrSubKeysPath
						strCurrentRangeKey = strKeyPath & "\" & strSubKeyPath
						objReg.GetStringValue HKEY_CURRENT_USER, strCurrentRangeKey, ":Range", strCurrentRangeKeyValue
						If (strCurrentRangeKeyValue = strRangeOrDomain) Then
							' IP address already into Local Intranet zone. Nothing to do.
							Exit Function
						End If
					Next
				Else
					ReDim arrSubKeysPath(0)
					arrSubKeysPath(0) = "Range0"
				End If
				
				' Adds IP address to Local Intranet zone.
				' Apparently Windows XP ignores Ranges created dynamically via script
				Dim strNewRangeKeyPath
				strNewRangeKeyPath = strKeyPath & "\Range" & (CInt(Right(arrSubKeysPath(UBound(arrSubKeysPath)), 1))+1)
				objReg.CreateKey HKEY_CURRENT_USER, strNewRangeKeyPath
				objReg.SetDWORDValue HKEY_CURRENT_USER, strNewRangeKeyPath, "*", 1
				objReg.SetStringValue HKEY_CURRENT_USER, strNewRangeKeyPath, ":Range", strRangeOrDomain
			Else
				Dim WshShell, strValueName, dwValue
				
				Set WshShell = Wscript.CreateObject("WScript.shell")
				
				strKeyPath = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\" _
					& "ZoneMap\Domains\" & strRangeOrDomain
				strValueName = "file"
				dwValue = 1
				WshShell.RegWrite strKeyPath & "\" & strValueName, dwValue, "REG_DWORD"
			End If
		End If
	End If
End Function

Function DeployFIServerCACert()
	Dim objFSO, bOverwrite, strLocalCACertDir, strScriptPath
	
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	bOverwrite = True
	
	strLocalCACertDir = objFSO.BuildPath(objFSO.BuildPath(CreateObject("WScript.Shell").ExpandEnvironmentStrings("%PROGRAMFILES%"), "FusionInventory-Agent"), "certs")

	If Not objFSO.FolderExists(strLocalCACertDir) Then
		CreateDirs(strLocalCACertDir)
	End If
	
	strScriptPath = Left(WScript.ScriptFullName,(Len(WScript.ScriptFullName) - (Len(WScript.ScriptName) + 1)))
	objFSO.CopyFile objFSO.BuildPath(objFSO.BuildPath(strScriptPath, "certs"), "cacert.pem"), objFSO.BuildPath(strLocalCACertDir, "cacert.pem"), bOverwrite

	DeployFIServerCACert = objFSO.BuildPath(strLocalCACertDir, "cacert.pem")
End Function

Function GetUAC()
	Dim WshShell, strErrorCode, strSystemRoot
	Dim iRet
	Dim i
	
	Set WshShell = Wscript.CreateObject("WScript.shell")
	
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

Sub CreateDirs( MyDirName )
' This subroutine creates multiple folders like CMD.EXE's internal MD command.
' By default VBScript can only create one level of folders at a time (blows
' up otherwise!).
'
' Argument:
' MyDirName   [string]   folder(s) to be created, single or
'                        multi level, absolute or relative,
'                        "d:\folder\subfolder" format or UNC
'
' Written by Todd Reeves
' Modified by Rob van der Woude
' http://www.robvanderwoude.com

    Dim arrDirs, i, idxFirst, objFSO, strDir, strDirBuild

    ' Create a file system object
    Set objFSO = CreateObject( "Scripting.FileSystemObject" )

    ' Convert relative to absolute path
    strDir = objFSO.GetAbsolutePathName( MyDirName )

    ' Split a multi level path in its "components"
    arrDirs = Split( strDir, "\" )

    ' Check if the absolute path is UNC or not
    If Left( strDir, 2 ) = "\\" Then
        strDirBuild = "\\" & arrDirs(2) & "\" & arrDirs(3) & "\"
        idxFirst    = 4
    Else
        strDirBuild = arrDirs(0) & "\"
        idxFirst    = 1
    End If

    ' Check each (sub)folder and create it if it doesn't exist
    For i = idxFirst to Ubound( arrDirs )
        strDirBuild = objFSO.BuildPath( strDirBuild, arrDirs(i) )
        If Not objFSO.FolderExists( strDirBuild ) Then
            objFSO.CreateFolder strDirBuild
        End If
    Next

    ' Release the file system object
    Set objFSO= Nothing
End Sub

Function TaskScheduler(taskActionPath, taskActionArguments, taskTime)
	Dim objFSO, objFile
	Set objFSO = CreateObject( "Scripting.FileSystemObject" )
	
	Dim WshShell : Set WshShell = WScript.CreateObject("WScript.shell")
	
	Dim strOSVer, strRunLevel, strCommand
	' REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentVersion
	strOSVer = WshShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\CurrentVersion")
	' https://superuser.com/questions/243605/how-do-i-specify-run-with-highest-privileges-in-schtasks
	ShowMessage("System version detected: " & strOSVer)
	If CInt(Left(strOSVer, InStr(strOSVer, "."))) >= 6 Then strRunLevel = " /RL HIGHEST"

	Dim strWinDir : strWinDir = WshShell.ExpandEnvironmentStrings("%WinDir%")
	Dim strTempDir : strTempDir = WshShell.ExpandEnvironmentStrings("%TEMP%")
	
	Dim strTempBat : strTempBat = objFSO.BuildPath(strTempDir, objFSO.GetBaseName(taskActionPath) & ".bat")
	Set objFile = objFSO.CreateTextFile(strTempBat,True)
	objFile.Close
	Set objFile = objFSO.OpenTextFile(strTempBat, 2)
	If Len(taskActionArguments) > 0 Then
		objFile.Write taskActionPath & " " & taskActionArguments
	Else
		objFile.Write taskActionPath
	End If
	objFile.Close
	
	' ShowMessage("Scheduling: " & taskActionPath & " " & taskActionArguments)
	' If objFSO.FileExists(objFSO.BuildPath(strWinDir, "System32\schtasks.exe")) Then
	If CInt(Left(strOSVer, InStr(strOSVer, "."))) >= 6 Then
		WshShell.Run "SCHTASKS.EXE /Delete /TN """ & objFSO.GetBaseName(taskActionPath) & """ /F", 0, True
		strCommand = "SCHTASKS.EXE /Create /TN """ & objFSO.GetBaseName(taskActionPath) & """ /TR """ & strTempBat & """ /SC ONCE /ST " & taskTime & " /RU SYSTEM" & strRunLevel
	Else
		'AT /DELETE /YES
		'AT 12:45 /every:M,T,W,Th,F,S,Su %BATCHROOT%\FAVLSSIC.BAT
		'AT 03:05 /interactive /every:Su %BATCHROOT%\BANDSICH.BAT
		strCommand = "AT.EXE " & taskTime & " " & strCmd & " /C """ & strTempBat & """"
	End If
	ShowMessage("Scheduling: " & strCommand)
	WshShell.Run strCommand, 0, True
End Function

Function GetSetupLocationNetworkPath
	Dim strScriptPath, strNetworkScriptPath
	' strScriptPath = Left(WScript.ScriptFullName, Len(WScript.ScriptFullName) - Len(WScript.ScriptName)-1)
	
	' Checks to see if SetupLocation is a mapped network drive.
	Dim fs, d, dc, s, n
	Set fs = CreateObject("Scripting.FileSystemObject")
	Set dc = fs.Drives
	For Each d in dc
		If d.DriveType = 3 Then
			' J: - \\192.168.2.8\NETLOGON
			If (d.DriveLetter & ":" = fs.GetDriveName(SetupLocation)) Then
				strNetworkScriptPath = d.ShareName
			End If
		End If
	Next
	
	' If SetupLocation is not a mapped network drive, assumes it's a CIFS share (e.g. \\192.168.2.8\NETLOGON).
	If IsEmpty(strNetworkScriptPath) And Left(SetupLocation, 2) = "\\" Then
		strNetworkScriptPath = SetupLocation
	End If
	
	GetSetupLocationNetworkPath = strNetworkScriptPath
End Function

Function Quotes(strQuotes)
	Quotes = Chr(34) & strQuotes & Chr(34)
End Function

'
'
' MAIN
'
'

Dim nMinutesToAdvance, strCmd, strSystemArchitecture, strTempDir, WshShell
Dim objFSO, bOverwrite
Dim strComputer, objWMIService, objNewJob, JobID, errJobCreated
Set WshShell = WScript.CreateObject("WScript.shell")

nMinutesToAdvance = 5

' Get system architecture
strSystemArchitecture = GetSystemArchitecture()
If (strSystemArchitecture <> "x86") And (strSystemArchitecture <> "x64") Then
   ShowMessage("The system architecture is unknown or not supported.")
   ShowMessage("Deployment aborted!")
   WScript.Quit 1
Else
   ShowMessage("System architecture detected: " & strSystemArchitecture)
End If

' Check and auto detect SetupArchitecture
Select Case LCase(SetupArchitecture)
   Case "x86"
      ' The setup architecture is 32-bit
      SetupArchitecture = "x86"
      Setup = Replace(Setup, "x86", SetupArchitecture, 1, 1, vbTextCompare)
      ShowMessage("Setup architecture: " & SetupArchitecture)
   Case "x64"
      ' The setup architecture is 64-bit
      SetupArchitecture = "x64"
      Setup = Replace(Setup, "x64", SetupArchitecture, 1, 1, vbTextCompare)
      ShowMessage("Setup architecture: " & SetupArchitecture)
   Case "auto"
      ' Auto detection of SetupArchitecture
      SetupArchitecture = strSystemArchitecture
      Setup = Replace(Setup, "Auto", SetupArchitecture, 1, 1, vbTextCompare)
      ShowMessage("Setup architecture detected: " & SetupArchitecture)
   Case Else
      ' The setup architecture is not supported
      ShowMessage("The setup architecture '" & SetupArchitecture & "' is not supported.")
      WScript.Quit 2
End Select

' Check the relation between strSystemArchitecture and SetupArchitecture
If (strSystemArchitecture = "x86") And (SetupArchitecture = "x64") Then
   ' It isn't possible to execute a 64-bit setup on a 32-bit operative system
   ShowMessage("It isn't possible to execute a 64-bit setup on a 32-bit operative system.")
   ShowMessage("Deployment aborted!")
   WScript.Quit 3
End If

If IsSelectedForce() Or IsInstallationNeeded(SetupVersion, SetupArchitecture, strSystemArchitecture) Then
   strCmd = WshShell.ExpandEnvironmentStrings("%ComSpec%")
   strTempDir = WshShell.ExpandEnvironmentStrings("%TEMP%")
   If isHttp(SetupLocation) Then
      ShowMessage("Downloading: " & SetupLocation & "/" & Setup)
      If SaveWebBinary(SetupLocation, Setup) Then
         ' ShowMessage("Running: """ & strTempDir & "\" & Setup & """ " & SetupOptions)
         ' WshShell.Run """" & strTempDir & "\" & Setup & """ " & SetupOptions, 0, True
         TaskScheduler Quotes(strTempDir & "\" & Setup), SetupOptions & vbCrLf & "SCHTASKS.EXE /Delete /TN """ & objFSO.GetBaseName(Setup) & """ /F" & vbCrLf & "DEL /Q /F " & Quotes(strTempDir & "\" & Setup) & " " & Quotes(strTempDir & "\" & objFSO.GetBaseName(Setup) & ".bat"), AdvanceTime(nMinutesToAdvance, "HH:MM")
         ShowMessage("Deployment done!")
      Else
         ShowMessage("Error downloading '" & SetupLocation & "\" & Setup & "'!")
      End If
   Else
      ' ShowMessage("Running: """ & SetupLocation & "\" & Setup & """ " & SetupOptions)
      ' WshShell.Run "CMD.EXE /C """ & SetupLocation & "\" & Setup & """ " & SetupOptions, 0, True
	  Set objFSO = CreateObject("Scripting.FileSystemObject")
	  bOverwrite = True
	  objFSO.CopyFile SetupLocation & "\" & Setup, strTempDir & "\" & Setup, bOverwrite
	  TaskScheduler Quotes(strTempDir & "\" & Setup), SetupOptions & vbCrLf & "SCHTASKS.EXE /Delete /TN """ & objFSO.GetBaseName(Setup) & """ /F" & vbCrLf & "DEL /Q /F " & Quotes(strTempDir & "\" & Setup) & " " & Quotes(strTempDir & "\" & objFSO.GetBaseName(Setup) & ".bat"), AdvanceTime(nMinutesToAdvance, "HH:MM")
	  ShowMessage("Deployment done!")
   End If
Else
   ShowMessage("It isn't needed the installation of '" & Setup & "'.")
End If
