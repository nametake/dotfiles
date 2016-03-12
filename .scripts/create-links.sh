#!/bin/bash

if [ -e ${HOME}/dotfiles ]; then
  ln -s ${HOME}/dotfiles/.zshenv ${HOME}/.zshenv
  ln -s ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
  ln -s ${HOME}/dotfiles/.zshrc.zplug ${HOME}/.zshrc.zplug
  ln -s ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc
  ln -s ${HOME}/dotfiles/.vim ${HOME}/.vim
else
  echo "Not found ${HOME}/dotfiles"
fi
