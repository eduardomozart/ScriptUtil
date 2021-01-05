# Uvnc2me

Customized version of Uvnc2me for Win7+ in a single 7z SFX file (Self-extracting archive).

**Note**: I recommend that you use [AeroAdmin](https://www.aeroadmin.com/en/) instead of Uvnc2me. AeroAdmin is free for commercial use and compatible with Windows XP/Server 2003 [1], but it's File Transfer is a paid feature. If you do not need to request permission to remotely access the user's computer (for example, you only provide support to your company's internal users), consider using [MeshCentral](https://www.meshcommander.com/meshcentral2).

## How the Uvnc2me works?

The goal of Uvnc2me was to create a free LogMeIn alternative. A single exe that can serve as viewer or server. Something simple without the need to configure anything... The same executable is used as server and viewer, it just depend on who pressed the connect button. [15]

Let's explain how Uvnc2me makes a connection [10]:

Server (local ip 10.10.10.1) <-> NAT router (external ip 125.125.124.32) <-> Internet (Access Server - TCP/5901)

Viewer (local ip 10.10.10.1) <-> NAT router (external ip 125.125.100.32) <-> Internet (Access Server - TCP/5901)

The Access Server is needed to initiate the connection. It just tell that the server exist on ip A and is using port B and the same for the viewer. [11]

- The Access Server sees a connection from 125.125.124.32 on port X
- The Access Server sees a connection from 125.125.100.32 on port Y

Now, the Access Server [10]:

- Tell the server that the viewer has ip 125.125.100.32 on port Y 
- Tell the viewer that the server is on 125.125.124.32 on port X

Using this information, the viewer and server use a rendezvous to establish a direct connection. The Access Server does not serve to transmit data between server and viewer, the server and viewer create an encrypted tunnel (AES 256) between them. All data goes direct from server to viewer, no data bouncing like with the Repeater. [11] A repeater connection is slower, as all data passes through the Repeater [14]. The password change each connection, the access code is fixed for a server. [7] If password are wrong decryption fail and connection quit [8].

Uvnc2me Nat2nat is done using [UDP hole punishing](http://en.wikipedia.org/wiki/UDP_hole_punching) [11] através das portas UDP 5351/5352. Connect try first Direct UDP if that fails it default to TCP Repeater. [13] Server or viewer behind 2 Nat routers is not supported. If you’re local network is behind a Nat router and you are testing with VMware you need to use the network bridge mode. Using Nat mode you get a dual NAT. [11]

When Uvnc2me work local, you also have need access to the access servers, else server could never find the viewer (even when you run both on the same pc). [12] You can install your own server by executing the [access_server.exe](https://www.uvnc.eu/download/pchw2/access_server.exe). The Access Server needs to run on direct connected server (not behind a Nat) to replace the 62.212.66.133/216.55.178.47 Access Servers via ``uvnc2me.ini``. [16]

## Purpose of this repository

Version 1.0.6 of Uvnc2me ([uvnc2me106.zip](http://www.uvnc2me.com/download/uvnc2me106/)) has two subdirectories: `` win10`` and `` XP``. Despite the name of the ``XP`` directory, the latest version of Uvnc2me compatible with Windows XP is [version 1.0.3](http://www.uvnc2me.com/download/). Unfortunately, I was unable to connect to hosts running Windows XP through this version through Uvnc2me 1.0.3 and 1.0.6, so apparently Uvnc2me is no longer compatible with Windows XP.

It is possible to run the Uvnc2me executable from the `` win10`` subdirectory on Windows 7, however, I was unable to establish the connection using `` win10`` build. However, by using the version of Uvnc2me available in the ``XP`` subdirectory, I was able to successfully connect to Windows 7 hosts.

Therefore, you would need to distribute two different Uvnc2me executables generated through the [Online compiler](https://www.uvnc.com/downloads/pchelpware/108-uvnc2me-downloads.html): one compatible with Windows 7 and the other with Windows 10. To avoid confusion (many users don't even know their operating system version), I would like to distribute a single SFX 7z file that, when executed, automatically detects the operating system used and runs the corresponding version of Uvnc2me.

## Why not use UltraVNC SC?

UltraVNC SC has little to none customizable and limited support for UAC (User Account Control). [2][9] For example, when requesting UAC elevation from UltraVNC SC, if the user presses "No" in the UAC popup (that is, the user does not have administrative permissions), UltraVNC SC will not run. A workaround would be to develop a VBScript or Batch script that checks whether the user has administrative permissions and, if the user does not have administrative permissions, the script requires UAC elevation. If the UAC elevation fails, the script continues to run UltraVNC SC in the same context as the user (consequently, unable to interact with UAC popups), but if the UAC elevation is successful (the user accepted the UAC prompt), the script would change //on-the-fly// the UltraVNC SC INI file to include the parameter `` [DIS_AUC] `` in the configuration file ([example](https://forum.ultravnc.net/viewtopic.php?f=54&p=91542)) and would run UltraVNC SC with administrative permissions (allowing interaction with UAC popups).

In addition, UltraVNC SC uses RC4 encryption. While it is remarkable for its simplicity and speed in software, multiple vulnerabilities have been discovered in RC4, rendering it insecure.

Despite the limitations of UltraVNC SC, it has some advantages:

1. UltraVNC SC is compatible with [Win9x](https://forum.ultravnc.net/viewtopic.php?f=15&t=4536) (with MS Update updates installed)/WinNT4/W2k/XP/Server 2003.
1. UltraVNC SC does not depend on Access Servers to establish the connection between Server and Viewer.
1. Pchelpware and Uvnc2me are not RFB compatible, an open simple protocol for remote access to graphical user interfaces used in VNC.

## HowTo

This HowTo uses the following file tree structure:

```
bin/
├─ 7za.dll
├─ 7zr.exe
├─ 7zsd_All.sfx
├─ Resourcer.exe
uvnc2me_custom/
├─ main.ico
├─ uvnc2me.vbs
├─ win10/
│  ├─ background.bmp
│  ├─ background1.bmp
│  ├─ main.ico
│  ├─ SCHook.dll
│  ├─ uvnc2me.exe
│  ├─ uvnc2me.ini
├─ XP/
│  ├─ background.bmp
│  ├─ background1.bmp
│  ├─ main.ico
│  ├─ SCHook.dll
│  ├─ uvnc2me.exe
│  ├─ uvnc2me.ini
sfx_build.bat
```

You can find Uvnc2me into it's [Download](http://www.uvnc2me.com/download/) page. After the download, you'll need to extract it into ``uvnc2me_custom`` folder, optionally replacing the custom background and INI file from this repository.

The ``bin`` directory is optional and you should create it only if you'll be creating 7z SFX using command-line tools.

### 1. Creating the 7z SFX file

After creating the file tree structure above, there are two ways to create the SFX 7z file:

1. You can generate an SFX 7z file with a customizable SFX icon (optional) by running the batch file `` sfx_build.bat`` (command line). Please download and put the following files into ``bin\`` folder:
     - You'll need to download 7-Zip executable and dependencies (``7za.dll``, ``7zr.exe``). Acquiring these stuffs is easy: Just look for keyword **7-Zip Extra** from Version 9.20 on the [official download page](https://www.7-zip.org/download.html).
	 - SFX module (``7zsd_All.sfx``) is available at [7z SFX Builder/3rdParty/Modules](https://sourceforge.net/p/s-zipsfxbuilder/code/ci/master/tree/3rdParty/Modules/).
     - You can find ``Resourcer.exe`` (Anolis Resourcer) into it's [DeviantArt](https://www.deviantart.com/anolisfx/art/Anolis-Resourcer-116235998) page. After downloading, extract ``Resourcer.exe`` file into ``bin`` folder.
2. You can also open the file `` 7zsfxbuilder_uvnc2me_custom.txt`` via [7z SFX Builder](https://sourceforge.net/projects/s-zipsfxbuilder/) and generate the 7z SFX file through the graphical interface (GUI).

### 2. Executing Uvnc2me with Admin Desktop (UAC)

After creating the SFX file, you can distribute it to your end users. I would like to create an installer that performs the deployment of Uvnc2me on all computers on the local network (LAN) and that this installer creates a Scheduled Task to run Uvnc2me as an Administrator (users on the local network do not have administrative privileges on their computers), allowing the desktop to be displayed as Admin (consequently, allowing interaction with UAC) and automatically creating Firewall rules to allow Uvnc2me to connect without displaying a Windows Firewall popup (users without administrative privileges are unable to free access from Windows Firewall).

The repository "[PSAppDeployToolkit-Scripts](https://github.com/coldscientist/PSAppDeployToolkit-Scripts)" provides a PowerShell installation script that automatically adds an exception to Uvnc2me in the Windows Firewall and creates a Scheduled Task for automatic execution of the Uvnc2me with administrative permissions (UAC).

## Referências 

1. [Features](https://www.aeroadmin.com/en/features.html). AeroAdmin.
2. [[DIS_UAC] and/or "request UAC on start"?](https://forum.ultravnc.net/viewtopic.php?f=15&t=35218). UltraVNC Forums.
3. [UltraVNC as Help Desk tool](https://forum.ultravnc.net/viewtopic.php?f=70&t=31502). UltraVNC Forums.
4. [Access Server behind NAT](https://forum.ultravnc.net/viewtopic.php?f=69&t=31862). UltraVNC Forums.
5. [Repeater](https://www.uvnc.com/products/uvnc-repeater.html). UltraVNC.
6. [pchelpware RC3 Access Servers...](https://forum.ultravnc.net/viewtopic.php?f=65&t=29563). UltraVNC Forums.
7. [What is Recent release date for the pchelpware](https://forum.ultravnc.net/viewtopic.php?f=31&t=31640). UltraVNC Forums.
8. [Beta 1002](https://forum.ultravnc.net/viewtopic.php?f=65&t=29146&start=0). UltraVNC Forums.
9. [UltraVNC Reverse/ Screen Locked](https://forum.ultravnc.net/viewtopic.php?f=3&t=33532). UltraVNC Forums.
10. [UVNC2ME error log](https://forum.ultravnc.net/viewtopic.php?f=69&t=33218). UltraVNC Forums.
11. [Tech data](https://www.uvnc2me.com/tech-data). Uvnc2me.
12. [pchelpware RC3 Access servers...](https://forum.ultravnc.net/viewtopic.php?f=65&t=29563). UltraVNC Forums.
13. [uvnc2me downloads](https://www.uvnc.com/downloads/pchelpware/108-uvnc2me-downloads.html). UltraVNC.
14. [PCHelpware Documentation](https://www.uvnc.com/docs/pchelpware.html). UltraVNC.
15. [Home page](https://www.uvnc2me.com/). Uvnc2me.
16. [Downloads](https://www.uvnc2me.com/uvnc2me-download). Uvnc2me.
