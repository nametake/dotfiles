"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" Vim SETTING 
"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"    ---INDEX---
"    NeoBundle setting
"       General
"       Language
"       Colorscheme
"    Setting
"       Basic setting
"       Color Scheme and Font setting
"       Apperance setting
"       Indent setting
"       Auto Complete setting
"       Search setting
"       Key setting
"       Setting of each language
"   Plugin setting
"       General
"       Language
"
"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" Variable setting every OS
" Mac -> darwin\n, Linux -> linux\n
let OSTYPE = system('uname')
"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" NeoBundle setting
"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

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
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
"---------------------------------------
" Bundle
"---------------------------------------
"************************
" General
"************************
" 補完
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'

" スニペット
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" vimshell
NeoBundle 'Shougo/vimshell'

" Surround
NeoBundle 'tpope/vim-surround'

" Align
NeoBundle 'vim-scripts/Align'

" YankRing
"NeoBundle 'vim-scripts/YankRing.vim'

" yankround
NeoBundle 'LeafCage/yankround.vim'

" Indent Guides
NeoBundle "nathanaelkane/vim-indent-guides"

" template
NeoBundle "thinca/vim-template"

" lightline
NeoBundle 'itchyny/lightline.vim'

" unite
NeoBundle 'Shougo/unite.vim'

" unite-outline
NeoBundle 'h1mesuke/unite-outline'

" vimfiler
NeoBundle 'Shougo/vimfiler'

" Fcitx setting
NeoBundle 'vim-scripts/fcitx.vim'

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

"************************
" Language
"************************
" Latex
"NeoBundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

" python
" Djangoを正しくVimで読み込めるようにする
NeoBundleLazy "lambdalisue/vim-django-support", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"]
        \ }}
" Vimで正しくvirtualenvを処理できるようにする
NeoBundleLazy "jmcantrell/vim-virtualenv", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"]
        \ }}
" jedi vim
NeoBundleLazy "davidhalter/jedi-vim", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ "build": {
        \   "mac": "pip install jedi",
        \   "unix": "pip install jedi",
        \ }}
" flake8
NeoBundleLazy "andviro/flake8-vim", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"]
        \ }}
" pep8 indent 引数などの改行をpep8準拠にする
NeoBundleLazy "hynek/vim-python-pep8-indent'", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"]
        \ }}
" Simpylfold  Pythonの折りたたみ
"NeoBundle 'tmhedberg/SimpylFold'
NeoBundleLazy "hattya/python_fold.vim'", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"]
        \ }}

" vim-pandoc
NeoBundleLazy "vim-pandoc/vim-pandoc", {
        \ "autoload": {
        \   "filetypes": ["text", "pandoc", "markdown", "rst", "textile"],
        \ }}


" HTML/CSS/Sass
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
" Emmet
NeoBundle 'mattn/emmet-vim'
" closetag
NeoBundle 'vim-scripts/closetag.vim'

" Javascript
" simple-javascript-indenter
NeoBundle 'jiangmiao/simple-javascript-indenter'
" vim-javascript-syntax
NeoBundle 'jelera/vim-javascript-syntax'
" vim-nodejs-complete
NeoBundle 'myhere/vim-nodejs-complete'
" vim-jade
NeoBundle 'digitaltoad/vim-jade'


" Markdown
" vim-markdown
NeoBundle 'plasticboy/vim-markdown'
" previm
NeoBundle 'kannokanno/previm'


"************************
" Colorscheme
"************************
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'



" Neo Bundle Required
filetype plugin indent on


"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" Setting
"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
" Plugin Path
set runtimepath+=~/.vim/plugin

" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END


"---------------------------------------
" Basic setting
"---------------------------------------
" Vimの設定をデフォルトに
set nocompatible

" Vimを使ってくれてありがとう
set notitle

" エンコード
set encoding=utf8

" ファイルエンコード
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,dos,mac

" .swapファイルを作らない
set noswapfile

" バックアップファイルを作らない
set nowritebackup

" バックアップをしない
set nobackup

" マウスモード有効
set mouse=a

