"---------------------------------------------------------------------------
" deoplete.nvim
"
" Key map {{{
" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr><C-g>       deoplete#refresh()
inoremap <expr><C-e>       deoplete#cancel_popup()
inoremap <silent><expr><C-l>       deoplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? deoplete#close_popup()."\<CR>" : "\<CR>"
endfunction
" }}}

" Complete sources {{{
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

call deoplete#custom#option({
      \   'smart_case': v:true,
      \   'camel_case': v:true,
      \   'skip_multibyte': v:true,
      \   'prev_completion_mode': 'length',
      \   'auto_preview': v:true,
      \   'on_insert_enter': v:false,
      \ })

call deoplete#custom#source('_', 'matchers', ['matcher_head'])

call deoplete#custom#source('_', 'converters', [
      \   'converter_remove_paren',
      \   'converter_remove_overlap',
      \   'matcher_length',
      \   'converter_truncate_abbr',
      \   'converter_truncate_menu',
      \   'converter_auto_delimiter',
      \ ])

call deoplete#custom#source('_', 'min_pattern_length', 1)
" }}}

" Input pattern {{{
call deoplete#custom#option('keyword_patterns', {
      \   '_': '[a-zA-Z_]\k*\(?',
      \   'tex': '\\?[a-zA-Z_]\w*',
      \   'ruby': '[a-zA-Z_]\w*[!?]?',
      \ })

call deoplete#custom#option('ignore_sources', {
      \   'go': ['buffer', 'tag']
      \ })

call deoplete#custom#option('omni_patterns', {
      \   'go': ['[^.[:digit:] *\t]\.\w*'],
      \ })

call deoplete#custom#var('omni', 'input_patterns', {
      \   'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
      \   'java': '[^. *\t]\.\w*',
      \   'php': '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?',
      \   'python': '[^. *\t]\.\w*\|\h\w*',
      \   'lua': '\w\+[.:]\|require\s*(\?["',
      \ })
" }}}
