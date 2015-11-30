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

NeoBundle 'Shougo/vimproc', {
      \   'build': {
      \     'windows': 'make -f make_mingw32.mak',
      \     'cygwin': 'make -f make_cygwin.mak',
      \     'mac': 'make -f make_mac.mak',
      \     'unix': 'make -f make_unix.mak',
      \   },
      \ }

NeoBundleLazy 'Shougo/neocomplete.vim', {
      \   'autoload': {'insert': 1}
      \ }

NeoBundleLazy 'Shougo/neosnippet.vim', {
      \   'autoload': {'insert': 1}
      \ }
NeoBundleLazy 'Shougo/neosnippet-snippets', {
      \   'depends': ['Shougo/neosnippet.vim'],
      \   'autoload': {'insert': 1}
      \ }

NeoBundleLazy 'Shougo/unite.vim', {
      \   'autoload': {'commands': ['Unite', 'UniteWithBufferDir']},
      \ }
NeoBundleLazy 'Shougo/vimfiler', {
      \   'depends': ['Shougo/unite.vim'],
      \   'autoload': {'commands': ['VimFiler']},
      \ }

NeoBundleLazy 'scrooloose/syntastic', {
      \   'autoload': {'insert': 1}
      \ }

NeoBundleLazy 'mattn/benchvimrc-vim', {
      \ 'autoload': {'commands': ['BenchVimrc']},
      \ }

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'vim-scripts/Align'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'thinca/vim-template'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'  "git plugin
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'glidenote/memolist.vim'
" *** hobby ***
NeoBundle 'koron/nyancat-vim'
NeoBundle 'thinca/vim-scouter'

" Python

NeoBundleLazy 'davidhalter/jedi-vim', {
      \   'autoload': {'filetypes': ['python', 'python3']},
      \   'build': {
      \     'mac': 'pip install jedi',
      \     'unix': 'pip install jedi',
      \   }
      \ }
NeoBundleLazy 'hynek/vim-python-pep8-indent', {
      \   'autoload': {'filetypes': ['python', 'python3']}
      \ }
" pyenv
function! IncludePath(path)
  " define delimiter depends on platform
  if has('win16') || has('win32') || has('win64')
    let delimiter = ";"
  else
    let delimiter = ":"
  endif
  let pathlist = split($PATH, delimiter)
  if isdirectory(a:path) && index(pathlist, a:path) == -1
    let $PATH=a:path.delimiter.$PATH
  endif
endfunction

call IncludePath(expand("~/.pyenv/shims"))
NeoBundleLazy 'lambdalisue/vim-pyenv', {
      \   'depends': ['davidhalter/jedi-vim'],
      \   'autoload': {'filetypes': ['python', 'python3']}
      \ }


" Javascript
NeoBundleLazy 'pangloss/vim-javascript', {
      \   'autoload': {'filetypes': ['javascript']}
      \ }
NeoBundleLazy 'jiangmiao/simple-javascript-indenter', {
      \   'autoload': {'filetypes': ['javascript']}
      \ }
" coffee
NeoBundleLazy 'kchmck/vim-coffee-script', {
      \   'autoload': {'filetypes': ['coffee']}
      \ }

" C sharp
NeoBundleLazy 'OmniSharp/omnisharp-vim', {
      \   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ]},
      \   'build': {
      \     'windows' : 'msbuild server/OmniSharp.sln',
      \     'mac': 'xbuild server/OmniSharp.sln',
      \     'unix': 'xbuild server/OmniSharp.sln',
      \   },
      \ }
NeoBundleLazy 'OrangeT/vim-csharp', {
      \   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ]}
      \ }

" JSON
NeoBundleLazy 'elzr/vim-json', {
      \   'autoload': {'filetypes': ['json']}
      \ }

" HTML/CSS
NeoBundleLazy 'mattn/emmet-vim', {
      \   'autoload': {'filetypes': ['html', 'css']}
      \ }
NeoBundleLazy 'taichouchou2/html5.vim', {
      \   'autoload': {'filetypes': ['html', 'css']}
      \ }
NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \   'autoload': {'filetypes': ['html', 'css']}
      \ }

" Markdown
NeoBundleLazy 'kannokanno/previm', {
      \   'autoload': {'filetypes': ['markdown']}
      \ }
NeoBundleLazy 'nelstrom/vim-markdown-folding', {
      \   'autoload': {'filetypes': ['markdown']}
      \ }
NeoBundleLazy 'dhruvasagar/vim-table-mode', {
      \   'autoload': {'filetypes': ['markdown']}
      \ }

" Latex
NeoBundleLazy 'matze/vim-tex-fold', {
      \   'autoload': {'filetypes': ["tex"]}
      \ }

" ino(Arduino)
NeoBundleLazy 'sudar/vim-arduino-syntax', {
      \   'autoload': {'filetypes': ["ino"]}
      \ }

" Golang
NeoBundleLazy 'fatih/vim-go', {
      \   'autoload': {'filetypes': ["go"]}
      \ }

" Scala
NeoBundleLazy 'derekwyatt/vim-scala', {
      \   'autoload': {'filetypes': ["scala"]}
      \ }

call neobundle#end()


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundleCheck

colorscheme molokai

runtime! userautoload/plugins/*.vim
