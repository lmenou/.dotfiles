" Vim syntax file
" Syntax: Better JSON Support

" Set Syntax highlightling for //
" This is done using RegeX
syntax match jsonComment "\v\/\/.+$+"
highlight link jsonComment Comment
