#!/bin/bash

pushd ./
cd ~/src/
git clone https://github.com/containers/podman-compose.git
cd podman-compose
popd

grep -qxF "alias docker='podman'" ~/.bash_aliases || echo "alias docker='podman'" >> ~/.bash_aliases
grep -qxF "alias docker-compose='podman-compose'" ~/.bash_aliases || echo "alias docker-compose='podman-compose'" >> ~/.bash_aliases

CONFIG_DIR="$HOME/.config/containers"
CONFIG_FILE="containers.conf"

# Create the configuration directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Create and populate the configuration file
cat > "$CONFIG_DIR/$CONFIG_FILE" <<EOL
[engine]
cgroup_manager = "cgroupfs"
events_logger = "file"
EOL
