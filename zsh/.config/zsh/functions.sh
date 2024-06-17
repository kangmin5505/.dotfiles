#!/bin/sh

function install_packages() {
	cat $HOME/packages.list | xargs sudo apt install -y
}
