# @name         &Keep Local Directory up to Date...
# @command      powershell.exe -ExecutionPolicy Bypass -File "%EXTENSION_PATH%" ^
#                   -sessionUrl "!E" -localPath "%LocalPath%" -remotePath "%RemotePath%" ^
#                   -batches "%Batches%" %Delete% %Beep% %ContinueOnError% -interval "%Interval%" -pause ^
#                   -sessionLogPath "%SessionLogPath%" -syncLogPath "%SyncLogPath%"
# @description  Periodically scans for changes in a remote directory and ^
#                   reflects them on a local directory
# @version      6
# @homepage     https://winscp.net/eng/docs/library_example_keep_local_directory_up_to_date
# @require      WinSCP 5.16
# @option       - -run group "Directories"
# @option         RemotePath -run textbox "&Watch for changes in the remote directory:" "!/"
# @option         LocalPath -run textbox ^
#                     "... &and automatically reflect them on the local directory:" "!\"
# @option       - -config -run group "Options"
# @option         Batch -run textbox "&Batch downloads" "" -batches
# @option         Delete -config -run checkbox "&Delete files" "" -delete 
# @option         Beep -config -run checkbox "&Beep on change" "" -beep
# @option         ContinueOnError -config -run checkbox "Continue on &error" "" -continueOnError
# @option         Interval -config -run textbox "&Interval (in seconds):" "30"
# @option       - -config group "Logging"
# @option         SessionLogPath -config sessionlogfile
# @option         SyncLogPath -run textbox "&Sync log" "!\"
# @optionspage  ^
#     https://winscp.net/eng/docs/library_example_keep_local_directory_up_to_date#options

 param (
    # Use Generate Session URL function to obtain a value for -sessionUrl parameter.
    $sessionUrl = "sftp://user:mypassword;fingerprint=ssh-rsa-xxxxxxxxxxx...=@example.com/",
    [Parameter(Mandatory = $True)]
    $localPath,
    [Parameter(Mandatory = $True)]
    $remotePath,
	$batches = 5,
    [Switch]
    $delete,
    [Switch]
    $beep,
    [Switch]
    $continueOnError,
    $sessionLogPath = $Null,
	$syncLogPath = $Null,
    $interval = 30,
    [Switch]
    $pause
)

# https://stackoverflow.com/questions/12503871/removing-path-and-extension-from-filename-in-powershell
# $scriptBasename = [io.path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)

# https://stackoverflow.com/questions/24446680/is-it-possible-to-check-if-verbose-argument-was-given-in-powershell
$Verbose = $false
if ($PSBoundParameters.ContainsKey('Verbose')) { # Command line specifies -Verbose[:$false]
    $Verbose = $PsBoundParameters.Get_Item('Verbose')
}

$Debug = $false
if ($PSBoundParameters.ContainsKey('Debug')) { # Command line specifies -Debug[:$false]
    $Debug = $PsBoundParameters.Get_Item('Debug')
}

# https://stackoverflow.com/questions/24616806/powershell-display-files-size-as-kb-mb-or-gb
function DisplayInBytes($num) 
{
	$suffix = "B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"
    $index = 0
    while ($num -gt 1kb) 
    {
        $num = $num / 1kb
        $index++
    } 

    "{0:N1} {1}" -f $num, $suffix[$index]
}

$StartTime = $(Get-Date)

Function ElapsedTime
{
	$elapsedTime = $(Get-Date) - $StartTime

	$totalTime = "{0:HH:mm:ss}" -f ([datetime]$elapsedTime.Ticks)

	return $totalTime
}

<# 
.Synopsis 
   Write-Log writes a message to a specified log file with the current time stamp. 
.DESCRIPTION 
   The Write-Log function is designed to add logging capability to other scripts. 
   In addition to writing output and/or verbose you can write to a log file for 
   later debugging. 
.NOTES 
   Created by: Jason Wasser @wasserja 
   Modified: 11/24/2015 09:30:19 AM   
 
   Changelog: 
    * Code simplification and clarification - thanks to @juneb_get_help 
    * Added documentation. 
    * Renamed LogPath parameter to Path to keep it standard - thanks to @JeffHicks 
    * Revised the Force switch to work as it should - thanks to @JeffHicks 
 
   To Do: 
    * Add error handling if trying to create a log file in a inaccessible location. 
    * Add ability to write $Message to $Verbose or $Error pipelines to eliminate 
      duplicates. 
.PARAMETER Message 
   Message is the content that you wish to add to the log file.  
.PARAMETER Path 
   The path to the log file to which you would like to write. By default the function will  
   create the path and file if it does not exist.  
.PARAMETER Level 
   Specify the criticality of the log information being written to the log (i.e. Error, Warning, Informational) 
.PARAMETER NoClobber 
   Use NoClobber if you do not wish to overwrite an existing file. 
.EXAMPLE 
   Write-Log -Message 'Log message'  
   Writes the message to c:\Logs\PowerShellLog.log. 
.EXAMPLE 
   Write-Log -Message 'Restarting Server.' -Path c:\Logs\Scriptoutput.log 
   Writes the content to the specified log file and creates the path and file specified.  
