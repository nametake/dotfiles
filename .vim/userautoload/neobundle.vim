"--------------------
" neobundle
"--------------------
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

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
"NeoBundleLazy 'Shougo/unite.vim', {
"            \ 'autoload' : {
"            \   'command' : ['Unite']
"            \ }}

" unite-outline
NeoBundle 'h1mesuke/unite-outline'
"NeoBundleLazy 'h1mesuke/unite-outline', {
"            \ 'autoload' : {
"            \   'command' : ['Unite']
"            \ }}

" 補完
NeoBundle 'Shougo/neocomplete'
"NeoBundleLazy 'Shougo/neocomplete', {
"            \ 'autoload' : {
"            \   'insert': 1
"            \ }}

" スニペット
"NeoBundleLazy 'Shougo/neosnippet', {
"            \ 'autoload' : {
"            \   'insert': 1
"            \ }}
"NeoBundleLazy 'Shougo/neosnippet-snippets', {
"            \ 'autoload' : {
"            \   'insert': 1
"            \ }}
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" vimfiler
"NeoBundle 'Shougo/vimfiler'
NeoBundleLazy 'Shougo/vimfiler', {
            \   'autoload' : { 'commands' : [ 'VimFiler' ] },
            \   'depends': [ 'Shougo/unite.vim' ],
            \ }

" vimshell
"NeoBundle 'Shougo/vimshell'
NeoBundleLazy 'Shougo/vimshell', {
            \   'autoload' : { 'commands' : [ 'VimShell' ] },
            \   'depends': [ 'Shougo/vimproc' ],
            \ }

" Surround
NeoBundle 'tpope/vim-surround'

" Align
NeoBundle 'vim-scripts/Align'

" yankround
NeoBundle 'LeafCage/yankround.vim'

" Indent Guides
NeoBundle "nathanaelkane/vim-indent-guides"

" template
NeoBundle "thinca/vim-template"

" lightline
NeoBundle 'itchyny/lightline.vim'

" Fcitx setting
"NeoBundle 'vim-scripts/fcitx.vim'

"##### auto fcitx  ###########
let g:input_toggle = 0
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
" インサートモードを離れた時
autocmd InsertLeave * call Fcitx2en()
" インサートモードになった時
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######

" sudo.vim
NeoBundle 'sudo.vim'

" syntastic
NeoBundle 'scrooloose/syntastic.git'

" vim-scouter
NeoBundle 'thinca/vim-scouter'

" vim-quickrun
NeoBundle 'thinca/vim-quickrun'

" open-browser
NeoBundle 'tyru/open-browser.vim'

" auto-pairs
NeoBundle 'jiangmiao/auto-pairs'

" vim-fugitive
NeoBundle 'tpope/vim-fugitive'

" 
NeoBundle 'koron/nyancat-vim'


"--------------------
" python
"--------------------
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
NeoBundleLazy 'davidhalter/jedi-vim', {
        \ 'autoload': {
        \   'filetypes': ["python", "python3", "djangohtml"],
        \ },
        \ 'build': {
        \   'mac': 'pip install jedi',
        \   'unix': 'pip install jedi',
        \ }}
" flake8
NeoBundleLazy 'andviro/flake8-vim', {
        \ 'autoload': {
        \   'filetypes': ["python", "python3", "djangohtml"]
        \ }}
" pep8 indent 引数などの改行をpep8準拠にする
NeoBundleLazy 'hynek/vim-python-pep8-indent', {
        \ 'autoload': {
        \   'filetypes': ["python", "python3", "djangohtml"]
        \ }}
" Simpylfold  Pythonの折りたたみ
"NeoBundle 'tmhedberg/SimpylFold'
NeoBundleLazy 'hattya/python_fold.vim', {
        \ 'autoload': {
        \   'filetypes': ["python", "python3", "djangohtml"]
        \ }}



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
NeoBundle 'vim-scripts/closetag.vim'

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

"--------------------
" Go
"--------------------

"--------------------
" Colorscheme
"--------------------
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'

colorscheme molokai

filetype plugin indent on

runtime! userautoload/plugins/*.vim
