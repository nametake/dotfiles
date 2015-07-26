#!/bin/sh

# zsh antigen
git clone https://github.com/zsh-users/antigen.git $HOME/.antigen

# pyenv
git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv

# grunt
npm install -g grunt-init
git clone https://github.com/gruntjs/grunt-init-jquery.git ~/.grunt-init/jquery
git clone https://github.com/nosami/grunt-init-csharpsolution.git ~/.grunt-init/csharpsolution

# Golang
go get github.com/nsf/gocode
