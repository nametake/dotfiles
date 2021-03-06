" coc.nvim

let g:coc_node_path = substitute(system('which node'), '\n', '', 'g')

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function CocActionWithSetTagStack(action) abort
  let l:old_location = [bufnr('%'), line('.'), col('.'), 0]
  let l:tagname = expand('<cword>')
  let l:winid = win_getid()
  call settagstack(l:winid, {'items': [{'from': l:old_location, 'tagname': l:tagname}]}, 'a')
  call settagstack(l:winid, {'curidx': len(gettagstack(l:winid)['items']) + 1})
  call CocActionAsync(a:action)
endfunction

autocmd MyAutoCmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <Plug>(coc-definition-with-settagstack) :<C-u>call CocActionWithSetTagStack('jumpDefinition')<CR>
nnoremap <silent> <Plug>(coc-implementation-with-settagstack) :<C-u>call CocActionWithSetTagStack('jumpImplementation')<CR>
nnoremap <silent> <Plug>(coc-type-definition-with-settagstack) :<C-u>call CocActionWithSetTagStack('jumpTypeDefinition')<CR>
nnoremap <silent> <Plug>(coc-references-with-settagstack) :<C-u>call CocActionWithSetTagStack('jumpReferences')<CR>
nnoremap <silent> <Plug>(coc-references-used-with-settagstack) :<C-u>call CocActionWithSetTagStack('jumpUsed')<CR>

" Code jump
nmap <C-]> <Plug>(coc-definition-with-settagstack)
nmap <silent> gy <Plug>(coc-type-definition-with-settagstack)
nmap <silent> gi <Plug>(coc-implementation-with-settagstack)
nmap <silent> gr <Plug>(coc-references-with-settagstack)
nmap <silent> gu <Plug>(coc-references-used-with-settagstack)

nmap <silent> <Space>j <Plug>(coc-diagnostic-next)
nmap <silent> <Space>k <Plug>(coc-diagnostic-prev)


" Rename
nmap <Space>r <Plug>(coc-rename)

" Focus float window
nmap <silent> <Space>; <Plug>(coc-float-jump)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

let g:coc_snippet_next = '<C-k>'
let g:coc_snippet_prev = '<C-j>'

" Highlight
hi default link CocErrorHighlight Error
hi default link CocWarningHighlight Error
