#!/usr/bin/env bash

#****************************************************************************
# Filename      : install-codium-settings.sh
# Created       : Thu June 6 2024
# Author        : Zolo
# Github        : https://github.com/zolodev
# Description   : Automate the installation of my codium settings
#****************************************************************************


# Find scripts directory 
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# macOS path
MACOS_PATH="$HOME/Library/Application Support/VSCodium/User"

# Flatpak path (Silverblue default)
FLATPAK_PATH="$HOME/.var/app/com.vscodium.codium/config/VSCodium/User"

# Normal path (RPM, Toolbox, and other Linux distributions)
NORMAL_PATH="$HOME/.config/VSCodium/User"

# Choose correct path depending on OS / installation
if [ "$(uname)" = "Darwin" ]; then
    TARGET="$MACOS_PATH"
elif [ -d "$FLATPAK_PATH" ]; then
    TARGET="$FLATPAK_PATH"
elif [ -d "$NORMAL_PATH" ]; then
    TARGET="$NORMAL_PATH"
else
    echo "Cannot find VSCodium configuration folder."
    exit 1
fi

echo "Using VSCodium folder: $TARGET"

# Make sure target directory exists
mkdir -p "$TARGET"

# Copy settings
yes | cp "$SCRIPT_DIR/../configuration/settings.json" "$TARGET/settings.json"
yes | cp "$SCRIPT_DIR/../configuration/keybindings.json" "$TARGET/keybindings.json"

# Ensure snippets folder exists
mkdir -p "$TARGET/snippets"

# Copy snippets
yes | cp "$SCRIPT_DIR/../snippets/"*.json "$TARGET/snippets/"

echo "VSCodium settings copied."

