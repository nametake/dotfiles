"--------------------
" filetype
"--------------------
" vim
autocmd MyAutoCmd FileType vim call s:setVimOnly()
function! s:setVimOnly()
  set foldmethod=marker
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
endfunction

" Python 
autocmd MyAutoCmd FileType python call s:setPythonOnly()
function! s:setPythonOnly()
  set expandtab
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
  set autoindent
  set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  set colorcolumn=80
endfunction

" javascript
autocmd MyAutoCmd FileType javascript call s:setJavascriptOnly()
function! s:setJavascriptOnly()
  set foldlevel=1
  set foldnestmax=99
endfunction
" jade
autocmd MyAutoCmd BufNewFile,BufRead *.jade set filetype=jade
autocmd MyAutoCmd FileType jade call s:setJadeOnly()
function! s:setJadeOnly()
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
endfunction
" coffee
autocmd MyAutoCmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd MyAutoCmd FileType coffee call s:setCoffeeOnly()
function! s:setCoffeeOnly()
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
endfunction

" tex
autocmd MyAutoCmd BufNewFile,BufRead *.tex set filetype=tex
autocmd MyAutoCmd FileType tex call s:setTexOnly()
function! s:setTexOnly()
  set noautoindent
  set noexpandtab
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  let g:tex_conceal=''
endfunction

" html
"autocmd MyAutoCmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd MyAutoCmd FileType html call s:setHtmlOnly()
function! s:setHtmlOnly()
  set noautoindent
  set nosmartindent
  set expandtab
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
endfunction

" kivy
autocmd MyAutoCmd BufRead,BufNewFile *.kv set filetype=kv
autocmd MyAutoCmd FileType kv call s:setKivyOnly()
function! s:setKivyOnly()
  set softtabstop=4
  set textwidth=79
  set shiftwidth=4
  set expandtab
  set tabstop=8
  set list
  set foldmethod=indent
  set foldlevelstart=99
  set foldlevel=99
endfunction

" markdown
autocmd MyAutoCmd BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd MyAutoCmd FileType markdown call s:setMarkdownOnly()
function! s:setMarkdownOnly()
  set foldlevel=1
  set foldnestmax=3
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set noexpandtab
  set noautoindent
  set formatoptions+=or
endfunction

" shell script
autocmd MyAutoCmd FileType sh call s:setShellScriptOnly()
autocmd MyAutoCmd FileType zsh call s:setShellScriptOnly()
function! s:setShellScriptOnly()
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
endfunction

" golang
autocmd MyAutoCmd FileType go call s:setGotOnly()
function! s:setGotOnly()
  set noexpandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set completeopt=menu
endfunction
"set runtimepath+=$GOROOT/misc/vim

autocmd MyAutoCmd FileType cs call s:setCsharpOnly()
function! s:setCsharpOnly()
  set noexpandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endfunction

autocmd MyAutoCmd BufRead,BufNewFile *.{ino} set filetype=ino
autocmd MyAutoCmd FileType go call s:setArduinotOnly()
function! s:setArduinotOnly()
endfunction

autocmd MyAutoCmd FileType json call s:setJsonOnly()
function! s:setJsonOnly()
  set noexpandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunction
