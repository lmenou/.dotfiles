" Function for the statusline

" Show the current mode used
let g:currentmode={
       \ 'n'  : '[ NORMAL ] ',
       \ 'v'  : '[ VISUAL ] ',
       \ 'V'  : '[ V·Line ] ',
       \ "\<C-V>" : '[ V·BLOCK ] ',
       \ 'i'  : '[ INSERT ] ',
       \ 'R'  : '[ REPLACE ] ',
       \ 'Rv' : '[ V·REPLACE ] ',
       \ 'c'  : '[ COMMAND ] ',
       \ 't'  : '[ TERMINAL ] ',
       \ 'r'  : '[ SUBSTITUTE ] ',
       \}

" Get the Git branch
" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" Get the Git branch in the statusline !
" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

" Initialize
set statusline=
" Show mode
set statusline+=\ %{toupper(g:currentmode[mode()])}
" Where to cut
set statusline+=%<
" Name (tail) of the file
set statusline+=%t
" Git branch
set statusline+=\ %{FugitiveStatusline()}
" Help, modified, Read-only mode
set statusline+=\ %h%m%r
" Switch to right side
set statusline+=%=
" Show filetype
" set statusline+=%-8.(%y%)
" Show fileencoding
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" Show fileformat
" set statusline+=\ \[%{&fileformat}\]
" Show LineNumber and Virtual Column number, Percentage
set statusline+=\ %-14.(%l:%L,%c%V%)\ %P
