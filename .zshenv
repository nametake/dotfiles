
case ${OSTYPE} in
  darwin*)
    # Mac
    #export PATH=/bin:/usr/local/bin:/usr/bin:/opt/local/bin:/opt/local/sbin:$PATH
    export PATH=/opt/local/sbin:/opt/local/bin:/opt/sbin:/opt/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    ;;
  linux*)
    #Linux
    ;;
esac

# Langage
export LANG=ja_JP.UTF-8

# Color
# Mac
export LSCOLORS=exfxcxdxbxegedabagacad
# Linux
export LS_COLORS='di=00;34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# python
#export WORKON_HOME=~/.virtualenvs
#. /usr/local/bin/virtualenvwrapper.sh

export PYENV_ROOT="${HOME}/.pyenv"
if [ -n ${PYENV_ROOT} ]; then
  path=(${PYENV_ROOT}/bin ${PYENV_ROOT}/shims ${path})
fi
eval "$(pyenv init -)"

# Latex
if [ -d /usr/texbin ]; then
  export PATH=/usr/texbin:$PATH
fi
