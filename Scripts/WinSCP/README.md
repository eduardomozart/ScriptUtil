# Sync-WinSCPDirectory

The PowerShell script `Sync-WinSCPDirectory.ps1` syncronizes a remote folder (FTP) into a local folder.

Please note that this script is distributed AS IS with the intention to be useful for developers that wants to interact with WinSCP API.

This script is extremely slow to compare local and remote files into remote folders (FTP) that contains a lot of files. It should should be rewritten to use [ListDirectory](https://winscp.net/forum/viewtopic.php?t=14392) approach into a recursively form, so it compares all files from a folder at once, instead of comparing each individual file.

Instead of using this script, I recommend using the WGET approach as described at [DokuWiki Backup](https://www.dokuwiki.org/tips:backup_script) page instead of this script.

# Parameters

| Parameter           | Description                                                                   |
| ------------------- | ----------------------------------------------------------------------------- |
| ``-sessionUrl``     | Specify connection string to remote folder (FTP).                             |
| ``-localPath``      | Specify local folder path.                                                    |
| ``-remotePath``     | Specify remote folder (FTP) path.                                             |
| ``-batches``        | Specify number of concurrent (simultaneous) download from remote folder (FTP) to local folder. |
| ``-delete``         | Delete files from local folder that doesn't exists into remote folder (FTP).  |
| ``-beep``           | Beeps console if there was changes between local and remote folders (files were added/removed into local folder). |
| ``-pause``          | Pause script execution ("Press any key to continue...") when script finishes. |
| ``-sessionLogPath`` | Specify WinSCP Session logging file location.                                 |
| ``-syncLogPath``    | Specify script logging file location.                                         |
| ``-verbose``        | Print script verbose output.                                                  |
| ``-debug``          | Print script debug output. This option can generate a huge log file, so use this option with caution. |

# Example

    powershell -ExecutionPolicy Bypass -File C:\Users\hp\Documents\GitHub\ScriptUtil\Scripts\WinSCP\Sync-WinSCPDirectory.ps1 -sessionUrl sftp://user:mypassword;fingerprint=ssh-rsa-xxxxxxxxxxx...=@example.com/ -remotePath /home/user/public_html/ -localPath C:\xampp\htdocs -sessionLogPath "%temp%\session.log" -syncLogPath "%temp%\Sync-WinSCPDirectory_public_html.log" -delete

+ **-sessionURL**: attempt to connect to ``example.com`` with ``user`` username and ``mypassword`` as password.
+ **-remotePath**: download files recursively from ``/home/user/public_html/`` remote location.
+ **-localPath**: files downloaded will be saved locally at ``C:\xampp\htdocs``.
+ **-sessionLogPath**: WinSCP session logging will be written into ``%temp%\session.log`` file (useful for Debug purposes).
+ **-syncLogPath**: log script output to ``%temp%\Sync-WinSCPDirectory_public_html.log`` file.
+ **-delete**: enable ``-delete`` parameter. Please read the "Parameters" section for details.

# Logging

Log files are only written when ``-sessionLogPath`` and/or ``-syncLogPath`` parameters are specified.

Please note that **Debug** and **Verbose** output are always written into ``-syncLogPath`` log file even if ``-verbose`` and ``-debug`` parameters are not specified when this script is executed.

# FAQ

## Could not load file or assembly ‘file:///…\WinSCPnet.dll’ or one of its dependencies. This assembly is built by a runtime newer than the currently loaded runtime and cannot be loaded.

You are attempting to load the assembly with an older version of .NET.

This error occurs because on Window Server 2008/Windows 7, PowerShell starts using the old .NET Framework’s CLR which will be able to load it modules compiled on .Net Framework 3.5 (which uses CLR 2.0) but not .Net Framework 4.0 (which uses the CLR 4.0).

You can see exactly which version Powershell is using by command ``$PSVersionTable``.

The solution is documented on the Microsoft's Technet Website, but there is a small PowerShell script that will automatically create and place the necessary files. **Be aware that the script as shown below will overwrite existing .config files IF they have been edited by someone else.**

Start PowerShell as an Administrator and then run the ``CRLVersion4.ps1``. Now restart PowerShell and examine the value of CRLVersion.
