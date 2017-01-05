" vimtex - LaTeX plugin for Vim
"
" Maintainer: Karl Yngve Lervåg
" Email:      karl.yngve@gmail.com
"

function! vimtex#paths#relative_to_root(path) " {{{1
  " Input: Absolute path
  " Output: Path relative to vimtex root (unless absolute path is shorter)

  let l:path = substitute(a:path, b:vimtex.root . '/', '', '')
  return l:path
endfunction

" }}}1
function! vimtex#paths#relative(a, b) " {{{1
  let l:common = a:a
  let l:result = ''

  let l:target = a:b
  let l:work = substitute(l:target, '^' . l:common, '', '')
  while l:work ==# l:target
    let l:common = fnamemodify(l:common, ':h')
    let l:work = substitute(l:target, '^' . l:common, '', '')
    let l:result = empty(l:result) ? '..' : '../' . l:result
  endwhile

  if l:common == '/'
    return l:result . '/' . a:a
  endif

  let l:forward = substitute(l:target)
endfunction

" }}}1
