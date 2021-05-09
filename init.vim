" TODO:
" Cursor and coc plugin.
" ----

" Source the vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Default like in .vimrc
set guicursor=

" Source coc config
source $HOME/.config/nvim/plug-config/coc.vim

" Set the source for Python support 
let g:python3_host_prog = "$HOME/opt/anaconda3/envs/clonebase/bin/python3"
