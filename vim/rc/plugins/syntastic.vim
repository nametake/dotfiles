" syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['go', 'javascript'],
      \ 'passive_filetypes': ['tex']
      \}
let g:syntastic_go_checkers = ['go', 'golint']
