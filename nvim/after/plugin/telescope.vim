" Configuration of Telescope
" Using lua functions

" Using lua functions
nnoremap <Leader>ff <CMD>lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>rg <CMD>lua require('telescope.builtin').live_grep()<CR>
nnoremap <Leader>fb <CMD>lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>fh <CMD>lua require('telescope.builtin').help_tags()<CR>
