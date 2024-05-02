" Initialize

let s:is_windows = has('win32') || has('win64')

function! IsWindows() abort
  return s:is_windows
endfunction

function! IsMac() abort
  return !s:is_windows && !has('win32unix')
        \ && (has('mac') || has('macunix') || has('gui_macvim')
        \     || (!executable('xdg-open') && system('uname') =~? '^darwin'))
endfunction

function! ClearTagStack() abort
  let l:view = winsaveview()
  let l:tagstack = gettagstack()
  if len(l:tagstack['items']) > 0
    let l:tagstack['items'] = []
    let l:tagstack['length'] = 0
    let l:tagstack['curidx'] = 0
    call settagstack(win_getid(), l:tagstack)
  endif

  call winrestview(l:view)
endfunction

nmap <silent> <Plug>(tag-stack-clear) :<C-u>call ClearTagStack()<CR>
