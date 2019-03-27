#!/bin/bash

vscode_dotfiles_dir=${HOME}/.config/Code/User

if [ ! -e ${vscode_dotfiles_dir} ]; then
  echo "VSCode config is not found."
  exit 1
fi

vscode_config_dir=${HOME}/Library/Application\ Support/Code/User
config_files=(settings.json keybindings.json)

for file in ${config_files[@]}; do
  ln -ins "${vscode_dotfiles_dir}/${file}" "${vscode_config_dir}/${file}"
done
