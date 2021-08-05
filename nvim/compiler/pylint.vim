" Vim compiler file
" Compiler: Pylint for Python
" Set Compiler and respective ErrorFormat

if exists("current_compiler")
  finish
endif
let current_compiler = "pylint"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pylint
CompilerSet errorformat=%A%f:%l:%c:\ %m,%A%f:%l:\ %m,%A%f:(%l):\ %m,%-Z%p^%.%#,%-G%.%#
