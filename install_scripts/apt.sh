#!/bin/bash

# dotnet
sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

# Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# vim-apt
curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh

# Install the Docker CLI which will connect to the Windows docker engine.
# There is done via this "export DOCKER_HOST=tcp://127.0.0.1:2375" in .bashrc
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'

#docker compose
curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)"
chmod +x /usr/local/bin/docker-compose

# vim
add-apt-repository ppa:pkg-vim/vim-daily

apt-get update

apt-get install -y \
    cowsay \
    vim \
    tmux \
    git \
    openssh-server \
    build-essential \
    cmake \
    python-dev \
    dotnet-dev-1.0.1 \
    docker-engine

npm install -g typescript
npm install -g typescript-formatter
npm install -g tslint
npm install -g js-beautify
npm install -g remark
