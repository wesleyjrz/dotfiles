#  Wesley Vieira S. Jr.
#
#    ,= ,-_-. =.
#   ((_/)o o(\_))
#    `-'(. .)`-'
#        \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

# My desktop-related packages

{ pkgs, config, ... }:

let

	unstable = import
		(builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixpkgs-unstable)
		# Reuse the current configuration
		{ config = config.nixpkgs.config; };

in

{
	home-manager.users.wesleyjrz.home.packages = with pkgs; [
		### Core packages
		picom                       # Compositor
		nitrogen                    # Wallpaper Engine
		polybarFull                 # Status bar
		rofi                        # dmenu replacement
		# redshift                    # Blue light filter
		# xss-lock i3lock-fancy-rapid # Screen locker
		haskellPackages.greenclip   # Clipboard manager
		xclip                       # Access X selections (clipboard) from the command line
		maim                        # Take screenshots
		pulsemixer                  # Audio mixing system
		unclutter-xfixes            # Hide cursor
		# libnotify                   # Send notifications

		### Main programs
		termite       # Terminal emulator
		ranger        # File manager
		exa           # ls replacement
		edir          # Batch renamer with text editor
		trash-cli     # CLI Trash
		imagemagick   # Create, modify and display bitmap images
		imv           # Image viewer
		mpv-unwrapped # Video + Audio player + Image viewer
		mupdf         # PDF viewer
		htop-vim      # Process viewer
		gimp          # Image edit
		cpu-x         # System information

		### Web Browsers
		w3m
		unstable.librewolf
		ungoogled-chromium

		### Archivers
		zip unzip # zip files
		_7zz      # 7zip files
		# unrar     # rar files

		### Themes and customisation
		nordic
		papirus-icon-theme
	];
}
