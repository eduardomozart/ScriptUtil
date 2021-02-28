@echo on
setlocal

net stop wuauserv
taskkill /f /im iexplore.exe
taskkill /f /im mmc.exe

for /f "tokens=2 delims=," %%I in (
    'wmic process where "name='wusetup.exe'" get ExecutablePath^,Handle /format:csv ^| find /i "wusetup.exe"'
) do set "exepath=%%~I"

if "%exepath%"=="" (
	echo ERROR: Environment variable "exepath" not set.
	exit /b 1
)

for %%A in ("%exepath%") do ( set "exepath=%%~dpA" )

cd /d "%exepath%"
copy /y *.dll C:\Windows\System32
copy /y *.exe C:\Windows\System32
copy /y *.cpl C:\Windows\System32
for /f %%f in ('dir /b *.mui_ptbr') do (
	call :COPY_MUI "%%f"
)

endlocal
echo.
echo.
echo Installation finished. Please reboot the system.
echo.
pause
goto :EOF

:COPY_MUI
set mui_filename=%~1
set mui_filename=%mui_filename:~0,-5%
copy /y %~1 C:\Windows\System32\%mui_filename%
goto :EOF
