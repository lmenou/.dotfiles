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
set signcolumn=yes
set nowrap
set nobackup
set noswapfile
set nowritebackup
set autoread
set cursorline
set backspace=indent,eol,start
set wildmenu
set wildignore+=*.pyc
set noshowmode
set splitright
set scrolloff=5
set encoding=utf-8
set ttimeout
set ttimeoutlen=10
set lazyredraw
set showcmd

" Explanation: Completion or not ?
" Add dictionary
" set dictionary+=/usr/share/dict/words
" Use code omnicompletion from ALE
" set omnifunc=ale#completion#OmniFunc

call plug#begin('~/.vim/plugged')

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Edit
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tmsvg/pear-tree'
" Explanation: I added a map here, hence the fork
" Type yom ]om [om in normal mode to toggle the number + relativenumber
Plug 'lmenou/vim-unimpaired', {'branch': 'dev'}

" Env and colorscheme
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'itchyny/landscape.vim'
Plug 'nanotech/jellybeans.vim'

" Integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'

call plug#end()

" Mode Settings
" Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI.="\e[2 q" "SI = INSERT mode
let &t_SR.="\e[2 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" Enable syntax highlighting in JSON
autocmd FileType json syntax match Comment +\/\/.\+$+

" remap leader and localleader key to space bar
let mapleader = " "
let maplocalleader = " "

" To use tags in vim, set the path to find tags
" Explanation: Add all the directories up and up until HOME in
" the path for tags (meaning of the semicolon). Stop at the first hit
set tags=./tags,tags;$HOME

" To use built-in fuzzy finder of vim
" Usage: Open vim in the root of the project and use :find in
" cmd mode + <TAB> completion
" Explanation: ** look to all subdirectories
set path+=**

" To use netrw easily
" TODO: Figure out hiding list
" Explanation: Opening current or root hitting - or +
let g:netrw_bufsettings = 'nomodifiable nomodified number nobuflisted nowrap readonly'
let g:netrw_list_hide= '.*\.pyc$, *\DS_Store$'
nnoremap + :Explore<CR>
nnoremap - :Explore.<CR>


" FZF settings
" Explanation: Window at the bottom
" let g:fzf_layout = { 'down': '50%' }
" Explanation: Popup window at the center of the screen
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>h :FZF ~<CR>

" Configuration of gv.vim
" Explanation: To show all !
nnoremap <Leader>gl :GV --all<CR>

" Set lightline
let g:lightline = {
		\ 'colorscheme' : 'quantum',
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

" Set nohighlight after search
nnoremap <TAB><CR> :nohl<CR>

" Shortcut for tab creation
nnoremap <Leader>t :tabe<CR>

" Resize the panes in vim
" Usage: Better with qwerty keyboard, visual mapping
" to +, -(horizontal), >, <(vertical)
nnoremap <Leader>= :resize +10<CR>
nnoremap <Leader>- :resize -10<CR>
nnoremap <Leader>, :vertical:resize -10<CR>
nnoremap <Leader>. :vertical:resize +10<CR>

" Configuration of vim-tmux-runner
let g:VtrUseVtrMaps = 1

let g:vtr_filetype_runner_overrides = {
  \ 'python': 'python -W ignore {file}',
  \ }

" Configuration of vim-fugitive
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>dl :diffget //3<CR>
nnoremap <Leader>da :diffget //2<CR>

" Configuration of ALE
let g:ale_linters = {'python': ['jedils', 'flake8', 'pycodestyle', 'pydocstyle']}
let g:ale_fixers = {
		\   '*': ['remove_trailing_lines', 'trim_whitespace'],
		\   'python': ['autopep8', 'isort'],
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
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)

" Editing and sourcing the vimrc faster
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

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
colorscheme quantum
