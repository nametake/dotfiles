" Note: Skip initialization for vim-tiny or vim-small.
" Reference: https://github.com/Shougo/shougo-s-github/blob/master/vim/vimrc
if 1
  execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/rc/vimrc'
endif
