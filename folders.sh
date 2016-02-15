#!/usr/bin/env bash

# create windows folder in media
if [ ! -d /media/windows ]; then
    sudo mkdir /media/windows
    sudo chown belveryin:belveryin /media/windows
fi
# create data folder in media
if [ ! -d /media/data ]; then
    sudo mkdir /media/data
    sudo chown belveryin:belveryin /media/data
fi

# add windows drive in fstab and mount it
if ! grep --quiet 'UUID=9A240B8B240B6A19 /media/windows ntfs-3g defaults,windows_names,locale=en_US.utf8 0 0' /etc/fstab; then
    sudo su -c "echo '# windows' >> /etc/fstab"
    sudo su -c "echo 'UUID=9A240B8B240B6A19 /media/windows ntfs-3g defaults,windows_names,locale=en_US.utf8 0 0' >> /etc/fstab"
    sudo mount -a
fi

# add windows drive in fstab and mount it
if ! grep --quiet 'UUID=9E04ADA204AD7E41 /media/data ntfs-3g defaults,windows_names,locale=en_US.utf8 0 0' /etc/fstab; then
    sudo su -c "echo '# data' >> /etc/fstab"
    sudo su -c "echo 'UUID=9E04ADA204AD7E41 /media/data ntfs-3g defaults,windows_names,locale=en_US.utf8 0 0' >> /etc/fstab"
    sudo mount -a
fi

# create symlinks if they don't exists already
if [ ! -L ~/Downloads ]; then
    rm -rf ~/Downloads
    ln -sfv /media/windows/Users/belveryin/Downloads ~
fi
if [ ! -L ~/Documents ]; then
    rm -rf ~/Documents
    ln -sfv /media/windows/Users/belveryin/Documents ~
fi
if [ ! -L ~/Pictures ]; then
    rm -rf ~/Pictures
    ln -sfv /media/windows/Users/belveryin/Pictures ~
fi
if [ ! -L ~/Videos ]; then
    rm -rf ~/Videos
    ln -sfv /media/windows/Users/belveryin/Videos ~
fi
