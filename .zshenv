
case ${OSTYPE} in
  darwin*)
    # Mac
    #export PATH='/opt/local/bin/:/opt/local/sbin/:$PATH'
    export PATH=/bin:/usr/bin:/usr/local/bin:/opt/local/bin/:/opt/local/sbin/:${PATH}
    ;;
  linux*)
    #Linux
    ;;
esac

# Langage
export LANG=ja_JP.UTF-8

# Color
# Mac
export LSCOLORS=Gxfxcxdxbxegedabagacad
# Linux
export LS_COLORS='di=01;34:ln=35:so=32:pi=33:ex=32;01:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# python
#export WORKON_HOME=~/.virtualenvs
#. /usr/local/bin/virtualenvwrapper.sh

