#!/usr/bin/bash

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

cat extensions.txt | while read extension || [[ -n $extension ]];
do
    codium --install-extension $extension --force     
done

echo "Installing local extensions (vsxi)"

for local_extension in ./vsxi/*
do
    codium --install-extension $local_extension --force
done

# Disable any powershell extensions

codium --list-extensions | while read extension || [[ -n $extension ]];
do
    if [[ $extension == *"powershell"* ]]; then
        echo "Disabling PowerShell extension..."
        codium --disable-extension $extension
    fi
done
