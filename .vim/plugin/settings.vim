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
set novisualbell
set signcolumn=no
set nowrap
set nobackup
set noswapfile
set nowritebackup
set autoread
set cursorline
set backspace=indent,eol,start
set wildmenu
set wildignore+=*.pyc
set showmode
set splitright
set scrolloff=5
set encoding=utf-8
set ttimeout
set ttimeoutlen=10
set lazyredraw
set showcmd

" Grep faster and faster with RipGrep
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat+=%f:%l:%c:%m,%f:%l:%m

" To use tags in vim, set the path to find tags
" Explanation: Add all the directories up and up until HOME in
" the path for tags (meaning of the semicolon). Stop at the first hit
set tags=./tags,tags;$HOME

" To use built-in fuzzy finder of vim
" Usage: Open vim in the root of the project and use :find in
" cmd mode + <TAB> completion
" Explanation: ** look to all subdirectories
set path+=**

" Explanation: Completion or not ?
" Add dictionary
" set dictionary+=/usr/share/dict/words

" Set the cursor
set guicursor=
