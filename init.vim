syntax on

set number
set relativenumber
set autoindent
set smartindent
set incsearch
set hlsearch
set laststatus=2
set tabstop=8
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set hidden
set noerrorbells
set visualbell
set signcolumn=no
set nowrap
set nobackup
set noswapfile
set nowritebackup
set autoread
set cursorline
set backspace=indent,eol,start
set wildmenu
set wildoptions=""
set wildignore+=*.pyc
set noshowmode
set splitright
set scrolloff=5
set encoding=utf-8
set ttimeout
set ttimeoutlen=10
set lazyredraw
set showcmd
" To use tags in vim, set the path to find tags
" Explanation: Add all the directories up and up until HOME in
" the path for tags (meaning of the semicolon). Stop at the first hit
set tags=./tags,tags;$HOME

" To use built-in fuzzy finder of vim
" Usage: Open vim in the root of the project and use :find in
" cmd mode + <TAB> completion
" Explanation: ** look to all subdirectories
set path+=**,*,;

" Explanation: Completion or not ?
" Add dictionary
" set dictionary+=/usr/share/dict/words
" Use code omnicompletion from ALE
" set omnifunc=ale#completion#OmniFunc

" Set the cursor
set guicursor=

call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'

" Edit
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tmsvg/pear-tree'

" Env and colorscheme
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'itchyny/landscape.vim'
Plug 'nanotech/jellybeans.vim'

call plug#end()

" remap leader and localleader key to space bar
let mapleader = " "
let maplocalleader = " "

" Set lightline
let g:lightline = {
		\ 'colorscheme' : 'jellybeans',
		\ 'active': {
		\   'left': [ [ 'mode', 'paste' ],
		\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
		\ },
		\ 'component_function': {
		\   'gitbranch': 'FugitiveHead',
		\   'fileformat': 'LightlineFileformat',
		\   'filetype': 'LightlineFiletype',
		\ },
		\ }

" Configuration of vim-fugitive
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>dl :diffget //3<CR>
nnoremap <Leader>da :diffget //2<CR>

" Editing and sourcing the vimrc faster
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Moving in quickfix list easily
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

" Make Y behave like other capitals D, C...
nnoremap Y y$

" Fast nohls
nnoremap <TAB><CR> :nohls<CR>

" Running Macro over an entire Visual bloc
" Usage: Select a visual bloc and run @register over the bloc
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

let g:python3_host_prog = "/Users/lmenou/opt/anaconda3/envs/clonebase/bin/python3"
"
" Setting background
" Explanation: To use colorscheme correctly following options must be given
" set t_Co=256
set termguicolors
set bg=dark
" let g:gruvbox_contrast_dark = 'soft'
colorscheme jellybeans
