#  Wesley Vieira S. Jr.
#
#    ,= ,-_-. =.
#   ((_/)o o(\_))
#    `-'(. .)`-'
#        \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

{ pkgs, config, ... }:

let

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

in

{
	### Import extra configurations (development packages, desktop environment...)
	imports = [
		~/.config/nixos/desktop.nix
		~/.config/nixos/development.nix
	];

	### Allow non-free software
	nixpkgs.config.allowUnfree = false;

	home = {
		### Configuration
		username = "wesleyjrz";
		homeDirectory = "/home/wesleyjrz";
		stateVersion = "21.05";

		### Packages
		packages = with pkgs; [
			curl
			wget
			fzf
			neofetch    # Show basic system information
			rclone      # Mount clouds locally
			pipe-viewer # Watch youtube videos
			scrcpy      # Display and control Android devices
			tex
			pandoc
			monero-gui
			cmatrix
			# taisei

			### Retroarch emulator
			retroarchBare
			libretro.desmume
			libretro.dosbox
			libretro.fceumm
			libretro.genesis-plus-gx
			libretro.mgba
			libretro.mupen64plus
			libretro.ppsspp
			libretro.snes9x
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
