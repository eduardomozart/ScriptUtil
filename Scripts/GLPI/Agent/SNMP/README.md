# GLPI Agent modules

This repo stores additional modules for GLPI Agent.

## Modules

### CiscoRAM

Displays used RAM on "FusionInventory SNMP" tab (GLPI 9.5) for Cisco Switches.

<img width="955" alt="image" src="https://github.com/eduardomozart/ScriptUtil/assets/2974895/d16776cb-7134-4698-ae47-1ddc6a1a13ee">

## How to install

There's no need to compile GLPI/FusionInventory Agent as those files are compiled on-the-fly.

You just need to copy the desired ``*.pm`` file to ``C:\Program Files\GLPI-Agent\perl\agent\GLPI\Agent\SNMP\MibSupport``

These modules should work on other OSes compatibles with GLPI Agent (not only Windows).

# Tested on

  * GLPI Agent 1.7.3/FusionInventory 2.6.0 (Windows/x64)
  * GSTI 9.5.12
    
