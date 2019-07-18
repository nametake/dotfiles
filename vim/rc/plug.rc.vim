" vim-plug configurations

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" View {{{
Plug 'itchyny/lightline.vim'
source ~/.vim/rc/plugins/lightline.rc.vim

Plug 'itchyny/vim-cursorword'

Plug 'Yggdroot/indentLine'
let g:indentLine_setConceal = 0
" }}}

" Text operation {{{
Plug 'tpope/vim-surround'

Plug 'tomtom/tcomment_vim'

Plug 'vim-scripts/Align'

Plug 'tpope/vim-abolish'

Plug 'bfredl/nvim-miniyank'
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <C-n> <Plug>(miniyank-cycle)
" }}}

" Search {{{
Plug 'ctrlpvim/ctrlp.vim'
nnoremap <silent> <C-i> :<C-u>CtrlPBuffer<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plug 'mileszs/ack.vim'
nnoremap <silent> <C-s> :<C-u>Ack!<Space>
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ack_autoclose = 1

Plug 'easymotion/vim-easymotion'
nmap s <Plug>(easymotion-overwin-f2)
map <Space>L <Plug>(easymotion-bd-jk)
nmap <Space>L <Plug>(easymotion-overwin-line)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
" }}}

" git {{{
Plug 'tpope/vim-fugitive'
command! Gac Gw|Gcommit

  Plug 'tpope/vim-rhubarb'

Plug 'airblade/vim-gitgutter'
" }}}

" nerdtree {{{
Plug 'scrooloose/nerdtree'
nnoremap <silent> <Space>f :<C-u>NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen=0

  Plug 'Xuyuanp/nerdtree-git-plugin'
  let g:NERDTreeIndicatorMapCustom = {
        \   'Modified'  : '*',
        \   'Staged'    : '+',
        \   'Untracked' : '-',
        \   'Renamed'   : '>',
        \   'Unmerged'  : '=',
        \   'Deleted'   : '!',
        \   'Dirty'     : 'x',
        \   'Clean'     : ':',
        \   'Ignored'   : 'I',
        \   'Unknown'   : '?'
        \ }

  Plug 'EvanDotPro/nerdtree-chmod'

  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1

" }}}

Plug 'w0rp/ale'
source ~/.vim/rc/plugins/ale.rc.vim

Plug 'sbdchd/neoformat'
source ~/.vim/rc/plugins/neoformat.rc.vim

Plug 'neoclide/coc.nvim', {'branch': 'release'}
source ~/.vim/rc/plugins/coc.rc.vim

Plug 'fatih/vim-go', {'for': 'go'}
source ~/.vim/rc/plugins/vim-go.vim

call plug#end()
