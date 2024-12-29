REM cls
REM @echo off
setlocal EnableDelayedExpansion

REG QUERY "HKU\S-1-5-19" >NUL 2>&1 && (
GOTO Continue
) || (
GOTO NoAdmin
)

:Continue
pushd "%~dp0"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs\CLSID" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs\CurVer" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs.1" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs.1\CLSID" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\AppID\{A79DB36D-6218-48E6-9EC9-DCBA9A39BF00}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\AppID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\Version" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\shdocvw" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\urlmon" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories\{56FFCC30-D398-11D0-B2AE-00A0C908FA49}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocHandler32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocServer32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Elevation" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocHandler32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocServer32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\ProgID" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Programmable" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Version" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\VersionIndependentProgID" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\Elevation" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\LocalServer32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\EPP" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\EPP" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Features\060BFB5022F401740B2A82101A6B605C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Features\588E9903A8ED9904BA2E65D18C85D9AF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Features\92A97705E43863E4BBBE7BACCB768A52" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Features\D7CD6B45B5C8BFD4CB510C013A23B6B2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\060BFB5022F401740B2A82101A6B605C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Media" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Net" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Media" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Net" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\92A97705E43863E4BBBE7BACCB768A52" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Media" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Net" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Media" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Net" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\18EAFAA8B504E9C4781184E19FC7A0F8" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\CC07A515C4AECB742B69801E86BC459D" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\ProxyStubClsid32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\ProxyStubClsid32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\ProxyStubClsid32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\ProxyStubClsid32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\MuiCache\A6" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\MuiCache\A6\96383CDB" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2\2\0\0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\Bags\50" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\Bags\50\ComDlgLegacy" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\Bags\50\ComDlgLegacy\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\Bags\50\Shell" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0\win32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\FLAGS" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0\win32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\FLAGS" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\HELPDIR" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2\2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2\2\0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs\CLSID" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs\CurVer" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs.1" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs.1\CLSID" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\EPP" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{A79DB36D-6218-48E6-9EC9-DCBA9A39BF00}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal\MsMpSvc" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\Network\MsMpSvc" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\Version" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\shdocvw" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\urlmon" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories\{56FFCC30-D398-11D0-B2AE-00A0C908FA49}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocHandler32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocServer32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Elevation" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocHandler32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocServer32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\ProgID" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Programmable" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Version" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\VersionIndependentProgID" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\Elevation" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\LocalServer32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shellex\ContextMenuHandlers\EPP" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Drive\shellex\ContextMenuHandlers\EPP" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\060BFB5022F401740B2A82101A6B605C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\588E9903A8ED9904BA2E65D18C85D9AF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\92A97705E43863E4BBBE7BACCB768A52" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\D7CD6B45B5C8BFD4CB510C013A23B6B2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Media" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Net" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Media" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Net" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Media" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Net" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Media" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Net" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\18EAFAA8B504E9C4781184E19FC7A0F8" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\CC07A515C4AECB742B69801E86BC459D" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\ProxyStubClsid32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\ProxyStubClsid32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\ProxyStubClsid32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\ProxyStubClsid32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\TypeLib" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0\win32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\FLAGS" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0\win32" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\FLAGS" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\HELPDIR" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Extensions" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Processes" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Miscellaneous Configuration" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\MpEngine" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\IP Ranges" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\Ports" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\Processes" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\Threat IDs" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\SKU Differentiation" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Registration" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Registration\Interception Points" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Registration\Interception Points\{AE632C46-4C8F-45CA-8AC5-B8CB38B2B9C7}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Quarantine" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Real-Time Protection" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Remediation" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Reporting" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Scan" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Signature Updates" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\SpyNet" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Threats" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Threats\ThreatIDDefaultAction" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Threats\ThreatSeverityDefaultAction" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\UX Configuration" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Security Client" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\CatDBTempFiles\C:*Windows*system32*CatRoot*TMP6072.tmp" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\CatDBTempFiles\C:*Windows*system32*CatRoot*TMP62B7.tmp" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\CatDBTempFiles\C:*Windows*system32*CatRoot*TMP64AD.tmp" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\18EAFAA8B504E9C4781184E19FC7A0F8" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\CC07A515C4AECB742B69801E86BC459D" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\01523D0AED689EC4C984FDC19AC4342F" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\01BEA2925585F5A4AA73F72A56C03416" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\037145BFB4595B1449DD5110DBBC2507" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0764D1BCF624D2D4699B30ABC24117CD" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0780CA2729318804E9770C02D53644FA" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\07F2D38488A50BF4BA40D916B27DC5C0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\07F90C94F2A1B4642B4B02F30D792205" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\09B51B1EA37612E4B81CF842CEAF9581" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\09EBB9D81D94B1641BCA51477BF78E9A" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0A38F93931709064A97199C5B30DA7BD" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0A6E0DC76B2FA274BBF952A50E09F855" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0CABE05899BC7D440A621FC2E2FAD8EE" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0D3FA2694E42D4C41AC5DA241A7F7855" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0ECE66AB04E8DBF4B893E3386A52F71A" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12450D303EAC62D4089DBE4086519212" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12A7FAF0C7F9DD7418212CD2081FEE39" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12C5C85AB0F3A634D9DE0D014C729BCF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12EF40EFA8ABFA84796E1946EC781B84" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\1311F3F504E9F0F4BAC62F4E7237D588" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\13F5DB82871A3914DA4348BBF344C017" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\14F5659F13BA0FC408436213C9FDC7D3" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\1B0A03BF3254292479EC484FF0D94B67" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\201E8C08E76091D4A96D005995980E82" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2037F46F534DC5B478AED44254147DD6" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\206E2EDE930F25C47BA2456B99F1D64C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\20A40AFED3307084B9A54F528099994E" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\22C1E077F939771499229BCC0B0817BF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\23212BA6E4FA47A459164E39AEF1AF19" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\246448638228C9F478B8F0DD9C8EDC0F" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\24BF93A1A95F6B640AA45B1A0CF9B672" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\25446969A23D9874593065374C5C98CC" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2CA8BBCFE72313648AAD891C02AC11B2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2D22D6569763B964484E798B63574779" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2F55144FDF8EBEF4A95CCCDE24A75D6A" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2FCA3AAFCA8A4FD49983C80E699E21C3" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3386AF4CE048AAA4DAB6E5788EDB3675" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\34035BBEC8542B243B660C01E077D9D6" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\341EC63C36CD12B4FAD4B7008BE3F87C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\34C3501731FD6604FA3FEE04455D08A5" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\37127518BB68D8D429BA62853BBC27F1" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3742CF8B53D00F64E8E290AD08A23CC1" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3846296071D4E1443AED4EEF4156E478" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\39D4460F39F215F47A206650EF745286" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3EB6007D1DEC7B543A38F5C380446E4B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\4098B2BC658CD15418E9ECFEBDD34E69" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\41AE8940BF79FDE439BD02BB36D4D6FF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\43FC6817EFC7A9045A091E1C9792FA10" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\445BE97A6F6F34541B0AA01F172DE56B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\4601324096B747C449D82AA3B457E31D" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\4622EE8A06B9A1146A00D7EC3CEA5336" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\473349D1495A9FA4B9016091802CA0F9" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\49BA6157DEDBCC74CA96E4D479792C75" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\51EF5CA72173BBC45A024FFABBBB1C5B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\54D34C5BCC400EE46AF9788512CB547A" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\55B24719E5A35CE4AB7D940CC201C8D5" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\564F8A66E04A81B42AB78BBD95C973B4" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\595A69D04EE6A3F4AA8A99DAF8508E11" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\5BE0645DC6E725E4ABC6B35DD4DFC85F" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\5FB70423FA556D241B8E34C4243C5B8E" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6397BD5CCB84DD14AA9922338C192CD4" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\64D7BB277153F6C4E8B77D2CCB4FF137" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6504C15F8F2C17C4498F972591E3B4B4" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\653A32395AAC1A746A89FEA059360E96" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\66C49D5ED52C47A4C94E676318AA7C05" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\68479F247AEB99948A164F03594788F8" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\694567FB52EFBDD45B0C09ACE0114485" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6B025C387EDA978468EA438AA4E73DE0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6B99332E3347BC04683E026C1676560B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6C7310CE84DE6194A8CA00CF1546CC3A" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6DBB8053881010241925C119C2C3F2A8" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6E0EBF3706210F2409A2F6A4E9562320" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\70428969E2D1B83489B8805568E08EEA" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\72E7B88E282A1834B8131396C4F2B820" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\752925E84F0B267428C2FA52FAFBA778" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\75A1E42E7528FB94A9C8A0545E57D2CE" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\767D288AD01EDAA4C93474675C8F9BB4" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\76ED05BECD2E1F848A1546938A49DFC1" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\777C23B0CC2C19742B99A86967D28DDC" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\79039BDF048DC5D48B314939DB5E9FA2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\7C5F7284834194345838FE5BFAD889EC" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\7C81C3FE6CEF1E54A95631A9CA56F952" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8076CB86CA9AEC74593FDA43E3CB6F48" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\80EBD67D6F9488B4CB738F0B8BC6C80B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\85B58B945B896234FA6497B4EAC00C72" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8702D3BD93060A8439C106246F1C9BFA" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\88CF20D1734503A4EB04DFC84A1E53E0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\89B4BA00D0AA2C64ABA8E36D70CFB582" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8AAA926C1768AE945BBBFABED00EF600" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8BF8EFB52D6ACA54490353A4E362E668" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8D6B52A9B9DCB5C43B39502D397B0A7F" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8E9C3FF9D38397B46A663813BA8F8521" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\98EA2D1B13919E34DA698B457CA492CA" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9B1F5E8D4C6FD1341A699357FCC2703B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9D4A9EE5B7D448A41B715600641063A5" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9DB9FE7DF150E554A826A02428613812" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9EA50590EDA67E440AE44E2D2C0E0416" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9EE09A0126ECC924E955C10C317DA8C6" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9FF30FB9C75714C4B837ADAE06581099" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A0771F70253FF9E4EA0F8CD15435B764" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A1678F0F9F326004193D9E00E3F80B54" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A5041DC31539C7649931C9CB6776B5DB" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A517ABAC1D585544EB7DD36A6CE88949" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A9363C80F5D92BA4C8C0F33F55578183" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\ABE74742105C56643B4AE32A9E312D61" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\ACE6A9D22E99C7C44A202641BFCEF83C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\AEE65E55DF05ED140B47EB5C7FB5369C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\AF4CE8622F10D45478F7C3DA6F84366A" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B28C83EBADC3A9D449E2D0578F96C35E" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B66DBA035CFB2BA40A2EACC8E31814B8" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B7E08E385BF9C9A42B544110EB5A990C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B82C3B6FEF01EE942B924482B10CBD4E" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B9C46CC2CB9C476499A0DC5180A107F6" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BA3A91F8AB8FC7A498D1F7F5FB819379" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BAF00D1A12911964A9D215B05802F52E" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BCD33DABF7BC52F47B1F7841BAA8E05C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BE451D3AC2AD74243B21D75A79530ADF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C2422EC720D257B48A60E2B849FBADB0" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C276244D8612E7B4D9E75D489C021CF3" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C34A0EBF281C0E34BB70FEFCF85B7715" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C4D6BA546F95BAF45BEABDC058D8937A" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C53C81AD148FB9E43A30B3156F5D5395" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C75C0EB1EFC992E46BFF69B2371D591E" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C90EA83C2A8755E4D9688958683ACA52" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\CC3B95501AB799046BF51FEB06E417CA" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\CE1898C8C42C73A49BF5F2E4625E1FFE" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D2F0E0EABE5D51847B262283B0DB01D2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D3CEFCDEF14D185488F6E15BB6478450" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D75228EFFE3171846B2B5B696B3ED530" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D86BE2F5E1B72C54B837DB48ADEE2603" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E0A864A6E031C4145A962AF55BAAFC5B" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E3397DC4493E0C84983383AB3AE171B7" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E343455F343F7134D82B407AB1625C89" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E36AA351DFB3C5943AF5586F660541D1" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E4E1364141ED6BB46B4B7EE9258F7209" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E774E119ACBA0F74CACEFEFFFBB6D53A" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E9C7EF746819CB14799F59438E45184F" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EA6D617B668331D44871FABF4E8D83D6" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EE6766BC6825308409F0E88087FCD672" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF092BF2B798DD1489401928B38D44E2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF374A3F802F8614DA7AEB27861167E9" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F3067DF1BCAC1CD4AAF0DC3922346D61" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F629A82DD11CF0848B6C04479C6F9FFC" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F7F55E851A892E64A9341CFBDD19C80D" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F901D882BACCD4F4B9108823ADB5ED91" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FAC431669832E6A40BA7C08B3E8C203A" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FD7DBD2D2ABC438468621EF2B306C556" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FE4E8CC936BE0164EAD2B6162BB90382" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FE4E8CC936BE0164EAD2B6162BB90392" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\52F553BF830F4A74F9B9344D1748B246" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\AC6E3177D5407944FBCB027BBE4BE263" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F46C95810534DB34491B8397BB7CAAEB" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\Features" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\InstallProperties" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\Patches" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\Usage" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\Features" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\InstallProperties" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\Patches" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\Usage" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\Features" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\InstallProperties" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\Patches" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\Usage" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\InstallProperties" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\Patches" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\Usage" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\Features" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\Sysprep\Cleanup" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Security Client" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{05BFB060-4F22-4710-B0A2-2801A1B606C5}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{3099E885-DE8A-4099-ABE2-561DC8589DFA}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{50779A29-834E-4E36-BBEB-B7CABC67A825}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{54B6DC7D-8C5B-4DFB-BC15-C010A3326B2B}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client\{a1488156-5391-4f34-9214-105e4335f3a4}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client OOBE" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client OOBE\{913EFF0B-2CC3-4c64-A840-B0D7A38E90E4}" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_MPFILTER" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_MPFILTER\0000" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_MPFILTER\0000\Control" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter\Instances" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter\Instances\MpFilter Instance" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter\Enum" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpNWMon" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MsMpSvc" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MsMpSvc\Security" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Network Inspection System" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Network Inspection System\Linkage" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Network Inspection System\Performance" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NisDrv" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NisSrv" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NisSrv\Parameters" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Microsoft Security Client" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\MPSampleSubmission" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\Microsoft Antimalware" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\RestrictedServices\Configurable\System" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0613561CC95F0384288DF9B679232D03" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6CE0868AEF096D24BBB3C5B6B4F79B90" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF324F64C1756FA4B967193154CCF1CF" /SetOwner="%UserName%"
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs\CLSID" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs\CurVer" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs.1" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\MsMpComExports.MsMpComFactoryFcs.1\CLSID" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\AppID\{A79DB36D-6218-48E6-9EC9-DCBA9A39BF00}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\AppID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\Version" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\shdocvw" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\urlmon" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories\{56FFCC30-D398-11D0-B2AE-00A0C908FA49}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocHandler32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocServer32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Elevation" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocHandler32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocServer32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\ProgID" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Programmable" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\TypeLib" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Version" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\VersionIndependentProgID" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\Elevation" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\LocalServer32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\TypeLib" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\EPP" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\EPP" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Features\060BFB5022F401740B2A82101A6B605C" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Features\588E9903A8ED9904BA2E65D18C85D9AF" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Features\92A97705E43863E4BBBE7BACCB768A52" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Features\D7CD6B45B5C8BFD4CB510C013A23B6B2" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\060BFB5022F401740B2A82101A6B605C" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Media" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Net" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Media" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Net" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\92A97705E43863E4BBBE7BACCB768A52" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Media" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Net" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Media" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Net" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\18EAFAA8B504E9C4781184E19FC7A0F8" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\CC07A515C4AECB742B69801E86BC459D" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\ProxyStubClsid32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\TypeLib" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\ProxyStubClsid32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\TypeLib" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\ProxyStubClsid32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\TypeLib" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\ProxyStubClsid32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\TypeLib" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\MuiCache\A6" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\MuiCache\A6\96383CDB" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2\2\0\0" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\Bags\50" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\Bags\50\ComDlgLegacy" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\Bags\50\ComDlgLegacy\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\Bags\50\Shell" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0\win32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\FLAGS" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0\win32" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\FLAGS" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\HELPDIR" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2\2" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2\2\0" /Grant=Administradores=F /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Features\060BFB5022F401740B2A82101A6B605C"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_CLASSES_ROOT\Installer\Products\060BFB5022F401740B2A82101A6B605C"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs\CLSID" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs\CurVer" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs.1" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs.1\CLSID" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\EPP" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{A79DB36D-6218-48E6-9EC9-DCBA9A39BF00}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal\MsMpSvc" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\Network\MsMpSvc" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\Version" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\shdocvw" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\urlmon" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories\{56FFCC30-D398-11D0-B2AE-00A0C908FA49}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocHandler32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocServer32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Elevation" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocHandler32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocServer32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\ProgID" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Programmable" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\TypeLib" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Version" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\VersionIndependentProgID" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\Elevation" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\LocalServer32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\TypeLib" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shellex\ContextMenuHandlers\EPP" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Drive\shellex\ContextMenuHandlers\EPP" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\060BFB5022F401740B2A82101A6B605C" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\588E9903A8ED9904BA2E65D18C85D9AF" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\92A97705E43863E4BBBE7BACCB768A52" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\D7CD6B45B5C8BFD4CB510C013A23B6B2" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Media" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Net" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Media" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Net" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Media" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Net" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Media" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Net" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\18EAFAA8B504E9C4781184E19FC7A0F8" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\CC07A515C4AECB742B69801E86BC459D" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\ProxyStubClsid32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\TypeLib" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\ProxyStubClsid32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\TypeLib" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\ProxyStubClsid32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\TypeLib" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\ProxyStubClsid32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\TypeLib" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0\win32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\FLAGS" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0\win32" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\FLAGS" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\HELPDIR" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware"" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Extensions" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Processes" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Miscellaneous Configuration" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\MpEngine" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\IP Ranges" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\Ports" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\Processes" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\Threat IDs" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\SKU Differentiation" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Registration" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Registration\Interception Points" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Registration\Interception Points\{AE632C46-4C8F-45CA-8AC5-B8CB38B2B9C7}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Quarantine" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Real-Time Protection" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Remediation" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Reporting" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Scan" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Signature Updates" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\SpyNet" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Threats" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Threats\ThreatIDDefaultAction" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Threats\ThreatSeverityDefaultAction" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\UX Configuration" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Security Client"" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\CatDBTempFiles\C:*Windows*system32*CatRoot*TMP6072.tmp" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\CatDBTempFiles\C:*Windows*system32*CatRoot*TMP62B7.tmp" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\CatDBTempFiles\C:*Windows*system32*CatRoot*TMP64AD.tmp" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\18EAFAA8B504E9C4781184E19FC7A0F8" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\CC07A515C4AECB742B69801E86BC459D" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\01523D0AED689EC4C984FDC19AC4342F" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\01BEA2925585F5A4AA73F72A56C03416" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\037145BFB4595B1449DD5110DBBC2507" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0764D1BCF624D2D4699B30ABC24117CD" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0780CA2729318804E9770C02D53644FA" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\07F2D38488A50BF4BA40D916B27DC5C0" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\07F90C94F2A1B4642B4B02F30D792205" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\09B51B1EA37612E4B81CF842CEAF9581" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\09EBB9D81D94B1641BCA51477BF78E9A" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0A38F93931709064A97199C5B30DA7BD" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0A6E0DC76B2FA274BBF952A50E09F855" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0CABE05899BC7D440A621FC2E2FAD8EE" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0D3FA2694E42D4C41AC5DA241A7F7855" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0ECE66AB04E8DBF4B893E3386A52F71A" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12450D303EAC62D4089DBE4086519212" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12A7FAF0C7F9DD7418212CD2081FEE39" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12C5C85AB0F3A634D9DE0D014C729BCF" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12EF40EFA8ABFA84796E1946EC781B84" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\1311F3F504E9F0F4BAC62F4E7237D588" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\13F5DB82871A3914DA4348BBF344C017" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\14F5659F13BA0FC408436213C9FDC7D3" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\1B0A03BF3254292479EC484FF0D94B67" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\201E8C08E76091D4A96D005995980E82" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2037F46F534DC5B478AED44254147DD6" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\206E2EDE930F25C47BA2456B99F1D64C" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\20A40AFED3307084B9A54F528099994E" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\22C1E077F939771499229BCC0B0817BF" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\23212BA6E4FA47A459164E39AEF1AF19" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\246448638228C9F478B8F0DD9C8EDC0F" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\24BF93A1A95F6B640AA45B1A0CF9B672" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\25446969A23D9874593065374C5C98CC" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2CA8BBCFE72313648AAD891C02AC11B2" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2D22D6569763B964484E798B63574779" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2F55144FDF8EBEF4A95CCCDE24A75D6A" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2FCA3AAFCA8A4FD49983C80E699E21C3" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3386AF4CE048AAA4DAB6E5788EDB3675" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\34035BBEC8542B243B660C01E077D9D6" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\341EC63C36CD12B4FAD4B7008BE3F87C" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\34C3501731FD6604FA3FEE04455D08A5" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\37127518BB68D8D429BA62853BBC27F1" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3742CF8B53D00F64E8E290AD08A23CC1" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3846296071D4E1443AED4EEF4156E478" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\39D4460F39F215F47A206650EF745286" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3EB6007D1DEC7B543A38F5C380446E4B" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\4098B2BC658CD15418E9ECFEBDD34E69" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\41AE8940BF79FDE439BD02BB36D4D6FF" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\43FC6817EFC7A9045A091E1C9792FA10" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\445BE97A6F6F34541B0AA01F172DE56B" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\4601324096B747C449D82AA3B457E31D" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\4622EE8A06B9A1146A00D7EC3CEA5336" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\473349D1495A9FA4B9016091802CA0F9" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\49BA6157DEDBCC74CA96E4D479792C75" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\51EF5CA72173BBC45A024FFABBBB1C5B" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\54D34C5BCC400EE46AF9788512CB547A" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\55B24719E5A35CE4AB7D940CC201C8D5" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\564F8A66E04A81B42AB78BBD95C973B4" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\595A69D04EE6A3F4AA8A99DAF8508E11" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\5BE0645DC6E725E4ABC6B35DD4DFC85F" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\5FB70423FA556D241B8E34C4243C5B8E" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6397BD5CCB84DD14AA9922338C192CD4" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\64D7BB277153F6C4E8B77D2CCB4FF137" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6504C15F8F2C17C4498F972591E3B4B4" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\653A32395AAC1A746A89FEA059360E96" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\66C49D5ED52C47A4C94E676318AA7C05" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\68479F247AEB99948A164F03594788F8" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\694567FB52EFBDD45B0C09ACE0114485" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6B025C387EDA978468EA438AA4E73DE0" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6B99332E3347BC04683E026C1676560B" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6C7310CE84DE6194A8CA00CF1546CC3A" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6DBB8053881010241925C119C2C3F2A8" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6E0EBF3706210F2409A2F6A4E9562320" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\70428969E2D1B83489B8805568E08EEA" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\72E7B88E282A1834B8131396C4F2B820" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\752925E84F0B267428C2FA52FAFBA778" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\75A1E42E7528FB94A9C8A0545E57D2CE" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\767D288AD01EDAA4C93474675C8F9BB4" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\76ED05BECD2E1F848A1546938A49DFC1" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\777C23B0CC2C19742B99A86967D28DDC" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\79039BDF048DC5D48B314939DB5E9FA2" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\7C5F7284834194345838FE5BFAD889EC" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\7C81C3FE6CEF1E54A95631A9CA56F952" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8076CB86CA9AEC74593FDA43E3CB6F48" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\80EBD67D6F9488B4CB738F0B8BC6C80B" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\85B58B945B896234FA6497B4EAC00C72" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8702D3BD93060A8439C106246F1C9BFA" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\88CF20D1734503A4EB04DFC84A1E53E0" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\89B4BA00D0AA2C64ABA8E36D70CFB582" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8AAA926C1768AE945BBBFABED00EF600" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8BF8EFB52D6ACA54490353A4E362E668" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8D6B52A9B9DCB5C43B39502D397B0A7F" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8E9C3FF9D38397B46A663813BA8F8521" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\98EA2D1B13919E34DA698B457CA492CA" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9B1F5E8D4C6FD1341A699357FCC2703B" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9D4A9EE5B7D448A41B715600641063A5" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9DB9FE7DF150E554A826A02428613812" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9EA50590EDA67E440AE44E2D2C0E0416" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9EE09A0126ECC924E955C10C317DA8C6" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9FF30FB9C75714C4B837ADAE06581099" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A0771F70253FF9E4EA0F8CD15435B764" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A1678F0F9F326004193D9E00E3F80B54" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A5041DC31539C7649931C9CB6776B5DB" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A517ABAC1D585544EB7DD36A6CE88949" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A9363C80F5D92BA4C8C0F33F55578183" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\ABE74742105C56643B4AE32A9E312D61" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\ACE6A9D22E99C7C44A202641BFCEF83C" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\AEE65E55DF05ED140B47EB5C7FB5369C" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\AF4CE8622F10D45478F7C3DA6F84366A" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B28C83EBADC3A9D449E2D0578F96C35E" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B66DBA035CFB2BA40A2EACC8E31814B8" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B7E08E385BF9C9A42B544110EB5A990C" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B82C3B6FEF01EE942B924482B10CBD4E" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B9C46CC2CB9C476499A0DC5180A107F6" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BA3A91F8AB8FC7A498D1F7F5FB819379" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BAF00D1A12911964A9D215B05802F52E" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BCD33DABF7BC52F47B1F7841BAA8E05C" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BE451D3AC2AD74243B21D75A79530ADF" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C2422EC720D257B48A60E2B849FBADB0" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C276244D8612E7B4D9E75D489C021CF3" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C34A0EBF281C0E34BB70FEFCF85B7715" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C4D6BA546F95BAF45BEABDC058D8937A" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C53C81AD148FB9E43A30B3156F5D5395" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C75C0EB1EFC992E46BFF69B2371D591E" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C90EA83C2A8755E4D9688958683ACA52" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\CC3B95501AB799046BF51FEB06E417CA" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\CE1898C8C42C73A49BF5F2E4625E1FFE" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D2F0E0EABE5D51847B262283B0DB01D2" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D3CEFCDEF14D185488F6E15BB6478450" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D75228EFFE3171846B2B5B696B3ED530" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D86BE2F5E1B72C54B837DB48ADEE2603" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E0A864A6E031C4145A962AF55BAAFC5B" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E3397DC4493E0C84983383AB3AE171B7" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E343455F343F7134D82B407AB1625C89" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E36AA351DFB3C5943AF5586F660541D1" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E4E1364141ED6BB46B4B7EE9258F7209" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E774E119ACBA0F74CACEFEFFFBB6D53A" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E9C7EF746819CB14799F59438E45184F" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EA6D617B668331D44871FABF4E8D83D6" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EE6766BC6825308409F0E88087FCD672" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF092BF2B798DD1489401928B38D44E2" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF374A3F802F8614DA7AEB27861167E9" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F3067DF1BCAC1CD4AAF0DC3922346D61" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F629A82DD11CF0848B6C04479C6F9FFC" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F7F55E851A892E64A9341CFBDD19C80D" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F901D882BACCD4F4B9108823ADB5ED91" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FAC431669832E6A40BA7C08B3E8C203A" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FD7DBD2D2ABC438468621EF2B306C556" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FE4E8CC936BE0164EAD2B6162BB90382" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FE4E8CC936BE0164EAD2B6162BB90392" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\52F553BF830F4A74F9B9344D1748B246" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\AC6E3177D5407944FBCB027BBE4BE263" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F46C95810534DB34491B8397BB7CAAEB" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\Features" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\InstallProperties" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\Patches" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\Usage" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\Features" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\InstallProperties" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\Patches" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\Usage" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\Features" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\InstallProperties" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\Patches" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\Usage" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\InstallProperties" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\Patches" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\Usage" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\Features" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\Sysprep\Cleanup" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Security Client" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{05BFB060-4F22-4710-B0A2-2801A1B606C5}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{3099E885-DE8A-4099-ABE2-561DC8589DFA}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{50779A29-834E-4E36-BBEB-B7CABC67A825}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{54B6DC7D-8C5B-4DFB-BC15-C010A3326B2B}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client\{a1488156-5391-4f34-9214-105e4335f3a4}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client OOBE" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client OOBE\{913EFF0B-2CC3-4c64-A840-B0D7A38E90E4}" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_MPFILTER" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_MPFILTER\0000" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_MPFILTER\0000\Control" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter\Instances" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter\Instances\MpFilter Instance" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter\Enum" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpNWMon" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MsMpSvc" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MsMpSvc\Security" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Network Inspection System" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Network Inspection System\Linkage" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Network Inspection System\Performance" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NisDrv" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NisSrv" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NisSrv\Parameters" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Microsoft Security Client" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\MPSampleSubmission" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\Microsoft Antimalware" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\RestrictedServices\Configurable\System" /Grant=Administradores=F  /Grant="%UserName%"=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\060BFB5022F401740B2A82101A6B605C"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0613561CC95F0384288DF9B679232D03"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\09EBB9D81D94B1641BCA51477BF78E9A"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12EF40EFA8ABFA84796E1946EC781B84"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\206E2EDE930F25C47BA2456B99F1D64C"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\23212BA6E4FA47A459164E39AEF1AF19"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\34C3501731FD6604FA3FEE04455D08A5"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\55B24719E5A35CE4AB7D940CC201C8D5"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6B025C387EDA978468EA438AA4E73DE0"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6CE0868AEF096D24BBB3C5B6B4F79B90"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\80EBD67D6F9488B4CB738F0B8BC6C80B"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A517ABAC1D585544EB7DD36A6CE88949"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C2422EC720D257B48A60E2B849FBADB0"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C75C0EB1EFC992E46BFF69B2371D591E"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\CC3B95501AB799046BF51FEB06E417CA"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF324F64C1756FA4B967193154CCF1CF"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF374A3F802F8614DA7AEB27861167E9"  /Grant="%UserName%"=F /Grant=Administradores=F
SubInACL /Subkeyreg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C"  /Grant="%UserName%"=F /Grant=Administradores=F

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs\CLSID" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs\CurVer" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs.1" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\MsMpComExports.MsMpComFactoryFcs.1\CLSID" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\EPP" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{A79DB36D-6218-48E6-9EC9-DCBA9A39BF00}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\Version" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\shdocvw" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Hosts\urlmon" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\Implemented Categories\{56FFCC30-D398-11D0-B2AE-00A0C908FA49}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocHandler32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{2781761E-28E1-4109-99FE-B9D127C57AFE}\InprocServer32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Elevation" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocHandler32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\InprocServer32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\ProgID" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Programmable" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\TypeLib" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\Version" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{546BF232-C9DD-4F28-8E38-30AE2D964D46}\VersionIndependentProgID" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\Elevation" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\LocalServer32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F706B4B5-72BC-49D5-967C-05194FA83446}\TypeLib" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shellex\ContextMenuHandlers\EPP" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Drive\shellex\ContextMenuHandlers\EPP" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\060BFB5022F401740B2A82101A6B605C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\588E9903A8ED9904BA2E65D18C85D9AF" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\92A97705E43863E4BBBE7BACCB768A52" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\D7CD6B45B5C8BFD4CB510C013A23B6B2" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Media" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\060BFB5022F401740B2A82101A6B605C\SourceList\Net" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Media" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\588E9903A8ED9904BA2E65D18C85D9AF\SourceList\Net" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Media" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\92A97705E43863E4BBBE7BACCB768A52\SourceList\Net" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Media" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\SourceList\Net" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\18EAFAA8B504E9C4781184E19FC7A0F8" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\CC07A515C4AECB742B69801E86BC459D" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\ProxyStubClsid32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{1161F40F-7D95-4039-BAFE-50309474EF51}\TypeLib" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\ProxyStubClsid32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{AC30C2BA-0109-403D-9D8E-140BB4703700}\TypeLib" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\ProxyStubClsid32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CDFED399-7999-4309-B064-1EDE04BC5800}\TypeLib" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\ProxyStubClsid32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{E2D74550-8E41-460E-BB51-52E1F9522100}\TypeLib" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\MuiCache\A6" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\MuiCache\A6\96383CDB" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2\2\0\0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\50" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\50\ComDlgLegacy" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\50\ComDlgLegacy\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\50\Shell" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\0\win32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{84DCD935-B80A-4DBA-8530-F151736F7F8C}\1.0\FLAGS" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\0\win32" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\FLAGS" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF400}\1.0\HELPDIR" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2\2" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\2\2\2\0" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot\Minimal\MsMpSvc" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot\Network\MsMpSvc" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\Microsoft Security Client" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control\SafeBoot\Minimal\MsMpSvc" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control\SafeBoot\Network\MsMpSvc" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control\WMI\Autologger\Microsoft Security Client" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Extensions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Processes" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Miscellaneous Configuration" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\MpEngine" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\IP Ranges" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\Ports" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\Processes" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\Exclusions\Threat IDs" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Consumers\IPS\SKU Differentiation" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Registration" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Registration\Interception Points" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\NIS\Registration\Interception Points\{AE632C46-4C8F-45CA-8AC5-B8CB38B2B9C7}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Quarantine" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Real-Time Protection" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Remediation" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Reporting" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Scan" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Signature Updates" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\SpyNet" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Threats" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Threats\ThreatIDDefaultAction" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Threats\ThreatSeverityDefaultAction" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\UX Configuration" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Security Client" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\CatDBTempFiles\C:*Windows*system32*CatRoot*TMP6072.tmp" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\CatDBTempFiles\C:*Windows*system32*CatRoot*TMP62B7.tmp" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\CatDBTempFiles\C:*Windows*system32*CatRoot*TMP64AD.tmp" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\18EAFAA8B504E9C4781184E19FC7A0F8" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\CC07A515C4AECB742B69801E86BC459D" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\01523D0AED689EC4C984FDC19AC4342F" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\01BEA2925585F5A4AA73F72A56C03416" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\037145BFB4595B1449DD5110DBBC2507" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0764D1BCF624D2D4699B30ABC24117CD" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0780CA2729318804E9770C02D53644FA" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\07F2D38488A50BF4BA40D916B27DC5C0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\07F90C94F2A1B4642B4B02F30D792205" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\09B51B1EA37612E4B81CF842CEAF9581" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\09EBB9D81D94B1641BCA51477BF78E9A" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0A38F93931709064A97199C5B30DA7BD" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0A6E0DC76B2FA274BBF952A50E09F855" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0CABE05899BC7D440A621FC2E2FAD8EE" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0D3FA2694E42D4C41AC5DA241A7F7855" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0ECE66AB04E8DBF4B893E3386A52F71A" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12450D303EAC62D4089DBE4086519212" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12A7FAF0C7F9DD7418212CD2081FEE39" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12C5C85AB0F3A634D9DE0D014C729BCF" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\12EF40EFA8ABFA84796E1946EC781B84" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\1311F3F504E9F0F4BAC62F4E7237D588" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\13F5DB82871A3914DA4348BBF344C017" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\14F5659F13BA0FC408436213C9FDC7D3" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\1B0A03BF3254292479EC484FF0D94B67" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\201E8C08E76091D4A96D005995980E82" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2037F46F534DC5B478AED44254147DD6" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\206E2EDE930F25C47BA2456B99F1D64C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\20A40AFED3307084B9A54F528099994E" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\22C1E077F939771499229BCC0B0817BF" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\23212BA6E4FA47A459164E39AEF1AF19" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\246448638228C9F478B8F0DD9C8EDC0F" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\24BF93A1A95F6B640AA45B1A0CF9B672" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\25446969A23D9874593065374C5C98CC" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2CA8BBCFE72313648AAD891C02AC11B2" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2D22D6569763B964484E798B63574779" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2F55144FDF8EBEF4A95CCCDE24A75D6A" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\2FCA3AAFCA8A4FD49983C80E699E21C3" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3386AF4CE048AAA4DAB6E5788EDB3675" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\34035BBEC8542B243B660C01E077D9D6" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\341EC63C36CD12B4FAD4B7008BE3F87C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\34C3501731FD6604FA3FEE04455D08A5" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\37127518BB68D8D429BA62853BBC27F1" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3742CF8B53D00F64E8E290AD08A23CC1" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3846296071D4E1443AED4EEF4156E478" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\39D4460F39F215F47A206650EF745286" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\3EB6007D1DEC7B543A38F5C380446E4B" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\4098B2BC658CD15418E9ECFEBDD34E69" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\41AE8940BF79FDE439BD02BB36D4D6FF" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\43FC6817EFC7A9045A091E1C9792FA10" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\445BE97A6F6F34541B0AA01F172DE56B" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\4601324096B747C449D82AA3B457E31D" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\4622EE8A06B9A1146A00D7EC3CEA5336" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\473349D1495A9FA4B9016091802CA0F9" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\49BA6157DEDBCC74CA96E4D479792C75" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\51EF5CA72173BBC45A024FFABBBB1C5B" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\54D34C5BCC400EE46AF9788512CB547A" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\55B24719E5A35CE4AB7D940CC201C8D5" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\564F8A66E04A81B42AB78BBD95C973B4" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\595A69D04EE6A3F4AA8A99DAF8508E11" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\5BE0645DC6E725E4ABC6B35DD4DFC85F" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\5FB70423FA556D241B8E34C4243C5B8E" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6397BD5CCB84DD14AA9922338C192CD4" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\64D7BB277153F6C4E8B77D2CCB4FF137" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6504C15F8F2C17C4498F972591E3B4B4" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\653A32395AAC1A746A89FEA059360E96" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\66C49D5ED52C47A4C94E676318AA7C05" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\68479F247AEB99948A164F03594788F8" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\694567FB52EFBDD45B0C09ACE0114485" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6B025C387EDA978468EA438AA4E73DE0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6B99332E3347BC04683E026C1676560B" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6C7310CE84DE6194A8CA00CF1546CC3A" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6DBB8053881010241925C119C2C3F2A8" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6E0EBF3706210F2409A2F6A4E9562320" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\70428969E2D1B83489B8805568E08EEA" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\72E7B88E282A1834B8131396C4F2B820" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\752925E84F0B267428C2FA52FAFBA778" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\75A1E42E7528FB94A9C8A0545E57D2CE" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\767D288AD01EDAA4C93474675C8F9BB4" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\76ED05BECD2E1F848A1546938A49DFC1" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\777C23B0CC2C19742B99A86967D28DDC" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\79039BDF048DC5D48B314939DB5E9FA2" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\7C5F7284834194345838FE5BFAD889EC" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\7C81C3FE6CEF1E54A95631A9CA56F952" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8076CB86CA9AEC74593FDA43E3CB6F48" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\80EBD67D6F9488B4CB738F0B8BC6C80B" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\85B58B945B896234FA6497B4EAC00C72" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8702D3BD93060A8439C106246F1C9BFA" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\88CF20D1734503A4EB04DFC84A1E53E0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\89B4BA00D0AA2C64ABA8E36D70CFB582" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8AAA926C1768AE945BBBFABED00EF600" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8BF8EFB52D6ACA54490353A4E362E668" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8D6B52A9B9DCB5C43B39502D397B0A7F" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\8E9C3FF9D38397B46A663813BA8F8521" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\98EA2D1B13919E34DA698B457CA492CA" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9B1F5E8D4C6FD1341A699357FCC2703B" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9D4A9EE5B7D448A41B715600641063A5" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9DB9FE7DF150E554A826A02428613812" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9EA50590EDA67E440AE44E2D2C0E0416" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9EE09A0126ECC924E955C10C317DA8C6" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\9FF30FB9C75714C4B837ADAE06581099" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A0771F70253FF9E4EA0F8CD15435B764" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A1678F0F9F326004193D9E00E3F80B54" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A5041DC31539C7649931C9CB6776B5DB" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A517ABAC1D585544EB7DD36A6CE88949" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A9363C80F5D92BA4C8C0F33F55578183" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\ABE74742105C56643B4AE32A9E312D61" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\ACE6A9D22E99C7C44A202641BFCEF83C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\AEE65E55DF05ED140B47EB5C7FB5369C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\AF4CE8622F10D45478F7C3DA6F84366A" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B28C83EBADC3A9D449E2D0578F96C35E" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B66DBA035CFB2BA40A2EACC8E31814B8" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B7E08E385BF9C9A42B544110EB5A990C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B82C3B6FEF01EE942B924482B10CBD4E" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B9C46CC2CB9C476499A0DC5180A107F6" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BA3A91F8AB8FC7A498D1F7F5FB819379" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BAF00D1A12911964A9D215B05802F52E" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BCD33DABF7BC52F47B1F7841BAA8E05C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\BE451D3AC2AD74243B21D75A79530ADF" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C2422EC720D257B48A60E2B849FBADB0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C276244D8612E7B4D9E75D489C021CF3" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C34A0EBF281C0E34BB70FEFCF85B7715" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C4D6BA546F95BAF45BEABDC058D8937A" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C53C81AD148FB9E43A30B3156F5D5395" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C75C0EB1EFC992E46BFF69B2371D591E" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C90EA83C2A8755E4D9688958683ACA52" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\CC3B95501AB799046BF51FEB06E417CA" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\CE1898C8C42C73A49BF5F2E4625E1FFE" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D2F0E0EABE5D51847B262283B0DB01D2" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D3CEFCDEF14D185488F6E15BB6478450" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D75228EFFE3171846B2B5B696B3ED530" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D86BE2F5E1B72C54B837DB48ADEE2603" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E0A864A6E031C4145A962AF55BAAFC5B" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E3397DC4493E0C84983383AB3AE171B7" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E343455F343F7134D82B407AB1625C89" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E36AA351DFB3C5943AF5586F660541D1" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E4E1364141ED6BB46B4B7EE9258F7209" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E774E119ACBA0F74CACEFEFFFBB6D53A" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\E9C7EF746819CB14799F59438E45184F" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EA6D617B668331D44871FABF4E8D83D6" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EE6766BC6825308409F0E88087FCD672" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF092BF2B798DD1489401928B38D44E2" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF374A3F802F8614DA7AEB27861167E9" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F3067DF1BCAC1CD4AAF0DC3922346D61" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F629A82DD11CF0848B6C04479C6F9FFC" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F7F55E851A892E64A9341CFBDD19C80D" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F901D882BACCD4F4B9108823ADB5ED91" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FAC431669832E6A40BA7C08B3E8C203A" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FD7DBD2D2ABC438468621EF2B306C556" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FE4E8CC936BE0164EAD2B6162BB90382" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FE4E8CC936BE0164EAD2B6162BB90392" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\52F553BF830F4A74F9B9344D1748B246" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\AC6E3177D5407944FBCB027BBE4BE263" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F46C95810534DB34491B8397BB7CAAEB" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\Features" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\InstallProperties" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\Patches" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\060BFB5022F401740B2A82101A6B605C\Usage" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\Features" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\InstallProperties" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\Patches" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\588E9903A8ED9904BA2E65D18C85D9AF\Usage" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\Features" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\InstallProperties" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\Patches" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D7CD6B45B5C8BFD4CB510C013A23B6B2\Usage" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\InstallProperties" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\Patches" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\Usage" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\92A97705E43863E4BBBE7BACCB768A52\Features" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\Sysprep\Cleanup" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Security Client" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{05BFB060-4F22-4710-B0A2-2801A1B606C5}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{3099E885-DE8A-4099-ABE2-561DC8589DFA}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{50779A29-834E-4E36-BBEB-B7CABC67A825}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{54B6DC7D-8C5B-4DFB-BC15-C010A3326B2B}" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client\{a1488156-5391-4f34-9214-105e4335f3a4}" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client OOBE" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft Security Client OOBE\{913EFF0B-2CC3-4c64-A840-B0D7A38E90E4}" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_MPFILTER" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_MPFILTER\0000" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_MPFILTER\0000\Control" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter\Instances" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter\Instances\MpFilter Instance" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpFilter\Enum" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MpNWMon" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MsMpSvc" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MsMpSvc\Security" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Network Inspection System" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Network Inspection System\Linkage" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Network Inspection System\Performance" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NisDrv" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NisSrv" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NisSrv\Parameters" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Microsoft Security Client" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\MPSampleSubmission" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\Microsoft Antimalware" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\RestrictedServices\Configurable\System" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0613561CC95F0384288DF9B679232D03" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6CE0868AEF096D24BBB3C5B6B4F79B90" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EF324F64C1756FA4B967193154CCF1CF" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal\MsMpSvc" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\Network\MsMpSvc" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Security Client" /f

:END
:: Close pushd connection
popd
exit

:NoAdmin
echo.
echo We do not have Administrator rights.
echo.
PAUSE
goto END

REM
