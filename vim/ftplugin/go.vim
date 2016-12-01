set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set completeopt=menu
set foldmethod=indent
set foldlevel=0
set foldnestmax=99

autocmd MyAutoCmd BufWritePre <buffer> silent Fmt
autocmd MyAutoCmd FileType go highlight goErr cterm=bold ctermfg=214 gui=bold guifg=#ffaf00
autocmd MyAutoCmd FileType go match goErr /\<err\>/
