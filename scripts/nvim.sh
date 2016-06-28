#!/bin/sh

vim="${HOME}/.vim"
vimrc="${HOME}/.vimrc"


if [ -f ${vim} -o -L ${vim} ]; then
  ln -s ${vim} ${XDG_CONFIG_HOME}/nvim
  echo "Create .vim link."
else
  echo "Not .vim dir"
fi

if [ -f ${vimrc} -o -L ${vimrc} ]; then
  ln -s ${vimrc} ${XDG_CONFIG_HOME}/nvim/init.vim
  echo "Create .vimrc link."
else
  echo "Not .vimrc file"
fi


