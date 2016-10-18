####################
# zshenv
####################

function _osx_only() {
  if [ -e ${HOME}/go ]; then
    # golang
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
  fi
}

function _linux_only() {
  if [ -x "`which go`" ]; then
    # golang
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
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
export LSCOLORS=Gxfxcxdxbxegedabagacad
# Linux
export LS_COLORS='di=01;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=30;42:ow=30;43:st=01;36:'

export TERM=xterm-256color
export XDG_CONFIG_HOME=~/.config

# python
#export WORKON_HOME=~/.virtualenvs
#. /usr/local/bin/virtualenvwrapper.sh
if [ -e ${HOME}/.pyenv ]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
fi

# ruby
if [ -e ${HOME}/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"
fi

# Latex
if [ -d /usr/texbin ]; then
  export PATH=/usr/texbin:$PATH
fi

# Play2
if [ -d /usr/local/lib/activator-1.2.2 ]; then
  export PATH=/usr/local/lib/activator-1.2.2:$PATH
fi

# ruby version manager
if [ -d ${HOME}/.rvm/bin ]; then
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi

# nodebrew
if [ -d ${HOME}/.nodebrew/current/bin ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

