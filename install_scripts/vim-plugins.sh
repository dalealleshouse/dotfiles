#!/bin/bash

apt-vim install -y https://github.com/scrooloose/nerdtree.git
apt-vim install -y https://github.com/tomasr/molokai.git
apt-vim install -y https://github.com/jlanzarotta/bufexplorer.git
apt-vim install -y https://github.com/scrooloose/syntastic.git
# apt-vim install -y https://github.com/tpope/vim-dispatch.git
apt-vim install -y https://github.com/tpope/vim-commentary.git
apt-vim install -y https://github.com/ctrlpvim/ctrlp.vim.git
# apt-vim install -y https://github.com/SirVer/ultisnips.git
apt-vim install -y https://github.com/tpope/vim-surround.git
apt-vim install -y https://github.com/plasticboy/vim-markdown.git
# apt-vim install -y https://github.com/leafgarland/typescript-vim.git
# apt-vim install -y https://github.com/Quramy/vim-js-pretty-template.git
# apt-vim install -y https://github.com/Shougo/vimproc.vim.git
# apt-vim install -y https://github.com/alvan/vim-closetag.git
# apt-vim install -y https://github.com/Townk/vim-autoclose.git
apt-vim install -y https://github.com/Chiel92/vim-autoformat.git
apt-vim install -y https://github.com/python-mode/python-mode.git

################ vimproc ################
cd ~/.vim/bundle/vimproc.vim
pushd ~/.vim/bundle/vimproc.vim
make
popd

################ You Complete Me ################
apt-vim install -y https://github.com/Valloric/YouCompleteMe.git

cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive

./install.py --clang-completer # --tern-completer
