if not exist "%appdata%\mozilla\firefox\profiles" goto:eof
set profiledir=%appdata%\mozilla\firefox\profiles
dir "%profiledir%" /a:d /b > "%temp%\temppath.txt"
if not exist "c:\windows\syswow64\nss" goto WIN32
for /f "tokens=*" %%i in (%temp%\temppath.txt) do (
cd /d "%profiledir%\%%i"
copy cert8.db cert8.db.orig /y
"c:\windows\syswow64\nss\certutil.exe" -A -n "Sao Leopoldo" -i "c:\windows\syswow64\nss\saoleo.cer" -t "TCu,TCu,TCu" -d .
)
goto FINALLY
:WIN32
if not exist "c:\windows\system32\nss" goto FINALLY
for /f "tokens=*" %%i in (%temp%\temppath.txt) do (
cd /d "%profiledir%\%%i"
copy cert8.db cert8.db.orig /y
"c:\windows\system32\nss\certutil.exe" -A -n "Sao Leopoldo" -i "c:\windows\system32\nss\saoleo.cer" -t "TCu,TCu,TCu" -d .
)
goto FINALLY
:FINALLY
del /f /q "%temp%\temppath.txt"
