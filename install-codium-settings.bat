@echo off
xcopy settings.json "%APPDATA%\VSCodium\User" /Y
xcopy ./snippets/*.json "%APPDATA%\VSCodium\User\snippets" /Y
