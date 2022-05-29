#!/bin/sh

NIX_CONFIG="/etc/nixos/configuration.nix"
HOMEMAN_CONFIG="$XDG_CONFIG_HOME/nixpkgs/home.nix"

# Create symlinks of my configurations if they don't exist
if [ -z "$(ls -A $NIX_CONFIG)" ]; then
	echo "Nix configuration succesfully installed"
	sudo ln -sf $PWD/config.nix $NIX_CONFIG
fi
if [ -z "$(ls -A $HOMEMAN_CONFIG)" ]; then
	echo "Home-manager configuration successfully installed"
	ln -sf $PWD/home.nix $HOMEMAN_CONFIG
fi
