param (
    [string]$versionName  # Accepts version name as an argument
)

if (-not $versionName) {
    Write-Host "Error: versionName parameter is required."
    exit 1
}

$zipFilePath = "Customization\$versionName\$versionName.zip"
$packageName = $versionName
$serverUrl = $env:ACUMATICA_URL
$username = $env:ACUMATICA_USERNAME
$password = $env:ACUMATICA_PASSWORD

# Ensure the ZIP file exists
if (-not (Test-Path $zipFilePath)) {
    Write-Host "Error: Customization package '$zipFilePath' not found. Cannot publish."
    exit 1
}

$cmd = "CustomizationPackageTools\bin\Release\net8.0\CustomizationPackageTools.exe"
&$cmd publish --packagefilename $zipFilePath --packagename $packageName --url $serverUrl --username $username --password $password --description "$versionName" --level 250

Write-Host "Customization package '$packageName' published successfully."
