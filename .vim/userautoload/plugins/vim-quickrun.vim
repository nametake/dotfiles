"--------------------
" vim-quickrun
"--------------------
nnoremap <Space>r :QuickRun<Cr>
let g:quickrun_config={
            \   '_':{
            \       'split': 'botright 8sp',
            \       'outputter/buffer/into': 1,
            \   },
            \   'htmldjango':{
            \       'command': 'google-chrome',
            \       'outputter/buffer/close_on_empty': 1
            \   },
            \   'tex': {
            \       'command': 'latexmk',
            \       'outputter' : 'error',
            \       'outputter/error/error' : 'buffer',
            \       'exec': ['%c -gg -pdfdvi %s', 'open %s:r.pdf']
            \   },
            \}

