# FusionInventory-Agent-Deploy

This is a slightly modified version from the original ``fusioninventory-agent-deployment.vbs`` script file available at ``contrib\windows`` folder of [fusioninventory\fusioninventory-agent](https://github.com/fusioninventory/fusioninventory-agent) project.

It was modified to add the following features:

1. Run the script elevated (as admin) through ``GetUAC()`` function.
1. Modified the variable ``SetupLocation`` to use a UNC path.
1. Remove "Open File Security Warning" to the specified UNC path through ``RemoveCIFSOpenFileWarning()`` function.
1. Deploy FusionInventory for GLPI (Server) CA cert to the local computador directory ``C:\Program Files\FusionInventory-Agent\certs`` through ``DeployFIServerCACert()`` function.
1. Added sub procedure ``CreateDirs`` used by ``DeployFIServerCACert()`` function to create the certs folder several levels deep all in one go, if it doesn't exists.
1. Modified the variable ``SetupOptions`` and appended the following parameters: ``/debug``, ``/installtasks``, ``/no-p2p`` and ``/ca-cert-file``.

## Directory Structure

```
\\AD.EXAMPLE.COM\NETLOGON\FUSIONINVENTORY-AGENT
│   fusioninventory-agent-deployment.vbs
│   fusioninventory-agent_windows-x64_2.5.2.exe
│   fusioninventory-agent_windows-x86_2.5.2.exe
│
└───certs
        cacert.pem
```
