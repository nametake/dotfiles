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
            \       'outputter/buffer/close_on_empty': 1,
            \   },
            \   'tex': {
            \       'command': 'latexmk',
            \       'outputter': 'error',
            \       'outputter/error/error': 'buffer',
            \       'cmdopt': '-pdfdvi',
            \       'exec': ['%c %o %s', 'open %s:r.pdf', 'open /Applications/Utilities/Terminal.app'],
            \   },
            \}

