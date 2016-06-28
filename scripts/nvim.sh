#!/bin/sh

vim="${HOME}/.vim"

if [ -f ${vim} -o -L ${vim} ]; then
  ln -s ${vim} ${XDG_CONFIG_HOME}/nvim
  echo "Create .vim link."
else
  echo "Not .vim dir"
fi


