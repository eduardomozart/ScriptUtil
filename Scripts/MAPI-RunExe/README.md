# RunExe

Script to run MAPI executable at logon via GPO by [Andrei Ghita](https://developermessaging.azurewebsites.net/2016/02/08/script-to-run-mapi-executable-at-logon-via-gpo/). I only added the line 43 so the script ``cmd`` is executed only if Outlook is installed.

## Description

The script below allows you to run a MAPI executable at logon via GPO. It detects the office version and bitness and it runs the exe version matching the bitness of Outlook.

## Syntax

The syntax to use is the following:

```
RunExe.vbs ROOT_FOLDER  EXE_NAME  PARAMETERS  RUN_OPTION_RERUN
```

For example, presuming I’ve stored the 32 bit version of an executable in \\CONDC-01\Netlogon\Myexe\x86 and the 64 bit version in \\CONDC-01\Netlogon\Myexe\x64 and the executable name is myexe.exe, to run the executable once and prevent future executions you would use the following syntax:

```
RunExe.vbs "\\CONDC-01\Netlogon\Myexe" "Myexe.exe" "param1 param2 param3" false
```

If your parameters contain quotes, please replace them with apostrophes "'". For example:

```
RunExe.vbs "\\CONDC-01\Netlogon\LdapABManager" "LdapABManager.exe" "-m create -f '\\CONDC-01\Netlogon\LdapABManager\ABConfiguration.xml'" false
```
