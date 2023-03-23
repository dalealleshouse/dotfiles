# WSL Environment Setup

My preferred WSL Linux distribution is [Whitewater Foundry's
Pengwin](https://github.com/WhitewaterFoundry/Pengwin). It's available in the
[Microsoft
Store](https://apps.microsoft.com/store/detail/pengwin-enterprise-8/9N2XZFWMRRQW?hl=en-us&gl=us&rtc=1)
for $10 and the utility it provided is well worth the price.

Another indispensable tool required for WSL development is [windows
terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701),
which is also available in the Microsoft store.

Once you get to a Pengwin terminal, get the latest updates with the following commands:

``` bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
```

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
[here]("https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/")
to configure github authentication keys.

Next, create a directory to hold all of yoru source code and navigate into it.

``` bash
mkdir src
cd src
```

Clone the dotfile repository and checkout the nvim branch.

``` bash
git clone git@github.com:dalealleshouse/dotfiles.git
git checkout nvim
```