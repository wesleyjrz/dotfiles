# Warning

You have to symlink the files in this directory to `/etc/nixos`, please use the
shell script I left or use the command below:

`sudo ln -sf ~/.config/nixos/*.nix /etc/nixos`

Also, to use home-manager as a NixOS module run the other script or the command below:

`sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager && sudo nix-channel --update`
