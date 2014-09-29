"--------------------
" jedi-vim
"--------------------
let s:hooks = neobundle#get_hooks("jedi-vim")

autocmd MyAutoCmd FileType python setlocal omnifunc=jedi#completions

autocmd FileType python setlocal completeopt-=preview 

function! s:hooks.on_source(bundle)
    let g:jedi#auto_initialization = 0

    let g:jedi#auto_vim_configuration = 0
    " The reason to deactivate jedi#auto_vim_configuration

    " 最初の項目を選択しない
    let g:jedi#popup_on_dot = 0
    let g:jedi#popup_select_first = 0

    let g:jedi#show_call_signatures = 0

    let g:jedi#use_splits_not_buffers = "left"

    if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
    endif

    let g:jedi#completions_enabled = 0
    "let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

    let g:jedi#show_function_definition = 0
endfunction
