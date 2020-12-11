param(
    [string]$DeploymentTemplateFile = "$PSScriptRoot\arm\armdeploy.json",
    [string]$DeploymentParameterFile = "$PSScriptRoot\arm\armdeploy.parameters.json",
    [string]$region = "eastus",
    [string]$resourceGroupName = "synapse-rg",
    [securestring]$SqlAdminLoginPassword,
    [securestring]$BackupStorageContainerSAS
)

$region = Read-Host "Which region should be used for deployment (i.e. eastus, centralus, southcentralus, japaneast, etc)?";
$resourceGroupName = Read-Host "Resource gruop name (existing or new)";

$deploymentName = "azuredeploy" + "-" + (Get-Date).ToUniversalTime().ToString('MMdd-HHmmss')
Write-Host("Now deploying RG to " + $resourceGroupName);

New-AzResourceGroup -Name $resourceGroupName -Location $region

$resourceGroup = Get-AzResourceGroup -Name $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue
if (!$resourceGroup) {
    $resourceGroup = New-AzResourceGroup -Name $ResourceGroupName -Location $region
}

New-AzResourceGroupDeployment -Name $deploymentName `
-ResourceGroupName $resourceGroupName `
-Location $region `
-TemplateFile $DeploymentTemplateFile `
-TemplateParameterFile $DeploymentParameterFile `
-SqlAdminLoginPassword $SqlAdminLoginPassword `
-BackupStorageContainerSAS $BackupStorageContainerSAS -AsJob