" neocomplete 

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#disable_auto_complete = 0

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
" Use fuzzy completion.
let g:neocomplete#enable_fuzzy_completion = 1

" Set auto completion length.
let g:neocomplete#auto_completion_start_length = 2
" Set manual completion length.
let g:neocomplete#manual_completion_start_length = 0
" Set minimum keyword length.
let g:neocomplete#min_keyword_length = 3

let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_cursor_hold_i = 0

" Key map {{{
"
call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)',
      \                        '<BS>',
      \                        '<BS>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)',
      \                        '<BS>',
      \                        '<C-h>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
      \                        '<Enter>',
      \                        '<Enter>')

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><BS> neocomplete#smart_close_popup()
" inoremap <expr><C-h> neocomplete#smart_close_popup()
" ### smartinput ###
imap <expr><BS> neocomplete#smart_close_popup()."\<Plug>(smartinput_BS)"
imap <expr><C-h> neocomplete#smart_close_popup()
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><C-s>  neocomplete#start_manual_complete()

" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
" ### smartinput ###
imap <expr><CR> !pumvisible() ? "\<Plug>(smartinput_CR)" :
      \ neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
      \ neocomplete#close_popup()

"" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" }}}

" Input pattern {{{

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#enable_auto_close_preview = 1

let g:neocomplete#sources#omni#input_patterns.python =
      \ '[^. *\t]\.\w*\|\h\w*'

" let g:neocomplete#sources#omni#functions.go =
"       \ 'gocomplte#Complete'
"
" let g:neocomplete#sources#omni#input_patterns.go =
"       \ '[^.[:digit:] *\t]\.\w*'

let g:neocomplete#sources#omni#input_patterns.php =
      \'\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

let g:neocomplete#sources#omni#input_patterns.lua =
      \ '\w\+[.:]\|require\s*(\?["'']\w*'

" }}}
