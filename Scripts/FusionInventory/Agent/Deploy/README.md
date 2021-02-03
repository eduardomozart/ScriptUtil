# FusionInventory-Agent-Deploy

## Script VBScript (Visual Basic Script)

This is a slightly modified version from the original ``fusioninventory-agent-deployment.vbs`` script file available at ``contrib\windows`` folder of [fusioninventory\fusioninventory-agent](https://github.com/fusioninventory/fusioninventory-agent) project.

It was modified to add the following features:

1. Run the script elevated (as admin) through ``GetUAC()`` function.
1. Modified the variable ``SetupLocation`` to use a UNC path.
1. Added ``GetSetupLocationNetworkPath()`` and ``RemoveCIFSSetupLocationOpenFileSecurityWarning()`` functions to detect if ``SetupLocation`` variable is into a CIFS (SMB) share and if it's a network share then ``RemoveCIFSSetupLocationOpenFileSecurityWarning()`` function add an exception to not show "Open File" warning when executing the FusionInventory Agent installer through a CIFS (SMB) share.
1. Deploy FusionInventory for GLPI (Server) CA cert to the local computer (``C:\Program Files\FusionInventory-Agent\certs`` directory) through ``DeployFIServerCACert()`` function.
1. Added sub procedure ``CreateDirs`` used by ``DeployFIServerCACert()`` function to create the certs folder several levels deep all in one go, if it doesn't exists.
1. Modified the variable ``SetupOptions`` and appended the following parameters: ``/execmode``, ``/add-firewall-exception``, ``/debug``, ``/installtasks``, ``/no-p2p`` and ``/ca-cert-file``.
1. Added the function ``TaskScheduler()`` to schedule the installation of the agent instead of installing it immediately. The basic problem with updating the agent through a deployment task is the agent will have to uninstall itself while in use, thus throwing some errors. A good method to update the agent without errors is to create a scheduled task that will update the agent to it's latest version. Please see "[Update FusionInventory agent through a deploy task](http://fusioninventory.org/documentation/tasks/updateagentwithdeploytask.html)" for more information.
1. Now you can specify ``/Verbose`` and ``/Force`` arguments from command line to debug or force the FusionInventory Agent installation without editing the script manually.

### Directory Structure

```
\\AD.EXAMPLE.COM\NETLOGON\FUSIONINVENTORY-AGENT
│   fusioninventory-agent-deployment.vbs
│   fusioninventory-agent_windows-x64_2.6.exe
│   fusioninventory-agent_windows-x86_2.6.exe
│
└───certs
        cacert.pem
```

## Group Policy

Please read "[Déployer l’agent Fusion Inventory par GPO](https://www.it-connect.fr/deployer-lagent-fusion-inventory-par-gpo/)" (French) for instructions on how to configure the FusionInventory Agent using Group Policy.

1. Copy the file "FusionInventory.admx" to ``PolicyDefinitions`` directory.
1. Copy the file "FusionInventory.adml" to ``PolicyDefinitions\en-US`` subdirectory.

Sample configuration:

```
Collect Timeout  180 
CA Cert Dir  
CA Cert File ..\..\certs\cacert.pem 
Conf Reload Interval  0 
Debug  2 
DelayTime  3600 
HTML  Disabled 
HTTPd IP  
HTTPd Port  62354 
HTTPd Trust 127.0.0.1/32,192.168.2.209/32 
Local  
Log File ..\..\logs\fusioninventory-agent.log 
Log File - Max Size (MB)  16 
Logger  
No-Category  
No-HTTPd  Disabled 
No-P2P  Disabled 
No-SSL Check  Disabled 
No-Task  
Password  
Proxy  
Scan HomeDirs  Disabled 
Scan Profiles  Disabled 
Server https://glpi.example.com/plugins/fusioninventory/ 
Tag  
Tasks  
Timeout  180 
User 
```
