#!/usr/bin/env bash

# install other applications
sudo apt-get install audacious

# install chrome
if ! hash google-chrome; then
    sudo apt-get install libxss1 libappindicator1 libindicator7
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb
    rm google-chrome-stable_current_amd64.deb
fi

# smplayer
if ! hash smplayer; then
    sudo add-apt-repository ppa:rvm/smplayer
    sudo apt-get update
    sudo apt-get install smplayer smplayer-themes smplayer-skins
fi
