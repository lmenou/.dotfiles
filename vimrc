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
set wildignore+=*.pyc
set showmode
set splitright
set scrolloff=5
set encoding=utf-8
set ttimeout
set ttimeoutlen=10
set lazyredraw
set showcmd

" To see lint and fix by ALE
" set signcolumn=yes

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
set path+=**,*,;

" Explanation: Completion or not ?
" Add dictionary
" set dictionary+=/usr/share/dict/words

" Set the cursor
set guicursor=

call plug#begin('~/.vim/plugged')


" Git
Plug 'tpope/vim-fugitive'
    " Configuration of vim-fugitive
    nnoremap <Leader>g :G<CR>
    nnoremap <Leader>dl :diffget //3<CR>
    nnoremap <Leader>da :diffget //2<CR>

" Lint and fix
Plug 'dense-analysis/ale'
    let g:ale_linters = {'python': ['flake8', 'pydocstyle']}
    let g:ale_fixers = {'python': ['black', 'isort']}
    let g:ale_fix_on_save=1
    nmap ]g <Plug>(ale_next_wrap)
    nmap [g <Plug>(ale_previous_wrap)

" Edit
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tmsvg/pear-tree'

" Env and colorscheme
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'itchyny/landscape.vim'
Plug 'nanotech/jellybeans.vim'

call plug#end()

" remap leader and localleader key to space bar
let mapleader = " "
let maplocalleader = " "

set statusline=%<%t\ %{FugitiveStatusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Configuration of netrw
" Avoid banner, hit I to make it appear again
let g:netrw_banner = 0
let g:netrw_bufsettings = 'nomodifiable nomodified number nobuflisted nowrap readonly'


" Editing and sourcing the vimrc faster
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
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

" Inserting new line above or below
nnoremap [<Space> O<ESC>x
nnoremap ]<Space> o<ESC>x

" Option toggling
" Explanation: Hit co? to toggle option
" Inspired from tpope's vim-unimpaired
function! s:toggle(op) abort
    return eval('&'.a:op) ? 'no'.a:op : a:op
endfunction

nnoremap cos :setlocal <C-R>=<SID>toggle("spell")<CR><CR>
nnoremap cow :setlocal <C-R>=<SID>toggle("wrap")<CR><CR>
nnoremap com :setlocal <C-R>=<SID>toggle("relativenumber")<CR><CR>
nnoremap con :setlocal <C-R>=<SID>toggle("number")<CR><CR>
nnoremap col :setlocal <C-R>=<SID>toggle("list")<CR><CR>

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

" Setting background
" Explanation: To use colorscheme correctly following options must be given
" set t_Co=256
set termguicolors
set bg=dark
" let g:gruvbox_contrast_dark = 'soft'
colorscheme jellybeans
