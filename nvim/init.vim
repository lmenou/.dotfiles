" What is commented out are nvim default !
" syntax on

set number
set relativenumber
" set autoindent
set smartindent
" set incsearch
" set hlsearch
" set laststatus=2
set tabstop=8
set softtabstop=4
set shiftwidth=4
" set smarttab
set expandtab
set hidden
" set noerrorbells
" set visualbell
set signcolumn=no
set nowrap
" set nobackup
" set noswapfile
" set nowritebackup
" set autoread
set cursorline
" set backspace=indent,eol,start
" set wildmenu
set splitright
set scrolloff=5
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

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

" Colorschemes
Plug 'morhetz/gruvbox'
    let g:gruvbox_contrast_dark = 'soft'
Plug 'arcticicestudio/nord-vim'
Plug 'tyrannicaltoucan/vim-quantum'
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

" Set python provider for nvim
let g:python3_host_prog = "~/opt/anaconda3/envs/clonebase/bin/python"

" Editing and sourcing the vimrc faster
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Create Tag easily
nnoremap <Leader>t :silent !ctags -R .<CR>

" Moving in (local)quickfix list easily
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz

nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

" Fast Make and compiler
nnoremap <Leader>c :compiler<Space>
nnoremap <Leader>m :silent make % <BAR> copen<CR><C-W>k
nnoremap <Leader>n :cclose <BAR> lclose<CR>

" Inserting new line above or below
nnoremap [<Space> O<ESC>x
nnoremap ]<Space> o<ESC>x

" Setting background
" Explanation: To use colorscheme correctly following options must be given
set termguicolors
set bg=dark
colorscheme landscape
