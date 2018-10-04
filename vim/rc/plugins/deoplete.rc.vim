"---------------------------------------------------------------------------
" deoplete.nvim
"
let g:deoplete#enable_at_startup = 1

"	" Use smartcase.
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_complete_start_length = 1

" Key map {{{
"
call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)',
      \                        '<BS>',
      \                        '<BS>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)',
      \                        '<C-h>',
      \                        '<C-h>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
      \                        '<Enter>',
      \                        '<Enter>')
"
" <C-h>, <BS>: close popup and delete backword char.
imap <expr><C-h> deoplete#smart_close_popup()
imap <expr><BS>  deoplete#smart_close_popup()."\<Plug>(smartinput_BS)"

" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
" }}}

" Complete sources {{{
let g:deoplete#sources = {}

let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.go = ['buffer', 'tag', 'around']
" }}}

" Input pattern {{{
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni_patterns = {}
let g:deoplete#omni#functions = {}

let g:deoplete#omni#input_patterns.python =
      \ '[^. *\t]\.\w*\|\h\w*'

let g:deoplete#omni_patterns.go =
      \ '[^.[:digit:] *\t]\.\w*'

let g:deoplete#omni#input_patterns.php =
      \ '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

let g:deoplete#omni#input_patterns.lua =
      \ '\w\+[.:]\|require\s*(\?["'']\w*'

let g:deoplete#skip_chars = ['(', ')']
" }}}
