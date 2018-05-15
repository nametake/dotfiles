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

let g:neoformat_enabled_go = ['gofmtrlx', 'goimports']
" }}}

" Javascript {{{
autocmd MyAutoCmd FileType javascript
      \ autocmd! MyAutoCmd BufWritePre <buffer> call WrapNeoformat()

let g:neoformat_javascript_prettiereslint = {
      \   'exe': './node_modules/.bin/prettier-eslint',
      \   'args': ['--stdin'],
      \   'stdin': 1,
      \ }

let g:neoformat_enabled_javascript = ['prettiereslint']
" }}}

" HTML {{{
autocmd MyAutoCmd FileType html
      \ autocmd! MyAutoCmd BufWritePre <buffer> call WrapNeoformat()

let g:neoformat_html_jsbeautify = {
      \   'exe': 'js-beautify',
      \   'args': ['-r', '--type html', '-s 2'],
      \   'replace': 1,
      \ }

let g:neoformat_enabled_html = ['jsbeautify']
" }}}

" JSON {{{
autocmd MyAutoCmd FileType json
      \ autocmd! MyAutoCmd BufWritePre <buffer>  Neoformat

let g:neoformat_enabled_json = ['jq']
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
endfunction
" }}}
