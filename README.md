# `/home/wesleyjrz`

> “Home Sweet Home”

## About

### What I use to manage my dotfiles
I've used `gnu stow` and `yadm` before to manage my dotfiles, but I noticed that I really don't need all this `bloat` to do a simple task like this, then I migrate to a `git bare repository`.

### Which Operating System I do prefer
You may notice that I use **NixOS**, which isn't a minimal system as I would like it to be (that's why I loved **Arch Linux**), but it has a bunch of advantages over another distros, and I love the idea of keeping all my packages and system configurations in "text" files. I was used to keep a list of my installed packages in a `installed-packages.txt` before I know **NixOS** and **home-manager**.

### Why I don't keep all my dotfiles in `home.nix`
I don't keep all my configurations within `home.nix` because it has a big lack of support for "advanced" configurations that I'd like to use and I wouldn't like to keep a huge configuration file to do everything (I would separate my `home.nix` in various modules if I use **home-manager** to manage it). Btw, I use it to manage some simple dotfiles.

# License
Released under the MIT License unless otherwise specified by license files in subfolders.
