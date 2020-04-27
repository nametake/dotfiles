" vim-plug configurations

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd MyAutoCmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" View {{{
Plug 'itchyny/lightline.vim'
source ~/.vim/rc/plugins/lightline.rc.vim

" Plug 'itchyny/vim-cursorword'

" Plug 'Yggdroot/indentLine'
" let g:indentLine_fileTypeExclude = ['markdown', 'json']

Plug 'fatih/molokai'
" }}}

" Text operation {{{
Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-jabraces'
  Plug 'sgur/vim-textobj-parameter'

Plug 'tpope/vim-surround'

Plug 'tomtom/tcomment_vim'

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'tpope/vim-abolish'

Plug 'bfredl/nvim-miniyank'
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <C-n> <Plug>(miniyank-cycle)

Plug 'thinca/vim-template'

Plug 'mattn/vim-sonictemplate'
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
map  <Space>F <Plug>(easymotion-bd-f)
nmap <Space>F <Plug>(easymotion-overwin-f)

nmap s <Plug>(easymotion-overwin-f2)

map <Space>L <Plug>(easymotion-bd-jk)
nmap <Space>L <Plug>(easymotion-overwin-line)

map  <Space>w <Plug>(easymotion-bd-w)
nmap <Space>w <Plug>(easymotion-overwin-w)

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
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeSortOrder = ['\/$'] + map(range(0, 25), '"\\." . nr2char(char2nr("a") + v:val) . "[^.]*$"')

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
  let g:NERDTreeLimitedSyntax = 1
" }}}

" lint/format {{{
" Plug 'dense-analysis/ale'
" source ~/.vim/rc/plugins/ale.rc.vim

" Plug 'sbdchd/neoformat'
" source ~/.vim/rc/plugins/neoformat.rc.vim
" }}}

" Complement {{{
Plug 'jiangmiao/auto-pairs'

Plug 'honza/vim-snippets'

let $NVIM_COC_LOG_LEVEL = 'debug'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
source ~/.vim/rc/plugins/coc.rc.vim

  Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" }}}

" Language {{{

" Go {{{
" Plug 'fatih/vim-go', {'for': 'go', 'on': 'GoUpdateBinaries'}
" source ~/.vim/rc/plugins/vim-go.vim

Plug 'arp242/gopher.vim', {'for': ['go']}
let g:gopher_highlight = [
      \   'string-fmt',
      \   'string-spell',
      \   'fold-block',
      \   'fold-varconst',
      \ ]
let g:gopher_map = {
      \   '_popup': 0,
      \   '_imap_prefix': '<C-g>',
      \   '_imap_ctrl': 1,
      \ }
nmap ; <Plug>(gopher-popup)

Plug 'buoto/gotests-vim', {'for': ['go']}

Plug 'nametake/ctrlp-goimport', {'for': ['go']}
nmap <C-g><C-i> <Plug>(ctrlp-goimport)

Plug 'nametake/vim-goiferr-snippets', {'for': ['go']}
" }}}

" Rust {{{
Plug 'rust-lang/rust.vim', {'for': ['rust']}

Plug 'neoclide/coc-rls', {'for': ['rust'], 'do': 'yarn install --frozen-lockfile'}
" }}}

" TypeScript {{{
Plug 'neoclide/coc-tsserver',  {'do': 'yarn install --frozen-lockfile'}

Plug 'neoclide/coc-eslint',  {'do': 'yarn install --frozen-lockfile'}

Plug 'neoclide/coc-prettier',  {'do': 'yarn install --frozen-lockfile'}

Plug 'othree/yajs.vim', {'for': ['typescript, typescriptreact']}
"
Plug 'maxmellon/vim-jsx-pretty', {'for': ['typescript.tsx', 'typescriptreact']}

Plug 'styled-components/vim-styled-components', {'for': ['typescript.tsx', 'typescriptreact'], 'branch': 'main'}
" }}}

" HTML,XML {{{
Plug 'alvan/vim-closetag', {'for': ['html', 'xml']}
" }}}

" Markdown {{{
Plug 'plasticboy/vim-markdown', {'for': ['markdown']}
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

Plug 'dhruvasagar/vim-table-mode', {'for': ['markdown']}
let g:markdown_fold_style = 'nested'
let g:table_mode_always_active = 1
" }}}

" Protocol Buffers {{{
Plug 'uber/prototool', {'for': ['proto'], 'rtp':'vim/prototool'}
" autocmd MyAutoCmd User prototool call PrototoolFormatFixEnable()
" }}}

" TOML {{{
Plug 'cespare/vim-toml', {'for': ['toml']}
" }}}

" fish {{{
Plug 'dag/vim-fish', {'for': ['fish']}
" }}}

" apex {{{
Plug 'ejholmes/vim-forcedotcom', {'for': ['apex']}
" }}}

" apex {{{
Plug 'derekwyatt/vim-scala', {'for': ['scala']}

Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
nmap <Space>ws <Plug>(coc-metals-expand-decoration)
" }}}

" }}}

call plug#end()
