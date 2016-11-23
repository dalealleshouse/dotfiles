#!/bin/bash

# dotnet
sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

# Node
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

# vim-apt
curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh

# vim
add-apt-repository ppa:pkg-vim/vim-daily

apt-get update

apt-get install -y \
    cowsay \
    vim \
    tmux \
    git \
    openssh-server \
    nodejs \
    build-essential \
    cmake \
    python-dev \
    dotnet-dev-1.0.0-preview2.1-003177


nvm install node
npm install -g typescript
npm install -g typescript-formatter
npm install -g tslint
npm install -g js-beautify
npm install -g remark
