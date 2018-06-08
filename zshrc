# complete
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' ignore-parents parent pwd ..

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

autoload -Uz select-word-style
select-word-style default

zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' menu select=1

# zplug

# prompt
PROMPT="%B%F{green}[${USER}@${HOST}]%f:%F{blue}%2~%f%b%(!.#.%%) "
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"

if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
  PROMPT="%B%F{magenta}[${USER}@${HOST}]%f:%F{blue}%2~%f%b%(!.#.%%) "
fi

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# alias
case "${OSTYPE}" in
  darwin*)
    alias ls='ls -G'
    ;;
  linux*)
    alias ls='ls --color=auto'
    ;;
esac

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias lal='ls -al'

#alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias sudo='sudo '

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'

alias tmux='tmux -2'

alias g='git'

if [ -d /Applications/MacVim.app ]; then
  alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  alias gvim='/Applications/MacVim.app/Contents/MacOS/mvim'
  alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim'
fi

setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt interactive_comments

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

setopt magic_equal_subst

setopt share_history
setopt hist_ignore_all_dups

setopt hist_save_nodups
setopt hist_ignore_space
setopt hist_reduce_blanks

setopt auto_menu

setopt extended_glob

setopt nonomatch

[ -d $HOME/.zplug ] && source $HOME/.zshrc.zplug
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
