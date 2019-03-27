#!/bin/bash

dotfiles_root=$(cd $(dirname $0)/.. && pwd)

echo ${dotfiles_root}
for file in ${@}; do
  ln -ins ${dotfiles_root}/${file} ${HOME}/.${file}
done
