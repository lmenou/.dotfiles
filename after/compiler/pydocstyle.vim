" Vim compiler file
" Compiler:	Pydocstyle for Python
" Maintainer: lmenou
" Last Change: 2021 May 7
"
" This enable to set the compiler to pydocstyle for python file and to run 
" test for specific file or the entire test suite using :make

if exists("current_compiler")
  finish
endif
let current_compiler = "pydocstyle"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pydocstyle
CompilerSet errorformat=%A%f:%l\ %.%#:,%Z%.%#%t%n:\ %m
