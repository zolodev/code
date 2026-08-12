#!/usr/bin/env bash

#****************************************************************************
# Filename      : install-codium-extensions.sh
# Created       : Mon Dec 25 2023
# Author        : Zolo
# Github        : https://github.com/zolodev
# Description   : Automate the installation of my favorite extensions
#****************************************************************************


# Run the following command to update the extensions list
# $ codium --list-extensions > extensions.txt
# Run the following command to remove|delete all extensions
# rm -rf ~/.vscode-oss/extensions/

# Fallback if "codium" does not exist

# Find script and project directories
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Find codium
if command -v codium >/dev/null 2>&1; then
    CODIUM="codium"

elif command -v flatpak >/dev/null 2>&1 && flatpak info com.vscodium.codium >/dev/null 2>&1; then
    CODIUM="flatpak run com.vscodium.codium"

else
    echo "Error: Could not find VSCodium."
    echo "Make sure VSCodium is installed and 'codium' is available in PATH."
    exit 1
fi

echo "Using VSCodium: $CODIUM"

# Extensions list
EXTENSIONS_FILE="$PROJECT_DIR/configuration/extensions.txt"

if [ ! -f "$EXTENSIONS_FILE" ]; then
    echo "Error: extensions.txt not found: $EXTENSIONS_FILE"
    exit 1
fi

echo "Installing extensions..."

while IFS= read -r extension || [[ -n "$extension" ]]; do

    # Ignore empty lines
    [[ -z "$extension" ]] && continue

    echo "Installing: $extension"
    $CODIUM --install-extension "$extension" --force

done < "$EXTENSIONS_FILE"

# Install local VSIX extensions
echo "Installing local extensions (vsix)..."

shopt -s nullglob

for local_extension in "$PROJECT_DIR"/vsxi/*.vsix; do
    echo "Installing: $local_extension"
    $CODIUM --install-extension "$local_extension" --force
done

shopt -u nullglob

# Disable PowerShell extensions
echo "Checking for PowerShell extensions..."

$CODIUM --list-extensions | while IFS= read -r extension || [[ -n "$extension" ]]; do

    if [[ "$extension" == *"powershell"* ]]; then
        echo "Disabling PowerShell extension: $extension"
        $CODIUM --disable-extension "$extension"
    fi

done

echo "VSCodium extensions installed."
