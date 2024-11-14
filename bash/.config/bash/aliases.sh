#!/bin/sh

alias rc="vim ~/.bashrc"
alias dotfiles="cd ~/.dotfiles"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# easier to read disk
alias df="df -h" # human-readable sizes
alias free="free -m" # show sizes in MB

# copy and paste
alias pbcopy="xsel --input --clipboard"
alias pbpaste="xsel --output --clipboard"

alias fd="fdfind"
alias grep="grep --color=auto"
alias ip="ip -c=auto"

# git
GIT_LOG_FORMAT="--graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'
"
alias glog="git log $GIT_LOG_FORMAT"
alias gloga="git log --all $GIT_LOG_FORMAT"
