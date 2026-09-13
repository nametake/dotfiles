# local bin
[ -e ${HOME}/.local/bin ] && \
  export PATH=${HOME}/.local/bin:${PATH}

# programming languages
export GOPATH=${HOME}/go
export TEXBIN_PATH=/usr/texbin

[ -e ${GOPATH} ] && \
  export PATH=${GOPATH}/bin:${PATH}

[ -e ${TEXBIN_PATH} ] && \
  export PATH=${TEXBIN_PATH}:$PATH

# env tools
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

export PATH="$HOME/.cargo/bin:$PATH"
