" Vim ftplugin file
" Remap: Better TeX Support
" File to make specific remap for TeX

" Better default for TeX
set tabstop=8 
set softtabstop=4
set shiftwidth=4 

" Set the compiler
compiler lacheck

" Set textwidth to 79
set textwidth=79

" Easy compiling
nnoremap <Leader>s :!make<CR>
