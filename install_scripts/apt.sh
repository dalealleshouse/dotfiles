#!/bin/bash

apt-get update

apt-get install -y \
    bear \
    python \
    python-dev \
    python3-dev \
    build-essential \
    cmake \
    clang-6.0 \
    tmux \
    inotify-hookable \
    clang-tidy-6.0 \
    clang-format-6.0 \
    git-lfs
