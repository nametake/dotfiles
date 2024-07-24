" vim-plug configurations

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd MyAutoCmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" View {{{
Plug 'rbtnn/vim-ambiwidth'

Plug 'itchyny/lightline.vim'
source ~/.vim/rc/plugins/lightline.rc.vim

" Plug 'itchyny/vim-cursorword'

" Plug 'Yggdroot/indentLine'
" let g:indentLine_fileTypeExclude = ['markdown', 'json']

if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()

  Plug 'nvim-treesitter/nvim-treesitter-context'
endif

" Plug 'tomasr/molokai'
Plug 'tamelion/neovim-molokai'
Plug 'sainnhe/sonokai'

Plug 'simeji/winresizer'

Plug 'biosugar0/vim-popyank'
nmap <Space>y <Plug>(PopYank)

Plug 'machakann/vim-highlightedyank'

Plug 'previm/previm'
let g:previm_open_cmd = 'open -a Google\ Chrome.app'

Plug 'schickling/vim-bufonly'
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

if has('nvim')
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
else
  Plug 'LunarWatcher/auto-pairs'
  let g:AutoPairsPrefix = '<M-p>'
endif


if has('nvim')
  Plug 'numToStr/Comment.nvim'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
else
  Plug 'tomtom/tcomment_vim'
endif

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'tpope/vim-abolish'

if has('nvim')
  Plug 'bfredl/nvim-miniyank'
  map p <Plug>(miniyank-autoput)
  map P <Plug>(miniyank-autoPut)
  map <C-n> <Plug>(miniyank-cycle)
  " for snippet jump
  smap p p
  smap P P
  smap <C-n> <Nop>
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

if has('nvim')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-live-grep-args.nvim'
  nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
  nnoremap <C-s> <cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>
  nnoremap <C-j> <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <Space>l <cmd>lua require('telescope.builtin').diagnostics()<cr>
  nnoremap gr <cmd>lua require('telescope.builtin').lsp_references({ jump_type='never' })<cr>
  nnoremap gd <cmd>lua require('telescope.builtin').lsp_definitions({ jump_type='never' })<cr>
  nnoremap gD <cmd>lua require('telescope.builtin').lsp_type_definitions({ jump_type='never' })<cr>
  nnoremap gi <cmd>lua require('telescope.builtin').lsp_implementations({ jump_type='never' })<cr>
  nnoremap gu <cmd>lua require('telescope.builtin').lsp_outgoing_calls({ jump_type='never' })<cr>
  nnoremap gl <cmd>lua require('telescope.builtin').lsp_incoming_calls({ jump_type='never' })<cr>
else
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
  nnoremap <C-p> :<C-u>Files<CR>
  nnoremap <C-j> :<C-u>Buffers<CR>
  nnoremap <C-s> :<C-u>Ag<CR>
endif


" Plug 'mileszs/ack.vim'
" nnoremap <C-s> :<C-u>Ack!<Space>
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
" let g:ack_autoclose = 1

Plug 'easymotion/vim-easymotion'
nmap f <Plug>(easymotion-fl)
vmap f <Plug>(easymotion-fl)
nmap F <Plug>(easymotion-Fl)
vmap F <Plug>(easymotion-Fl)

nmap s <Plug>(easymotion-s2)

nmap / <Plug>(easymotion-sn)
vmap / <Plug>(easymotion-sn)
nmap ? <Plug>(easymotion-sn)
vmap ? <Plug>(easymotion-sn)

" for snippet jump
smap f f
smap F F

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" if has('nvim')
"   Plug 'phaazon/hop.nvim'
"   nnoremap f <cmd>HopChar1CurrentLineAC<cr>
"   nnoremap F <cmd>HopChar1CurrentLineBC<cr>
"   nnoremap / <cmd>HopPattern<cr>
"   nnoremap ? <cmd>HopPatternBC<cr>
" endif
" }}}



" Shell {{{
Plug 'thinca/vim-localrc'

Plug 'thinca/vim-quickrun'
source ~/.vim/rc/plugins/quickrun.rc.vim
" }}}

" git {{{
Plug 'tpope/vim-fugitive'

autocmd MyAutoCmd FileType fugitive nmap <buffer> q gq
autocmd MyAutoCmd FileType fugitiveblame nmap <buffer> q gq
nnoremap <silent> g, :<C-u>below Git<CR>

  Plug 'tpope/vim-rhubarb'
  Plug 'rbong/vim-flog'
  nnoremap <silent> gt :<C-u>Flog<CR>
  autocmd MyAutoCmd FileType floggraph nmap <buffer> q gq

Plug 'airblade/vim-gitgutter'
" }}}

" nerdtree {{{
nmap <silent> <Plug>(nerdtree-cr) :<C-u>call nerdtree#ui_glue#invokeKeyMap("\<CR\>")<CR>
autocmd MyAutoCmd FileType nerdtree map <buffer> <CR> <Plug>(set-tag-stack-from-cache)<Plug>(nerdtree-cr)

Plug 'preservim/nerdtree'
nnoremap <silent> <Space>f <Plug>(cache-tag-stack-position):<C-u>NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen=1
" let g:NERDTreeSortOrder = ['[[extension]]']
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
  Plug 'ryanoasis/vim-devicons'
  let g:webdevicons_enable_nerdtree = 1

  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " let g:NERDTreeFileExtensionHighlightFullName = 1
  " let g:NERDTreeExactMatchHighlightFullName = 1
  " let g:NERDTreePatternMatchHighlightFullName = 1
  " let g:NERDTreeLimitedSyntax = 1
" }}}

