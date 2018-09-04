pushd "%~dp0"
for %%f in (*.crt) do certutil –f –addstore "CA" "%%f"
::for %%f in (*.crt) do certutil –f –addstore "Root" "%%f"
popd
