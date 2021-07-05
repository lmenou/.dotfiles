" Neovim has strong defaults !

set number
set relativenumber
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
set scrolloff=5

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
