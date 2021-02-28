# DST Rollup (KB4507704)

Earlier versions of Windows continue to delay the clock by one hour (Brasilia time) as they no longer receive time zone updates. 

This script performs the installation of update [KB4507704](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4507704) on Vista / Server 2008 and the import of a registry file on 2000 / XP / Server 2003 to change Brazilian daylight saving time (DST), since Brazil is no longer following daylight saving time (DST).

Please note that this script is distributed AS IS with the intention to be useful. This script update your Windows registry. Incorrect changes to the registry may damage Windows or other installed software. Be sure you know what a given script file contains before running it.

## Directory Structure

```
S:\wsusofflinewxp\client\cmd\custom
   DSTRollup.bat
   windows6.0-kb4507704-x64_a277d9fcb7b776a13e855987be3e5bea1e5fee61.msu
   windows6.0-kb4507704-x86_2cad8cde026c6ae1218bdc7dee5aa63e760d4c61.msu
   Windows2000-WindowsXP-WindowsServer2003-KB4507704-custom-x86-x64-enu.reg
```

## Instructions

If you use WSUS Offline Update 9.5.2 to update Windows XP / Server 2003 / Vista / Server 2008 operating systems offline, do the following:

1. Download all available updates for Windows Vista (w60 / w60-x64) through the WSUS 9.5.2 offline update
1. Save the files ``DSTRollup.bat`` and ``Windows2000-WindowsXP-WindowsServer2003-KB4507704-custom-x86-x64-enu.reg`` in the ``client\cmd\custom`` directory
1. Save the files ``windows6.0-kb4507704-x64_a277d9fcb7b776a13e855987be3e5bea1e5fee61.msu`` and ``windows6.0-kb4507704-x86_2cad8cde026c6ae1218bdc7dee5aa63e760d4c61.msu`` in the ``client\cmd\custom`` directory
1. Navigate to the ``client\cmd\custom`` directory and rename the ``InitializationHook.cmdt`` file to ``InitializationHook.cmd``
1. Add the following content to the ``InitializationHook.cmd`` file:

```
@echo off
pushd "%~dp0"
call DSTRollup.bat
popd
```
