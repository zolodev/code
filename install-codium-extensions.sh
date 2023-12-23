#!/usr/bin/bash

# Run the following command to update the extensions list
# $ codium --list-extensions > extensions.txt

cat extensions.txt | while read extension || [[ -n $extension ]];
do
    codium --install-extension $extension --force
    # codium --uninstall-extension $extension --force
done
