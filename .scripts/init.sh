#!/bin/sh

# zsh antigen
if ! [ -e ${HOME}/.antigen ]; then
  echo "angigen is already installed."
else
  git clone https://github.com/zsh-users/antigen.git $HOME/.antigen
  antigen bundle
fi

# pyenv
if [ -e ${HOME}/.pyenv ]; then
  echo "pyenv is already installed."
else
  git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
  git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
  git clone git://github.com/yyuu/pyenv-update.git ~/.pyenv/plugins/pyenv-update
  git clone https://github.com/yyuu/pyenv-pip-rehash.git ~/.pyenv/plugins/pyenv-pip-rehash
fi

if [ -x `which npm` ]; then
  # grunt
  npm install -g grunt-init
  git clone https://github.com/gruntjs/grunt-init-jquery.git ~/.grunt-init/jquery
  git clone https://github.com/nosami/grunt-init-csharpsolution.git ~/.grunt-init/csharpsolution
else
  echo "npm not found."
fi

# Golang
if [ -x `which go` ]; then
  go get github.com/nsf/gocode
  go get github.com/peco/peco/cmd/peco
else
  echo "go not found."
fi
