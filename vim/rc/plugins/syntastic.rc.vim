" syntastic

nnoremap <silent>,e :<C-u>Errors<CR>
"
let g:statline_syntastic = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1

let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['go', 'javascript'],
      \ 'passive_filetypes': ['tex']
      \}
let g:syntastic_go_checkers = ['golint']
let g:syntastic_javascript_checkers=['eslint']