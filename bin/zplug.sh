#!/bin/bash

if [ -e ${HOME}/.zplug ]; then
  echo "zplug is already installed."
else
  curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
fi
