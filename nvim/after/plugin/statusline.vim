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


" Initialize
set statusline=
" Show mode
set statusline+=\ %{toupper(g:currentmode[mode()])}
" Where to cut
set statusline+=%<
" Name (tail) of the file
set statusline+=%t
" Help, modified, Read-only mode
set statusline+=\ %h%m%r
" Git Branch
set statusline+=%{FugitiveStatusline()}
" Switch to right side
set statusline+=%=
" Show LineNumber and Virtual Column number, Percentage
set statusline+=\ %-14.(%l:%L,%c%V%)\ %P
