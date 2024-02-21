# Try and load the Oh My Posh Configuration
try {
  oh-my-posh init pwsh --config 'C:\Users\john\Documents\WindowsPowerShell\ovap.omp.json' | Invoke-Expression
}
catch {
  # Error if there was an issue.
  Write-Error "ERROR: Loading Oh-My-Posh Configuration... Is it installed?"
}

# Enable the following ENV below if working with Azure, the Oh My Posh has support for Azure.
# $env:POSH_AZURE_ENABLED = $true
