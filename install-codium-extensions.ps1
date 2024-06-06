/*****************************************************************************
* Filename      : install-codium-extensions.ps1
* Created       : December 24th, 2023
* Author        : Zolo
* Github        : https://github.com/zolodev
* Description   : 
*****************************************************************************/

# Install external extensions from .\extensions.txt
Get-Content extensions.txt | ForEach-Object { codium --install-extension $_ }

# Install local extensions from vsxi folder
Get-ChildItem -r ./vsxi | ForEach-Object { codium --install-extension $_.FullName }
