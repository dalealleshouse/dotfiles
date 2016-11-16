#!/bin/bash

git config --global user.email "dalealleshouse@gmail.com"
git config --global user.name "Dale Alleshouse"

ssh-keygen -t rsa -b 4096 -C "dalealleshouse@gmail.com"

eval `ssh-agent -s`
ssh-add

xclip -sel clip < ~/.ssh/id_rsa.pub

echo "The ssh key is on your clipboard. Add it to GitHub to complete setup"
echo "https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/"
