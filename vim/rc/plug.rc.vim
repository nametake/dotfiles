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
  Plug 'kana/vim-textobj-function'
  Plug 'kana/vim-textobj-jabraces'
  Plug 'sgur/vim-textobj-parameter'
  Plug 'Julian/vim-textobj-variable-segment'

Plug 'bkad/CamelCaseMotion'
let g:camelcasemotion_key = '<leader>'

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
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mattn/ctrlp-matchfuzzy'
" nnoremap <C-j> :<C-u>CtrlPBuffer<CR>
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <C-p> :<C-u>Files<CR>
nnoremap <C-j> :<C-u>Buffers<CR>
nnoremap <C-s> :<C-u>Ag<CR>

" Plug 'mileszs/ack.vim'
" nnoremap <C-s> :<C-u>Ack!<Space>
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
" let g:ack_autoclose = 1

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
let g:NERDTreeMapOpenSplit='<C-x>'
let g:NERDTreeMapOpenVSplit='<C-v>'

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

" Outline {{{
Plug 'liuchengxu/vista.vim'
nnoremap <silent> <Space>o :<C-u>Vista<CR>
let g:vista_default_executive = 'vim_lsp'
let g:vista#renderer#enable_icon = 0
" }}}

" LSP {{{
Plug 'jiangmiao/auto-pairs'

if has('nvim')
  Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  let g:vsnip_snippet_dir = '~/.vim/vsnip'

  " for Golang
  Plug 'golang/vscode-go'

  Plug 'rafamadriz/friendly-snippets'
endif

" " Auto complete
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
"
" " LSP
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
"   Plug 'nametake/vim-lsp-all-update'
" source ~/.vim/rc/plugins/vim-lsp.rc.vim
"
" " Snippets
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'rafamadriz/friendly-snippets'
" let g:vsnip_snippet_dir = '~/.vim/vsnip'
"
" let g:vsnip_filetypes = {}
" let g:vsnip_filetypes.javascriptreact = ['javascript']
" let g:vsnip_filetypes.typescriptreact = ['typescript']
"
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR> pumvisible()
"       \ ? vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : asyncomplete#close_popup()
"       \ : vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : "\<CR>"
" inoremap <expr> <C-k> pumvisible()
"       \ ? vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : asyncomplete#close_popup()
"       \ : vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : "\<C-k>"
" snoremap <expr> <C-k> pumvisible()
"       \ ? vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : asyncomplete#close_popup()
"       \ : vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : "\<C-k>"
"
" nmap s <Plug>(vsnip-select-text)
" xmap s <Plug>(vsnip-select-text)
" nmap S <Plug>(vsnip-cut-text)
" xmap S <Plug>(vsnip-cut-text)
" " }}}

" Language {{{

" Go {{{
Plug 'mattn/vim-goimports'
let g:goimports_show_loclist = 0
" let g:goimports_cmd = 'gofumports'
" let g:goimports_simplify_cmd = 'gofumpt'

Plug 'nametake/vim-goiferr-snippets', {'for': ['go']}
Plug 'fatih/vim-go', {'for': ['go'], 'do': ':GoUpdateBinaries'}
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_diagnostics_enabled = 0
let g:go_doc_keywordprg_enabled = 0

" }}}

" Rust {{{
Plug 'rust-lang/rust.vim', {'for': ['rust']}
" }}}

" JavaScript {{{
Plug 'pangloss/vim-javascript'
" }}}

" TypeScript {{{
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
" }}}

" }}}

call plug#end()

if has('nvim')
  source ~/.vim/rc/plugins/nvim-treesitter.rc.vim
endif

" check the specified plugin is installed
function! IsPlugged(name)
  if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
    return 1
  else
    return 0
  endif
endfunction
