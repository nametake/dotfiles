" vim-lsp

let g:lsp_format_on_save = 1

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:lsp_show_message_log_level = 'log'
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_cursor_delay = 1
let g:lsp_diagnostics_virtual_text_enabled = 0

let g:lsp_settings = {}

let g:lsp_settings['efm-langserver'] = {
  \  'disabled': v:false,
  \  'initialization_options': {
  \    'documentFormatting': v:true,
  \    'codeAction': v:true,
  \  },
  \}

" Vim {{{
let g:lsp_settings_filetype_vim = ['vim-language-server', 'efm-langserver']
" }}}

" Shell {{{
let g:lsp_settings_filetype_sh = ['bash-language-server', 'efm-langserver']
" }}}

" json {{{
let g:lsp_settings_filetype_json = ['efm-langserver']
" }}}

" Go {{{
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']
let g:lsp_settings['golangci-lint-langserver'] = {
  \  'args': ['-debug'],
  \  'initialization_options': {
  \    'command': ['golangci-lint', 'run',
  \        '--out-format', 'json',
  \        '--allow-parallel-runners',
  \    ],
  \  },
  \}
" }}}

" Scala {{{
let g:lsp_settings['metals'] = {
  \  'workspace_config': {
  \    'metals': {
  \      'bloopSbtAlreadyInstalled': v:true
  \    },
  \  },
  \}
" }}}

" Frontend {{{
let s:frontend_lsp =  ['typescript-language-server', 'efm-langserver']
let g:lsp_settings_filetype_javascript = s:frontend_lsp
let g:lsp_settings_filetype_javascriptreact = s:frontend_lsp
let g:lsp_settings_filetype_typescript = s:frontend_lsp
let g:lsp_settings_filetype_typescriptreact = s:frontend_lsp
" }}}

let s:lsp_format_efm_only_list = [
      \   'javascript',
      \   'javascriptreact',
      \   'typescript',
      \   'typescriptreact'
      \ ]

function! LspFormat()
  if index(s:lsp_format_efm_only_list, &filetype) >= 0
    call execute('LspDocumentFormatSync --server=efm-langserver')
  else
    call execute('LspDocumentFormatSync')
  endif
endfunction

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <silent> gd <plug>(lsp-definition)
  nmap <silent> gs <plug>(lsp-document-symbol-search)
  nmap <silent> gS <plug>(lsp-workspace-symbol-search)
  nmap <silent> gr <plug>(lsp-references)
  nmap <silent> gi <plug>(lsp-implementation)
  nmap <silent> gt <plug>(lsp-type-definition)
  nmap <silent> <Space>r <plug>(lsp-rename)
  nmap <silent> <Space>k <plug>(lsp-previous-diagnostic)
  nmap <silent> <Space>j <plug>(lsp-next-diagnostic)
  nmap <silent> K <plug>(lsp-hover)
  inoremap <silent> <expr><c-f> lsp#scroll(+4)
  inoremap <silent> <expr><c-d> lsp#scroll(-4)
  nmap <silent> ; <plug>(lsp-code-action)

  let g:lsp_format_sync_timeout = 1000
  if g:lsp_format_on_save
    " autocmd MyAutoCmd BufWritePre <buffer> call execute('LspDocumentFormatSync')
    autocmd! MyAutoCmd BufWritePre * call LspFormat()
  endif

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

  " Gauge {{{
  let root_dir = finddir('.git/..', expand('%:p:h').';')
  if executable('gauge') && filereadable(root_dir.'/.gauge_root')
    autocmd MyAutoCmd BufNewFile,BufRead *.spec set filetype=spec
    autocmd MyAutoCmd BufNewFile,BufRead *.spec set syntax=markdown
    autocmd MyAutoCmd BufNewFile,BufRead *.cpt set filetype=cpt
    autocmd MyAutoCmd BufNewFile,BufRead *.cpt set syntax=markdown
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'gauge',
      \ 'cmd': {server_info->['gauge', 'daemon', '--lsp']},
      \ 'allowlist': ['spec', 'cpt', 'typescript'],
      \ })
  endif
  " }}}
augroup END
