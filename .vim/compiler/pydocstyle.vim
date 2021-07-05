" Vim compiler file
" Compiler: Pydocstyle for Python
" Set Compiler and respective ErrorFormat

if exists("current_compiler")
  finish
endif
let current_compiler = "pydocstyle"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pydocstyle
CompilerSet errorformat=%W%f:%l\ %.%#:,%+C\ %m
