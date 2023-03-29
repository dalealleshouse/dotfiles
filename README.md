# WSL Environment Setup

## Distribution

My preferred WSL Linux distribution is [Whitewater Foundry's
Pengwin](https://github.com/WhitewaterFoundry/Pengwin). It's available in the
[Microsoft
Store](https://apps.microsoft.com/store/detail/pengwin-enterprise-8/9N2XZFWMRRQW?hl=en-us&gl=us&rtc=1)
for $10 and the utility it provided is well worth the price.

Another indispensable tool required for WSL development is [windows
terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701),
which is also available in the Microsoft store.

## Package Updates

Once you get to a Pengwin terminal, get the latest updates with the following commands:

``` bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
```

Install the prerequisites

```bash
sudo apt install build-essential cmake apt install wget curl gnupg2 ca-certificates lsb-release apt-transport-https -y
sudo apt-get install -y libassuan-dev libdevmapper-dev libglib2.0-dev libgpgme-dev libgpg-error-dev libostree-dev libseccomp-dev libselinux1-dev libsystemd-dev go-md2man runc conmon -y
```

## Programming Language Tools

Use `pengwin-setup` to install language tools.

- `PROGRAMMING`
  - `GO`
  - `JAVA`
  - `NODEJS`
    - `NVM`
  - `PYTHONPI`
    - `PYENV`
  - `RUBY`

# Git
Configure git with the following commands:

``` bash
git config --global user.email "<INSERT YOUR GIT EMAIL ADDRESS>"
git config --global user.name "<INSERT YOUR GIT USER NAME>"
git config --global credential.helper cache

ssh-keygen -t rsa -b 4096 -C "<INSERT YOUR GIT EMAIL ADDRESS>"

eval `ssh-agent -s`
ssh-add

clip.exe  < ~/.ssh/id_rsa.pub
```

At this point, your public RSA key should be on your clipboard. Follow the
instructions
[here](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
to configure github authentication keys.

Clone the dotfiles repository and checkout the nvim branch.

``` bash
git clone git@github.com:dalealleshouse/dotfiles.git
cd dotfiles
git checkout nvim
```

## Optional [poshgit](https://github.com/dahlbyk/posh-git) configuration -
trust me, you want this

``` bash
./postgit_install.sh
```

# TMUX
Install tmux

``` bash
sudo apt install tmux -y
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

# NVIM
Create the config directories

``` bash
mkdir -p ~/.config/nvim/pack/plugin/start/
```

Run the pre-made install script

``` bash
./nvim_install.sh
```

Configure tooling support
``` bash
# python
pip3 install --user virtualenv
mkdir -p ~/.config/nvim/envs
virtualenv --python=$(which python3) ~/.config/nvim/envs/neovim_py
source ~/.config/nvim/envs/neovim_py/bin/activate
pip install pynvim
deactivate

# node
yarn global add neovim

# ruby
gem install neovim
```

Link the config file
``` bash
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
```

Restart bash, open nvim and run the `:checkhealth` command to verify the
install.

Configure Copilot, open nvim and issue the command
```
:Copilot setup
```

# Podman
If you don't need to use VS Code devcontainers, do this:
```
./podman_config.sh
sudo apt-get update
sudo apt-get install -y podman podman-compose
pip3 install --user ~/src/podman-compose
```

In order to use VS Code devcontainer, you need podman version 4.4. As of the
this instance, the latest Debian repo only has 3.4. The only viable option is
to build from source. So, if you need need to use devcontainers, do this:

```
sudo dnf install -y \
  make \
  golang \
  go-md2man \
  iptables \
  glib2-devel \
  device-mapper-devel \
  gpgme-devel \
  ostree-devel \
  protobuf-c-devel \
  protobuf-devel \
  libseccomp-devel \
  libselinux-devel \
  pkgconf-pkg-config \
  runc \
  containers-common \
  slirp4netns \
  apparmor-devel \
  systemd-devel \
  libcap-devel \
  glibc-devel

cd ~/src/
git clone https://github.com/containers/podman.git
cd podman

git checkout v4.4.4

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

make

sudo make install
pip3 install --user ~/src/podman-compose
```
