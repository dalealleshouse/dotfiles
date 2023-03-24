#!/bin/bash

# Download the latest Neovim release package
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb

# Install the Neovim Debian package
sudo apt install -y ./nvim-linux64.deb

# Remove the downloaded package
rm nvim-linux64.deb

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
