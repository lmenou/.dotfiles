 " Here comes the plugins

call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'

" Comments
Plug 'tpope/vim-commentary'

" LSP and Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Tree-Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/landscape.vim'
Plug 'lifepillar/vim-gruvbox8'

call plug#end()

" Remap leader and localleader key to space bar
" Set this early to avoid confusion
let mapleader = " "
let maplocalleader = " "

" Set the python provider
let g:python_provider = "~/opt/anaconda3/envs/clonebase/bin/python"

" Plugin development
let &runtimepath.=',~/Documents/LearningVim/nvim-luamake/'
let g:quick_open = 1

" Setting background
" Explanation: To use colorscheme correctly following options 
" must be given
set termguicolors
" set t_Co=256colors
set bg=dark
colorscheme gruvbox8
