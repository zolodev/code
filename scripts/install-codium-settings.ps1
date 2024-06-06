# /***************************************************************************
# * Filename      : install-codium-settings.ps1
# * Created       : Thu Jun 05 2024
# * Author        : Zolo
# * Github        : https://github.com/zolodev
# * Description   : 
# ***************************************************************************/


# Copy keybindings configurations
Copy-Item ./configuration/settings.json "$env:APPDATA\VSCodium\User"

# Copy keybindings configurations
Copy-Item ./configuration/keybindings.json "$env:APPDATA\VSCodium\User"

# Copy snippets configurations
Copy-Item ./snippets/*.json "$env:APPDATA\VSCodium\User\snippets"