.EXAMPLE 
   Write-Log -Message 'Folder does not exist.' -Path c:\Logs\Script.log -Level Error 
   Writes the message to the specified log file as an error message, and writes the message to the error pipeline. 
.LINK 
   https://gallery.technet.microsoft.com/scriptcenter/Write-Log-PowerShell-999c32d0 
#> 
function Write-Log 
{ 
    [CmdletBinding()] 
    Param 
    ( 
        [Parameter(Mandatory=$true, 
                   ValueFromPipelineByPropertyName=$true)] 
        [ValidateNotNullOrEmpty()] 
        [Alias("LogContent")] 
        [string]$Message, 
 
        [Parameter(Mandatory=$false)] 
        [Alias('LogPath')] 
        [string]$Path=$syncLogPath, 
         
        [Parameter(Mandatory=$false)] 
        [ValidateSet("Error","Warn","Debug","Verbose","Info")] 
        [string]$Level="Info", 
         
        [Parameter(Mandatory=$false)] 
        [switch]$NoClobber
    ) 
 
    Begin 
    { 
        # Set VerbosePreference to Continue so that verbose messages are displayed. 
		$VerbosePreference = 'Continue'
		$DebugPreference = 'Continue'
    } 
    Process 
    { 
         
		if (!([string]::IsNullOrEmpty($Path))) {
			# If the file already exists and NoClobber was specified, do not write to the log. 
			if ((Test-Path $Path) -AND $NoClobber) { 
				Write-Error "Log file $Path already exists, and you specified NoClobber. Either delete the file or specify a different name." 
				Return 
				} 
	 
			# If attempting to write to a log file in a folder/path that doesn't exist create the file including the path. 
			elseif (!(Test-Path $Path)) { 
				Write-Verbose "Creating $Path." 
				$NewLogFile = New-Item $Path -Force -ItemType File 
				} 
	 
			else { 
				# Nothing to see here yet. 
				} 
		}
		
        # Format Date for our Log File 
        $FormattedDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss" 
 
        # Write message to error, warning, or verbose pipeline and specify $LevelText 
        switch ($Level) { 
            'Error' { 
                Write-Error $Message 
                $LevelText = 'ERROR:' 
                } 
            'Warn' { 
                Write-Warning $Message 
                $LevelText = 'WARNING:' 
                } 
			'Debug' {
				if ($Debug) { # Command line specifies -Debug[:$false]
					Write-Debug $Message
				}
				$LevelText = 'VERBOSE:'
				}
			'Verbose' {
				if ($Verbose) { # Command line specifies -Verbose[:$false]
					Write-Verbose $Message
				}
				$LevelText = 'VERBOSE:'
				}
            'Info' { 
                Write-Host $Message 
                $LevelText = 'INFO:' 
                } 
            } 
         
        # Write log entry to $Path 
        # "$FormattedDate $LevelText $Message" | Out-File -FilePath $Path -Append 
		
		# https://deploymentresearch.com/syncing-to-ftp-archive-sftp-using-powershell-and-winscp/
		# Add-Content $Path -value "$FormattedDate $LevelText $Message"
	
		if (!([string]::IsNullOrEmpty($Path))) {
			# https://powershellexplained.com/2017-03-18-Powershell-reading-and-saving-data-to-files/
			try
			{
				# https://stackoverflow.com/questions/54256798/appending-to-a-file-with-streamwriter-in-powershell
				$stream = New-Object IO.StreamWriter $Path,$true
				# $data | ForEach-Object{ $stream.WriteLine( $_ ) }
				$stream.WriteLine( "$FormattedDate $LevelText $Message" )
			}
			finally
			{
				$stream.close()
			}
		}
    } 
    End 
    { 
    } 
}

