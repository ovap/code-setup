$ErrorActionPreference = "Stop"

$source = $PSScriptRoot

# Windows PowerShell 5.1 profile directory
$profileDir = Split-Path -Parent $PROFILE

# Create profile directory if missing
New-Item -ItemType Directory -Path $profileDir -Force |
    Out-Null

# Copy PowerShell profiles
$profileFiles = @(
    "Microsoft.PowerShell_profile.ps1"
    "Microsoft.VSCode_profile.ps1"
)

foreach ($file in $profileFiles) {
    $src = Join-Path $source $file
    $dst = Join-Path $profileDir $file

    if (Test-Path $src) {
        Copy-Item $src $dst -Force
        Write-Host "Installed: $dst" -ForegroundColor Green
    }
    else {
        Write-Warning "Missing source file: $src"
    }
}

Write-Host "`nProfile deployment complete!" -ForegroundColor Cyan

Write-Host "`nPowerShell profile locations:"
Write-Host "Windows PowerShell: $PROFILE"
Write-Host "Profile directory:  $profileDir"
