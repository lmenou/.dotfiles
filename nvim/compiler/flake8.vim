" Vim compiler file
" Compiler: Flake8 for Python
" Set Compiler and respective ErrorFormat

if exists("current_compiler")
  finish
endif
let current_compiler = "flake8"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=flake8\ --format=default
CompilerSet errorformat=%A%f:%l:%c:\ %t%n\ %m,\ %A%f:%l:\ %t%n\ %m,\ %-G%.%#

" Previous Version
" CompilerSet errorformat=%A%f:%l:%c:%t:\ %m,%A%f:%l:\ %m,%A%f:(%l):\ %m,%-Z%p^%.%#,%-G%.%#
