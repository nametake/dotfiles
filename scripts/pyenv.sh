#!/bin/sh

# pyenv
if [ -e ${HOME}/.pyenv ]; then
  echo "pyenv is already installed."
else
  git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
  git clone https://github.com/yyuu/pyenv-virtualenv.git\
    $HOME/.pyenv/plugins/pyenv-virtualenv
  git clone git://github.com/yyuu/pyenv-update.git\
    ~/.pyenv/plugins/pyenv-update
  git clone https://github.com/yyuu/pyenv-pip-rehash.git\
    ~/.pyenv/plugins/pyenv-pip-rehash
fi