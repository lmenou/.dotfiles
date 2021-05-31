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
set signcolumn=yes
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

" Env and colorscheme
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'itchyny/landscape.vim'
Plug 'nanotech/jellybeans.vim'

" Lint and Fix
Plug 'dense-analysis/ale'

" Fuzzy Finder and more
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" remap leader and localleader key to space bar
let mapleader = " "
let maplocalleader = " "

" Configuration of statusline
" reset statusline
set statusline=
" tail name of buffer
set statusline+=%t
" Current git branch
set statusline+=\ %{FugitiveStatusline()}
" modified or not
set statusline+=\ %m
" read only
set statusline+=%r
" help
set statusline+=%h
" preview or not
set statusline+=%w
" go to right side
set statusline+=%=
" type of file
set statusline+=%y
" line number
set statusline+=\ %l
" ratio
set statusline+=/
" total lines in buffer
set statusline+=%L,
" Column number
set statusline+=%c
" percentage through file
set statusline+=\ %p
" % symbol
set statusline+=%%

" Configuration of netrw
" Avoid banner, hit I to make it appear again
let g:netrw_banner = 0

" Configuration of vim-fugitive
nnoremap <Leader>g :G<CR>
nnoremap <Leader>dl :diffget //3<CR>
nnoremap <Leader>da :diffget //2<CR>

" Configuration of ALE
let g:ale_linters = {'python': ['jedils', 'flake8', 'pydocstyle']}
let g:ale_fixers = {
		\   '*': ['remove_trailing_lines', 'trim_whitespace'],
		\   'python': ['black', 'isort'],
		\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] says: %s [%severity%]'

nnoremap gd :ALEGoToDefinition<CR>
nnoremap K :ALEHover<CR>

" Using telescope
nnoremap <Leader>ff <CMD>Telescope find_files<CR>
nnoremap <Leader>fg <CMD>Telescope live_grep<CR>
nnoremap <Leader>fb <CMD>Telescope buffers<CR>

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
nnoremap [<Space> maO<ESC>`a
nnoremap ]<Space> mao<ESC>`a

" Option toggling
" Explanation: Hit yo? to toggle option
" Inspired from tpope's vim-unimpaired
function! s:toggle(op) abort
    return eval('&'.a:op) ? 'no'.a:op : a:op
endfunction

function! s:number_options() abort
  return &number && &relativenumber ? 'nonumber norelativenumber' : 'number relativenumber'
endfunction

nnoremap yos :setlocal <C-R>=<SID>toggle("spell")<CR><CR>
nnoremap yow :setlocal <C-R>=<SID>toggle("wrap")<CR><CR>
nnoremap yom :setlocal <C-R>=<SID>number_options()<CR><CR>

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

" Set python provider for nvim
let g:python3_host_prog = "~/opt/anaconda3/envs/clonebase/bin/python"
"
" Setting background
" Explanation: To use colorscheme correctly following options must be given
" set t_Co=256
set termguicolors
set bg=dark
" let g:gruvbox_contrast_dark = 'soft'
colorscheme jellybeans
