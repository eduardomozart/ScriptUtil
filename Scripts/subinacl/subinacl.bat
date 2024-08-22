cls
@echo off
setlocal EnableDelayedExpansion
echo SubInACL Auto 1.5 - 2011-2013 Eduardo Oliveira (https://eduardomozartdeoliveira.wordpress.com/)
echo.

REG QUERY "HKU\S-1-5-19" >NUL 2>&1 && (
GOTO Continue
) || (
GOTO NoAdmin
)

:Continue
:: Change actual directory to the directory that this script is saved with subinacl_list and subinacl.
pushd "%~dp0"

if not exist subinacl_list.txt (
	set filename=subinacl_list.txt
	GOTO FileNotFound
)

if not exist subinacl.exe (
	set filename=subinacl.exe
	GOTO FileNotFound
)

if exist "%temp%\subinacl_hkcu.log" (
	del "%temp%\subinacl_hkcu.log" > nul
)

if exist "%temp%\subinacl_hklm.log" (
	del "%temp%\subinacl_hklm.log" > nul
)

:: Set "winver" variable with 'ver' command output
FOR /F "tokens=* delims=" %%A IN ('ver') DO set winver=%%A

:: Read last 9 words from winver variable... Like '6.1.7601]'
set winver=%winver:~-9%

:: Remove ']' from winver.
:: set winver=%winver:]=%

:: Read first digit from winver
set winver=%winver:~0,1%

:: If Windows Vista or above (6.*), execute the commands below. If Windows XP (5.*), run commands in 'else'.
:: It fix registry permissions to the default system accounts.
if %winver% GEQ 6 (
	secedit /configure /cfg "%windir%\inf\defltbase.inf" /db "%windir%\system32\defltbase.sdb" /verbose
	del "%windir%\System32\GroupPolicy" /f /q 1>NUL 2>&1
	del "%windir%\System32\GroupPolicyUsers" /f /q 1>NUL 2>&1
) ELSE (
	secedit /configure /cfg "%windir%\repair\secsetup.inf" /db "%windir%\system32\secsetup.sdb" /verbose
	del "%windir%\system32\grouppolicy\machine\registry.pol" /f /q 1>NUL 2>&1
	del "%windir%\system32\grouppolicy\user\registry.pol" /f /q 1>NUL 2>&1
)

:: Reset local computer account and general account permission policies.
:: It will be rebuild in the next logon.
:: http://technet.microsoft.com/en-us/library/cc759074(v=WS.10).aspx
reg delete HKLM\Software\Policies /f 1>NUL 2>&1
reg delete HKCU\Software\Policies /f 1>NUL 2>&1
reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Policies /f 1>NUL 2>&1
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies /f 1>NUL 2>&1
gpupdate /force

:SUBINACL
:: http://superuser.com/questions/78496/variables-in-batch-file-not-being-set-when-inside-if
FOR /F "tokens=* delims=*" %%A IN (subinacl_list.txt) DO set StrUsers=!strUsers! /grant=%%A=F

subinacl.exe /errorlog=%temp%\subinacl_hkcu.log /subkeyreg HKEY_CURRENT_USER!strUsers!
subinacl.exe /errorlog=%temp%\subinacl_hklm.log /subkeyreg HKEY_LOCAL_MACHINE!strUsers!

:END
:: Close pushd connection
popd
exit

:NoAdmin
echo.
echo We do not have Administrator rights.
echo.
PAUSE
goto END

:FileNotFound
echo.
echo File %FILENAME% not found.
echo.
PAUSE
goto END