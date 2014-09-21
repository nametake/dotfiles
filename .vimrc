"--------------------
" vimrc
"--------------------
let OSTYPE = system('uname')

" release autogroup in MyAutoCmd
augroup MyAutoCmd
    autocmd!
augroup END

set runtimepath+=~/.vim/
runtime! userautoload/*.vim
