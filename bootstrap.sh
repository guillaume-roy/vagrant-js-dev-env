#!/bin/bash

# Change default password
echo "ubuntu:ubuntu" | sudo chpasswd

# Update installed packages
sudo apt-get update
sudo apt-get upgrade -y

# Install UI
sudo apt-get install lubuntu-desktop -y

# Install VBoxGuestAdditions
sudo apt-get install linux-headers-$(uname -r) build-essential -y
sudo apt-get install virtualbox-guest-x11 virtualbox-guest-utils virtualbox-guest-dkms -y

# Install Chromium
sudo apt-get install chromium-browser -y

# Install NodeJs
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install node
nvm use node

# Install VSCode
wget -q https://go.microsoft.com/fwlink/?LinkID=760868 -O VSCode.deb
sudo dpkg -i VSCode.deb
sudo apt-get install -f
rm VSCode.deb

# Git Configuration
git config --global user.name "USER NAME"
git config --global user.email "USER EMAIL"
git config --global color.ui auto
git config --global credential.helper store

setxkbmap fr

sudo reboot