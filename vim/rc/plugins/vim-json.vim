"--------------------
" vim-json
"--------------------
let s:bundle = neobundle#get("vim-json")

function! s:bundle.hooks.on_source(bundle)
  let g:vim_json_syntax_conceal = 0
endfunction
