autocmd MyAutoCmd BufWritePre * undojoin | Neoformat

" Javascript
let g:neoformat_javascript_prettiereslint = {
      \   'exe': './node_modules/.bin/prettier-eslint',
      \   'args': ['--stdin'],
      \   'stdin': 1,
      \ }

let g:neoformat_enabled_javascript = ['prettiereslint']
