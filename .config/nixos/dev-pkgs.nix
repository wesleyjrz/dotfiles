#  Wesley Vieira S. Jr.
#
#    ,= ,-_-. =.
#   ((_/)o o(\_))
#    `-'(. .)`-'
#        \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

# Development packages

{ pkgs, config, ... }:

with pkgs;
let
	python-pkgs = python-packages: with python-packages; [
		i3ipc
	];
	myPython = python310.withPackages python-pkgs;
in

{
	### Package overlays
	nixpkgs = {
		overlays = [
			# Neovim vi/vim aliases
			(self: super: {
				neovim = super.neovim.override {
					viAlias = true;
					vimAlias = true;
				};
			})
		];
	};

	users.users.wesleyjrz.packages = with pkgs; [
		### Tools
		nix-prefetch-scripts
		any-nix-shell
		git git-lfs
		neovim
		docker        # portable containers
		gnumake       # generate executables and other non-source files easily
		entr          # run arbitrary commands when files change
		file          # show file types
		binutils      # set of tools for creating and managing binary programs
		unixtools.xxd # hexdump

		### Assembly
		nasm # portable 80x86 assembler

		### C/C++
		gcc cmake  # C and C++ compiler
		gdb cgdb   # debugger
		ccls       # LSP

		### Python
		myPython
		nodePackages.pyright    # LSP

		### Lua
		lua
		love
		sumneko-lua-language-server # LSP

		### Shell script
		nodePackages.bash-language-server
		shellcheck

		### Web
		sass
		hugo
		nodePackages.live-server

		### JavaScript
		nodejs
		nodePackages.npm
	];
}
