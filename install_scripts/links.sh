#!/bin/bash

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf > /dev/null 2>&1
ln -s ~/dotfiles/.vimrc ~/.vimrc > /dev/null 2>&1
ln -s ~/dotfiles/.bash_profile ~/.bash_profile > /dev/null 2>&1

grep -q -F 'source ~/dotfiles/.bashrc' ~/.bashrc || echo 'source ~/dotfiles/.bashrc' >> ~/.bashrc
