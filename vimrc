"--------------------
" vimrc
"--------------------
let OSTYPE = system('uname')

" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

runtime! userautoload/*.vim

"set runtimepath+=$GOROOT/misc/vim
"let $PYTHON3_DLL="/usr/local/Cellar/python3/3.4.1_1/Frameworks/Python.framework/Versions/3.4/Python"
