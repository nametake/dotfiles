export LANG=ja_JP.UTF-8
export TERM=xterm-256color

export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS='di=01;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=30;42:ow=30;43:st=01;36:'
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

export EDITOR=vim
bindkey -e

export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export XDG_CONFIG_HOME=~/.config

# Homebrew bin
[ -e /opt/homebrew/bin ] && \
  export PATH=/opt/homebrew/bin:${PATH}

# local bin
[ -e ${HOME}/.local/bin ] && \
  export PATH=${HOME}/.local/bin:${PATH}

# GNUBIN
export GNUBIN_PATH=/opt/homebrew/opt/make/libexec/gnubin
[ -e ${GNUBIN_PATH} ] && \
  export PATH=${GNUBIN_PATH}:${PATH}

export COREUTILS=/opt/homebrew/opt/coreutils/libexec/gnubin
[ -e ${COREUTILS} ] && \
  export PATH=${COREUTILS}:${PATH}

export GNU_INDENT=/opt/homebrew/opt/gnu-indent/libexec/gnubin
[ -e ${GNU_INDENT} ] && \
  export PATH=${GNU_INDENT}:${PATH}

export GNU_TAR=/opt/homebrew/opt/gnu-tar/libexec/gnubin
[ -e ${GNU_TAR} ] && \
  export PATH=${GNU_TAR}:${PATH}

export GREP=/opt/homebrew/opt/grep/libexec/gnubin
[ -e ${GREP} ] && \
  export PATH=${GREP}:${PATH}

export GNU_SED=/opt/homebrew/opt/gnu-sed/libexec/gnubin
[ -e ${GNU_SED} ] && \
  export PATH=${GNU_SED}:${PATH}

export GAWK=/opt/homebrew/opt/gawk/libexec/gnubin
[ -e ${GAWK} ] && \
  export PATH=${GAWK}:${PATH}

export FINDUTILS=/opt/homebrew/opt/findutils/libexec/gnubin
[ -e ${FINDUTILS} ] && \
  export PATH=${FINDUTILS}:${PATH}

export GNU_WHICH=/opt/homebrew/opt/gnu-which/libexec/gnubin
[ -e ${GNU_WHICH} ] && \
  export PATH=${GNU_WHICH}:${PATH}

# programming languages
export GOPATH=${HOME}/go
export GO111MODULE=auto
export TEXBIN_PATH=/usr/texbin
export CARGO_PATH=${HOME}/.cargo

[ -e ${GOPATH} ] && \
  export PATH=${GOPATH}/bin:${PATH}

[ -e ${CARGO_PATH} ] && \
  export PATH=${CARGO_PATH}/bin:${PATH}

[ -e ${TEXBIN_PATH} ] && \
  export PATH=${TEXBIN_PATH}:$PATH

[ -e /usr/local/lib/node_modules ] && \
  export NODE_PATH=/usr/local/lib/node_modules

[ -e /opt/homebrew/lib/node_modules ] && \
  export NODE_PATH=/opt/homebrew/lib/node_modules

# env tools
export ASDF=${HOME}/.asdf
[ -e ${ASDF} ] && \
  export PATH="${ASDF}/shims:${PATH}"

# export ANYENV=${HOME}/.anyenv
# [ -e ${ANYENV} ] && \
#   export PATH=${ANYENV}/bin:${PATH} && \
#   eval "$(anyenv init - zsh)"
#
# export PYENV_ROOT=${HOME}/.pyenv
# export RBENV_ROOT=${HOME}/.rbenv
# export NODEBREW_ROOT=${HOME}/.nodebrew
#
# [ -e ${PYENV_ROOT} ] && \
#   export PATH=${PYENV_ROOT}/bin:$PATH && \
#   eval "$(pyenv init -)"
#
# [ -e ${RBENV_ROOT} ] && \
#   export PATH=${RBENV_ROOT}/bin:$PATH
#
# [ -e ${NODEBREW_ROOT} ] && \
#   export PATH=${NODEBREW_ROOT}/current/bin:$PATH

# ripgrep
[ -e ${HOME}/.ripgreprc ] && \
  export RIPGREP_CONFIG_PATH=${HOME}/.ripgreprc

# Kube
[ -e ${HOME}/.kube ] && \
  export KUBECONFIG="$KUBECONFIG:`ls ${HOME}/.kube/* | tr '\n' ':'`"

# Flutter
export FLUTTER_ROOT=${HOME}/.local/share/flutter
[ -e ${FLUTTER_ROOT} ] && \
  export PATH=${FLUTTER_ROOT}/bin:$PATH

# GCP
export GOOGLE_CLOUD_SDK=${HOME}/.local/share/google-cloud-sdk
export GOAPP=${GOOGLE_CLOUD_SDK}/platform/google_appengine

[ -e ${GOOGLE_CLOUD_SDK} ] && \
  export PATH=${GOOGLE_CLOUD_SDK}/bin:$PATH

[ -e ${GOAPP} ] && \
  export PATH=${GOAPP}:$PATH

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
