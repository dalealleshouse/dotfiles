source ~/dotfiles/git-prompt.sh
source ~/dotfiles/.functions
PROMPT_COMMAND='__posh_git_ps1 "\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" "\\n\$ ";'$PROMPT_COMMAND
