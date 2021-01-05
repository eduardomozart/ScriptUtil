pushd "%~dp0"
del /f uvnc2me_custom.7z
bin\7zr.exe a -r uvnc2me_custom.7z uvnc2me_custom\*.*
copy bin\7zSD.sfx "%temp%"
if exist "uvnc2me_custom\main.ico" (
	bin\Resourcer.exe -op:upd -src:"%temp%\7zSD.sfx" -type:14 -name:1 -file:"uvnc2me_custom\main.ico"
)
copy /b "%temp%\7zSD.sfx" + 7zsfxbuilder_uvnc2me_custom.txt + uvnc2me_custom.7z uvnc2me_custom_sfx.exe
del /f "%temp%\7zSD.sfx"
popd
pause
