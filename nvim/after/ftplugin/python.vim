" Vim ftplugin file
" Remap: Better Python Support
" File to make specific remap for Python

" Better default for python
set tabstop=4 
set softtabstop=4
set shiftwidth=4 
set expandtab

" Set the compiler
compiler flake8

" Format
nnoremap <Leader>fo :silent !black %<CR>

setlocal include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)
setlocal define=^\\s*\\\\(def\\\|class\\)\\>
setlocal includeexpr=PyInclude(v:fname)

function! PyInclude(fname)
  let parts = split(a:fname, ' import ')
  let l = parts[0]
  if len(parts) > 1
    let r = parts[1]
    let joined = join([l, r]. '.')
    let fp = substitute(joined, '\.', '/', 'g') . '.py'
    let found = glob(fp, 1)
    if len(found)
      return found
    endif
  endif
  return substitute(l, '\.', '/', 'g') . '.py'
endfunction
