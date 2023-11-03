#!/bin/bash

# Download the latest Neovim release package
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim


# Remove the downloaded package
rm nvim.appimage

# Verify the installation and check the Neovim version
nvim --version

# Check if .bash_aliases file exists, if not, create it
if [ ! -f ~/.bash_aliases ]; then
    touch ~/.bash_aliases
fi

# Add vim to nvim alias if it doesn't exist
grep -qxF "alias vim='nvim'" ~/.bash_aliases || echo "alias vim='nvim'" >> ~/.bash_aliases

# Apply the changes immediately
source ~/.bash_aliases

echo "Neovim installation completed successfully."
