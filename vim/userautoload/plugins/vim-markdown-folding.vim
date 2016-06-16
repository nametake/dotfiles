"--------------------
" vim-markdown-folding
"--------------------
let s:hooks = neobundle#get_hooks("vim-markdown-folding")

function! s:hooks.on_source(bundle)
  let g:markdown_fold_style = 'nested'
endfunction
