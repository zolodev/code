#!/usr/bin/bash

# Run the following command to update the extensions list
# $ codium --list-extensions > extensions.txt

cat extensions.txt | while read extension || [[ -n $extension ]];
do
    codium --install-extension $extension --force
    # codium --uninstall-extension $extension --force
done

echo "Installing local extensions (vsxi)"

for local_extension in ./vsxi/*
do
    codium --install-extension $local_extension --force
done
