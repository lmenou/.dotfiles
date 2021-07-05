" Editing and sourcing the vimrc faster
nnoremap <Leader>ev :find $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Moving in (local)quickfix list easily
nnoremap [Q :cfirst<CR>zz
nnoremap ]Q :clast<CR>zz
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz

nnoremap [L :lfirst<CR>zz
nnoremap ]L :llast<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

" Make Y behave like other capitals D, C...
nnoremap Y y$

" Fast nohls
nnoremap <TAB><CR> :nohls<CR>

" Fast Lexplore
command! L Lexplore

" Open new line above or below
nnoremap [<Space> :insert<CR><CR>.<CR>
nnoremap ]<Space> :append<CR><CR>.<CR>

" Switch to current directory for the file
" Locally
nnoremap \lcd :lcd %:p:h<CR>
" Globally
nnoremap \cd :cd %:p:h<CR>

" Access full file name
" Press ESC afterwards
nnoremap \fd :<C-R>=expand("%:p")<CR>
