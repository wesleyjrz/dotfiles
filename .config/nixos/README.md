# Warning

I've recently switched to NixOS and don't know a better way to store my nix
dotfiles in the same directory, then for now I will keep these files here and
use symlinks to its default directories.

If you're trying to use this configuration, I left a script named "link.sh" in
this directory that does the boring work, though you can just use the commands
below:

### NixOS configuration

`sudo ln -sf ~/.config/nixos/configuration.nix /etc/nixos`

### Home-manager configuration

`ln -sf ~/.config/nixos/home.nix ~/.config/nixpkgs`

**NOTE:** You should use the last command for `email.nix` and other extra files.
