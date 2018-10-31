let g:ale_linters = {
      \  'go': ['gobuild', 'gofmt', 'govet', 'staticcheck', 'golangci-lint'],
      \  'proto': ['prototool'],
      \ }

let g:ale_sign_column_always = 1

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

nmap <silent> <Space>j <Plug>(ale_next_wrap)
nmap <silent> <Space>k <Plug>(ale_previous_wrap)
