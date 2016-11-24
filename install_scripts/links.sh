#!/bin/bash

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile

# VS Code
ln -s ~/.local/share/umake/ide/visual-studio-code/bin/code /usr/local/bin/code

grep -q -F 'source ~/dotfiles/.bashrc' ~/.bashrc || echo 'source ~/dotfiles/.bashrc' >> ~/.bashrc
