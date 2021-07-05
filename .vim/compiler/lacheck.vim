" Vim compiler file
" Compiler: lacheck for Latex
" Set Compiler and respective ErrorFormat

if exists("current_compiler")
  finish
endif
let current_compiler = "lacheck"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=lacheck
CompilerSet errorformat="%f"\,\ line\ %l:\ %m
