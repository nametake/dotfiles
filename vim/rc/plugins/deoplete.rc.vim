"---------------------------------------------------------------------------
" deoplete.nvim
"

" Key map {{{
"
" <C-h>, <BS>: close popup and delete backword char.
imap <expr><C-h> deoplete#smart_close_popup()
imap <expr><BS> pumvisible() ? deoplete#smart_close_popup()."\<BS>" : "\<BS>"

" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}
" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"


inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? deoplete#close_popup()."\<CR>" : "\<CR>"
endfunction
" }}}

" Complete sources {{{
call deoplete#custom#option({
      \   'smart_case': v:true,
      \   'camel_case': v:true,
      \   'skip_multibyte': v:true,
      \   'prev_completion_mode': 'length',
      \   'auto_preview': v:true,
      \ })

call deoplete#custom#source('_', 'matchers',
      \ ['matcher_fuzzy', 'matcher_length'])

call deoplete#custom#option('ignore_sources', {
      \   'go': ['buffer', 'tag', 'around']
      \ })
" }}}

" Input pattern {{{
call deoplete#custom#option('keyword_patterns', {
      \   '_': '[a-zA-Z_]\k*\(?',
      \   'tex': '\\?[a-zA-Z_]\w*',
      \   'ruby': '[a-zA-Z_]\w*[!?]?',
      \ })

call deoplete#custom#option('omni_patterns', {
      \   'go': '[^.[:digit:] *\t]\.\w*',
      \ })

call deoplete#custom#var('omni', 'input_patterns', {
      \   'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
      \   'java': '[^. *\t]\.\w*',
      \   'php': '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?',
      \   'python': '[^. *\t]\.\w*\|\h\w*',
      \   'lua': '\w\+[.:]\|require\s*(\?["',
      \ })
" }}}
