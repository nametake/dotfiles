" dein.vim configurations.

let s:path = expand('~/.cache/dein')
let s:repo = s:path . '/repos/github.com/Shougo/dein.vim'

" install dein
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:repo
  endif
  execute 'set runtimepath^=' . fnamemodify(s:repo, ':p')
endif


if !dein#load_state(s:path)
  finish
endif


call dein#begin(s:path, [expand('<sfile>')]
      \ + split(glob('~/.vim/rc/*.toml'), '\n'))

" load toml and cache
call dein#load_toml('~/.vim/rc/dein.toml',      {'lazy': 0})
call dein#load_toml('~/.vim/rc/dein_lazy.toml', {'lazy': 1})

" disable other plugins
if dein#tap('deoplete.nvim') && has('nvim')
  call dein#disable('neocomplete.vim')
endif
call dein#disable('neobundle.vim')
call dein#disable('neopairs.vim')

call dein#end()
call dein#save_state()


" Installation check.
if !has('vim_starting') && dein#check_install()
  call dein#install()
endif

