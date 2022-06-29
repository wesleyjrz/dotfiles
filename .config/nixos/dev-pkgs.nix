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
		git git-lfs
		neovim
		docker        # portable containers
		gnumake       # generate executables and other non-source files easily
		gtk4          # widget toolkit
		entr          # run arbitrary commands when files change
		file          # show file types
		jq            # JSON processor
		binutils      # set of tools for creating and managing binary programs
		unixtools.xxd # hexdump

		### Assembly
		nasm # portable 80x86 assembler

		### C/C++
		gcc cmake  # C and C++ compiler
		gdb cgdb   # debugger
		ncurses    # CRT screen handling and optimisation lib (build TUIs)
		i3ipc-glib # interface library to i3wm
		libstdcxx5 # C++ Standard Library
		ccls       # LSP

		### Python
		python37Full python2Full pypy37 pypy
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
