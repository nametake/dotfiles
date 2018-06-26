"--------------------
" My filetype setting
"--------------------

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " jsx
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  " typescript
  autocmd BufNewFile,BufRead *.ts set filetype=typescript
  " jade
  autocmd BufNewFile,BufRead *.jade set filetype=jade
  " coffee
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  " tex
  autocmd BufNewFile,BufRead *.tex set filetype=tex
  " markdown
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  " json
  autocmd BufNewFile,BufRead *.{eslintrc,babelrc,tern-config} set filetype=json
augroup END
