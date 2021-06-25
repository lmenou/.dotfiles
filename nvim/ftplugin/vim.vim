" Vim ftplugin file
" Remap: Better vim Support

" Better default for vim
set tabstop=8
set softtabstop=2
set shiftwidth=2 

" Automatically source .vimrc on save
augroup Vimrc
  autocmd!
  autocmd! BufWritePost init.vim source %
augroup END
