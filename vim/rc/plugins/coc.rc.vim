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

nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <C-k> <ESC>:<C-u>call <SID>show_documentation()<CR>l<INSERT>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function JumpDefinitionWithSetTagStack() abort
  let l:old_location = [bufnr('%'), line('.'), col('.'), 0]
  let l:tagname = expand('<cword>')
  let l:winid = win_getid()
  call settagstack(l:winid, {'items': [{'from': l:old_location, 'tagname': l:tagname}]}, 'a')
  call settagstack(l:winid, {'curidx': len(gettagstack(l:winid)['items']) + 1})
  call CocAction('jumpDefinition')
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <Plug>(jump-definition-with-settagstack) :<C-u>call JumpDefinitionWithSetTagStack()<CR>

" Code jump
" nmap <C-]> <Plug>(coc-definition)
nmap <C-]> <Plug>(jump-definition-with-settagstack)

nmap <silent> <Space>n <Plug>(coc-diagnostic-next)
nmap <silent> <Space>p <Plug>(coc-diagnostic-prev)

" Rename
nmap <Space>r <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

let g:coc_snippet_next = '<C-k>'
let g:coc_snippet_prev = '<C-j>'

" Highlight
hi default link CocErrorHighlight CocErrorSign
