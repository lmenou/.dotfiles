" Vim ftplugin file
" Remap: Better Python Support
" File to make specific remap for Python

" Better default for python
set tabstop=8 
set softtabstop=4
set shiftwidth=4 

" Set the compiler
compiler flake8

" Specific remap for format
nnoremap <Leader>f :silent !black %<CR>
