" neoformat

" debug
" let g:neoformat_verbose = 1

let g:neoformat_run_all_formatters = 1

" Golang {{{
autocmd MyAutoCmd FileType go
      \ autocmd! MyAutoCmd BufWritePre <buffer> call WrapNeoformat()

let g:neoformat_go_gofmtrlx = {
      \   'exe': 'gofmtrlx',
      \   'args': ['-s', '-w'],
      \   'replace': 1,
      \   'stdin': 0,
      \ }

let g:neoformat_go_goreturns = {
      \   'exe': 'goreturns',
      \   'args': [],
      \   'replace': 0,
      \   'stdin': 1,
      \ }

let g:neoformat_enabled_go = ['gofmtrlx', 'goreturns']
" }}}

" JSON {{{
autocmd MyAutoCmd FileType json
      \ autocmd! MyAutoCmd BufWritePre <buffer> Neoformat

let g:neoformat_enabled_json = ['jq']
" }}}

" Shell script {{{
autocmd MyAutoCmd FileType sh
      \ autocmd! MyAutoCmd BufWritePre <buffer> Neoformat

let g:neoformat_enabled_sh = ['shfmt']
" }}}

" Markdown {{{
autocmd MyAutoCmd FileType markdown
      \ autocmd! MyAutoCmd BufWritePre <buffer> call WrapNeoformat()

let g:neoformat_markdown_mdfmt = {
      \   'exe': 'mdfmt',
      \ }

let g:neoformat_enabled_markdown = ['mdfmt']
" }}}

" SQL {{{
autocmd MyAutoCmd FileType sql
      \ autocmd! MyAutoCmd BufWritePre <buffer> Neoformat

let g:neoformat_enabled_sql = ['sqlfmt']
" }}}

" func {{{
" Refer: https://github.com/fatih/vim-go/blob/7cfb890609b50e11fb27e0fee90a930646b5419f/autoload/go/fmt.vim#L16-L91
function! WrapNeoformat() abort
  let l:curw = {}
  try
    mkview!
  catch
    let l:curw = winsaveview()
  endtry

  " save our undo file to be restored after we are done. This is needed to
  " prevent an additional undo jump due to BufWritePre auto command and also
  " restore 'redo' history because it's getting being destroyed every
  " BufWritePre
  let tmpundofile = tempname()
  exe 'wundo! ' . tmpundofile

  Neoformat

  " restore our undo history
  silent! exe 'rundo ' . tmpundofile
  call delete(tmpundofile)

  " Restore our cursor/windows positions, folds, etc.
  if empty(l:curw)
    silent! loadview
  else
    call winrestview(l:curw)
  endif

  syntax sync fromstart
endfunction
" }}}
