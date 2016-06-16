"--------------------
" vimfiler
"--------------------
let s:bundle = neobundle#get('vimfiler')

function! s:bundle.hooks.on_source(bundle)
  let g:vimfiler_as_default_explorer = 1

  "nnoremap <Space>f :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
  autocmd! FileType vimfiler call s:my_vimfiler_settings()

  let s:my_action = { 'is_selectable' : 1 }
  function! s:my_action.func(candidates)
    wincmd p
    exec 'split '. a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'my_split', s:my_action)

  let s:my_action = { 'is_selectable' : 1 }
  function! s:my_action.func(candidates)
    wincmd p
    exec 'vsplit '. a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'my_vsplit', s:my_action)
endfunction

nnoremap <Space>f :VimFiler -buffer-name=explorer -toggle<Cr>

function! s:my_vimfiler_settings()
  nmap <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v :call vimfiler#mappings#do_action('my_vsplit')<Cr>
  " use R to refresh
  nmap <buffer> R <Plug>(vimfiler_redraw_screen)
  " overwrite C-l
  nmap <buffer> <C-l> <C-w>l
endfunction
