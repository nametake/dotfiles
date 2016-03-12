#!/bin/sh

function error()
{
   echo "ERROR: $@" 1>&2
}

function abort()
{
   echo "ABORT: $@" 1>&2
   exit 1
}

function exists_command()
{
  test $# -eq 1 || abort "exists_command argument isn't 1."

  if type $1 > /dev/null 2>&1;then
    echo 0
  else
    echo 1
  fi
}

# zplug
if ! [ -e ${HOME}/.zplug ]; then
  echo "zplug is already installed."
else
  curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
fi

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

# npm tools
if [ `exists_command npm` -eq 0 ]; then
  npm install -g grunt-init
  git clone https://github.com/gruntjs/grunt-init-jquery.git\
    ~/.grunt-init/jquery
  git clone https://github.com/nosami/grunt-init-csharpsolution.git\
    ~/.grunt-init/csharpsolution
else
  echo "npm not found."
fi

# golang
if [ `exists_command go` -eq 0 ]; then
  go get github.com/nsf/gocode
  go get github.com/peco/peco/cmd/peco
else
  echo "go not found."
fi
