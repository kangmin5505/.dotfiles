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

if [[ "$(uname)" == "Darwin" ]]; then
  alias find="fd"
fi
