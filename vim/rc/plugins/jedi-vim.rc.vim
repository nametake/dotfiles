" jedi-vim

let g:jedi#auto_initialization = 0

let g:jedi#auto_vim_configuration = 0

let g:jedi#popup_on_dot = 0

let g:jedi#show_call_signatures = 0

let g:jedi#use_splits_not_buffers = "left"

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:jedi#completions_enabled = 0

let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

let g:jedi#squelch_py_warning = 0

setlocal omnifunc=jedi#completions
