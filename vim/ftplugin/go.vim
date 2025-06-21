set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set completeopt=menu

autocmd MyAutoCmd FileType go highlight goErr cterm=bold ctermfg=214 gui=bold guifg=#ffaf00
autocmd MyAutoCmd FileType go match goErr /\<err\>/
