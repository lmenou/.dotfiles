" Vim ftplugin file
" Remap: Better TeX Support
" File to make specific remap for TeX

" Set the compiler
compiler lacheck

" Set textwidth to 79
set textwidth=79

" Easy compiling
nnoremap <Leader>s :!make<CR>
