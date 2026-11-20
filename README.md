<!-- Hello there! -->

# code-setup

Personal preferences of setting up my coding environment :shipit:[^1]

## Folders

### PowerShell Profiles

> [!NOTE]
> PowerShell user profiles can be found at `%USERPROFILE%\Documents\WindowsPowerShell`
>
> _You might need to run the following PowerShell Script to create your profile_ _or run the `PowerShell Profiles/PowerShell Setup.ps1`_
>
> ```powershell
> if (!(Test-Path -Path $PROFILE)) {
>  New-Item -ItemType File -Path $PROFILE -Force
> }
> ```

- `Microsoft.PowerShell_profile.ps1`
  - This includes all profile configuration for the Windows PowerShell Terminal
- `Microsoft.VSCode_profile.ps1`
  - This includes all profile configuration for the VSCode PowerShell Terminal
  <!-- - `ovap.omp.json.old` **NO LONGER USE**
  - This is a _OMP_ ([Oh My Posh](https://ohmyposh.dev/)) JSON file, both profiles use this. It includes the following support.
    - **Node**
      - Currently just the version
    - **Python**
      - Shows what Virutal Environment is enabled.
    - **AWS**
      - Profile + Region
    - **Azure** (Make sure to enable the ENV in the profiles)
      - Currently the Environment Name
    - **Time Format**
      - 12-Hour Format -->
- `starship.toml`
  - This is a [Starship](https://starship.rs/) TOML file, both profiles use this.

### VSCode

- `settings.json`
  - These are all the settings that I run in VSCode.
    - Keep in mind if you want to use Starship config in the terminal you will need a [Nerd Fonts](https://www.nerdfonts.com/)
- `extensions.txt`
  - This is a list of extensions that I have installed.

[^1]: Still adding more to this document....
