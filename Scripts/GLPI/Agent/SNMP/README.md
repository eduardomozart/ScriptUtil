# GLPI Agent modules

This repo stores additional modules for GLPI Agent.

The intention is to provide accurate CPU and RAM usage on "FusionInventory SNMP" tab (GSIT 9.5) or "GLPI Agent SNMP" tab (GLPI 10 with [swcpuram](https://github.com/eduardomozart/swcpuram) plug-in).

<img width="955" alt="image" src="https://github.com/eduardomozart/ScriptUtil/assets/2974895/d16776cb-7134-4698-ae47-1ddc6a1a13ee">

## Modules

### [CiscoRAM](MibSupport/CiscoRAM.pm)

Displays **RAM usage (in %)** on "GLPI Agent SNMP" tab (GLPI 10 with [swcpuram](https://github.com/eduardomozart/swcpuram) plug-in) for Cisco Switches.

It works by querying the [CISCO-MEMORY-POOL](https://oidref.com/1.3.6.1.4.1.9.9.48.1.1) MIB.

You can use ``snmpwalk`` (available on [Net-SNMP](https://github.com/bvanassche/net-snmp-binaries/blob/main/net-snmp-5.9.3-1.x64.exe)) to query the values available on this OID (where ``192.168.0.33`` is the IP address of Cisco Switch):

```
C:\Program Files\GLPI-Agent>snmpwalk -v 2c -c public 192.168.0.33 .1.3.6.1.4.1.9.9.48.1.1
```

### [HH3CComware](MibSupport/H3CComware.pm)

Displays **Memory** on "Network device" tab and **CPU usage (in %)** and **RAM usage (in %)** on "GLPI Agent SNMP" tab (GLPI 10 with [swcpuram](https://github.com/eduardomozart/swcpuram) plug-in) for H3C HP Comware HH3C Switches.

### [ArubaCPURAM](MibSupport/ArubaCPURAM.pm)

Displays **Memory** on "Network device" tab and **CPU usage (in %)** and **RAM usage (in %)** on "GLPI Agent SNMP" tab (GLPI 10 with [swcpuram](https://github.com/eduardomozart/swcpuram) plug-in) for Aruba APs.

### [UbntCPURAM](MibSupport/UbntCPURAM.pm)

Displays **Memory** on "Network device" tab and **CPU usage (in %)** and **RAM usage (in %)** on "GLPI Agent SNMP" tab (GLPI 10 with [swcpuram](https://github.com/eduardomozart/swcpuram) plug-in) for UniFi APs.

## How to install

There's no need to compile GLPI/FusionInventory Agent as those files are compiled on-the-fly.

You just need to copy the desired ``MibSupport\*.pm`` file to ``C:\Program Files\GLPI-Agent\perl\agent\GLPI\Agent\SNMP\MibSupport``

These modules should work on other OSes compatibles with GLPI Agent (not only Windows).

## Module debugging/troubleshoot

You can debug these module without forcing a full inventory by running the GLPI Agent executables directly.

Example:

```
C:\Program Files\GLPI-Agent>"C:\Program Files\GLPI-Agent\glpi-netinventory.bat" --host 192.168.0.1 --credentials version:2c,community:public --debug > %temp%\comware.ocs
[debug] Current netinventory run expiration timeout: 1.0 hour
[debug] using 1 netinventory worker
[debug] #1, full snmp scan of 192.168.0.1 with credentials 1
[debug] #1, full match for sysobjectID .1.3.6.1.4.1.25506.11.1.12 in database
[debug] #1, sysobjectID match: HH3CComware mib support enabled
[debug] #1, Comware number of valid CPU Usage (%) indexes: 1
[debug] #1, Comware CPU Usage Average (%) [CPU]: 4
[debug] #1, Comware number of valid RAM indexes: 1
[debug] #1, Comware [RAM]: 128
[debug] #1, Comware number of valid RAM Usage (%) indexes: 1
[debug] #1, Comware RAM Usage Average (%) [MEMORY]: 58
[debug] #1, Netinventory worker terminated

```

Check if the ``%temp%\comware.ocs`` file contains ``<CPU></CPU>``, ``<RAM></RAM>`` and ``<MEMORY></MEMORY>`` XML tags as expected. The debug output isn't printed on the ``comware.ocs`` file, only on the ``CMD`` prompt. The pipe redirects only the inventory data to ``comware.ocs`` file.

You can inject the switch device inventory on GLPI by running:

```
C:\Program Files\GLPI-Agent>"C:\Program Files\GLPI-Agent\glpi-injector.bat" --file %temp%\comware.ocs --url https://glpi.example.com/ --verbose
```

# Tested on

  * GLPI Agent 1.7.3 (Windows/x64)
  * GSTI 9.5.12
    
