"--------------------
" My filetype setting
"--------------------

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " jsx
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
  " jade
  autocmd BufNewFile,BufRead *.jade set filetype=jade
  " coffee
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  " tex
  autocmd BufNewFile,BufRead *.tex set filetype=tex
  " markdown
  autocmd BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
