# alias tmux='tmux -2'
# alias docker='docker.exe'
# alias docker-compose='docker-compose.exe'

# minikube stuff
# alias mk='minikube --vm-driver=hyperv --hyperv-virtual-switch=minikube start'
# alias mkdock='minikube ip | { read ip; /mnt/c/Git/zero-to-devops/docker/minikube-docker.sh $ip; } && source ~/.minikube/docker.temp'
# alias mkkube='kubectl config use-context minikube'

export DOCKER_HOST=tcp://127.0.0.1:2375

source ~/dotfiles/git-prompt.sh
source ~/dotfiles/.functions
PROMPT_COMMAND='__posh_git_ps1 "\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" "\\n\$ ";'$PROMPT_COMMAND
