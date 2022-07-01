#  Wesley Vieira S. Jr.
#
#    ,= ,-_-. =.
#   ((_/)o o(\_))
#    `-'(. .)`-'
#        \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

# Desktop environment packages

{ pkgs, config, ... }:

{
	environment.systemPackages = with pkgs; [
		### Core packages
		picom                       # compositor
		nitrogen                    # wallpaper engine
		polybarFull                 # status bar
		rofi                        # dmenu replacement
		redshift                    # blue light filter
		# xss-lock i3lock-fancy-rapid # screen locker
		haskellPackages.greenclip   # clipboard manager
		xclip                       # access X clipboard from the command line
		maim                        # take screenshots
		pulsemixer                  # audio mixing system
		unclutter-xfixes            # hide cursor
		# libnotify                   # send notifications

		### Main programs
		termite       # terminal emulator
		exa           # ls replacement
		ranger        # file manager
		trash-cli     # CLI trash
		imagemagick   # create, modify and display bitmap images
		imv           # image viewer
		mpv-unwrapped # video + audio player + image viewer
		mupdf         # PDF viewer
		htop-vim      # process viewer
		librewolf     # web browser
		gimp          # image editor

		### Archivers
		zip unzip # zip files
		_7zz      # 7zip files
		# unrar     # rar files

		### Customisation
		nordic
		papirus-icon-theme
	];
}
