function Invoke-Starship-PreCommand {
  $host.ui.RawUI.WindowTitle = "$env:USERNAME@$env:COMPUTERNAME`: $pwd `a"
}

$ENV:STARSHIP_CONFIG = "$HOME\Github\code-setup\PowerShell Profiles\starship.toml"

Invoke-Expression (&starship init powershell)
