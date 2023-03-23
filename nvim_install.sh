#!/bin/bash

# Check if the user has root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run the script as root or with sudo."
  exit 1
fi

# Update package list and install required dependencies
apt update
apt install -y wget curl gnupg2 ca-certificates lsb-release apt-transport-https

# Download the latest Neovim release package
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb

# Install the Neovim Debian package
apt install -y ./nvim-linux64.deb

# Remove the downloaded package
rm nvim-linux64.deb

# Verify the installation and check the Neovim version
nvim --version

echo "Neovim installation completed successfully."
