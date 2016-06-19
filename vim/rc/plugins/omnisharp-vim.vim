"--------------------
" jedi-vim
"--------------------
let s:hooks = neobundle#get_hooks("omnisharp-vim")

function! s:hooks.on_source(bundle)
  set completeopt=longest,menuone
endfunction
