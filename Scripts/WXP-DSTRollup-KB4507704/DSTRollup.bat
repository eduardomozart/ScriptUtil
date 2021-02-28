@echo off
pushd "%~dp0"
setlocal

REM --- Check for admin rights
fsutil dirty query %SystemDrive% >NUL && set admin=1
if NOT "%admin%"=="1" (
     echo.
     echo ERROR: User %USERNAME% does not have administrative privileges.
     goto :EOF
)

set win=
ver | find "6.0." >NUL && set win=windows6.0
ver | find "5.1." >NUL && set win=windowsxp
ver | find "5.0." >NUL && set win=windows2000
if "%win%"=="" (
	echo ERROR: Environment variable win not set.
	exit /b 1
)

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
REM echo %OS%
REM exit /b 1

..\..\win\glb\rootsupd.exe

if "%OS%"=="32BIT" set hotfix=..\..\..\w60\glb\windows6.0-kb4493730-x86_13a73566ca60f81e309380a8df58bf7f8e0aff1c.cab
if "%OS%"=="64BIT" set hotfix=..\..\..\w60-x64\glb\windows6.0-kb4493730-x64_de2cd401093a5c42254c7bd69349821ad10341ff.cab
if "%win%" == "windows6.0" (
	wmic qfe get hotfixid | find "KB4493730" > NUL
	if errorlevel 1 (
		ECHO Installing %hotfix%...
		start /w Pkgmgr /ip /m:%hotfix%
	)
)

if "%OS%"=="32BIT" set hotfix=..\..\w60\glb\windows6.0-kb4474419-v4-x64_a5f1b40e6afb4874248c3a71583010b4b7d4512e.cab
if "%OS%"=="64BIT" set hotfix=..\..\w60-x64\glb\windows6.0-kb4474419-v4-x64_a5f1b40e6afb4874248c3a71583010b4b7d4512e.cab
if "%win%" == "windows6.0" (
	wmic qfe get hotfixid | find "KB4474419" > NUL
	if errorlevel 1 (
		ECHO Installing %hotfix%...
		start /w Pkgmgr /ip /m:%hotfix%
	)
)

if "%OS%"=="32BIT" set hotfix=windows6.0-kb4507704-x86_2cad8cde026c6ae1218bdc7dee5aa63e760d4c61.msu
if "%OS%"=="64BIT" set hotfix=windows6.0-kb4507704-x64_a277d9fcb7b776a13e855987be3e5bea1e5fee61.msu
if "%win%" == "windows6.0" (
	wmic qfe get hotfixid | find "KB4507704" > NUL
	if errorlevel 1 (
		ECHO Installing %hotfix%...
		call :INSTALL_MSU "%hotfix%"
	)
)


if "%win%" == "windowsxp" if "%win%" == "windows2000" (
	regedit /s .\Windows2000-WindowsXP-WindowsServer2003-KB4507704-custom-x86-x64-enu.reg
	set REBOOT_REQUIRED=1
)
endlocal
popd
goto :EOF

:INSTALL_MSU
REM echo %~1
net stop wuauserv >nul 2>&1
net start wuauserv >nul 2>&1
start /wait "install" "%SystemRoot%\system32\wusa.exe" "%~dp0%~1" /quiet /norestart
if "%errorlevel%"=="-2146869232" set REBOOT_REQUIRED=1
if "%errorlevel%"=="-2146869232" set RECALL_REQUIRED=1
REM if "%errorlevel%"=="2359302" echo Update already installed.
REM if "%errorlevel%"=="3010" echo Reboot required.
if "%errorlevel%"=="3010" set REBOOT_REQUIRED=1
REM if "%errorlevel%"=="3010" set RECALL_REQUIRED=1
if not "%errorlevel%"=="3010" if not "%errorlevel%"=="3011" if not "%errorlevel%"=="2359302" if not "%errorlevel%"=="0" call echo ERROR: Installation of %1 failed (errorlevel: %errorlevel%).
goto :EOF
