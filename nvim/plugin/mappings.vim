" Make Y behave like other capitals D, C...
nnoremap Y y$

" Fast nohls
nnoremap <TAB><CR> :nohls<CR>

" Editing and sourcing the vimrc faster
nnoremap <Leader>ev :find $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Create Tag easily
nnoremap <Leader>t :silent !ctags -R .<CR>

" Moving in (local)quickfix list easily
nnoremap [Q :cfirst<CR>zz
nnoremap ]Q :clast<CR>zz
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz

nnoremap [L :lfirst<CR>zz
nnoremap ]L :llast<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

" Fast Make and compiler
nnoremap <Leader>c :compiler<Space>
nnoremap <Leader>m :silent make % <BAR> copen<CR><C-W>k
nnoremap <Leader>n :cclose <BAR> lclose<CR>

" Inserting new line above or below
nnoremap [<Space> :silent insert<CR><CR>.<CR>
nnoremap ]<Space> :silent append<CR><CR>.<CR>

" Fast Lexplore
" Explanation: This is due to the fact that
" LSP brings Lsp{function} in command-line
command! L Lexplore

" Switch to current directory for the file
" Locally
nnoremap \lcd :lcd %:p:h<CR>
" Globally
nnoremap \cd :cd %:p:h<CR>

" Access full file name
" Press ESC afterwards
nnoremap \fd :<C-R>=expand("%:p")<CR>
