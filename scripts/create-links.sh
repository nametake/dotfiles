#!/bin/bash

dotfiles_root=$(cd $(dirname $0)/.. && pwd)
dotfiles=(
          "zshenv"
          "zshrc"
          "zshrc.zplug"
          "vimrc"
          "vim"
          "tmux.conf"
          "gitconfig"
          )

# Arg parse
while getopts ld OPT
do
  case "$OPT" in
    "l")
      FLG_LINK="TRUE"
      ;;
    "d")
      FLG_DELETE="TRUE"
      ;;
  esac
done


if [ "$FLG_LINK" = "TRUE" ]; then
  echo 'Create Link'
  for file in ${dotfiles[@]}; do
    ln -si ${dotfiles_root}/${file} ${HOME}/.${file}
  done
fi


if [ "$FLG_DELETE" = "TRUE" ]; then
  echo 'Delete Link'
  for file in ${dotfiles[@]}; do
    rm -i ${HOME}/.${file}
  done
fi

echo "DONE"
