# FusionInventory-Agent-Deploy

This is a slightly modified version from the original ``fusioninventory-agent-deployment.vbs`` script file available at ``contrib\windows`` folder of [fusioninventory\fusioninventory-agent](https://github.com/fusioninventory/fusioninventory-agent) project.

It was modified to add the following features:

1. Remove "Open File Security Warning" to the specified UNC path through ``RemoveCIFSOpenFileWarning()`` function.
1. Deploy FusionInventory for GLPI (Server) CA cert to the directory ``C:\Program Files\FusionInventory-Agent\certs`` through ``DeployFIServerCACert()`` function.
