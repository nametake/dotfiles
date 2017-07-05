let g:ale_linters = {
      \  'go': ['gofmt', 'goling', 'go vet', 'go build', 'staticcheck']
      \ }

nmap <silent> <Space>j <Plug>(ale_next_wrap)
nmap <silent> <Space>k <Plug>(ale_previous_wrap)
