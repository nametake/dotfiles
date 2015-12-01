"--------------------
" memolist.vim
"--------------------1
let g:memolist_path = "~/Dropbox/Memo/"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 1
let g:memolist_vimfiler = 1
let g:memolist_vimfiler_option = "-toggle"

map <Space>mn  :MemoNew<CR>
map <Space>ml  :MemoList<CR>
map <Space>mg  :MemoGrep<CR>

