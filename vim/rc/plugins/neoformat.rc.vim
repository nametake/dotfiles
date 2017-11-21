" Javascript {{{
autocmd MyAutoCmd FileType javascript
      \ autocmd! MyAutoCmd BufWritePre <buffer> Neoformat

let g:neoformat_javascript_prettiereslint = {
      \   'exe': './node_modules/.bin/prettier-eslint',
      \   'args': ['--stdin'],
      \   'stdin': 1,
      \ }

let g:neoformat_enabled_javascript = ['prettiereslint']
" }}}


" HTML {{{
autocmd MyAutoCmd FileType html
      \ autocmd! MyAutoCmd BufWritePre <buffer> Neoformat

let g:neoformat_html_jsbeautify = {
      \   'exe': 'js-beautify',
      \   'args': ['-r', '--type html', '-s 2'],
      \   'replace': 1,
      \ }

let g:neoformat_enabled_html = ['jsbeautify']
" }}}


" JSON {{{
autocmd MyAutoCmd FileType json
      \ autocmd! MyAutoCmd BufWritePre <buffer>  Neoformat

let g:neoformat_enabled_json = ['jq']
" }}}