# Load WinSCP .NET assembly
$dllPath = if ($env:WINSCP_PATH) { (Join-Path $env:WINSCP_PATH "WinSCPnet.dll") } else { [IO.Path]::Combine((${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0], "WinSCP", "WinSCPnet.dll") }
# Write-Log -Message "dllPath: $($dllPath)" -Level "Debug"
Add-Type -Path $dllPath

# Remote FTP Server settings
#$FTPHostName = "FQDN_of_ftp_server"
#$FTPPortNumber = "21"
#$FTPUserName = "ftpuser"
#$FTPPassword = "ftppassword"

# Directories to sync (Local to Remote)
#$remotePath =  = "S:\xampp\htdocs\wiki"
#$localPath = "S:\xampp\htdocs\wiki"

# Session.FileTransferProgress event handler

#function FileTransferProgress
#{
#    param($e)

#    Write-Progress `
#               -Id 1 -Activity "Downloading" -CurrentOperation ("$($e.FileName) - {0:P0}" -f $e.FileProgress) -Status ("{0:P0} complete at $([math]::Round($e.CPS % 1000)) kbps" -f $e.OverallProgress) `
#               -PercentComplete ($e.OverallProgress * 100)
#}

# Main script

try
{
    # Setup session options from URL
    $sessionOptions = New-Object WinSCP.SessionOptions
	$sessionOptions.ParseUrl($sessionUrl)
    #$sessionOptions.Protocol = [WinSCP.Protocol]::Ftp
	#$sessionOptions.FtpSecure = [WinSCP.FtpSecure]::Explicit
    #$sessionOptions.HostName = $FTPHostName
    #$sessionOptions.PortNumber = $FTPPortNumber
    #$sessionOptions.UserName = $FTPUserName
    #$sessionOptions.Password = $FTPPassword
    # Replace below with your certificate key
    #$sessionOptions.TlsHostCertificateFingerprint = "c0:3c:58:8c:a5:b1:05:4b:f7:de:77:cc:5d:07:cf:68:4e:44:4c:8d"
 
    $session = New-Object WinSCP.Session
 
    # Optimization
    # (do not waste time enumerating files, if you do not need to scan for deleted files)
    if (!(Test-Path $localPath)) {
		$delete = $false
		New-Item -ErrorAction "Stop" -ItemType "Directory" -Path $localPath | Out-Null
	}
	
	if (!(Test-Path $localPath)) {  }
	
	# https://superuser.com/questions/150748/have-powershell-get-childitem-return-files-only
	$localFiles = Get-ChildItem -Recurse -Path $localPath | Where { ! $_.PSIsContainer }
	
	# if ($delete)
    # {
	#	$localFiles = Get-ChildItem -Recurse -Path $localPath
    # }
 
    try
    {
		$session.SessionLogPath = $sessionLogPath
		
		# Will continuously report progress of transfer
        # $session.add_FileTransferProgress( { FileTransferProgress($_) } )
		
        # Connect
		Write-Log -Message "> $(ElapsedTime) Connecting..." -Level "Info"
        $session.Open($sessionOptions)
 
        # Enumerate files and directories to download
		Write-Log -Message "< $(ElapsedTime) Synchronizing changes..." -Level "Info"
        $fileInfos =
            $session.EnumerateRemoteFiles(
                $remotePath, $Null,
                ([WinSCP.EnumerationOptions]::EnumerateDirectories -bor
                    [WinSCP.EnumerationOptions]::AllDirectories))

		$changed = $False
		
		# $j = start-job { while(1) { Get-Random; sleep 1 } }
		
		# $j = Start-Job -ScriptBlock { 
		# } -ArgumentList $sessionUrl,$remotePath
		
		Write-Log -Message "==============================" -Level "Verbose"
		Write-Log -Message "Start-Job EnumerateRemoteFiles" -Level "Verbose"
		Write-Log -Message "dllPath: $($dllPath)" -Level "Verbose"
		#Write-Log -Message "$sessionURL: $($sessionURL)" -Level "Verbose"
		Write-Log -Message "remotePath: $($remotePath)" -Level "Verbose"
		Write-Log -Message "==============================" -Level "Verbose"
		
		$j = Start-Job `
				-ArgumentList $dllPath, $sessionUrl, $remotePath {
				param (
					[Parameter(Position = 0)]
					$dllPath,
					[Parameter(Position = 1)]
					$sessionUrl,
					[Parameter(Position = 2)]
					$remotePath
				)

				# Load WinSCP .NET assembly
				Add-Type -Path $dllPath

				try
				{
					$sessionOptions = New-Object WinSCP.SessionOptions
					$sessionOptions.ParseUrl($sessionUrl)

					$session = New-Object WinSCP.Session

					try
					{
						$session.Open($sessionOptions)
					
						$fileInfos =
							$session.EnumerateRemoteFiles(
								$remotePath, $Null,
								([WinSCP.EnumerationOptions]::EnumerateDirectories -bor
									[WinSCP.EnumerationOptions]::AllDirectories))
					
						# https://stackoverflow.com/questions/58572405/powershell-how-to-get-count-of-piped-collection
						# $fileInfos | ForEach-Object -Begin { $fileInfosCount = 0 } `
						#			  -Process { 
						#					++$fileInfosCount; 
						#					Write-Output "$($fileInfosCount),$($_.Length)" # Drop it to Receive-Job 
						#			  }
						
						# https://stackoverflow.com/questions/14609875/powershell-start-job-receive-job-no-return-value
						$fileInfosCount = 1
						foreach ($fileInfo in $fileInfos)
						{
							$obj=New-Object PSObject
							$obj|Add-Member -MemberType "NoteProperty" -Name ID -Value $fileInfosCount
							$obj|Add-Member -MemberType "NoteProperty" -Name Length -Value $fileInfo.Length
							$obj|Add-Member -MemberType "NoteProperty" -Name Error -Value 0
							$obj # Drop it to Receive-Job
							
							++$fileInfosCount;
						}
					}
					finally {
						$session.Dispose()
					}
				} 
				catch {
					$obj=New-Object PSObject
					$obj|Add-Member -MemberType "NoteProperty" -Name ID -Value 0
					$obj|Add-Member -MemberType "NoteProperty" -Name Length -Value 0
					$obj|Add-Member -MemberType "NoteProperty" -Name Error -Value "Error (Start-Job EnumerateRemoteFiles): $($_.Exception.Message)"
					$obj # Drop it to Receive-Job
					
					Write-Host $obj.Error
				}
			} # End Start-Job
		
		# while($j.State -eq 'Running') {
		#   $enumerateFiles = Receive-Job -Job $j
		#   $enumerateFiles
		#   sleep 1
		# } 

		# $enumerateFiles=@()
		# $obj=New-Object PSObject
		# $obj|Add-Member -MemberType "NoteProperty" -Name ID -Value 0
		# $obj|Add-Member -MemberType "NoteProperty" -Name Length -Value 0
		# $enumerateFiles += $obj
		
		$fileInfosBytesTotal = 0
		$fileInfosCount = 1
		$fileInfosDownloadError = @()
		$fileInfosDownloadSuccess = @()
		$fileInfosLocalPath = @()
        foreach ($fileInfo in $fileInfos)
        {
			# if ($j.State -eq 'Running') { 
			#	$enumerateFiles = Receive-Job -Job $j -Keep
			# }
			
			# Receive-Job -Job $j -OutVariable $enumerateFiles
			
			# $enumerateFiles = Receive-Job -Job $j
			
			# $enumerateFiles = Receive-Job $j -Keep
			
			# Receive first file enumeration from server
			# While (($enumerateFiles | Measure-Object).Count -eq 0)
			# While (!($enumerateFiles -is [System.Object]) -or (($enumerateFiles -is [String]) -and ($enumerateFiles -like "Error*")))
			if (!($enumerateFiles -is [System.Object])) {
				While (!($enumerateFiles -is [System.Object]))
				{
					foreach ( $Job in @(Get-Job | Where-Object { ($_.ID -eq $j.ID) -and ($_.HasMoreData) }) ) {
						$enumerateFiles = Receive-Job $Job -Keep
					}
				}
				
				Write-Log -Message "Printing 'enumerateFiles' variable (1st time)" -Level "Verbose"
				Write-Log -Message ($enumerateFiles | Format-Table | Out-String) -Level "Verbose"
			}
			
			foreach ( $Job in @(Get-Job | Where-Object { ($_.ID -eq $j.ID) -and !($_.Name -like "DownloadID*") -and ($_.HasMoreData) }) ) {
				$cmpEnumerateFiles = $enumerateFiles
				$enumerateFiles = Receive-Job $Job -Keep
				
				if ($Debug) {
					Write-Log -Message "Printing 'enumerateFiles' variable" -Level "Debug"
					Write-Log -Message ($enumerateFiles | Format-Table | Out-String) -Level "Debug"
				}

				# $enumerateFiles | % {
						# 	Write-Host $_.ID
						#   Write-Host $_.Length
						#   Write-Host $_.Error
						# }
				
				# Write-Log -Message ($enumerateFiles | Format-Table | Out-String) -Level "Verbose"
				if ($cmpEnumerateFiles -is [System.Object]) {
					if ($Debug) {
						Write-Log -Message "Printing 'cmpEnumerateFiles' variable" -Level "Debug"
						Write-Log -Message ($cmpEnumerateFiles | Format-Table | Out-String) -Level "Debug"
					}
					
					if (Diff $cmpEnumerateFiles $enumerateFiles)
					{
						$changes = Compare-Object -DifferenceObject $enumerateFiles -ReferenceObject $cmpEnumerateFiles
						Write-Log -Message "Printing differences between 'cmpEnumerateFiles' and 'enumerateFiles' variables" -Level "Verbose"
						Write-Log -Message ($changes | Format-Table | Out-String) -Level "Verbose"
					}
				}
			} # ForEach
			
			# $enumerateFiles | % {
					# 	Write-Host $_.ID
					#   Write-Host $_.Length
					# }
			
			# $enumerateFilesCount = ($enumerateFiles | Measure-Object).Count
			# https://stackoverflow.com/questions/4546567/get-last-element-of-pipeline-in-powershell
			$enumerateFilesCount = ($enumerateFiles | Select-Object -Last 1).ID
			$enumerateFilesBytesTotal = ($enumerateFiles | Measure-Object -Property Length -Sum).Sum
			
			Write-Log -Message "enumerateFilesCount: $($enumerateFilesCount)" -Level "Verbose"
			Write-Log -Message "enumerateFilesBytesTotal: $enumerateFilesBytesTotal ($(DisplayInBytes $enumerateFilesBytesTotal))" -Level "Verbose"
			
			# Print error message only once
			
			# $enumerateFilesError = ($enumerateFiles | Where-Object { ($_.Error -ne 0) })
			# if ($enumerateFilesError.Count -ne 0) { }
			
			foreach ($errorMsg in @($enumerateFiles | Where-Object { ($_.Error -ne 0) })) {
				if ([string]::IsNullOrEmpty($enumerateFilesErrorMsg)) # It's set only when an error is detected
				{
					$enumerateFilesErrorMsg = $errorMsg.Error
					Write-Log -Message $enumerateFilesErrorMsg -Level "Warn"
				}
			}
			
			Write-Log -Message "fileInfosCount: $($fileInfosCount)" -Level "Verbose"
			Write-Log -Message "fileInfosBytesTotal: $($fileInfosBytesTotal) ($(DisplayInBytes $fileInfosBytesTotal))" -Level "Verbose"
				
			# if ($enumerateFilesCount -gt 0) { Write-Log -Message "Count / Out: $(($fileInfosCount / $($enumerateFilesCount)) * 100)" -Level "Verbose" }
			
			# An error occurred
			# if ($enumerateFiles -is [String])
			if (!([string]::IsNullOrEmpty($enumerateFilesErrorMsg)))
			{
				Write-Progress `
							-Id 0 -Activity "Progress" -Status ("$($fileInfosCount) items, $(DisplayInBytes $fileInfosBytesTotal)")
			} 
			else {

				# if(!$enumerateFiles) { $enumerateFiles = "0,0" }

				# $enumerateFiles
				
				
			# if ($enumerateFiles -gt 1) {
			# if (!($enumerateFiles)) {
				# $enumerateFiles = $enumerateFiles -split ','
				# $enumerateFiles = [int]$enumerateFiles[-1]
				# $enumerateFilesBytesTotal = 0
				# for ($i=1; $i -le $enumerateFiles.Count; $i=$i+2) {
				#	$enumerateFilesBytesTotal = $enumerateFilesBytesTotal + [int]$enumerateFiles[$i]
				# }
				
				#$enumerateFiles.Split(",") | ForEach {
				#	"$_ is a token"
				#}
				
				# Write-Verbose "enumerateFiles: $([int]$enumerateFiles[-2])"
				
				if ($enumerateFilesCount -gt $fileInfosCount)
				{
					# Write-Progress `
					#			-Id 0 -Activity "Progress" -Status ("$([math]::Round(($fileInfosCount / [int]$enumerateFiles[-2]) * 100))% complete ($($fileInfosCount) of $([int]$enumerateFiles[-2]) items, $(DisplayInBytes $fileInfosBytesTotal) of $(DisplayInBytes $enumerateFilesBytesTotal) remaining):") `
					#			-PercentComplete (($fileInfosCount / [int]$enumerateFiles[-2]) * 100)
					
					$elapsed = $(Get-Date) - $StartTime
					$averageSpeed = ($fileInfosBytesTotal * 8 / 1MB) / $elapsed.TotalSeconds
					$elapsed = $elapsed.ToString('hh\:mm\:ss')
					$remainingSeconds = ($enumerateFilesBytesTotal - $fileInfosBytesTotal) * 8 / 1MB / $averageSpeed
					
					Write-Log -Message "averageSpeed: $($averageSpeed)" -Level "Verbose"
					Write-Log -Message "elapsed: $($elapsed)" -Level "Verbose"
					Write-Log -Message "remainingSeconds: $($remainingSeconds)" -Level "Verbose"
					
					if ($averageSpeed -eq 0) { $remainingSeconds = -1 } else { $remainingSeconds = [int]$remainingSeconds }
					
					Write-Progress `
								-Id 0 -Activity "Progress" -Status ("$([math]::Round(($fileInfosCount / $($enumerateFilesCount)) * 100))% complete ($($fileInfosCount) of $($enumerateFilesCount) items, $(DisplayInBytes $fileInfosBytesTotal) of $(DisplayInBytes $enumerateFilesBytesTotal) remaining):") `
								-SecondsRemaining $remainingSeconds `
								-PercentComplete (($fileInfosCount / $enumerateFilesCount) * 100)
								
				} else {
					Write-Progress `
							-Id 0 -Activity "Progress" -Status ("$($fileInfosCount) items, $(DisplayInBytes $fileInfosBytesTotal)")
				}
			} # End $enumerateFilesError
			
            $localFilePath =
                [WinSCP.RemotePath]::TranslateRemotePathToLocal(
                    $fileInfo.FullName, $remotePath, $localPath)
			$fileInfosLocalPath = $fileInfosLocalPath + $localFilePath
			
            if ($fileInfo.IsDirectory)
            {
                # Create local subdirectory, if it does not exist yet
                if (!(Test-Path $localFilePath))
                {
                    New-Item $localFilePath -ItemType directory | Out-Null
                }
            }
            else
            {
				$remoteFilePath = [WinSCP.RemotePath]::EscapeFileMask($fileInfo.FullName)
				
				# https://winscp.net/eng/docs/library_example_check_existence_timestamp
				if (!(Test-Path $localFilePath))
				{
					Write-Log -Message (
						". $(ElapsedTime) File $remoteFilePath exists, local backup $localFilePath does not") -Level "Info"
					$download = $True
				}
				else
				{
					$remoteWriteTime = $session.GetFileInfo($remoteFilePath).LastWriteTime
					$localWriteTime = (Get-Item $localFilePath).LastWriteTime
	 
					if ($remoteWriteTime -gt $localWriteTime)
					{
						Write-Log -Message (". $(ElapsedTime) File $remoteFilePath as well as local backup $localFilePath exist, " +
							"but remote file is newer ($remoteWriteTime) than " +
							"local backup ($localWriteTime)") -Level "Info"
						$download = $True
					}
					else
					{
						Write-Log -Message (
							". $(ElapsedTime) File $remoteFilePath as well as local backup $localFilePath exist, " +
							"but remote file is not newer ($remoteWriteTime) than " +
							"local backup ($localWriteTime)") -Level "Info"
						$fileInfosBytesTotal = $fileInfosBytesTotal + $fileInfo.Length
						$fileInfosDownloadSuccess = $fileInfosDownloadSuccess + $localFilePath
						$download = $False
					}
				}
 
				if ($download)
				{
					# Write-Log -Message "< $(ElapsedTime) Downloading file $($fileInfo.FullName)..." -Level "Info"
					Write-Log -Message "< $(ElapsedTime) Downloading file $($remoteFilePath) to $($localFilePath)..." -Level "Info"
					
					Write-Log -Message "==============================" -Level "Verbose"
					Write-Log -Message "Start-Job DownloadID $($fileInfosCount)" -Level "Verbose"
					Write-Log -Message "dllPath: $($dllPath)" -Level "Verbose"
					#Write-Log -Message "$sessionURL: $($sessionURL)" -Level "Verbose"
					Write-Log -Message "sessionLogPath: $($sessionLogPath)" -Level "Verbose"
					Write-Log -Message "remoteFilePath: $($remoteFilePath)" -Level "Verbose"
					Write-Log -Message "localFilePath: $($localFilePath)" -Level "Verbose"
					Write-Log -Message "fileInfoLength: $($fileInfo.Length)" -Level "Verbose"
					Write-Log -Message "fileInfosCount: $($fileInfosCount)" -Level "Verbose"
					Write-Log -Message "==============================" -Level "Verbose"
					
					# https://winscp.net/eng/docs/library_example_parallel_transfers
					Start-Job -Name "DownloadID $($fileInfosCount)" `
						-ArgumentList $dllPath, $sessionUrl, $sessionLogPath, $remoteFilePath, $localFilePath, $fileInfo.Length, $fileInfosCount {
						param (
							[Parameter(Position = 0)]
							$dllPath,
							[Parameter(Position = 1)]
							$sessionUrl,
							[Parameter(Position = 2)]
							$sessionLogPath,
							[Parameter(Position = 3)]
							$remoteFilePath,
							[Parameter(Position = 4)]
							$localFilePath,
							[Parameter(Position = 5)]
							$fileInfoLength,
							[Parameter(Position = 6)]
							$fileInfosCount
						)
						
						$debugDownloadStartJob = $false
						
						try
						{
							# Load WinSCP .NET assembly.
							Add-Type -Path $dllPath
							if ($debugDownloadStartJob) { Write-Output "dllPath" }
							$obj=New-Object PSObject
							$obj|Add-Member -MemberType "NoteProperty" -Name ID -Value $fileInfosCount
							$obj|Add-Member -MemberType "NoteProperty" -Name Length -Value $fileInfoLength
							$obj|Add-Member -MemberType "NoteProperty" -Name LocalFileName -Value $localFilePath
							$obj|Add-Member -MemberType "NoteProperty" -Name Status -Value ""
							$obj|Add-Member -MemberType "NoteProperty" -Name FileName -Value ""
							$obj|Add-Member -MemberType "NoteProperty" -Name FileProgress -Value ""
							$obj|Add-Member -MemberType "NoteProperty" -Name CPS -Value ""
							$obj|Add-Member -MemberType "NoteProperty" -Name OverallProgress -Value ""
							# Session.FileTransferProgress event handler
							
							function FileTransferProgress
							{
								param($e)
								
								$obj.FileName=$e.FileName
								$obj.FileProgress=$e.FileProgress
								$obj.CPS=$e.CPS
								$obj.OverallProgress=$e.OverallProgress
								
								$obj # Drop it to Receive-Job	
								
								if ($debugDownloadStartJob) { Write-Output "FileTransferProgress" }
								
								# https://winscp.net/forum/viewtopic.php?t=25223
								# https://winscp.net/eng/docs/library_session_filetransferprogress#powershell
								Write-Progress `
											   -Id $($fileInfosCount) -Activity "Downloading $($fileInfosCount)" -CurrentOperation ("$($e.FileName) - {0:P0}" -f $e.FileProgress) -Status ("{0:P0} complete at $([math]::Round($e.CPS % 1000)) kbps" -f $e.OverallProgress) `
											   -PercentComplete ($e.OverallProgress * 100)
							}
							
							# Setup session options from URL
							if ($debugDownloadStartJob) { Write-Output "sessionOptions" }
							$sessionOptions = New-Object WinSCP.SessionOptions
							$sessionOptions.ParseUrl($sessionUrl)
							
							try
							{
								if ($debugDownloadStartJob) { Write-Output "session" }
								$session = New-Object WinSCP.Session
								
								$session.SessionLogPath = $sessionLogPath
								
								# Will continuously report progress of transfer
								$session.add_FileTransferProgress( { FileTransferProgress($_) } )
								
								if ($debugDownloadStartJob) { Write-Output "session.Open" }
								$session.Open($sessionOptions)
								
								#$remoteFilePath = "$remotePath/$file"
                                #$localFilePath = (Join-Path "$localPath" "$file")
                                # Write-Host "Downloading $remoteFilePath to $localFilePath"
								
								# Download file
								# $transferResult = $session.GetFiles($remoteFilePath, $localFilePath)
								if ($debugDownloadStartJob) { Write-Output "GetFiles" }
								$transferResult = $session.GetFiles(
                                    [WinSCP.RemotePath]::EscapeFileMask($remoteFilePath),
                                    $localFilePath)
								
								# Did the download succeeded?
								Write-Progress `
											   -Id $obj.ID -Activity "Downloading $($obj.ID)" -Status ("{0:P0} complete at $([math]::Round($obj.CPS % 1000)) kbps" -f $obj.OverallProgress) `
											   -Completed
											   
								if ($transferResult.IsSuccess)
								{
									if ($debugDownloadStartJob) { Write-Output "Completed" }
									$obj.Status="Completed"
								} else {
									$obj.Status=(
										"Error downloading file $($fileInfo.FullName): " +
										"$($transferResult.Failures[0].Message)")
									
									# Print error (but continue with other files)
									if ($debugDownloadStartJob) { Write-Output ($obj.Status) }
									
									# [System.Console]::BackgroundColor = 'Red'
								}
							}
							finally
							{
								# Disconnect, clean up
								$session.Dispose()
							}
						}
						catch
						{
							$obj.Status="Error (Start-Job DownloadID $($obj.ID)): $($_.Exception.Message)"
							if ($debugDownloadStartJob) { Write-Output ($obj.Status) }
							$obj
							exit 1
						}
						$obj
					} | Out-Null # End Start-Job
				} # End Download
            } # End !fileInfo.IsDirectory
			
			# Process the results
			# https://stackoverflow.com/questions/8781666/run-n-parallel-jobs-in-powershell
			#foreach($job in Get-Job)
			#{
			#	$result = Receive-Job $job
			#	Write-Host $result
			#}
					
			# $running = @(Get-Job | Where-Object { $_.State -eq 'Running' })
			# if ($running.Count -ge $batches+1) {
			#	$running | Wait-Job -Any | Out-Null
			# }
			# Write-Log -Message "Printing current jobs" -Level "Verbose"
			if (!($GetJob)) { 
				$GetJob = Get-Job
				Write-Log -Message ($GetJob | Format-Table | Out-String) -Level "Verbose"
			}
					
			if ($Debug -or $Verbose)
			{
				Write-Log -Message "Printing current jobs" -Level "Verbose"
				Write-Log -Message (Get-Job | Format-Table | Out-String) -Level "Verbose"
			} 
			else {
				if ($GetJob -ne (Get-Job)) {
					$GetJob = Get-Job
					Write-Log -Message "Printing current jobs" -Level "Verbose"
					Write-Log -Message ($GetJob | Format-Table | Out-String) -Level "Verbose"
				}
			}
				
			#While ((Get-Job).State -match 'Running')
			# $running = @(Get-Job | Where-Object { ($_.State -eq 'Running') -and ($_.ID -ne $j.ID) })
			$running = @(Get-Job | Where-Object { ($_.Name -like "DownloadID*") })
			$loopHole = "While ( ($($running.Count) -ge $($batches)) -or (($($enumerateFilesCount) -eq $($fileInfosCount)) -and ($($running.Count) -gt 0)) )"
			if ($running.Count -gt 0) { Write-Log -Message $loopHole -Level "Debug" }
			While ( ($running.Count -ge $batches) -or (($enumerateFilesCount -eq $fileInfosCount) -and ($running.Count -gt 0)) )
			{
				# Print While loop debug information on changes only
				if ($loopHole -ne "While ( ($($running.Count) -ge $($batches)) -or (($($enumerateFilesCount) -eq $($fileInfosCount)) -and ($($running.Count) -gt 0)) )") {
					$loopHole = "While ( ($($running.Count) -ge $($batches)) -or (($($enumerateFilesCount) -eq $($fileInfosCount)) -and ($($running.Count) -gt 0)) )"
					Write-Log -Message $loopHole -Level "Debug"
				}
				if (Diff $running @(Get-Job | Where-Object { ($_.Name -like "DownloadID*") })) {
					Write-Log -Message "Printing current jobs inside While loop" -Level "Debug"
					Write-Log -Message (Get-Job | Format-Table | Out-String) -Level "Debug"
				}
				
				foreach ($Job in @(Get-Job | Where-Object { ($_.HasMoreData) -and ($_.ID -ne $j.ID) }) ) {
					Write-Verbose "Job ID: $($Job.ID)"
					Write-Verbose "Job State: $($Job.State)"
								
					$e = Receive-Job $Job
							
					if ($e -is [System.Object])
					{
						Write-Log -Message "Printing 'e' variables from $($Job.Name)" -Level "Verbose"
						Write-Log -Message ($e | Format-Table | Out-String) -Level "Verbose"
									

						$e | % { 
							$eID = $_.ID
							$eLength = $_.Length
							$eLocalFileName = $_.LocalFileName
							$eStatus = $_.Status
							$eFileName = $_.FileName
							$eFileProgress = $_.FileProgress
							$eCPS = $_.CPS
							$eOverallProgress = $_.OverallProgress
						}
								
						Write-Log -Message "e.ID: $($eID)" -Level "Verbose"
						Write-Log -Message "e.Length: $($eLength) (DisplayInBytes $($eLength))" -Level "Verbose"
						Write-Log -Message "e.LocalFileName: $($eLocalFileName)" -Level "Verbose"
						Write-Log -Message "e.Status: $($eStatus)" -Level "Verbose"
						Write-Log -Message "e.FileName: $($eFileName)" -Level "Verbose"
						Write-Log -Message "e.FileProgress: $($eFileProgress)" -Level "Verbose"
						Write-Log -Message "e.CPS: $($eCPS)" -Level "Verbose"
						Write-Log -Message "e.OverallProgress: $($eOverallProgress)" -Level "Verbose"
									

						# https://stackoverflow.com/questions/13738634/how-can-i-check-if-a-string-is-null-or-empty-in-powershell
						# if (!$eStatus) {
						#	Write-Progress `
						#				-Id $($eID) -Activity "Downloading $($eID)" -Status $eStatus -Completed
						# }
								
						Write-Log -Message (". $(ElapsedTime) Downloading $($eFileName) to $($eLocalFileName) - {0:P0} complete at $([math]::Round($eCPS % 1000)) kbps" -f $eOverallProgress) -Level "Info"
								
						if ($eStatus -eq "Completed") {
							$fileInfosDownloadSuccess = $fileInfosDownloadSuccess + $eLocalFileName
							$fileInfosBytesTotal = $fileInfosBytesTotal + $eLength
						} elseif ($eStatus -like "Error*") {
							$fileInfosDownloadError = $fileInfosDownloadError + $eLocalFileName
											
							Write-Log -Message $eStatus -Level "Error"
							# [System.Console]::BackgroundColor = 'Red'
						}
								
						if (!([string]::IsNullOrEmpty($eStatus))) {
							@(Get-Job | Where-Object { $_.ID -eq $Job.ID }) | ForEach { $_ | Remove-Job -Force }
						}
								
								
					}
					# [System.Console]::ReadKey() | Out-Null
				} #End Foreach
								
				# Start-Sleep -Seconds 5
				# Start-Sleep -Seconds 1
						
				# Remove-Job -State Completed
				$running = @(Get-Job | Where-Object { ($_.Name -like "DownloadID*") })
			} # End While
			
			++$fileInfosCount
		} # ForEach FileInfos
		
		#,$fileInfosLocalPath | Get-Member
		# foreach ($fileInfoLocalPath in $fileInfosLocalPath) {
		#	Write-Verbose $fileInfoLocalPath
		# }
		
		# https://winscp.net/eng/docs/library_example_watch_for_changes
		# https://winscp.net/eng/docs/library_example_keep_local_directory_up_to_date
		
		# Then look for differences against the previous list
		# https://community.spiceworks.com/topic/2134167-how-to-use-powershell-to-compare-a-csv-list-with-files-in-a-folder-for-missing
		
		if ($fileInfosCount -gt 1) {
			# https://stackoverflow.com/questions/10550128/powershell-test-if-folder-empty
			if (($localFiles | Measure-Object).Count -gt 0) {
				$changes = Compare-Object -DifferenceObject $fileInfosDownloadSuccess -ReferenceObject ($localFiles | % {$_.FullName})
				
				if (Diff $fileInfosDownloadSuccess ($localFiles | % {$_.FullName})) {
					Write-Log -Message "Printing changes between local and remote files" -Level "Verbose"
					Write-Log -Message ($changes | Format-Table | Out-String) -Level "Verbose"
				}
				
				$addedFiles =
					$changes |
					Where-Object -FilterScript { $_.SideIndicator -eq "=>" } |
					Select-Object -ExpandProperty InputObject
				
				$removedFiles =
					$changes |
					Where-Object -FilterScript { $_.SideIndicator -eq "<=" } |
					Select-Object -ExpandProperty InputObject
					if ($removedFiles)
					{
						Write-Log -Message "Local only files ($(($removedFiles | measure).Count)):" -Level "Info"
						Write-Log -Message ($removedFiles -Join "`n") -Level "Info"
						$changed = $True
					}
			} else {
				$addedFiles = $fileInfosDownloadSuccess
			}
				
			if ($addedFiles)
			{
				Write-Log -Message "Added files ($(($addedFiles | measure).Count)):" -Level "Info"
				Write-Log -Message ($addedFiles -Join "`n") -Level "Info"
				$changed = $True
			}
			
			# https://winscp.net/eng/docs/library_example_keep_local_directory_up_to_date
			if ($delete)
			{
				# Print removed local files
				if ($removedFiles) {
					foreach ($removedFile in $removedFiles)
					{
						Remove-Item -Path $removedFile -Force
						Write-Log -Message "$removedFile deleted" -Level "Info"
					}
				}
			} # End Delete
		} # End fileInfosDownloadSuccess
		
		if ($fileInfosDownloadError) {
			Write-Log -Message "Failed download files ($(($fileInfosDownloadError | measure).Count)):" -Level "Error"
			foreach ($fileInfoDownloadError in $fileInfosDownloadError) {
				Write-Log -Message $fileInfoDownloadError -Level "Error"
			}
		}
			
		if ($changed)
        {
            if ($beep)
            {
                [System.Console]::Beep()
            }
        }
        else
        {
            Write-Log -Message ". $(ElapsedTime) No change." -Level "Info"
        }
    } # 2nd Try
    finally
    {
		Write-Log -Message ". $(ElapsedTime) Disconnecting..." -Level "Info"
        # Disconnect, clean up
        $session.Dispose()
		# [System.Console]::ResetColor()
    }
 
    exit 0
} # 1st Try
catch
{
    Write-Log -Message "Error: $($_.Exception.Message)" -Level "Error"
    exit 1
}

# Pause if -pause switch was used
if ($pause)
{
    Write-Host "Press any key to exit..."
    [System.Console]::ReadKey() | Out-Null
}