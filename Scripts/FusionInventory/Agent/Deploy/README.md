# FusionInventory-Agent-Deploy

This is a slightly modified version from the original ``fusioninventory-agent-deployment.vbs`` script file available at ``contrib\windows`` folder of [fusioninventory\fusioninventory-agent](https://github.com/fusioninventory/fusioninventory-agent) project.

It was modified to add the following features:

1. Run the script elevated (as admin) through ``GetUAC()`` function (UAC).
1. Modified the variable ``SetupLocation`` to use a UNC path.
1. Remove "Open File Security Warning" to the specified UNC path through ``RemoveCIFSOpenFileWarning()`` function.
1. Deploy FusionInventory for GLPI (Server) CA cert to the local computador directory ``C:\Program Files\FusionInventory-Agent\certs`` through ``DeployFIServerCACert()`` function.
1. Modified the variable ``SetupOptions`` and appended the following parameters: ``/debug``, ``/installtasks`` and ``/ca-cert-file``.
