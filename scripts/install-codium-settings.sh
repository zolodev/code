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

# Flatpak path (Silverblue default)
FLATPAK_PATH="$HOME/.var/app/com.vscodium.codium/config/VSCodium/User"

# Normal path (RPM, Toolbox, andra distar)
NORMAL_PATH="$HOME/.config/VSCodium/User"

# Choose correct path depending on how it is installed
if [ -d "$FLATPAK_PATH" ]; then
    TARGET="$FLATPAK_PATH"
elif [ -d "$NORMAL_PATH" ]; then
    TARGET="$NORMAL_PATH"
else
    echo "Can not find VSCodium configurations folder."
    exit 1
fi

echo "Use VSCodium folder: $TARGET"

# Copy settings
yes | cp "$SCRIPT_DIR/../configuration/settings.json" "$TARGET/settings.json"
yes | cp "$SCRIPT_DIR/../configuration/keybindings.json" "$TARGET/keybindings.json"

# Ensure snippets folder exists
mkdir -p "$TARGET/snippets"

# Copy snippets
yes | cp "$SCRIPT_DIR/../snippets/"*.json "$TARGET/snippets/"

echo "VSCodium settings copied."

