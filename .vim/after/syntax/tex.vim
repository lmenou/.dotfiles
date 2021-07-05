" Vim syntax file
" Syntax: Better TeX Support

" Define new Math Zone for TeX
" MathZone: align
call TexNewMathZone("O","align",1)

" Set Syntax highlightling for \@
" This is done using RegeX
syntax match texStatement "\v\\\@"
highlight link texStatement Statement
