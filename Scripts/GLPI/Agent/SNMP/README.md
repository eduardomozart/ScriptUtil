# GLPI Agent modules

This repo stores additional modules for GLPI Agent.

## Modules

### CiscoRAM

Displays used RAM on "FusionInventory SNMP" tab (GLPI 9.5) for Cisco Switches.

<img width="955" alt="image" src="https://github.com/eduardomozart/ScriptUtil/assets/2974895/d16776cb-7134-4698-ae47-1ddc6a1a13ee">

It works by querying the [CISCO-MEMORY-POOL](https://oidref.com/1.3.6.1.4.1.9.9.48.1.1.1) OID.

You can use ``snmpwalk`` (available on [Net-SNMP](https://github.com/bvanassche/net-snmp-binaries/blob/main/net-snmp-5.9.3-1.x64.exe)) to query the values available on this OID (where ``192.168.0.33`` is the IP address of Cisco Switch):

```
C:\Program Files\GLPI-Agent>snmpwalk -v 2c -c public 192.168.0.33 .1.3.6.1.4.1.9.9.48.1.1
SNMPv2-SMI::enterprises.9.9.48.1.1.1.2.1 = STRING: "Processor"
SNMPv2-SMI::enterprises.9.9.48.1.1.1.2.2 = STRING: "I/O"
SNMPv2-SMI::enterprises.9.9.48.1.1.1.2.20 = STRING: "Driver text"
SNMPv2-SMI::enterprises.9.9.48.1.1.1.3.1 = INTEGER: 0
SNMPv2-SMI::enterprises.9.9.48.1.1.1.3.2 = INTEGER: 0
SNMPv2-SMI::enterprises.9.9.48.1.1.1.3.20 = INTEGER: 0
SNMPv2-SMI::enterprises.9.9.48.1.1.1.4.1 = INTEGER: 1
SNMPv2-SMI::enterprises.9.9.48.1.1.1.4.2 = INTEGER: 1
SNMPv2-SMI::enterprises.9.9.48.1.1.1.4.20 = INTEGER: 1
SNMPv2-SMI::enterprises.9.9.48.1.1.1.5.1 = Gauge32: 28274856
SNMPv2-SMI::enterprises.9.9.48.1.1.1.5.2 = Gauge32: 5261456
SNMPv2-SMI::enterprises.9.9.48.1.1.1.5.20 = Gauge32: 40
SNMPv2-SMI::enterprises.9.9.48.1.1.1.6.1 = Gauge32: 35380256
SNMPv2-SMI::enterprises.9.9.48.1.1.1.6.2 = Gauge32: 9418608
SNMPv2-SMI::enterprises.9.9.48.1.1.1.6.20 = Gauge32: 1048536
SNMPv2-SMI::enterprises.9.9.48.1.1.1.7.1 = Gauge32: 17559416
SNMPv2-SMI::enterprises.9.9.48.1.1.1.7.2 = Gauge32: 9418328
SNMPv2-SMI::enterprises.9.9.48.1.1.1.7.20 = Gauge32: 1048532

```

The value that is returned to GLPI is .1.3.6.1.4.1.9.9.48.1.1.1.6.1 (free RAM) as FI4GLPI plug-in uses available RAM to calculate usage instead of the current RAM usage.

## How to install

There's no need to compile GLPI/FusionInventory Agent as those files are compiled on-the-fly.

You just need to copy the desired ``MibSupport\*.pm`` file to ``C:\Program Files\GLPI-Agent\perl\agent\GLPI\Agent\SNMP\MibSupport``

These modules should work on other OSes compatibles with GLPI Agent (not only Windows).

# Tested on

  * GLPI Agent 1.7.3 (Windows/x64)
  * GSTI 9.5.12
    
