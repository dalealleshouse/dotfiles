#!/bin/bash

apt-get install git-all

git config --global user.email "dalealleshouse@gmail.com"
git config --global user.name "Dale Alleshouse"
git config credential.helper cache

ssh-keygen -t rsa -b 4096 -C "dalealleshouse@gmail.com"

eval `ssh-agent -s`
ssh-add

echo "Copy the contents of ~/.ssh/id_rsa.pub into a github ssh key"
echo "https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/"
