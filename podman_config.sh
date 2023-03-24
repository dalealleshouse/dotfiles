#!/bin/bash

echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/Release.key" | sudo apt-key add -

grep -qxF "alias docker='podman'" ~/.bash_aliases || echo "alias docker='podman'" >> ~/.bash_aliases
grep -qxF "alias docker-compose='podman-compose'" ~/.bash_aliases || echo "alias docker-compose='podman-compose'" >> ~/.bash_aliases

#!/bin/bash

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
