#!/usr/bin/env bash

# install other applications
sudo apt-get -y install audacious smplayer

# install chrome
if [! hash google-chrome]
then
    sudo apt-get -y install libxss1 libappindicator1 libindicator7
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb
    rm google-chrome-stable_current_amd64.deb
fi
