" coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <C-k> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

inoremap <C-g><C-g> <ESC>:<C-u>call CocActionAsync('showSignatureHelp')<CR>l<INSERT>

" Code jump
nmap <C-]> <Plug>(coc-definition)
" Rename
nmap <Space>r <Plug>(coc-rename)

let g:coc_snippet_next = '<C-k>'
let g:coc_snippet_prev = '<C-j>'
