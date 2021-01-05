pushd "%~dp0"
del /f uvnc2me_custom.7z
bin\7zr.exe a -r uvnc2me_custom.7z uvnc2me_custom\*.*
copy bin\7zsd_All.sfx "%temp%"
if exist "uvnc2me_custom\main.ico" (
REM	bin\Resourcer.exe -op:upd -src:"%temp%\7zsd_All.sfx" -type:14 -name:101 -file:"uvnc2me_custom\main.ico"
REM	bin\ResourceHacker.exe -addoverwrite "bin\7zsd_All.sfx", "bin\7zsd_All.sfx", "uvnc2me_custom\main.ico", ICONGROUP, MAINICON, 0
	bin\rcedit-x86.exe "%temp%\7zsd_All.sfx" --set-icon "uvnc2me_custom\main.ico"
)
copy /b "%temp%\7zsd_All.sfx" + 7zsfxbuilder_uvnc2me_custom.txt + uvnc2me_custom.7z uvnc2me_custom_sfx.exe
del /f "%temp%\7zsd_All.sfx"

setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" (
	IE4Uinit.exe -Show
) else (
	IE4Uinit.exe -ClearIconCache
)
endlocal

popd
pause
