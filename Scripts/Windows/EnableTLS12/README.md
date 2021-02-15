# Enable TLS 1.2

Windows Vista/7/Server 2008 does not properly support TLS 1.1 and TLS 1.2 HTTPS connections. This can cause issues not just with the built in Internet Explorer web browser, but also with any apps that rely on the Windows networking components when connecting to servers configured to only accept TLS 1.1+ connections.

This script will enable TLS 1.0/1.1/1.2 and disable SSL 2.0/3.0 for Windows Vista/Server 2008 SP2 and Windows 7/Server 2008 R2 SP1 using the [KB4056564](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4056564) update patch for Windows Server 2008 (Windows Vista) and [KB3140245](https://www.catalog.update.microsoft.com/Search.aspx?q=KB3140245) update patch for Windows 7/Server 2008 R2. You can download these updates through the [Microsoft Update Catalog](https://www.catalog.update.microsoft.com).

You can use this script to enable TLS 1.1/1.2 in bulk on your internal network through Active Directory Computer Startup Scripts (GPO).

Please note that this script is distributed AS IS with the intention to be useful. This script update your Windows registry. Incorrect changes to the registry may damage Windows or other installed software. Be sure you know what a given script file contains before running it.

## Directory Structure

```
\\AD.EXAMPLE.COM\NETLOGON\ENABLETLS12
   EnableTLS12.vbs
   windows6.0-kb4056564-v2-x64_173bf5ef3e4cfba4c43899d8db9f25c6dcccab22.msu
   windows6.0-kb4056564-v2-x86_1cf1b27424b4017e5f1341d88b42c463a62e1ac8.msu
   windows6.1-kb3140245-x64_5b067ffb69a94a6e5f9da89ce88c658e52a0dec0.msu
   windows6.1-kb3140245-x86_cdafb409afbe28db07e2254f40047774a0654f18.msu
```

## Variables

You can change the value of some variables in the script to suit your environment:

| Parameter               | Description                                                                                     |
| ----------------------- | ----------------------------------------------------------------------------------------------- |
| ``LOG_PATH``            | Script log files will be recorded in the %TEMP% directory (by default).                         |
| ``LOGNAME``             | By default, log files will be named with the same name as the script (e.g. ``EnableTLS12.log``) |
| ``strHotFixFolderPath`` | Specifies the hotfix location directory. By default, the same directory as the script is used.  |

## Logging

By default, this script records it's operation in the ``%TEMP%\EnableTLS12.vbs`` and ``%TEMP%\EnableTLS12-install_msu.log`` files (e.g. ``C:\Users\Administrator\AppData\Local\Temp``).

Please attach these files when opening an Issue on GitHub to make it possible to identify the possible cause of your problem.
