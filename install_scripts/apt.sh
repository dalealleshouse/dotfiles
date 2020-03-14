#!/bin/bash

apt-get update

apt-get install -y \
    bear \
    build-essential \
    cmake \
    clang \
    tmux \
    inotify-hookable \
    clang-tidy \
    clang-format \
    git-lfs \
    vim-gtk \
    libcunit1 \
    libcunit1-doc \
    libcunit1-dev
