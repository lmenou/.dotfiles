" Vim ftplugin file
" Remap: Better Python Support
" File to make specific remap for Python

" Better default for python
set tabstop=4 
set softtabstop=4
set shiftwidth=4 
set expandtab

" Set the compiler
compiler flake8

" Specific remap for format
nnoremap <Leader>fo :silent !black %<CR>
