#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo chsh -s /bin/zsh $(whoami)
sudo apt-get update && sudo apt-get -y upgrade tmux

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim
ln -s $(pwd)/emacs $HOME/.emacs
ln -s $(pwd)/screenrc $HOME/.screenrc

vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"

alias tmux-dev="tmux new-session \; \
  split-window -v \; \
  split-window -h \; "
