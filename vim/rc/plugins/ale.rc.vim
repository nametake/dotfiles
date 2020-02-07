" ale

let g:ale_linters = {
      \  'go': ['gobuild', 'gofmt', 'govet', 'staticcheck', 'golangci-lint'],
      \  'markdown': ['remark_lint', 'textlint'],
      \  'dockerfile': ['hadolint'],
      \  'fish': ['fish'],
      \  'proto': ['prototool-lint'],
      \  'rust': ['rustc', 'cargo', 'rls'],
      \ }

let g:ale_sign_column_always = 1

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

let g:ale_go_staticcheck_lint_package = 1
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '--enable-all --disable lll --disable gochecknoglobals --disable gochecknoinits'

let g:ale_dockerfile_hadolint_use_docker = 'always'

nmap <silent> <Space>j <Plug>(ale_next_wrap)
nmap <silent> <Space>k <Plug>(ale_previous_wrap)
