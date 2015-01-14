"--------------------
" vim-go
"--------------------
let g:go_bin_path = expand("~/.go/bin")

" Disable opening browser after posting to your snippet to 'play.golang.org'
let g:go_play_open_browser = 0

" Enable goimports to automatically insert import paths instead of 'gofmt'
let g:go_fmt_command = "goimports"

" Disable auto fmt on save:
let g:go_fmt_autosave = 0

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
