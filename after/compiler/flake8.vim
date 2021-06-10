" Vim compiler file
" Compiler:	Flake8 for Python
" Maintainer: lmenou
" Last Change: 2021 May 7
"
" This enable to set the compiler to flake8 for python file and to run 
" test for specific file or the entire test suite using :make

if exists("current_compiler")
  finish
endif
let current_compiler = "flake8"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=flake8\ --format=pylint
CompilerSet errorformat=%A%f:%l:%c:%t:\ %m,%A%f:%l:\ %m,%A%f:(%l):\ %m,%-Z%p^%.%#,%-G%.%#
