"--------------------
" tern-for-vim
"--------------------
autocmd MyAutoCmd FileType javascript setlocal omnifunc=tern#Complete
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'


autocmd MyAutoCmd FileType coffee setlocal omnifunc=tern#Complete
let g:neocomplete#sources#omni#input_patterns.coffee = '[^. \t]\.\%(\h\w*\)\?'
