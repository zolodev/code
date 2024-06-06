# VSCode|VSCodium Settings and Extensions

## Personal favorite font

Download the font from JetBrains.
[JetBrains Mono](https://www.jetbrains.com/lp/mono/) (JetBrains Mono. A typeface for developers_)


## Backup extensions
```bash
$ codium --list-extensions > ./configuration/extensions.txt
```

## Install VSCodium for Fedora
In order to install VSCodium on Fedora39 follow the steps below:

[Instruction Source](https://www.linuxcapable.com/install-vscodium-on-fedora-linux/)

Step 1:

>$ dnf upgrade --refresh

Step 2:

> sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

Step 3:

> printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

Followed by the last step 4:

> $ sudo dnf install codium


## Old font settings
These are my _old_ personal preferences for VSCode

Install Fira code Font
[Fira-code](https://github.com/tonsky/FiraCode/wiki/Installing) (font to make sure vscode code looks nice)

## Fedora
How to install Fira code font on Fedora, just run the following command:
> $ dnf install fira-code-fonts

Nerdfonts

[Nerd fonts](https://www.nerdfonts.com/) (Iconic font aggregator, collection, and patcher)
