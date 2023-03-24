#!/bin/bash

curl https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh > ~/dotfiles/git-prompt.sh

line1='source ~/dotfiles/git-prompt.sh'
line2='PROMPT_COMMAND='\''__posh_git_ps1 "\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" "\\n\$ ";'\''$PROMPT_COMMAND'

# Check if the lines already exist in bashrc
if grep -Fxq "$line1" ~/.bashrc && grep -Fxq "$line2" ~/.bashrc; then
    echo "poshgit already isntalled"
else
    # If the lines don't exist, add them to bashrc
    echo -e "\n$line1" >> ~/.bashrc
    echo "$line2" >> ~/.bashrc
    echo "postgit installed"
fi
