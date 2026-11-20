$ErrorActionPreference = "Stop"

# Files in the script's directory
$setupDir = $PSScriptRoot
$settingsFile = Join-Path $setupDir "settings.json"
$extensionsFile = Join-Path $setupDir "extensions.txt"

# 1. Install VS Code
Write-Host "`nInstalling VS Code..." -ForegroundColor Cyan

winget install --id Microsoft.VisualStudioCode `
    --exact `
    --source winget `
    --accept-package-agreements `
    --accept-source-agreements

if ($LASTEXITCODE -ne 0) {
    throw "VS Code installation failed."
}

# 2. Locate VS Code CLI
$code = (Get-Command code -ErrorAction SilentlyContinue).Source

if (-not $code) {
    $paths = @(
        "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin\code.cmd",
        "$env:ProgramFiles\Microsoft VS Code\bin\code.cmd"
    )

    $code = $paths |
        Where-Object { Test-Path $_ } |
        Select-Object -First 1
}

if (-not $code) {
    throw "VS Code CLI not found. Restart PowerShell and run again."
}

# 3. Install extensions from TXT
if (Test-Path $extensionsFile) {
    Write-Host "`nInstalling extensions..." -ForegroundColor Cyan

    $extensions = Get-Content $extensionsFile |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ -and -not $_.StartsWith("#") }

    foreach ($extension in $extensions) {
        Write-Host "Installing $extension ..."
        & $code --install-extension $extension --force

        if ($LASTEXITCODE -ne 0) {
            Write-Warning "Failed to install: $extension"
        }
    }
}
else {
    Write-Warning "extensions.txt not found."
}

# 4. Apply settings.json
if (Test-Path $settingsFile) {
    Write-Host "`nApplying VS Code settings..." -ForegroundColor Cyan

    $destination = Join-Path $env:APPDATA "Code\User\settings.json"

    New-Item -ItemType Directory `
        -Path (Split-Path $destination) `
        -Force | Out-Null

    Copy-Item $settingsFile $destination -Force

    Write-Host "Settings applied: $destination" -ForegroundColor Green
}
else {
    Write-Warning "settings.json not found."
}

# 5. Verify
Write-Host "`nInstalled extensions:" -ForegroundColor Cyan
& $code --list-extensions

Write-Host "`nVS Code setup complete!" -ForegroundColor Green
