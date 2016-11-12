#!/bin/bash

# sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
# apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
# curl http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu52_52.1-3ubuntu0.4_amd64.deb > /tmp/libicu52_52.1-3ubuntu0.4_amd64.deb
# dpkg -i /tmp/libicu52_52.1-3ubuntu0.4_amd64.deb
# apt-get update
# apt-get install dotnet-dev-1.0.0-preview2-003131

# sh -c 'echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/dotnet/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
# apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
# apt-get update
# apt-get install libicu-dev
# curl http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu52_52.1-3ubuntu0.4_amd64.deb > /tmp/libicu52_52.1-3ubuntu0.4_amd64.deb
# dpkg -i /tmp/libicu52_52.1-3ubuntu0.4_amd64.deb
# apt-get install dotnet

sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ yakkety main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
apt-get update
apt-get install dotnet-dev-1.0.0-preview2.1-003155
