" quickrun

let g:quickrun_config = {
      \  '_': {
      \    'runner': 'job',
      \    'outputter': 'quickfix',
      \    'outputter/quickfix/into': 1,
      \  },
      \}

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
