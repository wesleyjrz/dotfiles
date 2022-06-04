#!/bin/sh

# For extracting different kind of files.

ex () {
	if [ -f "$1" ] ; then
		case $1 in
			*.tar)     tar --extract --verbose --file $1         ;;
			*.tar.xz)  tar --extract --verbose --file $1         ;;
			*.tar.gz)  tar --extract --gzip --verbose --file $1  ;;
			*.tgz)     tar --extract --gzip --verbose --file $1  ;;
			*.tar.bz2) tar --extract --bzip2 --verbose --file $1 ;;
			*.tbz2)    tar --extract --bzip2 --verbose --file $1 ;;
			*.tar.zst) unzstd $1                                 ;;
			*.gz)      gunzip $1                                 ;;
			*.bz2)     bunzip2 $1                                ;;
			*.zip)     unzip $1                                  ;;
			*.Z)       uncompress $1                             ;;
			*.7z)      7zz x $1                                  ;;
			*.rar)     unrar x $1                                ;;
			*)         echo "Unknown file format"                ;;
		esac
	else
		echo "\"$1\" isn't a valid file"
	fi
}
