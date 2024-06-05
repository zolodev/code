# Copy keybindings configurations
Copy-Item ./settings.json "$env:APPDATA\VSCodium\User"

# Copy keybindings configurations
Copy-Item ./keybindings.json "$env:APPDATA\VSCodium\User"

# Copy snippets configurations
Copy-Item ./snippets/*.json "$env:APPDATA\VSCodium\User\snippets"
