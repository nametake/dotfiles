"--------------------
" vim-go
"--------------------
let s:hooks = neobundle#get_hooks("vim-go")

function! s:hooks.on_source(bundle)
  let g:go_highlight_functions = 0
  let g:go_highlight_methods = 0
  let g:go_highlight_structs = 0
  let g:go_highlight_interfaces = 0
  let g:go_highlight_operators = 0
  let g:go_highlight_build_constraints = 0

  let g:go_fmt_fail_silently = 0
  let g:go_fmt_autosave = 1
  let g:go_term_mode = "split"
endfunction

