#!/bin/bash

alias rc="vim ~/.zshrc"
alias s="source ~/.zshrc"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# easier to read disk
alias df="df -h" # human-readable sizes
alias free="free -m" # show sizes in MB


if [[ "$(uname)" == "Darwin" ]]; then
  alias find="fd"
fi
