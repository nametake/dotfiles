set -g __fish_git_prompt_showuntrackedfiles true

# set -g __fish_git_prompt_char_cleanstate "#"
# set -g __fish_git_prompt_char_invalidstate '*'
# set -g __fish_git_prompt_char_stagedstate "@"
# set -g __fish_git_prompt_char_dirtystate "+"
# set -g __fish_git_prompt_char_untrackedfiles "_"
# set -g __fish_git_prompt_char_conflictedstate "*"

set -g __fish_git_prompt_char_cleanstate ''
set -g __fish_git_prompt_char_dirtystate '*'
set -g __fish_git_prompt_char_invalidstate '#'
set -g __fish_git_prompt_char_stagedstate '+'
set -g __fish_git_prompt_char_stashstate '$'
set -g __fish_git_prompt_char_untrackedfiles '%'
set -g __fish_git_prompt_char_upstream_ahead '>'
set -g __fish_git_prompt_char_upstream_behind '<'
set -g __fish_git_prompt_char_upstream_diverged '<>'
set -g __fish_git_prompt_char_upstream_equal '='

set -U GHQ_SELECTOR peco

alias g='git'
alias rg='rg --hidden'
alias ag='ag --hidden'

if type -q hub
  alias git=hub
end

if test -e /Applications/MacVim.app
  alias gvim='/Applications/MacVim.app/Contents/bin/gvim'
end

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# set -g __done_tmux_pane_format '\[Pane #{window_index}]'

if test -f $HOME/.local.fish
  source $HOME/.local.fish
end

# ~/.config/fish/conf.d/git_worktree_completions.fish
complete -c git -n '__fish_seen_subcommand_from wa' -a '(git for-each-ref --format="%(refname:short)" refs/heads/)'
complete -c git -n '__fish_seen_subcommand_from wr' -a '(git worktree list --porcelain | grep "^worktree " | awk \'{print $2}\' | sed "s|.*/||")'
