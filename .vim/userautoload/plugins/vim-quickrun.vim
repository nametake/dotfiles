"--------------------
" vim-quickrun
"--------------------
if has('mac')
  let tex_exec_command = "'open %s:r.pdf', 'open /Applications/Utilities/Terminal.app'"
  let open_command = "open"
elseif has('unix')
  let tex_exec_command = ""
  let open_command = "xdg-open"
endif

let g:quickrun_config={
      \   '_':{
      \       'split': 'botright 8sp',
      \       'outputter/buffer/into': 1,
      \   },
      \   'html':{
      \       'command': open_command,
      \       'outputter/buffer/close_on_empty': 1,
      \   },
      \   'tex': {
      \       'command': 'latexmk',
      \       'outputter': 'error',
      \       'outputter/error/error': 'buffer',
      \       'cmdopt': '-pdfdvi',
      \       'exec': ['%c %o %s', tex_exec_command],
      \   },
      \   'arduino': {
      \       'command': 'ino',
      \       'exec': ['%c build', '%c upload'],
      \   },
      \}

nnoremap <Space>r :QuickRun<Cr>
