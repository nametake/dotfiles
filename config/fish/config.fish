set -g __fish_git_prompt_char_stagedstate "@"
set -g __fish_git_prompt_char_dirtystate "+"
set -g __fish_git_prompt_char_untrackedfiles "_"
set -g __fish_git_prompt_char_conflictedstate "*"
set -g __fish_git_prompt_char_cleanstate "#"

set -U GHQ_SELECTOR peco

if test -e /Applications/MacVim.app
  alias gvim='/Applications/MacVim.app/Contents/bin/gvim'
end
