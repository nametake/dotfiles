"--------------------
" My filetype setting
"--------------------

if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  " jsx
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  " post css
  autocmd BufNewFile,BufRead *.{pcss} set filetype=scss
  " apex
  autocmd BufNewFile,BufRead *.cls set filetype=apex
  " jade
  autocmd BufNewFile,BufRead *.jade set filetype=jade
  " coffee
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  " tex
  autocmd BufNewFile,BufRead *.tex set filetype=tex
  " markdown
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  " bruno
  autocmd BufNewFile,BufRead *.bru set filetype=bruno
  " json
  " autocmd BufNewFile,BufRead .{*rc,tern-config} set filetype=json
  " autocmd BufNewFile,BufRead {*rc,tern-config} set filetype=json
  " vim
  autocmd BufNewFile,BufRead .vimrc set filetype=vim
  autocmd BufNewFile,BufRead vimrc set filetype=vim
augroup END
