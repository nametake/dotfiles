" dein.vim configurations.

let g:dein#enable_notification = 1

let s:path = expand('~/.cache/dein')
let s:repo = s:path . '/repos/github.com/Shougo/dein.vim'

" install dein
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:repo)
    execute '!git clone https://github.com/Shougo/dein.vim' s:repo
  endif
  execute 'set runtimepath^=' . fnamemodify(s:repo, ':p')
endif

if !dein#load_state(s:path)
  finish
endif


call dein#begin(s:path, expand('<sfile>'))

" load toml and cache
call dein#load_toml('~/.vim/rc/dein.toml', {'lazy': 0})
call dein#load_toml('~/.vim/rc/dein_lazy.toml', {'lazy': 1})
if has('nvim')
  call dein#load_toml('~/.vim/rc/dein_neo.toml', {})
endif

" disable other plugins
if dein#tap('deoplete.nvim') && has('nvim')
  call dein#disable('neocomplete.vim')
endif

call dein#end()
call dein#save_state()


" Installation check.
if dein#check_install()
  call dein#install()
endif

command! DeinUpdate call dein#update()
