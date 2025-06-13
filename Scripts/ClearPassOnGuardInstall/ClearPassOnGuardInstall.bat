:: Check privileges 
net file 1>NUL 2>NUL
if not '%errorlevel%' == '0' (
    powershell Start-Process -FilePath "%0" -ArgumentList "%cd%" -verb runas >NUL 2>&1
    exit /b
)

:: Change directory with passed argument. Processes started with
:: "runas" start with forced C:\Windows\System32 workdir
if not '%~1' == '' (
    cd /d %1
)

:: Actual work
pushd "%~dp0"
powershell -ExecutionPolicy Bypass -File "ClearPassOnGuardInstall.ps1"
popd
