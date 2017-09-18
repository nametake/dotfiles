autocmd MyAutoCmd BufWritePre * Neoformat

" Javascript
let g:neoformat_javascript_prettiereslint = {
      \   'exe': './node_modules/.bin/prettier-eslint',
      \   'args': ['--stdin'],
      \   'stdin': 1,
      \ }

let g:neoformat_enabled_javascript = ['prettiereslint']

let g:neoformat_html_jsbeautify = {
      \   'exe': 'js-beautify',
      \   'args': ['-r', '--type html', '-s 2'],
      \   'replace': 1,
      \ }

let g:neoformat_enabled_html = ['jsbeautify']
