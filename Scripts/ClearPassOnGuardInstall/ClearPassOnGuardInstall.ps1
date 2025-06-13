# Caminho da pasta onde o script está
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Caminho do MSI na rede
$networkMSIPath = Join-Path -Path $scriptDir -ChildPath "ClearPassOnGuardInstall.msi"
$transformFile = Join-Path -Path $scriptDir -ChildPath "ClearPassOnGuardInstall.mst"

# Função para obter a versão de um MSI
function Get-MsiVersion {
    param (
        [string]$msiPath
    )
	
	if (-not (Test-Path $msiPath)) {
        Write-Warning "Arquivo MSI não encontrado em: $msiPath"
        return $null
    }
	
	$parentPath = (Resolve-Path -Path (Split-Path -Path $msiPath)).Path
	$fileName   = Split-Path -Path $msiPath -Leaf

	$shell = New-Object -COMObject Shell.Application
	$shellFolder = $Shell.NameSpace($parentPath)
	$shellFile   = $ShellFolder.ParseName($fileName)
	
	if ($shellFolder.GetDetailsOf($shellFile,22) -match '(\d+\.\d+\.\d+\.\d+)') {
		$version = $matches[1]
	} else {
		Write-Warning "No version found"
		return $null
	}
	
    return $version
}

# Função para obter a versão instalada
function Get-InstalledMsiVersion {
    param (
        [string]$productName
    )
    $product = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*$productName*" }
    return $product.Version
}

# Nome do produto instalado (como aparece em Programas e Recursos)
$productName = "ClearPass OnGuard"

Write-Host "`n>>> Verificando versão instalada do ClearPass OnGuard..."
$installedVersion = Get-InstalledMsiVersion -productName $productName
if (-not $installedVersion) {
    Write-Host "Nenhuma versão instalada foi encontrada."
    $installedVersion = "0.0.0.0"
} else {
    Write-Host "Versão instalada: $installedVersion"
}

Write-Host "`n>>> Verificando versão disponível na rede..."
$newVersion = Get-MsiVersion -msiPath $networkMSIPath
Write-Host "Versão disponível: $newVersion"

# Comparação de versão
if ([version]$newVersion -gt [version]$installedVersion) {
    Write-Host "`n>>> Nova versão detectada. Iniciando instalação..."
	
    $tempDir = Join-Path $env:TEMP "ClearPassOnGuardInstall"
    New-Item -Path $tempDir -ItemType Directory -Force | Out-Null

    $basenameMsi = Split-Path -Path $networkMSIPath -Leaf
    $basenameMst = Split-Path -Path $transformFile -Leaf

    $tempMsi = Join-Path $tempDir $basenameMsi
    $tempMst = Join-Path $tempDir $basenameMst

    Copy-Item -Path $networkMSIPath -Destination $tempMsi -Force
    Copy-Item -Path $transformFile -Destination $tempMst -Force
    Unblock-File -Path $tempMsi -ErrorAction SilentlyContinue
    Unblock-File -Path $tempMst -ErrorAction SilentlyContinue

    $serviceName = "ClearPass Agent Controller"

    if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
        Stop-Service -Name $serviceName -Force
        Write-Host "Serviço '$serviceName' foi finalizado com êxito."
    }

    $processName = "clearpassonguard"
    
    if (Get-Process -Name "clearpassonguard" -ErrorAction SilentlyContinue) {
        Stop-Service -Name $serviceName -Force
        Write-Host "Processo '$serviceName' foi finalizado."
    }

    $arguments = @(
        "/i `"$tempMsi`"",
        "TRANSFORMS=`"$tempMst`"",
        "/qn",
        "/norestart",
        "/log `"$env:TEMP\ClearPassOnGuard_Install.log`""
    )

    $process = Start-Process msiexec.exe -ArgumentList $arguments -Wait -PassThru
    if ($process.ExitCode -eq 0) {
        Write-Host "`nInstalação concluída com sucesso."
    } else {
        Write-Host "`nErro na instalação. Código de saída: $($process.ExitCode)"
    }
} else {
    Write-Host "`nA versão instalada já é igual ou mais recente. Nenhuma ação necessária."
}
