#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Add symlinks
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall