$config_text = @"
<?xml version="1.0"?> 
<configuration> 
    <startup useLegacyV2RuntimeActivationPolicy="true"> 
        <supportedRuntime version="v4.0.30319"/> 
        <supportedRuntime version="v2.0.50727"/> 
    </startup> 
</configuration>
"@
 
$config_text| Out-File $pshome\powershell.exe.config
$config_text| Out-File $pshome\powershell_ise.exe.config