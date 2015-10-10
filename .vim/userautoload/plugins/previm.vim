"--------------------
" previm
"--------------------
let s:hooks = neobundle#get_hooks("previm")

function! s:hooks.on_source(bundle)
  let g:previm_show_header = 0
endfunction
