" Vim ftplugin file
" Remap: Better TeX Support
" File to make specific remap for TeX

" Better default for TeX
set tabstop=2 
set softtabstop=2
set shiftwidth=2 
set expandtab

" Set the compiler
compiler lacheck

" Set textwidth to 79
set textwidth=79

" Easy compiling
nnoremap <Leader>so :!make<CR>
