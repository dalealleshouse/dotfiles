#!/bin/bash

apt-vim install -y https://github.com/scrooloose/nerdtree.git
apt-vim install -y https://github.com/tomasr/molokai.git
apt-vim install -y https://github.com/jlanzarotta/bufexplorer.git
apt-vim install -y https://github.com/scrooloose/syntastic.git
apt-vim install -y https://github.com/tpope/vim-commentary.git
apt-vim install -y https://github.com/ctrlpvim/ctrlp.vim.git
apt-vim install -y https://github.com/tpope/vim-surround.git
apt-vim install -y https://github.com/plasticboy/vim-markdown.git
apt-vim install -y https://github.com/Chiel92/vim-autoformat.git
apt-vim install -y https://github.com/python-mode/python-mode.git


################ You Complete Me ################
apt-vim install -y https://github.com/Valloric/YouCompleteMe.git

cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive

./install.py --clang-completer
