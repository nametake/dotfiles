"--------------------
" yankround
"--------------------
let s:bundle = neobundle#get("yankround.vim")

function! s:bundle.hooks.on_source(bundle)
  " 保存する履歴数
  let g:yankround_max_history = 35

  " 保存ファイルの場所
  let g:yankround_dir = '~/.cache/yankround'
endfunction

" yankring key bind
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
