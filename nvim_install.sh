#!/bin/bash

# Download the latest Neovim release package
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb

# Install the Neovim Debian package
sudo apt install -y ./nvim-linux64.deb

# Remove the downloaded package
rm nvim-linux64.deb

# Verify the installation and check the Neovim version
nvim --version

# Add vim to nvim alias if it doesn't exist
grep -qxF "alias vim='nvim'" ~/.bashrc || echo "\nalias vim='nvim'" >> ~/.bashrc

# Apply the changes immediately
source ~/.bashrc

echo "Neovim installation completed successfully."
