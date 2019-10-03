set -g __fish_git_prompt_char_stagedstate "@"
set -g __fish_git_prompt_char_dirtystate "+"
set -g __fish_git_prompt_char_untrackedfiles "_"
set -g __fish_git_prompt_char_conflictedstate "*"
set -g __fish_git_prompt_char_cleanstate "#"

set -U GHQ_SELECTOR peco

alias g='git'

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
