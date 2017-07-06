let g:ale_linters = {
      \  'go': ['gofmt', 'goling', 'go vet', 'go build', 'staticcheck']
      \ }

let g:ale_sign_column_always = 1

nmap <silent> <Space>j <Plug>(ale_next_wrap)
nmap <silent> <Space>k <Plug>(ale_previous_wrap)
