param (
    [string]$versionName  # Accepts version name as an argument
)

if (-not $versionName) {
    Write-Host "Error: versionName parameter is required."
    exit 1
}

$customizationPath = "Customization\$versionName"
$zipFileName = "Customization\$versionName.zip"

# Ensure the version folder exists
if (-not (Test-Path $customizationPath)) {
    Write-Host "Error: Customization folder '$customizationPath' does not exist."
    exit 1
}

# Check if the directory is empty
$files = Get-ChildItem -Path $customizationPath -Recurse
if (-not $files) {
    Write-Host "Error: Customization files not exist. Not able to generate ZIP."
    exit 1
}

$cmd = "CustomizationPackageTools\bin\Release\net8.0\CustomizationPackageTools.exe"
&$cmd build --customizationpath $customizationPath --packagefilename $zipFileName --description "Build for $versionName" --level "250"

Write-Host "Customization package created successfully: $zipFileName"
