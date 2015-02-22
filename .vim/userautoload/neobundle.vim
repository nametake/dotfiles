"--------------------
" neobundle
"--------------------

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" colorsheme
NeoBundle 'tomasr/molokai'

NeoBundle 'Shougo/neocomplete.vim', {
            \   "autoload" : {"insert": 1}
            \}

NeoBundle 'Shougo/neosnippet.vim', {
            \   "autoload" : {"insert": 1}
            \}
NeoBundle 'Shougo/neosnippet-snippets', {
            \   "depends" : ["neosnippet.vim"]
            \}

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

colorscheme molokai
