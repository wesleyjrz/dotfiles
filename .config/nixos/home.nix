{ pkgs, config, ... }:
let

	unstable = import
		(builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixpkgs-unstable)
		# Reuse the current configuration
		{ config = config.nixpkgs.config; };

	tex = (pkgs.texlive.combine {
		inherit (pkgs.texlive) scheme-small
		amsfonts                     # math symbols
		amsmath                      # math notations
		fontspec                     # for loading fonts
		xunicode xltxtra url parskip # formatting
		xcolor                       # custom colours
		layaureo                     # margin formatting
		hyperref                     # adding and customising links
		titlesec;                    # customise \section
	});

in {
	### Nixpkgs
	nixpkgs = {
		config.allowUnfree = false; # allow non-free software
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

	home = {
		### Configuration
		username = "wesleyjrz";
		homeDirectory = "/home/wesleyjrz";
		stateVersion = "21.05";

		### Packages
		# NOTE: I will separate this packages in their own nix files soon
		packages = with pkgs; [
			### Development
			neovim-nightly
			git
			git-lfs
			gnumake
			binutils
			gcc
			cmake
			ccls
			libstdcxx5 # C++ Standard Library
			tcsh
			nasm
			python37Full
			python2Full
			pypy3
			lua
			nodejs
			sumneko-lua-language-server
			gtk4
			sass
			love
			# godot
			nodePackages.npm
			nodePackages.pyright
			nodePackages.bash-language-server
			shellcheck
			nodePackages.live-server
			docker

			### Desktop environment
			picom
			nitrogen
			redshift
			polybarFull
			rofi
			xclip
			haskellPackages.greenclip
			xss-lock
			i3lock-fancy-rapid
			unclutter-xfixes
			libnotify
			maim
			termite
			curl
			wget
			trash-cli
			pulsemixer

			### Others
			w3m
			unstable.librewolf
			ungoogled-chromium
			ranger
			mpv-unwrapped
			imv
			ncmpcpp
			mupdf
			pipe-viewer
			gimp
			rclone
			retroarchBare
			libretro.desmume
			libretro.dosbox
			libretro.fceumm
			libretro.genesis-plus-gx
			libretro.mgba
			libretro.mupen64plus
			libretro.ppsspp
			libretro.snes9x
			# taisei
			cpu-x
			monero-gui
			scrcpy
			exa
			neofetch
			unixtools.xxd
			file
			fzf
			entr
			edir
			cmatrix
			htop-vim
			youtube-dl
			pandoc
			imagemagick
			tex

			### Archivers
			zip
			unzip
			_7zz
			# unrar

			### Theming
			nordic
			papirus-icon-theme
		];
	};

	### Modules
	# NOTE: I don't pretend to use home-manager to configure all my dotfiles,
	# because it doesn't have a good support for complex configurations and
	# newer versions of them yet, and I don't like to have a gigantic file
	# with all configurations, even if it helps me storing them easier
	# Nevertheless, some simple configurations like the `bat` one will be here
	programs = {
		home-manager.enable = true;
		bat = {
			enable = true;
			config = {
				theme = "Nord";
				style = "plain";
				paging = "auto";
				italic-text = "never";
			};
		};
	};
}
