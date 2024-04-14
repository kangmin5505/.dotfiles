#!/bin/bash

install_plugin() {
	local plugin_name=$(echo $1 | cut -d '/' -f2)
	local plugin_repo=$1

	if [ ! -d "$ZSH_CUSTOM/plugins/$plugin_name" ]; then
		echo "Installing $plugin_name..."
		git clone --depth 1 "https://github.com/$plugin_repo.git" "$ZSH_CUSTOM/plugins/$plugin_name"
	fi
}
