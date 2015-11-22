"--------------------
" keymap
"--------------------
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

" ノーマルモード時にエンターで改行挿入
noremap  O o<ESC>
