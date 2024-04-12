#!/bin/bash

# variables 
export BASE_DIR="$HOME/.dotfiles"

export ZSHRC_SOURCE="$BASE_DIR/.zshrc"
export ZSHRC_TARGET="$HOME/.zshrc"

export GITCONFIG_SOURCE="$BASE_DIR/.gitconfig"
export GITCONFIG_TARGET="$HOME/.gitconfig"

export ALACRITTY_SOURCE="$BASE_DIR/.config/alacritty/alacritty.toml"
export ALACRITTY_TARGET_DIR="$HOME/.config/alacritty"
export ALACRITTY_TARGET="$ALACRITTY_TARGET_DIR/alacritty.toml"

export TMUX_SOURCE="$BASE_DIR/.tmux.conf"
export TMUX_TARGET="$HOME/.tmux.conf"

export OHMYZSH_SOURCE="$BASE_DIR/.p10k.zsh"
export OHMYZSH_TARGET="$HOME/.p10k.zsh"

export LVIM_SOURCE="$BASE_DIR/.config/lvim"
export LVIM_TARGET="$HOME/.config"

# $1: Target $2: Source
make_symbolic_link() {
	if [ -f $1 ]; then
		mv $1 "$1.bak"
	fi
	ln -s $2 $1
}

make_symbolic_link $ZSHRC_TARGET $ZSHRC_SOURCE
make_symbolic_link $GITCONFIG_TARGET $GITCONFIG_SOURCE

mkdir -p $ALACRITTY_TARGET_DIR
make_symbolic_link $ALACRITTY_TARGET $ALACRITTY_SOURCE

make_symbolic_link $TMUX_TARGET $TMUX_SOURCE
make_symbolic_link $OHMYZSH_TARGET $OHMYZSH_SOURCE

make_symbolic_link $LVIM_TARGET $LVIM_SOURCE
