" quickrun
"
if has('mac')
  let tex_exec_command = "open %s:r.pdf; open /Applications/Utilities/Terminal.app"
  let open_command = "open"
elseif has('unix')
  let tex_exec_command = ""
  let open_command = "xdg-open"
endif

let g:quickrun_config={
      \   '_':{
      \       'split': 'botright 8sp',
      \       'runner': 'vimproc',
      \       'outputter' : 'error',
      \       'outputter/error/success' : 'buffer',
      \       'outputter/error/error'   : 'quickfix',
      \       'outputter/buffer/split'  : ':rightbelow 8sp',
      \       'outputter/buffer/into': 1,
      \       'outputter/buffer/close_on_empty' : 1,
      \   },
      \   'go': {
      \       'command': 'go',
      \       'exec': ['%c test'],
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
      \       'runner': "vimproc",
      \       'exec': ['%c %o %s', tex_exec_command],
      \   },
      \   'arduino': {
      \       'command': 'ino',
      \       'exec': ['%c build', '%c upload'],
      \   },
      \}

nnoremap <Space>r :QuickRun<Cr>
autocmd MyAutoCmd BufWritePost,FileWritePost *.go QuickRun go
