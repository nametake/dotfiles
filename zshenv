export LANG=ja_JP.UTF-8
export TERM=xterm-256color

export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS='di=01;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=30;42:ow=30;43:st=01;36:'
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

export EDITOR=vim
bindkey -e

export PATH=/usr/local/bin:${PATH}
export XDG_CONFIG_HOME=~/.config

# local bin
[ -e ${HOME}/.local/bin ] && \
  export PATH=${HOME}/.local/bin:${PATH}

# programming languages
export GOPATH=${HOME}/go
export GO111MODULE=auto
export TEXBIN_PATH=/usr/texbin

[ -e ${GOPATH} ] && \
  export PATH=${GOPATH}/bin:${PATH}

[ -e ${TEXBIN_PATH} ] && \
  export PATH=${TEXBIN_PATH}:$PATH

# env tools
export ANYENV=${HOME}/.anyenv
[ -e ${ANYENV} ] && \
  export PATH=${ANYENV}/bin:${PATH} && \
  eval "$(anyenv init - zsh)"

export PYENV_ROOT=${HOME}/.pyenv
export RBENV_ROOT=${HOME}/.rbenv
export NODEBREW_ROOT=${HOME}/.nodebrew

[ -e ${PYENV_ROOT} ] && \
  export PATH=${PYENV_ROOT}/bin:$PATH && \
  eval "$(pyenv init -)"

[ -e ${RBENV_ROOT} ] && \
  export PATH=${RBENV_ROOT}/bin:$PATH

[ -e ${NODEBREW_ROOT} ] && \
  export PATH=${NODEBREW_ROOT}/current/bin:$PATH

# Kube
[ -e ${HOME}/.kube ] && \
  export KUBECONFIG="$KUBECONFIG:`ls ${HOME}/.kube/*.yml | tr '\n' ':'`"

# GCP
export GOOGLE_CLOUD_SDK=${HOME}/.local/share/google-cloud-sdk
export GOAPP=${GOOGLE_CLOUD_SDK}/platform/google_appengine

[ -e ${GOOGLE_CLOUD_SDK} ] && \
  export PATH=${GOOGLE_CLOUD_SDK}/bin:$PATH

[ -e ${GOAPP} ] && \
  export PATH=${GOAPP}:$PATH