" fern {{{
" Plug 'lambdalisue/vim-fern'
" nmap <Plug>(fern-action-open) :<C-u>Fern . -reveal=% -drawer -width=40 -toggle<CR>
" nnoremap <silent> <Space>f <Plug>(cache-tag-stack-position)<Plug>(fern-action-open)
"
" function! s:init_fern() abort
"   set nonumber
"   " Define
"   nmap <Plug>(fern-action--close-drawer) :<C-u>FernDo close -drawer -stay<CR>
"   nmap <buffer><silent> <Plug>(fern-action--open-and-close)
"         \ <Plug>(fern-action-open)
"         \ <Plug>(fern-action--close-drawer)
"
"   nmap <buffer><expr>
"         \ <Plug>(fern-action--expand-or-collapse)
"         \ fern#smart#leaf(
"         \   "\<Plug>(fern-action--open-and-close)",
"         \   "\<Plug>(fern-action-expand)",
"         \   "\<Plug>(fern-action-collapse)",
"         \ )
"
"   " Map
"   nmap <buffer> o <Plug>(fern-action-expand)
"   nmap <buffer> x <Plug>(fern-action-collapse)
"   nmap <buffer> <C-v> <Plug>(fern-action-open:vsplit)<Plug>(fern-action--close-drawer)
"   nmap <buffer> <C-x> <Plug>(fern-action-open:split)<Plug>(fern-action--close-drawer)
"   nmap <buffer> I <Plug>(fern-action-hidden)
"   nmap <buffer> r <Plug>(fern-action-reload)
"   nmap <buffer> D <Plug>(fern-action-remove)
"   nmap <silent><buffer> q :<C-u>bd<CR>
"   nmap <buffer><nowait> <CR> <Plug>(set-tag-stack-from-cache)<Plug>(fern-action--expand-or-collapse)
"
"   silent! nunmap <buffer><silent> z
" endfunction
"
" augroup fern-custom
"   autocmd! *
"   autocmd FileType fern call s:init_fern()
" augroup END
"
" Plug 'lambdalisue/vim-fern-git-status'
" Plug 'lambdalisue/vim-fern-mapping-git'
"
" Plug 'lambdalisue/vim-nerdfont'
" Plug 'lambdalisue/vim-fern-renderer-nerdfont'
" Plug 'lambdalisue/vim-glyph-palette'
" let g:fern#renderer = 'nerdfont'
" Plug 'nametake/vim-fern-comparator-extension'
" let g:fern#comparator = 'extension'
" let g:fern_comparator_extension#disable_compare_extension = 1
" let g:fern_comparator_extension#enable_go_test_grouping = 1
" }}}

" Outline {{{
Plug 'simrat39/symbols-outline.nvim'
nnoremap <silent> <Space>o :<C-u>SymbolsOutlineOpen<CR>

" }}}

" Snippets {{{
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
let g:vsnip_snippet_dir = '~/.vim/vsnip'
" }}}

" LSP {{{

" Plug 'github/copilot.vim'
" inoremap <C-m> <Plug>(copilot-suggest)

" let g:lsp_client = 'vim-lsp'
let g:lsp_client = 'nvim-lspconfig'

" vim-lsp {{{

if g:lsp_client ==# 'vim-lsp'
  " Auto complete
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'

  " LSP
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'nametake/vim-lsp-all-update'
  source ~/.vim/rc/plugins/vim-lsp.rc.vim

  " Snippets
  let g:vsnip_filetypes = {}
  let g:vsnip_filetypes.javascriptreact = ['javascript']
  let g:vsnip_filetypes.typescriptreact = ['typescript']

  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <CR> pumvisible()
        \ ? vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : asyncomplete#close_popup()
        \ : vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : "\<CR>"
  inoremap <expr> <C-k> pumvisible()
        \ ? vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : asyncomplete#close_popup()
        \ : vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : "\<C-k>"
  snoremap <expr> <C-k> pumvisible()
        \ ? vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : asyncomplete#close_popup()
        \ : vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : "\<C-k>"
  inoremap <expr> <C-j> pumvisible() ? "<Plug>(vsnip-jump-prev)" : "\<C-j>"
  snoremap <expr> <C-j> pumvisible() ? "<Plug>(vsnip-jump-prev)" : "\<C-j>"

  nmap s <Plug>(vsnip-select-text)
  xmap s <Plug>(vsnip-select-text)
  nmap S <Plug>(vsnip-cut-text)
  xmap S <Plug>(vsnip-cut-text)
endif
" }}}

" nvim-lsp-config {{{

if g:lsp_client ==# 'nvim-lspconfig' && has('nvim')
  Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'

  Plug 'hrsh7th/nvim-cmp'
  inoremap <C-x><C-o> <Cmd>lua require('cmp').complete()<CR>

  Plug 'lukas-reineke/lsp-format.nvim'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/cmp-vsnip'

  " for Golang
  Plug 'golang/vscode-go'

  Plug 'zbirenbaum/copilot.lua'
    Plug 'zbirenbaum/copilot-cmp'
endif
" }}}

" }}}

" Language {{{

" Go {{{
" Plug 'mattn/vim-goimports'
" let g:goimports_show_loclist = 0
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

" HTML,XML,JSX {{{

if has('nvim')
  Plug 'windwp/nvim-ts-autotag'
else
  Plug 'alvan/vim-closetag'
  let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascriptreact': 'jsxRegion',
      \ }
endif

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

" Kotlin {{{
Plug 'udalov/kotlin-vim'
" }}}

" }}}

call plug#end()

" check the specified plugin is installed
function! IsPlugged(name)
  if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
    return 1
  else
    return 0
  endif
endfunction
