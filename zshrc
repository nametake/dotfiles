function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
  if is_screen_or_tmux_running; then
    ! is_exists 'tmux' && return 1

    if is_tmux_runnning; then
      # echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
      # echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
      # echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
      # echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
      # echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
    elif is_screen_running; then
      echo "This is on screen."
    fi
  else
    if shell_has_started_interactively && ! is_ssh_running; then
      if ! is_exists 'tmux'; then
        echo 'Error: tmux command not found' 2>&1
        return 1
      fi

      if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
        # detached session exists
        tmux list-sessions
        echo -n "Tmux: attach? (y/N/num) "
        read
        if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
          tmux attach-session
          if [ $? -eq 0 ]; then
            echo "$(tmux -V) attached session"
            return 0
          fi
        elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
          tmux attach -t "$REPLY"
          if [ $? -eq 0 ]; then
            echo "$(tmux -V) attached session"
            return 0
          fi
        fi
      fi

      if is_osx && is_exists 'reattach-to-user-namespace'; then
        # on OS X force tmux's default command
        # to spawn a shell in the user's namespace
        tmux_config=$(cat $HOME/.tmux.conf)
        tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
      else
        tmux new-session && echo "tmux created new session"
      fi
    fi
  fi
}
tmux_automatically_attach_session


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
