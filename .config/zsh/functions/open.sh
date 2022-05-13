#!/bin/sh

# It's the magic `open` command, I use it to automatically
# open different types of files with my preferred programs.
# And also it opens things like links directly into the browser.

VIDEO_PLAYER="mpv";
OFFICE_SUITE="libreoffice";
PDF_READER="mupdf";

open () {
  if [ -f "$1" ] ; then
    case $1 in
      # Videos
      *.avi)     $VIDEO_PLAYER $1   ;;
      *.mpg)     $VIDEO_PLAYER $1   ;;
      *.vob)     $VIDEO_PLAYER $1   ;;
      *.mp4)     $VIDEO_PLAYER $1   ;;
      *.m2ts)    $VIDEO_PLAYER $1   ;;
      *.mov)     $VIDEO_PLAYER $1   ;;
      *.3gp)     $VIDEO_PLAYER $1   ;;
      *.mkv)     $VIDEO_PLAYER $1   ;;
      *.webm)    $VIDEO_PLAYER $1   ;;

      # Images
      *.jp*g)    $VIDEO_PLAYER $1   ;;
      *.gif)     $VIDEO_PLAYER $1   ;;
      *.tiff)    $VIDEO_PLAYER $1   ;;
      *.png)     $VIDEO_PLAYER $1   ;;
      *.bmp)     $VIDEO_PLAYER $1   ;;
      *.raw)     $VIDEO_PLAYER $1   ;;
      *.webp)    $VIDEO_PLAYER $1   ;;

      # Audios
      *.wav)     $VIDEO_PLAYER $1   ;;
      *.aiff)    $VIDEO_PLAYER $1   ;;
      *.flac)    $VIDEO_PLAYER $1   ;;
      *.mp3)     $VIDEO_PLAYER $1   ;;
      *.ogg)     $VIDEO_PLAYER $1   ;;
      *.midi)    $VIDEO_PLAYER $1   ;;

      # Others
      *.od?)     $OFFICE_SUITE $1 & ;;
      *.doc)     $OFFICE_SUITE $1 & ;;
      *.doc*)    $OFFICE_SUITE $1 & ;;
      *.xls*)    $OFFICE_SUITE $1 & ;;
      *.ppt*)    $OFFICE_SUITE $1 & ;;
      *.xps)     $PDF_READER $1 &   ;;
      *.epub)    $PDF_READER $1 &   ;;
      *.pdf)     $PDF_READER $1 &   ;;
      *.html)    $BROWSER $1        ;;
      *.xcf)     gimp $1 &          ;;
    esac
  else
    echo "There's no set program to open \"$1\""
  fi
}
