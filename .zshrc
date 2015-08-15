########################################
# Color autoload -U colors; colors
########################################
#
# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# コマンドが存在するかどうかを判定
whichs() { whence -p ${1+"$1"} >/dev/null; }

########################################
# PROMPT
PROMPT="%B%F{green}[${USER}@${HOST}]%f:%F{blue}%2~%f%b%(!.#.%%) "
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"

if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
  PROMPT="%B%F{magenta}[${USER}@${HOST}]%f:%F{blue}%2~%f%b%(!.#.%%) "
fi

# vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"


########################################
# Complete
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default

# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# ls コマンドの色
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 選択補完
zstyle ':completion:*:default' menu select=1

# 補完の設定
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

########################################
# alias

# OS毎の設定
case "${OSTYPE}" in
  darwin*)
    # mac
    alias ls='ls -G'
    alias brew-cask-upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'
    if [ -e /Applications/MacVim.app ]; then
      alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
      alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    fi
    ;;
  linux*)
    # linux
    alias ls='ls --color=auto'
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    ;;
esac


# ls
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias lal='ls -al'

#alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'


alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


alias tmux='tmux -2'

########################################
# key bind 
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# ctrl-x, ctrl-pでクリップボードにコピー
pbcopy-buffer(){ 
  print -rn $BUFFER | pbcopy
  zle -M "pbcopy: ${BUFFER}" 
}
zle -N pbcopy-buffer
bindkey '^x^p' pbcopy-buffer

########################################
# Option
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# = の後はパス名として補完する
setopt magic_equal_subst

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# コマンドが見つからない時のエラー表示をしない
setopt nonomatch

########################################
# each OS
case ${OSTYPE} in
  darwin*)
    #Mac用の設定
    export CLICOLOR=1
    ;;
  linux*)
    #Linux用の設定
    ;;
esac

# vim:set ft=zsh:
autoload -U compinit
compinit

########################################
# tmux
if [ -x "`whence tmux`" ]; then
  # session restart
  if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux -2 attach || tmux -2 new-session)
  fi
fi

########################################
# peco
function peco-select-history()
{
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

########################################
# antigen
if [ -e $HOME/.antigen ]; then
  source $HOME/.zshrc.antigen
fi

########################################
# local
if [ -e $HOME/.zshrc.local ]; then
  source $HOME/.zshrc.local
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
