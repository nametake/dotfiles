"--------------------
" vim-quickrun
"--------------------
if has('mac')
  let tex_exec_command = "'open %s:r.pdf', 'open /Applications/Utilities/Terminal.app'"
elseif has('unix')
  let tex_exec_command = ""
endif

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
      \       'exec': ['%c %o %s', tex_exec_command],
      \   },
      \   'markdown':{
      \       'command': 'google-chrome',
      \       'outputter/buffer/close_on_empty': 1,
      \   },
      \}

nnoremap <Space>r :QuickRun<Cr>
