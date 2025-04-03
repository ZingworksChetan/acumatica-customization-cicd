param (
    [string]$versionName  # Accepts version name as an argument
)

if (-not $versionName) {
    Write-Host "Error: versionName parameter is required."
    exit 1
}

# Construct paths using System.IO to handle special characters properly
$customizationPath = [System.IO.Path]::Combine("Customization", $versionName)
$zipFileName = [System.IO.Path]::Combine("Customization", $versionName, "$versionName.zip")
$xmlFilePath = [System.IO.Path]::Combine($customizationPath, "_project", "ProjectMetadata.xml")

# Check if the customization folder exists
if (-not (Test-Path -LiteralPath $customizationPath -PathType Container)) {
    Write-Host "Error: Customization folder does not exist: $customizationPath"
    exit 1
}

# Check if the directory contains files
$files = Get-ChildItem -LiteralPath $customizationPath -Recurse -ErrorAction SilentlyContinue
if (-not $files) {
    Write-Host "Error: Customization files not found in: $customizationPath. Not able to generate ZIP."
    exit 1
}

# Check if XML file exists
if (-not (Test-Path -LiteralPath $xmlFilePath -PathType Leaf)) {
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

# Execute the build command safely
&$cmd build --customizationpath "$customizationPath" --packagefilename "$zipFileName" --description "$versionName" --level $Level

Write-Host "Customization package created successfully: $zipFileName"
