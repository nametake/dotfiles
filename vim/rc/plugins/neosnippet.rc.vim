" neosnippet

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_complete_done = 1
let g:neosnippet#expand_word_boundary = 1

let g:neosnippet#snippets_directory = '~/.vim/snippets'

" Key map {{{

" Expand select word
imap <expr><C-k> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-k>"
smap <expr><C-k> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-k>"
xmap <expr><C-k> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand)" : "\<C-k>"
smap <expr><BS> "\<ESC>i"

inoremap <expr><CR>  pumvisible() ?
      \ neocomplete#close_popup() : "\<CR>"

imap <expr><TAB> pumvisible() ?
      \"\<C-n>"
      \: neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
      \: "\<TAB>"
smap <expr><TAB> neosnippet#jumpable()?
      \"\<Plug>(neosnippet_expand)"
      \: "\<TAB>"
" }}}
