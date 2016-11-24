#!/bin/bash

# Docker

#!/bin/bash
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list
apt-cache policy docker-engine

# Mono
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list

# Dotnet Core
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

# Node
# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

apt-get update

apt-get install -y \
    cowsay \
    vim \
    vim-nox-py2 \
    tmux \
    xclip \
    git \
    openssh-server \
    docker-engine \
    docker-compose \
    mono-runtime \
    mono-xbuild \
    mono-complete \
    nodejs \
    build-essential \
    cmake \
    npm \
    python-dev \
    dotnet-dev-1.0.0-preview3-004056


nvm install node
npm install -g typescript
npm install -g typescript-formatter
npm install -g tslint
npm install -g js-beautify
npm install -g remark

# Docker Permissions
usermod -aG docker "$(whoami)"
