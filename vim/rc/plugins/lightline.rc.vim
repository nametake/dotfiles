" lightline
scriptencoding utf-8

let g:lightline = {
        \  'colorscheme': 'wombat',
        \  'mode_map': {'c': 'NORMAL'},
        \  'active': {
        \    'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \    'right': [
        \       [ 'lineinfo' ],
        \       [ 'percent' ],
        \       [ 'running', 'fileformat', 'fileencoding', 'filetype' ],
        \     ],
        \  },
        \  'component': {
        \  },
        \  'component_function': {
        \    'mode': 'LightlineMode',
        \    'gitbranch': 'FugitiveHead',
        \    'readonly': 'LightlineReadonly',
        \    'modified': 'LightlineModified',
        \    'filename': 'LightlineFilename',
        \    'fileformat': 'LightlineFileformat',
        \    'filetype': 'LightlineFiletype',
        \    'fileencoding': 'LightlineFileencoding',
        \    'running': 'LightlineIsRunningQuickrun',
        \  }
        \}

function! LightlineModified()
  return &filetype =~# 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
endfunction

function! LightlineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction

function! LightlineIsRunningQuickrun()
  return quickrun#is_running() ? 'Running quickrun...' : ''
endfunction

function! s:LoadingTextGenerator()
  let txt = [
        \  '\', '\', '\', '\',
        \  '|', '|', '|', '|',
        \  '/', '/', '/', '/',
        \  '-', '-', '-', '-',
        \]
  let i = 0
  function! s:text() closure
    let i = len(txt)-1 > i ? i+1 : 0
    echo i
    return txt[i]
  endfunction
  return funcref('s:text')
endfunction

let s:LoadingText = s:LoadingTextGenerator()
