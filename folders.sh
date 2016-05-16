#!/usr/bin/env bash

export USERNAME WINDOWS_DIR DATA_DIR
USERNAME="belveryin"
WINDOWS_DIR="/media/windows"
DATA_DIR="/media/data"

# create windows folder in media
if [ ! -d "$WINDOWS_DIR" ]
then
    sudo mkdir "$WINDOWS_DIR"
    sudo chown "$USERNAME:$USERNAME" "$WINDOWS_DIR"
fi

# create data folder in media
if [ ! -d "$DATA_DIR" ]
then
    sudo mkdir "$DATA_DIR"
    sudo chown "$USERNAME:$USERNAME" "$DATA_DIR"
fi

# add windows drive in fstab and mount it
if [ ! grep --quiet "UUID=9A240B8B240B6A19 $WINDOWS_DIR ntfs-3g defaults,windows_names,locale=en_US.utf8 0 0" /etc/fstab ]
then
    sudo su -c "echo '# windows' >> /etc/fstab"
    sudo su -c "echo 'UUID=9A240B8B240B6A19 $WINDOWS_DIR ntfs-3g defaults,windows_names,locale=en_US.utf8 0 0' >> /etc/fstab"
    sudo mount -a
fi

# add windows drive in fstab and mount it
if [ ! grep --quiet "UUID=9E04ADA204AD7E41 $DATA_DIR ntfs-3g defaults,windows_names,locale=en_US.utf8 0 0" /etc/fstab ]
then
    sudo su -c "echo '# data' >> /etc/fstab"
    sudo su -c "echo 'UUID=9E04ADA204AD7E41 $DATA_DIR ntfs-3g defaults,windows_names,locale=en_US.utf8 0 0' >> /etc/fstab"
    sudo mount -a
fi

# create symlinks if they don't exists already
if [ ! -L ~/Downloads ]
then
    rm -rf ~/Downloads
    ln -sfv "$DATA_DIR/Downloads" ~
fi

if [ ! -L ~/Documents ]
then
    rm -rf ~/Documents
    ln -sfv "$DATA_DIR/Documents" ~
fi

if [ ! -L ~/Pictures ]
then
    rm -rf ~/Pictures
    ln -sfv "$DATA_DIR/Pictures" ~
fi

if [ ! -L ~/Videos ]
then
    rm -rf ~/Videos
    ln -sfv "$DATA_DIR/Videos" ~
fi