" OSのクリップボードを使用
if OSTYPE == "Darwin\n"
   ""Mac
elseif OSTYPE == "Linux\n"
   ""Linux
    set clipboard=unnamedplus,autoselect
endif

" 行の折り返し
set wrap
" 一行の最大幅(改行しない)
set textwidth=0

" バックスペースキーの動作を決定する
set backspace=indent,eol,start

" 移動時に行頭に移動しない
set nostartofline

" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" 現在のモードを表示
set showmode

" コマンドをステータスに表示
set showcmd

" ステータスラインを常に表示"
set laststatus=2

"コマンドラインの高さを1に
set cmdheight=1

" バッファを変更可能にする
set modified

" ファイルの書き込みを有効にする
set write

"set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}A-)(]\[LOW=%l/%L]

" IMEの設定
""inoremap <C-[> <C-[><C-[> 
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
inoremap <silent> <C-[> <C-[>:set iminsert=0<CR>
" <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください。
" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" markdownの折りたたみ設定
"" 折りたたみを有効
set foldenable

" シンタックスに従い折りたたみ
set foldmethod=marker

" カーソルが移動した時に自動で折りたたみを開く
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo

" 折りたたみの具合
set foldlevel=0

" 最大折りたたみ深度
set foldnestmax=2

" 左側に折りたたみガイド表示
set foldcolumn=2


"---------------------------------------
" Color Scheme and Font setting
"---------------------------------------
" Vimを256色対応にする
set t_Co=256

" シンタックスハイライトをオン
syntax on

" カラースキーム
colorscheme molokai
"set background=dark

" Font
set guifont=Ricty\ 12
set guifontwide=Ricty\ 12


"---------------------------------------
" Apperance setting
"---------------------------------------
" 行番号を表示
set number

" 行・列の番号を表示
set ruler

" 不可視文字表示
set list
" 不可視次文字設定
set listchars=tab:»-,trail:･,extends:»,precedes:«,nbsp:%,eol:↲

" カーソル行をハイライト
set cursorline

" 括弧の対応をハイライト
set showmatch
" 対応括弧のハイライト表示を3秒にする
set matchtime=3
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>


"---------------------------------------
" Indent setting
"---------------------------------------
" タブ幅
set tabstop=4

" タブを挿入するときの幅
set shiftwidth=4

set softtabstop=4

" インデントをスペースのみ使用
set expandtab

" インデントをshiftwidthの倍数を丸める
set shiftround




"---------------------------------------
" Auto Complete setting
"---------------------------------------
" コマンドラインモード補完
set wildmenu

"コマンド補完を開始するキー
set wildchar=<tab>

" リスト表示，最長マッチ
set wildmode=list:full

" 補完時に大文字小文字を区別しない
set infercase


"---------------------------------------
" Search setting
"---------------------------------------
"最後まで検索したら先頭へ戻る
set wrapscan

" 大文字小文字無視
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

 " インクリメンタルサーチ
set incsearch

" 検索文字をハイライト
set hlsearch 
"
"---------------------------------------
" Key setting
"---------------------------------------
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" 矢印を有効化
nnoremap OA gi<Up>
nnoremap OB gi<Down>
nnoremap OC gi<Right>
nnoremap OD gi<Left>
nnoremap OF gi<End>
nnoremap OH gi<Home>
nnoremap [3~ gi<Del>
nnoremap [5~ gi<PageUp>
nnoremap [6~ gi<PageDown>]

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""inoremap { {}<LEFT>
""inoremap [ []<LEFT>
""inoremap ( ()<LEFT>
""inoremap " ""<LEFT>
""inoremap ' ''<LEFT>
"---------------------------------------
" Setting of each language
"---------------------------------------
" Python 
" インデントを半角スペース4個
autocmd MyAutoCmd FileType python set expandtab
autocmd MyAutoCmd FileType python set tabstop=4
autocmd MyAutoCmd FileType python set shiftwidth=4
autocmd MyAutoCmd FileType python set softtabstop=4
autocmd MyAutoCmd FileType python set autoindent
autocmd MyAutoCmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd MyAutoCmd FileType python set colorcolumn=80

"javascript
autocmd MyAutoCmd FileType javascript set foldlevel=1
autocmd MyAutoCmd FileType javascript set foldnestmax=99
" jade
autocmd MyAutoCmd FileType jade set tabstop=2
autocmd MyAutoCmd FileType jade set shiftwidth=2
autocmd MyAutoCmd FileType jade set softtabstop=2

" tex
" ファイルはインデントしない"
autocmd MyAutoCmd FileType tex set noautoindent
autocmd MyAutoCmd FileType tex set tabstop=2
autocmd MyAutoCmd FileType tex set shiftwidth=2
autocmd MyAutoCmd FileType tex set softtabstop=2

" html
autocmd MyAutoCmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd MyAutoCmd FileType html set noautoindent
autocmd MyAutoCmd FileType html set nosmartindent
autocmd MyAutoCmd FileType html set expandtab
autocmd MyAutoCmd FileType html set tabstop=4
autocmd MyAutoCmd FileType html set shiftwidth=4
autocmd MyAutoCmd FileType html set softtabstop=4

" kivy
autocmd MyAutoCmd BufRead,BufNewFile *.kv set filetype=kv
autocmd MyAutoCmd FileType kv set softtabstop=4
autocmd MyAutoCmd FileType kv set textwidth=79
autocmd MyAutoCmd FileType kv set shiftwidth=4
autocmd MyAutoCmd FileType kv set expandtab
autocmd MyAutoCmd FileType kv set tabstop=8
autocmd MyAutoCmd FileType kv set list
autocmd MyAutoCmd FileType kv set foldmethod=indent
autocmd MyAutoCmd FileType kv set foldlevelstart=99
autocmd MyAutoCmd FileType kv set foldlevel=99

" md as markdown, instead of modula2
autocmd MyAutoCmd BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd MyAutoCmd FileType markdown set foldlevel=1
autocmd MyAutoCmd FileType markdown set foldnestmax=3



"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
" Plugin setting
"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
"
"---------------------------------------
" General
"---------------------------------------
"
"************************
" neocomplcache
"************************
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 0

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"************************
" neocomplete
"************************
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"************************
" neosnippet
"************************

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand)
smap <C-k>     <Plug>(neosnippet_expand)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

imap <expr><TAB> pumvisible() ?
            \"\<C-n>"
            \: neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
            \: "\<TAB>"
smap <expr><TAB> neosnippet#jumpable()?
            \"\<Plug>(neosnippet_expand)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"************************
" Yankring
"************************
let g:yankring_history_dir = '$HOME/.vim'

"************************
" yankround
"************************
" yankring key bind
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" 保存する履歴数
let g:yankround_max_history = 35

" 保存ファイルの場所
let g:yankround_dir = '~/.cache/yankround'


"************************
" vim-indent-guides
"************************
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=235
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3a3a3a ctermbg=237
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1


"************************
" vim-template
"************************
" テンプレート中に含まれる特定文字列を置き換える
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
    silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction
" テンプレート中に含まれる'<+CURSOR+>'にカーソルを移動
autocmd MyAutoCmd User plugin-template-loaded
    \   if search('<+CURSOR+>')
    \ |   silent! execute 'normal! "_da>'
    \ | endif


"************************
" lightline
"************************
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ?"x":"" 
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? 'm'._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"************************
" unite
"************************


"************************
" unite-outline
"************************
nnoremap <silent> <Space>uo : <C-u>Unite -vertical -winwidth=30 outline<CR>

"************************
" vimfiler
"************************
let g:vimfiler_as_default_explorer = 1

"nnoremap <Space>f :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
nnoremap <Space>f :VimFiler -buffer-name=explorer -toggle<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
    nmap <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
    nnoremap <buffer>s :call vimfiler#mappings#do_action('my_split')<Cr>
    nnoremap <buffer>v :call vimfiler#mappings#do_action('my_vsplit')<Cr>
    " use R to refresh
    nmap <buffer> R <Plug>(vimfiler_redraw_screen)
    " overwrite C-l
    nmap <buffer> <C-l> <C-w>l
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
    wincmd p
    exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
    wincmd p
    exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)

"---------------------------------------
" Language
"---------------------------------------
"
"************************
" vim-latex
"************************
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_CompileRule_dvi = 'platex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode $*'
let g:Tex_BibtexFlavor = 'pbibtex'
"let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'mendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_dvi = 'pxdvi -watchfile 1'
"let g:Tex_ViewRule_dvi = 'advi -watch-file 1'
"let g:Tex_ViewRule_dvi = 'evince'
"let g:Tex_ViewRule_dvi = 'okular --unique'
"let g:Tex_ViewRule_dvi = 'wine ~/.wine/drive_c/w32tex/dviout/dviout.exe -1'
let g:Tex_ViewRule_ps = 'gv --watch'
"let g:Tex_ViewRule_ps = 'evince'
"let g:Tex_ViewRule_ps = 'okular --unique'
"let g:Tex_ViewRule_ps = 'zathura'
"let g:Tex_ViewRule_pdf = 'texworks'
let g:Tex_ViewRule_pdf = 'evince'
"let g:Tex_ViewRule_pdf = 'okular --unique'
"let g:Tex_ViewRule_pdf = 'zathura -s -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
"let g:Tex_ViewRule_pdf = 'pdfviewer'
"let g:Tex_ViewRule_pdf = 'gv --watch'
"let g:Tex_ViewRule_pdf = 'acroread'
"let g:Tex_ViewRule_pdf = 'pdfopen -viewer ar9-tab'
" 自動折りたたみしない場合
"let g:Tex_AutoFolding=0


"************************
" jedi-vim
"************************
"let s:hooks = neobundle#get_hooks("jedi-vim")
"function! s:hooks.on_source(bundle)
"  " jediにvimの設定を任せると'completeopt+=preview'するので
"  " 自動設定機能をOFFにし手動で設定を行う
"  let g:jedi#auto_vim_configuration = 0
"  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
"  let g:jedi#popup_select_first = 0
"  " quickrunと被るため大文字に変更
"  "let g:jedi#rename_command = '<Leader>R'
"  " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
"  "let g:jedi#goto_command = '<Leader>G'
"endfunction
"
"let g:jedi#auto_initialization = 1
"let g:jedi#popup_on_dot = 0
"autocmd  FileType python let b:did_ftplugin = 1
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_initialization = 1

let g:jedi#auto_vim_configuration = 0
" The reason to deactivate jedi#auto_vim_configuration
"autocmd FileType python setlocal completeopt-=preview 

let g:jedi#use_splits_not_buffers = "left"

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

" 最初の項目を選択しない
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#popup_select_first=0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

"************************
" flake8-vim
"************************
"1の時，保存時に自動でチェック
let g:PyFlakeOnWrite = 0 

"解析種別を設定
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'

"McCabe複雑度の最大値
let g:PyFlakeDefaultComplexity=10

"visualモードでQを押すと自動で修正
let g:PyFlakeRangeCommand = 'Q'

"************************
" closetag
"************************
let g:closetag_html_style=1
autocmd Filetype html,xml,xsl source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

"************************
" syntastic
"************************
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

"************************
" simple-javascript-indenter
"************************
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

"************************
" vim-javascript-syntax
"************************
autocmd MyAutoCmd FileType javascript call JavaScriptFold()

"************************
" vim-quickrun
"************************
nnoremap <Space>r :QuickRun<Cr>
let g:quickrun_config={
            \   '_':{
            \       'split': 'botright 8sp',
            \       'outputter/buffer/into': 1
            \   },
            \   'htmldjango':{
            \       'command': 'google-chrome',
            \       'outputter/buffer/close_on_empty': 1
            \   }
            \}

"************************
" vim-nodejs-complete
"************************
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS

let g:node_usejscomplete = 1

"************************
" previm
"************************
let g:previm_open_cmd = 'google-chrome'
