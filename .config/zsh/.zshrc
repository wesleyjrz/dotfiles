#  Wesley Vieira S. Jr.
#
#      ,= ,-_-. =.
#     ((_/)o o(\_))
#      `-'(. .)`-'
#          \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

### Enable extended colour support ###

export TERM=xterm-256color
export COLORTERM=truecolor

### ZSH completion system ###

zstyle ":completion:*" menu select
zstyle ":completion:*" completer _complete _ignored _correct _approximate
zstyle :compinstall filename "~/.config/zsh/.zshrc"

autoload -Uz compinit ; compinit

### Default man pager ###

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### Enable nix-shell support

any-nix-shell zsh --info-right | source /dev/stdin

### Import custom aliases ###

source $ZDOTDIR/aliases.zsh

### Custom functions ###

source $ZDOTDIR/functions/open.sh
source $ZDOTDIR/functions/extract.sh
# source $ZDOTDIR/functions/gita.sh
source $ZDOTDIR/functions/rclone.sh

### Bootstrap ZSH Snap ###

[[ -f $ZDOTDIR/plugins/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $ZDOTDIR/plugins/zsh-snap
source $ZDOTDIR/plugins/zsh-snap/znap.zsh

### Theme ###

znap prompt geometry-zsh/geometry

### Plugins ###

znap source jeffreytse/zsh-vi-mode            # better vi mode
znap source agkozak/zsh-z                     # easy navigation with `z`
znap source hlissner/zsh-autopair             # auto-close matching delimiters
znap source zsh-users/zsh-syntax-highlighting # fish-like syntax highlighting (must be at the end)
