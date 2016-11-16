#!/bin/bash

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
    python-dev


nvm install node
npm install -g typescript
npm install -g typescript-formatter
npm install -g js-beautify
npm install -g remark
