#  Wesley Vieira S. Jr.
#
#      ,= ,-_-. =.
#     ((_/)o o(\_))
#      `-'(. .)`-'
#          \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

### Manage my dotfiles bare repository ###

alias dot="git --git-dir=$XDG_DATA_HOME/dotfiles --work-tree=$HOME"

### Edit aliases ###

alias aliases="$EDITOR $XDG_CONFIG_HOME/zsh/aliases.zsh"

### NixOS ###

alias home="home-manager"
alias nix-edit="$EDITOR /etc/nixos/configuration.nix"                # edit system's configuration
alias home-edit="home-manager edit"                                  # edit home-manager's configuration
alias nix-gc="sudo nix-collect-garbage -d && nix-collect-garbage -d" # do a garbage collection (system-wide and user-specific)

# List my system generations
alias nix-gen="sudo nix-env -p /nix/var/nix/profiles/system --list-generations"

### exa ###

alias ls="exa -G --all --icons --group-directories-first --ignore-glob='*~'"      # my favourite default list
alias lr="exa -T --all --icons --group-directories-first --ignore-glob='*~|.git'" # tree-like recursive list (hide .git)
alias ll="exa -l --all --icons --group-directories-first --ignore-glob='*~'"      # long display (table mode)
alias l="exa -G --icons --group-directories-first --ignore-glob='*~'"             # list only visible files

### rclone ###

alias rclonegui="rclone rcd --rc-web-gui" # open rclone GUI

### greenclip ###

alias clip="greenclip print | bat --number" # print clipboard

### youtube-dl ###

# Download video
alias ytv="youtube-dl --format bestvideo+bestaudio"

# Download audio
alias yta-aac="youtube-dl --extract-audio --audio-format aac"
alias yta-best="youtube-dl --extract-audio --audio-format best"
alias yta-flac="youtube-dl --extract-audio --audio-format flac"
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a"
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3"
alias yta-opus="youtube-dl --extract-audio --audio-format opus"
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis"
alias yta-wav="youtube-dl --extract-audio --audio-format wav"

### pipe-viewer ###

# Start pipe-viewer with my preferred settings
alias yt="pipe-viewer region UK resolution 1080p"

### scrcpy ###

# Start scrcpy with my preferred settings
alias scr="scrcpy --turn-screen-off --stay-awake --show-touches --disable-screensaver -b4M -m1280"

### wget ###

# Enable continue downloads by default and change history file path to be XDG Compliant
alias wget="wget --continue --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

### Colours and human-readable options ###

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias free="free --human"
alias du="du --human-readable"
alias df="df --human-readable"

### Confirm before overwriting something ###

alias cp="cp --interactive"
alias mv="mv --interactive"
alias rm="rm --interactive"

### todo ###

# Find and print all my `todo.txt` files and print them in order from "A" to "D"
alias todo="find $HOME -name "todo.txt" -type f -exec cat {} + | grep '(A)' ; find $HOME -name "todo.txt" -type f -exec cat {} + | grep '(B)' ; find $HOME -name "todo.txt" -type f -exec cat {} + | grep '(C)' ; find $HOME -name "todo.txt" -type f -exec cat {} + | grep '(D)'"

### Print object files assembly ###

alias disassemble="objdump -S --disassemble"

### xxd ###

alias bin="xxd -bits" # print file bits
alias hex="xxd"       # print file hex

### List available fonts ###

alias fonts="fc-list | bat"

### test connection ###

alias up="ping -c 4 -i 1 archlinux.org ; echo '' && ping -c 4 -i 1 manjaro.org"

### gcc ###

# My preferred flags to compile C code
alias gcc="gcc -ansi -pedantic -Wall -Wextra"
alias cc="gcc -ansi -pedantic -Wall -Wextra"

### cshell ###

alias csh="tcsh"

### python ###

alias py="python2"
alias py3="python3"
alias pp="pypy3"

# pip
alias pypip="python2 -mpip"
alias py3pip="python3 -mpip"
alias pppip="pypy3 -mpip"
