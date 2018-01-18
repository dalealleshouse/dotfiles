#!/bin/bash

pushd .

git clone https://github.com/rizsotto/Bear.git ~/bear
cd ~/bear
mkdir build
cd build
cmake ..
make all
sudo make install

echo "To build a compolation database from a Makefile: bear make"

popd

