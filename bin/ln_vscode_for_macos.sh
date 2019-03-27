#!/bin/bash

if [ ! -e ${HOME}/.config/Code/User ]; then
  echo "VSCode config is not found."
  exit 1
fi
echo foo
