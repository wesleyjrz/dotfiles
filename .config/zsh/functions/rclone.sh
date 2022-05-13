#!/bin/sh

######################
### Cloud Storages ###
######################

DROPBOX="$HOME/Cloud/dropbox"
GDRIVE="$HOME/Cloud/gdrive"
ONEDRIVE="$HOME/Cloud/onedrive"
PHOTOS="$HOME/Cloud/photos"

rmount () {
  # Create directories if they don't exist
  if [ ! -d "$DROPBOX" ] ; then
    mkdir --parents $DROPBOX
  fi
  if [ ! -d "$GDRIVE" ] ; then
    mkdir --parents $GDRIVE
  fi
  if [ ! -d "$ONEDRIVE" ] ; then
    mkdir --parents $ONEDRIVE
  fi
  if [ ! -d "$PHOTOS" ] ; then
    mkdir --parents $PHOTOS
  fi

  # Mount rclone partitions if they aren't mounted yet
  if [ -z "$(\ls -A $DROPBOX)" ] ; then
    rclone mount --daemon dropbox:/ $DROPBOX ; echo "Dropbox succesfully mounted."
  else
    echo "Dropbox is already mounted."
  fi
  if [ -z "$(\ls -A $GDRIVE)" ] ; then
    rclone mount --daemon gdrive:/ $GDRIVE ; echo "Google Drive succesfully mounted."
  else
    echo "Google Drive is already mounted."
  fi
  if [ -z "$(\ls -A $ONEDRIVE)" ] ; then
    rclone mount --daemon onedrive:/ $ONEDRIVE ; echo "OneDrive succesfully mounted."
  else
    echo "OneDrive is already mounted."
  fi
  if [ -z "$(\ls -A $PHOTOS)" ] ; then
    rclone mount --daemon photos:/ $PHOTOS ; echo "Google Photos succesfully mounted."
  else
    echo "Google Photos is already mounted."
  fi
}

rumount () {
  # Umount rclone partitions
  if [ ! -z "$(\ls -A $DROPBOX)" ] ; then
    umount --quiet $DROPBOX ; echo "Dropbox succesfully umounted."
  else
    echo "Dropbox isn't mounted."
  fi
  if [ ! -z "$(\ls -A $GDRIVE)" ] ; then
    umount --quiet $GDRIVE ; echo "Google Drive succesfully umounted."
  else
    echo "Google Drive isn't mounted."
  fi
  if [ ! -z "$(\ls -A $ONEDRIVE)" ] ; then
    umount --quiet $ONEDRIVE ; echo "OneDrive succesfully umounted."
  else
    echo "OneDrive isn't mounted."
  fi
  if [ ! -z "$(\ls -A $PHOTOS)" ] ; then
    umount --quiet $PHOTOS ; echo "Google Photos succesfully umounted."
  else
    echo "Google Photos isn't mounted."
  fi

  # Remove directories
  if [ -d "$DROPBOX" ] ; then
    rmdir $DROPBOX
  fi
  if [ -d "$GDRIVE" ] ; then
    rmdir $GDRIVE
  fi
  if [ -d "$ONEDRIVE" ] ; then
    rmdir $ONEDRIVE
  fi
  if [ -d "$PHOTOS" ] ; then
    rmdir $PHOTOS
  fi
  if [ -d "$HOME/Cloud" ] ; then
    rmdir $HOME/Cloud
  fi
}

############
### FTP  ###
############

ANDROID="$HOME/FTP/android"

ftpmount () {
  # Create directories if they don't exist
  if [ ! -d "$ANDROID" ] ; then
    mkdir --parents $ANDROID
  fi

  # Mount rclone ftp partitions if they aren't mounted yet
  if [ -z "$(\ls -A $ANDROID)" ] ; then
    rclone mount --daemon android:/ $ANDROID ; echo "Android succesfully mounted."
  else
    echo "Android is already mounted."
  fi
}

ftpumount () {
  # Umount rclone ftp partitions
  if [ ! -z "$(\ls -A $ANDROID)" ] ; then
    umount --quiet $ANDROID ; echo "Android succesfully umounted."
  else
    echo "Android isn't mounted."
  fi

  # Remove directories
  if [ -d "$ANDROID" ] ; then
    rmdir $ANDROID
  fi
  if [ -d "$HOME/FTP" ] ; then
    rmdir $HOME/FTP
  fi
}
