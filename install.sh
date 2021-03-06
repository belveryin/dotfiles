#!/usr/bin/env bash

# install vim meld byobu
sudo apt install -y vim vim-gnome meld byobu

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Add symlinks
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/.psqlrc" ~
ln -sfv "$DOTFILES_DIR/.gitignore" ~
ln -sfv "$DOTFILES_DIR/.gitconfig" ~

mkdir -p ~/.vim/dein/repos/github.com/Shougo/
git clone https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim
vim +"call dein#install()"

# Install airline glyphs
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir ~/.fonts/
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Install ack
echo 'yes' | sudo cpan App:Ack

# Install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
source ~/.bashrc
# Set stable as the default node version
nvm install stable
nvm alias default stable
# Update npm
npm install npm -g
# Install jshint globally
npm install -g jshint

# install bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
# add line if it doesn't already exist
grep -q -F 'source ~/.bash-git-prompt/gitprompt.sh' ~/.bashrc || echo 'source ~/.bash-git-prompt/gitprompt.sh' >> ~/.bashrc

# Getting rid of swap/backup/undo files in the current directory.
# Create folders in the home dir:
if [ ! -d "$HOME/.vim-backup" ]
then
    mkdir ~/.vim-backup
fi

if [ ! -d "$HOME/.vim-undo" ]
then
    mkdir ~/.vim-undo
fi

if [ ! -d "$HOME/.vim-swap" ]
then
    mkdir ~/.vim-swap
fi

#source "$DOTFILES_DIR/apps.sh"
#source "$DOTFILES_DIR/folders.sh"

source ~/.bashrc
