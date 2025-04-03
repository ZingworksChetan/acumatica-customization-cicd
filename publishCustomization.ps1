param (
    [string]$versionName  # Accepts version name as an argument
)

if (-not $versionName) {
    Write-Host "Error: versionName parameter is required."
    exit 1
}

# Construct paths safely
$customizationPath = [System.IO.Path]::Combine("Customization", $versionName)
$zipFilePath = [System.IO.Path]::Combine($customizationPath, "$versionName.zip")
$xmlFilePath = [System.IO.Path]::Combine($customizationPath, "_project", "ProjectMetadata.xml")

$packageName = $versionName
$serverUrl = $env:ACUMATICA_URL
$username = $env:ACUMATICA_USERNAME
$password = $env:ACUMATICA_PASSWORD

# Ensure the ZIP file exists
if (-not (Test-Path -LiteralPath $zipFilePath)) {
    Write-Host "Error: Customization package '$zipFilePath' not found. Cannot publish."
    exit 1
}

# Check if XML file exists
if (-not (Test-Path -LiteralPath $xmlFilePath)) {
    Write-Host "Error: ProjectMetadata.xml file not found at '$xmlFilePath'"
    exit 1
}

# Load XML and extract project level
[xml]$xmlContent = Get-Content -LiteralPath $xmlFilePath
$Level = $xmlContent.project.level

# Set Level to 0 if it's missing or empty
if (-not $Level -or $Level.Trim() -eq "") {
    Write-Host "Warning: 'Level' is missing or empty in ProjectMetadata.xml. Defaulting to 0."
    $Level = 0
}

Write-Host "Level of PackG: $Level"

$cmd = "CustomizationPackageTools\bin\Release\net8.0\CustomizationPackageTools.exe"

# Execute the publish command safely
&$cmd publish --packagefilename "$zipFilePath" --packagename "$packageName" --url "$serverUrl" --username "$username" --password "$password" --description "$versionName" --level "$Level"


