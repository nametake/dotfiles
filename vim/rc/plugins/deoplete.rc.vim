"---------------------------------------------------------------------------
" deoplete.nvim
"

"	" Use smartcase.
let g:deoplete#enable_smart_case = 1

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction


" Input pattern {{{
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif
if !exists('g:deoplete#omni#functions')
  let g:deoplete#omni#functions = {}
endif

let g:deoplete#omni#input_patterns.python =
      \ '[^. *\t]\.\w*\|\h\w*'

let g:deoplete#omni_patterns.go =
      \ '[^.[:digit:] *\t]\.\w*'

let g:deoplete#omni#input_patterns.php =
      \'\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

let g:deoplete#omni#input_patterns.lua =
      \ '\w\+[.:]\|require\s*(\?["'']\w*'
" }}}
