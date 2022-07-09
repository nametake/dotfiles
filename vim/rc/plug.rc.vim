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

if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

Plug 'tomasr/molokai'

Plug 'sainnhe/sonokai'

Plug 'simeji/winresizer'

Plug 'biosugar0/vim-popyank'
nmap <Space>y <Plug>(PopYank)
" }}}

" Text operation {{{
Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-jabraces'
  Plug 'sgur/vim-textobj-parameter'

Plug 'tpope/vim-surround'

Plug 'kana/vim-operator-user'

Plug 'kana/vim-operator-replace'
map _ <Plug>(operator-replace)

Plug 'tomtom/tcomment_vim'

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'tpope/vim-abolish'

if has('nvim')
  Plug 'bfredl/nvim-miniyank'
  map p <Plug>(miniyank-autoput)
  map P <Plug>(miniyank-autoPut)
  map <C-n> <Plug>(miniyank-cycle)
endif

Plug 'mattn/vim-sonictemplate'
let g:sonictemplate_vim_template_dir = [
      \  '~/.vim/template'
      \]
" }}}

" Search {{{
Plug 'ctrlpvim/ctrlp.vim'
nnoremap <silent> <C-i> :<C-u>CtrlPBuffer<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plug 'mileszs/ack.vim'
nnoremap <silent> <C-s> :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
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

" Shell {{{
Plug 'thinca/vim-localrc'

Plug 'thinca/vim-quickrun'
source ~/.vim/rc/plugins/quickrun.rc.vim
" }}}

" git {{{
Plug 'tpope/vim-fugitive'
autocmd MyAutoCmd FileType fugitiveblame nmap <buffer> q gq
command! Gac Gw|Gcommit

  Plug 'tpope/vim-rhubarb'

Plug 'airblade/vim-gitgutter'
" }}}

" nerdtree {{{
Plug 'preservim/nerdtree'
nnoremap <silent> <Space>f :<C-u>NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeSortOrder = ['\/$'] + map(range(0, 25), '"\\." . nr2char(char2nr("a") + v:val) . "[^.]*$"')

  Plug 'Xuyuanp/nerdtree-git-plugin'
  let g:NERDTreeGitStatusIndicatorMapCustom = {
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

  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " let g:NERDTreeFileExtensionHighlightFullName = 1
  " let g:NERDTreeExactMatchHighlightFullName = 1
  " let g:NERDTreePatternMatchHighlightFullName = 1
  " let g:NERDTreeLimitedSyntax = 1
" }}}

" lint/format {{{
" Plug 'dense-analysis/ale'
" source ~/.vim/rc/plugins/ale.rc.vim

" Plug 'sbdchd/neoformat'
" source ~/.vim/rc/plugins/neoformat.rc.vim
" }}}

" Complement {{{
Plug 'jiangmiao/auto-pairs'

" Auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'thomasfaingnaert/vim-lsp-snippets'
source ~/.vim/rc/plugins/vim-lsp.rc.vim

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-k>   vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
snoremap <expr> <C-k>   vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'

" let $NVIM_COC_LOG_LEVEL = 'debug'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" source ~/.vim/rc/plugins/coc.rc.vim
"
"   Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
"   Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" }}}

" Language {{{

" Go {{{
Plug 'mattn/vim-goimports'
" let g:goimports_cmd = 'gofumports'
" let g:goimports_simplify_cmd = 'gofumpt'
" let g:goimports_show_loclist = 0

" Plug 'fatih/vim-go', {'for': 'go', 'on': 'GoUpdateBinaries'}
" source ~/.vim/rc/plugins/vim-go.vim

" Plug 'arp242/gopher.vim', {'for': ['go']}
" let g:gopher_highlight = [
"       \   'string-fmt',
"       \   'string-spell',
"       \   'fold-block',
"       \   'fold-varconst',
"       \ ]
" let g:gopher_map = {
"       \   '_popup': 0,
"       \   '_imap_prefix': '<C-g>',
"       \   '_imap_ctrl': 1,
"       \ }
" nmap ; <Plug>(gopher-popup)

Plug 'buoto/gotests-vim', {'for': ['go']}

Plug 'nametake/ctrlp-goimport', {'for': ['go']}
nmap <C-g><C-i> <Plug>(ctrlp-goimport)

Plug 'nametake/vim-goiferr-snippets', {'for': ['go']}
" }}}

" Rust {{{
Plug 'rust-lang/rust.vim', {'for': ['rust']}

" Plug 'neoclide/coc-rls', {'for': ['rust'], 'do': 'yarn install --frozen-lockfile'}
" }}}

" JavaScript {{{
Plug 'pangloss/vim-javascript'
" }}}

" TypeScript {{{
" Plug 'neoclide/coc-tsserver',  {'do': 'yarn install --frozen-lockfile'}
"
" Plug 'neoclide/coc-eslint',  {'do': 'yarn install --frozen-lockfile'}
"
" Plug 'neoclide/coc-prettier',  {'do': 'yarn install --frozen-lockfile'}

" Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript', 'typescriptreact']}

" Plug 'maxmellon/vim-jsx-pretty', {'for': ['typescript.tsx', 'typescriptreact']}

" Plug 'ap/vim-css-color', {'for': ['typescript', 'typescriptreact']}

" Plug 'styled-components/vim-styled-components', {'for': ['typescript.tsx', 'typescriptreact'], 'branch': 'main'}
" autocmd MyAutoCmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd MyAutoCmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" }}}

" HTML,XML {{{
Plug 'alvan/vim-closetag', {'for': ['html', 'xml', 'typescript.tsx', 'typescriptreact']}
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

" Salesforce {{{
Plug 'ejholmes/vim-forcedotcom', {'for': ['apex']}
" }}}

" Scala {{{
Plug 'derekwyatt/vim-scala', {'for': ['scala']}

" Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
" nmap <Space>ws <Plug>(coc-metals-expand-decoration)
" }}}

" }}}

call plug#end()

if has('nvim')
  source ~/.vim/rc/plugins/nvim-treesitter.rc.vim
endif
