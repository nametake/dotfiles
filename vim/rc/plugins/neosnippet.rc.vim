" neosnippet

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_complete_done = 1
let g:neosnippet#expand_word_boundary = 1

let g:neosnippet#snippets_directory = '~/.vim/snippets'

" Key map {{{

" Expand select word
imap <expr><C-k> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-r>=<SID>my_c_k_function()<CR>"
smap <expr><C-k> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-r>=<SID>my_c_k_function()<CR>"
xmap <expr><C-k> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand)" : "\<C-r>=<SID>my_c_k_function()<CR>"

function! s:my_c_k_function()
  return pumvisible() ? neocomplete#close_popup() : "\<C-k>"
endfunction

inoremap <expr><CR>  pumvisible() ?
      \ neocomplete#close_popup() : "\<CR>"

imap <expr><TAB> pumvisible() ?
      \"\<C-n>"
      \: neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
      \: "\<TAB>"
smap <expr><TAB> neosnippet#jumpable()?
      \"\<Plug>(neosnippet_expand)"
      \: "\<TAB>"
<<<<<<< HEAD
""" }}}
=======
" }}}
>>>>>>> 070acf81ce55f4c7b62985e0fd9bebc523b77fe6
