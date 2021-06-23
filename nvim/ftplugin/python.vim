" Vim ftplugin file
" Remap: Better Python Support
" File to make specific remap for Python

" Ignore compiled files
set wildignore+=*.pyc

" Set the compiler
compiler flake8

" Specific remap for format
nnoremap <Leader>f :silent !black %<CR>

" Set the include ?
" Explanation: Recognize import files
" Use of RegeX to recognize the name of the import file
set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)

" Conversion to proper file path for import
function! PyInclude(fname)
    let parts = split(a:fname, ' import ')
    let l = parts[0]
    if len(parts) > 1
        let r = parts[1]
        let joined = join([l, r], '.')
        let fp = substitute(joined, '\.', '/', 'g'). '.py'
        let found = glob(fp, 1)
        if len(found)
            return found
        endif
    endif
    return substitute(l, '\.', '/', 'g'). '.py' 
endfunction

" Set the prg for the import
" Explanation: See the occurence with :ij or the def with :dj
" Help: :help :ij or :help :dj
setlocal includeexpr=PyInclude(v:fname)
setlocal define=^\\s*\\<\\(def\\\|class\\)\\>
