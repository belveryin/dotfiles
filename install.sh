#!/usr/bin/env bash

# install vim and meld
sudo apt-get install vim vim-gnome meld

# install other applications
sudo apt-get install audacious

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Add symlinks
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/.gitignore" ~
ln -sfv "$DOTFILES_DIR/.gitconfig" ~

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Vundle plugins
vim +PluginInstall +qall

# Install ack
sudo cpan App:Ack

# Install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
source ~/.bashrc
# Set stable as the default node version
nvm install stable
nvm alias default stable
# Update npm
npm install npm -g
# Install jshint globally
npm install -g jshint

# install bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
# add line if it doesn't already exist
grep -q -F 'source ~/.bash-git-prompt/gitprompt.sh' ~/.bashrc || echo 'source ~/.bash-git-prompt/gitprompt.sh' >> ~/.bashrc

# Install git-prompt.sh to see the git branch on the prompt url: http://git-prompt.sh/
# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
