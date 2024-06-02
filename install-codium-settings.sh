#!/usr/bin/env bash

# Copy and replace settings.json at: ~/.config/VSCodium/User/settings.json
yes | cp ./settings.json ~/.config/VSCodium/User/settings.json
yes | cp ./keybindings.json ~/.config/VSCodium/User/keybindings.json
yes | cp ./snippets/*.json ~/.config/VSCodium/User/snippets/
