"--------------------
" neosnippet
"--------------------
let s:hooks = neobundle#get_hooks("neosnippet.vim")

function! s:hooks.on_source(bundle)
  " 自分用 snippet ファイルの場所
  let s:my_snippet = '~/.vim/snippet/'
  let g:neosnippet#snippets_directory = s:my_snippet

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

endfunction

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

inoremap <expr><CR>  pumvisible() ?
      \ neocomplete#close_popup() : "\<CR>"

imap <expr><TAB> pumvisible() ?
      \"\<C-n>"
      \: neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
      \: "\<TAB>"
smap <expr><TAB> neosnippet#jumpable()?
      \"\<Plug>(neosnippet_expand)"
      \: "\<TAB>"
