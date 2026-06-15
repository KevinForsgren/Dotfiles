# Run this script as Administrator (or enable Developer Mode)
$ScriptDirectory = "$PSScriptRoot\Windows\.config"
$UserHomeDirectory = "$HOME"

function Create-Link($target, $linkPath) {
    # Check if a file or folder already exists at the destination
    if (Test-Path $linkPath) {
        Write-Host "Removing existing file/folder at $linkPath" -ForegroundColor Yellow
        Remove-Item $linkPath -Recurse -Force
    }
    
    # Create the Symlink
    New-Item -ItemType SymbolicLink -Path $linkPath -Target $target -Force | Out-Null
    Write-Host "Linked $linkPath ---> $target" -ForegroundColor Green
}

# --- DEFINE YOUR LINKS HERE ---

# FastFetch
Create-Link "$ScriptDirectory\fastfetch\config.jsonc" "$UserHomeDirectory\.config\fastfetch\config.jsonc"

# WezTerm
Create-Link "$ScriptDirectory\wezterm\wezterm.lua" "$UserHomeDirectory\.config\wezterm\wezterm.lua"

# YASB (Yet Another Status Bar)
Create-Link "$ScriptDirectory\yasb\config.yaml" "$UserHomeDirectory\.config\yasb\config.yaml"
Create-Link "$ScriptDirectory\yasb\styles.css" "$UserHomeDirectory\.config\yasb\styles.css"

# Neovim / .config style apps
# $CONFIG_DIR = "$HOME\.config"
# if (!(Test-Path $CONFIG_DIR)) { New-Item -ItemType Directory -Path $CONFIG_DIR }
# Create-Link "$DOTFILES\nvim" "$CONFIG_DIR\nvim"

# Komorebi
Create-Link "$ScriptDirectory\Komorebi\whkdrc" "$UserHomeDirectory\.config\whkdrc"
Create-Link "$ScriptDirectory\Komorebi\komorebi.json" "$UserHomeDirectory\komorebi.json"


Write-Host "All links updated!" -ForegroundColor Cyan
