$source = Join-Path $PWD "settings.json"

$destination = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

if (Test-Path $source) {
    Copy-Item $source $destination -Force
    Write-Host "Windows Terminal settings applied."
} else {
    Write-Error "Source settings.json not found."
}
