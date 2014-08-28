
case ${OSTYPE} in
  darwin*)
    # Mac
    export PATH=/bin:/usr/local/bin:/usr/bin:/opt/local/bin:/opt/local/sbin:
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

