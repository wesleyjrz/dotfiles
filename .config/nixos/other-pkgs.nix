#  Wesley Vieira S. Jr.
#
#    ,= ,-_-. =.
#   ((_/)o o(\_))
#    `-'(. .)`-'
#        \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

# General packages

{ pkgs, config, ... }:

{
	users.users.wesleyjrz.packages = with pkgs; [
		### System tools
		ed        # THE STANDARD TEXT EDITOR
		bat       # cat with extra features
		curl      # transfer data (from or to a server)
		wget      # CLI downloader
		fzf       # fuzzy finder
		ncdu      # ncurses disk usage
		rclone    # mount clouds locally
		scrcpy    # display and control Android devices
		pandoc    # markup converter
		neofetch  # show basic system information
		cpu-x     # GUI system hardware info
		dmidecode # system hardware info
		edir      # text editor batch renamer
		todo-txt-cli
		texlive.combined.scheme-full

		### Cryptocurrency
		monero-gui
		mycrypto
		electrum
		# bisq-desktop
		nodePackages.coinmon

		### Editors
		gimp    # image editor
		shotcut # video editor

		### Study tools
		minder   # create mind maps
		anki-bin # flashcards

		### Games
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

		### Misc
		cmatrix
	];
}
