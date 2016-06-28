" dein.vim configurations.

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

let s:toml_path = '~/.vim/rc/dein.toml'
let s:toml_lazy_path = '~/.vim/rc/dein_lazy.toml'
let s:toml_neovim_path = '~/.vim/rc/dein_neo.toml'


call dein#begin(s:path, [expand('<sfile>')]
      \ + split(glob('~/.vim/rc/*.toml'), '\n'))

" load toml and cache
call dein#load_toml(s:toml_path, {'lazy': 0})
call dein#load_toml(s:toml_lazy_path, {'lazy': 1})
if has('nvim')
  call dein#load_toml(s:toml_neovim_path, {})
endif

" disable other plugins
if dein#tap('deoplete.nvim') && has('nvim')
  call dein#disable('neocomplete.vim')
endif
call dein#disable('neobundle.vim')
call dein#disable('neopairs.vim')

call dein#end()
call dein#save_state()


" Installation check.
if dein#check_install()
  call dein#install()
endif

