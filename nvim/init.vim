" Neovim has strong defaults !

set number
set completeopt+=menuone
set relativenumber
set noexpandtab
set hidden
set signcolumn=no
set nowrap
set cursorline
set splitright
set encoding=utf-8
set ttimeout
set ttimeoutlen=10
set lazyredraw
set showcmd
set listchars+=eol:$
set noshowmode

" Grep faster and faster with RipGrep
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat+=%f:%l:%c:%m,%f:%l:%m

" To use tags in vim, set the path to find tags
" Explanation: Add all the directories up and up until HOME in
" the path for tags (meaning of the semicolon). Stop at the first hit
set tags+=./tags,tags;$HOME

" To use built-in fuzzy finder of vim
" Usage: Open vim in the root of the project and use :find in
" cmd mode + <TAB> completion
" Explanation: ** look to all subdirectories
set path+=**

" Ignore compiled files
" Python
set wildignore+=*.pyc
" LaTeX
set wildignore+=*.dvi,*.fls,*.pdf,*.aux,*.bbl
set wildignore+=*.log,*.run.xml,*.out,*.blg,*.bcf

call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'
" Comments
Plug 'tpope/vim-commentary'

" LSP config
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Tree-Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/landscape.vim'

call plug#end()

" Remap leader and localleader key to space bar
let mapleader = " "
let maplocalleader = " "

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
nnoremap [<Space> O<ESC>
nnoremap ]<Space> o<ESC>

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

" Set python provider for nvim
let g:python3_host_prog = '~/opt/anaconda3/envs/clonebase/bin/python'

" Set the source for LSP-autocomplete
" Explanation: if wants to use LSP protocol
lua require("lsp-config")

" Set the config for Tree-Sitter
lua require("treesitt-config")

" Set the LSP-autocomplete
" Explanation: without LSP protocol
" Give it a try
" lua require("autocomplete-config")

" Plugin development
let &runtimepath.=',~/Documents/LearningVim/nvim-luasync/'

" Setting background
" Explanation: To use colorscheme correctly following options must be given
set termguicolors
" set t_Co=256colors
set bg=dark
colorscheme landscape
