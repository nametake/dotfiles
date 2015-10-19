####################
# zshenv
####################

function _osx_only() {
  if [ -e ${HOME}/.go ]; then
    # golang
    export GOPATH=$HOME/.go
    export GOROOT=/usr/local/opt/go/libexec
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  fi
}

function _linux_only() {
  if [ -x `which go` ]; then
    # golang
    export GOPATH=$HOME/.go
    export GOROOT=/usr/lib/go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  fi
}

case ${OSTYPE} in
  darwin*)
    # Mac
    #export PATH=/bin:/usr/local/bin:/usr/bin:/opt/local/bin:/opt/local/sbin:$PATH
    export PATH=/opt/local/sbin:/opt/local/bin:/opt/sbin:/opt/bin:/usr/local/opt:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    export PATH=$HOME/.local/bin:$PATH
    _osx_only
    ;;
  linux*)
    #Linux
    _linux_only
    ;;
esac

# Langage
export LANG=ja_JP.UTF-8

# Color
# Mac
export LSCOLORS=exfxcxdxbxegedabagacad
# Linux
export LS_COLORS='di=01;34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# python
#export WORKON_HOME=~/.virtualenvs
#. /usr/local/bin/virtualenvwrapper.sh
if [ -e ${HOME}/.pyenv ]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
fi

# Latex
if [ -d /usr/texbin ]; then
  export PATH=/usr/texbin:$PATH
fi

if [ -d /usr/local/lib/activator-1.2.2 ]; then
  export PATH=/usr/local/lib/activator-1.2.2:$PATH
fi

