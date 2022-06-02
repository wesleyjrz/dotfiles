#  Wesley Vieira S. Jr.
#
#    ,= ,-_-. =.
#   ((_/)o o(\_))
#    `-'(. .)`-'
#        \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

# Packages I use for development

{ pkgs, config, ... }:

{
	### Package overlays
	nixpkgs = {
		overlays = [
			# Neovim Nightly overlay
			(import (builtins.fetchTarball { url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz; }))
			# Neovim Nightly vi/vim aliases
			(self: super: {
				neovim-nightly = super.neovim.override {
					viAlias = true;
					vimAlias = true;
				};
			})
		];
	};

	home.packages = with pkgs; [
		### Tools
		git
		git-lfs
		neovim-nightly
		docker
		gnumake
		gtk4
		entr # run arbitrary commands when files change
		file # determine file type
		jq   # JSON processor
		binutils
		unixtools.xxd

		### Assembly
		nasm

		### C/C++
		gcc
		cmake
		libstdcxx5 # C++ Standard Library
		ccls # LSP

		### Python
		python37Full python2Full pypy3
		nodePackages.pyright # LSP

		### Lua
		lua
		love
		sumneko-lua-language-server # LSP

		### Bash/Shell Script
		nodePackages.bash-language-server
		shellcheck

		### Web Development
		sass
		hugo
		nodePackages.live-server

		### JavaScript
		nodejs
		nodePackages.npm
	];
}
