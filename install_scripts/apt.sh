#!/bin/bash

# Mono
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list

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
	docker-compose \
	mono-runtime \
	mono-xbuild \
	mono-complete \
	nodejs \
	build-essential \
	cmake \
	npm \
	python-dev


nvm install node
npm install -g typescript
