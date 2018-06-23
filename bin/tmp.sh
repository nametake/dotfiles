#!/bin/bash

if [ -e ${HOME}/.tmux/plugins/tpm ]; then
  echo "tpm(tmux plugin manager) is already installed."
else
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
