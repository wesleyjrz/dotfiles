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

{
	### Import extra configurations (development packages, desktop environment...)
	imports = [
		/etc/nixos/desktop.nix
		/etc/nixos/development.nix
	];

	### Allow non-free software
	nixpkgs.config.allowUnfree = false;

	home-manager.users.wesleyjrz.home = {
		stateVersion = "21.05";

		### Packages
		packages = with pkgs; [
			curl
			wget
			fzf
			kjv
			todo-txt-cli
			neofetch # show basic system information
			rclone   # mount clouds locally
			scrcpy   # display and control Android devices
			texlive.combined.scheme-full
			dmidecode
			minder
			pandoc
			cmatrix
			# taisei

			### Cryptocurrency
			mycrypto
			monero-gui
			bisq-desktop

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
	 home-manager.users.wesleyjrz.programs = {
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
