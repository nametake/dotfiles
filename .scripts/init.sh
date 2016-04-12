#!/bin/bash

# zplug
if [ -e ${HOME}/.zplug ]; then
  echo "zplug is already installed."
else
  curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
fi

if [ -e ${HOME}/.tmux/plugins/tpm ]; then
  echo "tpm(tmux plugin manager) is already installed."
else
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
