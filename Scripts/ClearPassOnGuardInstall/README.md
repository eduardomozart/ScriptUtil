# ClearPassOnGuardInstall

Scripts to install ClearPass OnGuard over network. Please notice you'll need to [create the file TRANSFORMS file manually](https://community.arubanetworks.com/discussion/onguard-msi-gpo).

* ``ClearPassOnGuardInstall.ps1``: Script to install/upgrade ClearPass OnGuard if MSI package installer version is greater than current ClearPass OnGuard version installed. Can be added to Machine Startup Script GPO to install ClearPass OnGuard over network.
* ``ClearPassOnGuardInstall.bat``: Script to execute ``ClearPassOnGuardInstall.ps1`` over network for non-GPO install.
