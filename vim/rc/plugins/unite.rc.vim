" Unite.vim
"
let g:unite_enable_start_insert = 1

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
let g:unite_source_grep_recursive_opt = '-R'

" Key map {{{
"
nnoremap <silent> ,g  :<C-u>Unite vimgrep:** -buffer-name=grep<CR>
nnoremap <silent> ,cg :<C-u>Unite vimgrep:** -buffer-name=grep<CR><C-R><C-W>

"}}}
