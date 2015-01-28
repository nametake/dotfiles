"--------------------
" basic
"--------------------
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

" undoファイルを作成しない
set noundofile

" マウスモード有効
set mouse=a

" OSのクリップボードを使用
"if OSTYPE == "Darwin\n"
"    ""Mac
"elseif OSTYPE == "Linux\n"
"    ""Linux
"    set clipboard=unnamedplus,autoselect
"endif
if has('mac')
    set clipboard=unnamed,autoselect
elseif has('unix')
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
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
"inoremap <silent> <C-[> <C-[>:set iminsert=0<CR>
" <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください。
" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" markdownの折りたたみ設定
"" 折りたたみを有効
set foldenable

" シンタックスに従い折りたたみ
set foldmethod=syntax

" カーソルが移動した時に自動で折りたたみを開く
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo

" 折りたたみの具合
set foldlevel=0

" 最大折りたたみ深度
set foldnestmax=2

" 左側に折りたたみガイド表示
set foldcolumn=2


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

" 補完メニューの設定
set completeopt=menu,preview
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


if OSTYPE == "Linux\n"
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
    ""##### auto fcitx end ######
endif
