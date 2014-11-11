

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

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

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
            \   'build' : {
            \       'windows' : 'make -f make_mingw32.mak',
            \       'cygwin' : 'make -f make_cygwin.mak',
            \       'mac' : 'make -f make_mac.mak',
            \       'unix' : 'make -f make_unix.mak',
            \   },
            \ }

" vim-pandoc
NeoBundleLazy 'vim-pandoc/vim-pandoc', {
            \ 'autoload': {
            \   'filetypes': ["text", "pandoc", "markdown", "rst", "textile"],
            \ }}

" unite
NeoBundle 'Shougo/unite.vim'

" vimfiler
NeoBundleLazy 'Shougo/vimfiler', {
            \   'autoload' : { 'commands' : [ 'VimFiler' ] },
            \   'depends': [ 'Shougo/unite.vim' ],
            \ }

" neocomplete
NeoBundle 'Shougo/neocomplete'

" neosnippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Surround
NeoBundle 'tpope/vim-surround'

" Align
NeoBundle 'vim-scripts/Align'

" yankround
NeoBundle 'LeafCage/yankround.vim'

" vim-indent-guides
NeoBundle "nathanaelkane/vim-indent-guides"

" template
NeoBundle "thinca/vim-template"

" lightline
NeoBundle 'itchyny/lightline.vim'

" sudo.vim
NeoBundle 'sudo.vim'

" syntastic : syntax plugin
NeoBundle 'scrooloose/syntastic.git'

" vim-quickrun
NeoBundle 'thinca/vim-quickrun'

" auto-pairs
NeoBundle 'jiangmiao/auto-pairs'

" vim-fugitive : git plugin
NeoBundle 'tpope/vim-fugitive'


" *** hobby ***
NeoBundle 'koron/nyancat-vim'
NeoBundle 'thinca/vim-scouter'

"--------------------
" python
"--------------------
let $PATH = "~/.pyenv/shims:".$PATH

" Djangoを正しくVimで読み込めるようにする
NeoBundleLazy 'lambdalisue/vim-django-support', {
            \ 'autoload': {
            \   'filetypes': ["python", "python3", "djangohtml"]
            \ }}
" Vimで正しくvirtualenvを処理できるようにする
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
            \ 'autoload': {
            \   'filetypes': ["python", "python3", "djangohtml"]
            \ }}
" jedi vim
NeoBundle 'davidhalter/jedi-vim'
"NeoBundleLazy 'davidhalter/jedi-vim', {
"        \ 'autoload': {
"        \   'filetypes': ["python", "python3", "djangohtml"],
"        \ },
"        \ 'build': {
"        \   'mac': 'pip install jedi',
"        \   'unix': 'pip install jedi',
"        \ }}
" pep8 indent 引数などの改行をpep8準拠にする
NeoBundleLazy 'hynek/vim-python-pep8-indent', {
            \ 'autoload': {
            \   'filetypes': ["python", "python3", "djangohtml"]
            \ }}
" pyenv 処理用に vim-pyenv を追加
" Note: depends が指定されているため jedi-vim より後にロードされる（ことを期待）
"NeoBundleLazy "lambdalisue/vim-pyenv", {
"            \ 'depends': ['davidhalter/jedi-vim'],
"            \ 'autoload': {
"            \   'filetypes': ["python", "python3", "djangohtml"]
"            \ }}


"--------------------
" HTML/CSS/Sass
"--------------------
NeoBundleLazy 'taichouchou2/html5.vim', {
            \ 'autoload': {
            \   'filetypes': ["html", "djangohtml", "css"],
            \ }}
NeoBundleLazy 'hail2u/vim-css3-syntax', {
            \ 'autoload': {
            \   'filetypes': ["html", "djangohtml", "css"],
            \ }}
" Emmet
NeoBundleLazy 'mattn/emmet-vim', {
            \ 'autoload': {
            \   'filetypes': ["html", "djangohtml", "css"],
            \ }}
" closetag
"NeoBundle 'vim-scripts/closetag.vim'

"--------------------
" Javascript
"--------------------
" simple-javascript-indenter
NeoBundleLazy 'jiangmiao/simple-javascript-indenter', {
            \ 'autoload': {
            \   'filetypes': ["javascript"],
            \ }}
" vim-javascript-syntax
NeoBundleLazy 'jelera/vim-javascript-syntax', {
            \ 'autoload': {
            \   'filetypes': ["javascript"],
            \ }}
" vim-nodejs-complete
NeoBundleLazy 'myhere/vim-nodejs-complete', {
            \ 'autoload': {
            \   'filetypes': ["javascript"],
            \ }}
" vim-jade
NeoBundleLazy 'digitaltoad/vim-jade', {
            \ 'autoload': {
            \   'filetypes': ["jade"],
            \ }}
NeoBundleLazy 'pangloss/vim-javascript', {
            \ 'autoload': {
            \   'filetypes': ["javascript"],
            \ }}

NeoBundleLazy 'moll/vim-node', {
            \ 'autoload': {
            \   'filetype': ["javascript"],
            \ }}
"--------------------
" Markdown
"--------------------
" vim-markdown
NeoBundle 'plasticboy/vim-markdown'
"NeoBundleLazy 'plasticboy/vim-markdown', {
"        \ 'autoload': {
"        \   'filetypes': ["markdown"],
"        \ }}
" previm
NeoBundleLazy 'kannokanno/previm', {
            \ 'autoload': {
            \   'filetypes': ["markdown"],
            \ }}

" colorscheme
NeoBundle 'tomasr/molokai'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

colorscheme molokai

runtime! userautoload/plugins/*.vim
