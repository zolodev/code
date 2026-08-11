# /***************************************************************************
# * Filename      : backup-codium-configuration.ps1
# * Created       : August 11th, 2026
# * Author        : Zolo
# * Github        : https://github.com/zolodev
# * Description   : Backup VSCodium extensions and user configuration
# ***************************************************************************/

# Get repository root from the scripts directory
$RepoRoot = Split-Path -Parent $PSScriptRoot

# Configuration directory
$ConfigurationPath = Join-Path $RepoRoot "configuration"

# VSCodium user configuration directory
$VSCodiumUserPath = Join-Path $env:APPDATA "VSCodium\User"

# Create configuration directory if it does not exist
if (-not (Test-Path $ConfigurationPath)) {
    New-Item -ItemType Directory -Path $ConfigurationPath -Force | Out-Null
}

# Backup installed extensions
$ExtensionsFile = Join-Path $ConfigurationPath "extensions.txt"

codium --list-extensions | Out-File -Encoding utf8 $ExtensionsFile

Write-Host "Backed up extensions.txt"

# Backup settings.json
$SettingsFile = Join-Path $VSCodiumUserPath "settings.json"
$SettingsBackup = Join-Path $ConfigurationPath "settings.json"

if (Test-Path $SettingsFile) {
    Copy-Item $SettingsFile $SettingsBackup -Force
    Write-Host "Backed up settings.json"
}
else {
    Write-Warning "Could not find settings.json:"
    Write-Warning $SettingsFile
}

# Backup keybindings.json
$KeybindingsFile = Join-Path $VSCodiumUserPath "keybindings.json"
$KeybindingsBackup = Join-Path $ConfigurationPath "keybindings.json"

if (Test-Path $KeybindingsFile) {
    Copy-Item $KeybindingsFile $KeybindingsBackup -Force
    Write-Host "Backed up keybindings.json"
}
else {
    Write-Warning "Could not find keybindings.json:"
    Write-Warning $KeybindingsFile
}

Write-Host ""
Write-Host "VSCodium configuration backup completed."
Write-Host "Repository:  $RepoRoot"
Write-Host "Extensions:  $ExtensionsFile"
Write-Host "Settings:    $SettingsBackup"
Write-Host "Keybindings: $KeybindingsBackup"
