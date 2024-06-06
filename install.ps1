# /***************************************************************************
#  * Filename      : install.ps1
#  * Created       : Thu Jun 06 2024
#  * Author        : Zolo
#  * Github        : https://github.com/zolodev
#  * Description   : 
# ***************************************************************************/

# Run install extensions script
Write-Output "Installing extensions..."
.\scripts\install-codium-extensions.ps1

# Run and install configuration files
Write-Output "Installing configurations..."
.\scripts\install-codium-settings.ps1
