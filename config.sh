#!/usr/bin/env bash

# install numix icons
sudo apt-add-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle

# set gnome shell config
gsettings set org.gnome.desktop.interface clock-show-date true &&
echo -e "Shell clock will show date.\n" ||
echo -e "[ERROR] Shell clock configuration failed.\n"

gsettings set org.gnome.desktop.input-sources show-all-sources false &&
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'es')]" &&
gsettings set org.gnome.desktop.input-sources xkb-options  "['grp:lalt_lshift_toggle']" &&
echo -e "US and ES set as input sources.\n" ||
echo -e "[ERROR] Input sources configuration failed.\n"

gsettings set system.locale region en_GB.UTF-8 &&
echo -e "Date format set to en_GB.\n" ||
echo -e "[ERROR] Date format configuration failed.\n"

gsettings set org.gnome.shell.overrides button-layout :minimize,maximize,close &&
gsettings set org.gnome.desktop.wm.preferences theme Numix &&
gsettings set org.gnome.desktop.interface gtk-theme Numix &&
gsettings set org.gnome.desktop.interface icon-theme Numix-Circle &&
gsettings set org.gnome.shell.extensions.user-theme name elegance-colors &&
echo -e "Interface themes configured.\n" ||
echo -e "[ERROR] Interface themes configuration failed.\n"

gsettings set org.gnome.nautilus.preferences sort-directories-first true &&
gsettings set org.gnome.nautilus.preferences default-folder-viewer list-view &&
echo -e "Nautilus will show directories first and set list-view as default.\n" ||
echo -e "[ERROR] Nautilus configuration failed.\n"

gsettings set org.gnome.settings-daemon.plugins.media-keys home "<Super>t" &&
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "<Primary><Shift>Up" &&
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "<Primary><Shift>Down" &&
echo -e "Media keys configured.\n" ||
echo -e "[ERROR] Media keys configuration failed.\n"

# gnome shell extensions
export GNOME_SHELL_VERSION
GNOME_SHELL_VERSION=$(gnome-shell --version | sed s/GNOME.Shell.//)

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# AlternateTab
$DOTFILES_DIR/shell-extension-install.sh $GNOME_SHELL_VERSION 15

# Applications Menu
$DOTFILES_DIR/shell-extension-install.sh $GNOME_SHELL_VERSION 6

# Dash to Dock
$DOTFILES_DIR/shell-extension-install.sh $GNOME_SHELL_VERSION 307

# Hide Top Bar
$DOTFILES_DIR/shell-extension-install.sh $GNOME_SHELL_VERSION 545

# No Topleft Corner
$DOTFILES_DIR/shell-extension-install.sh $GNOME_SHELL_VERSION 118

# Pixel Saver
$DOTFILES_DIR/shell-extension-install.sh $GNOME_SHELL_VERSION 723

# Removable Drive Menu
$DOTFILES_DIR/shell-extension-install.sh $GNOME_SHELL_VERSION 7

# TopIcon Plus
$DOTFILES_DIR/shell-extension-install.sh $GNOME_SHELL_VERSION 1031
