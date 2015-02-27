"--------------------
" syntastic
"--------------------
let s:bundle = neobundle#get("syntastic")

function! s:bundle.hooks.on_source(bundle)
  let g:syntastic_enable_signs=1
  let g:syntastic_auto_loc_list=2

  let g:syntastic_mode_map = {
        \ 'mode': 'active',
        \ 'active_filetypes': ['javascript'],
        \ 'passive_filetypes': ['tex']
        \}
endfunction
