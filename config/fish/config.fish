set -g __fish_git_prompt_char_stagedstate "@"
set -g __fish_git_prompt_char_dirtystate "+"
set -g __fish_git_prompt_char_untrackedfiles "_"
set -g __fish_git_prompt_char_conflictedstate "*"
set -g __fish_git_prompt_char_cleanstate "#"

set -U GHQ_SELECTOR peco

if test -d /Applications/MacVim.app
  alias gvim="/Applications/MacVim.app/Contents/MacOS/gvim"
end
