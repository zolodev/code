Get-Content extensions.txt | ForEach-Object { codium --install-extension $_ }
Get-ChildItem -r ./vsxi | ForEach-Object { codium --install-extension $_.FullName }
