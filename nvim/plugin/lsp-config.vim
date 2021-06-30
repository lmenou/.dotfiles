" Setting map for the language server
" LSP config

" Ways of showing the completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <Leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <Leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>k <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <Leader>wa <cmd>lua vim.lsp.buf.add_workLeader_folder()<CR>
nnoremap <Leader>wr <cmd>lua vim.lsp.buf.remove_workLeader_folder()<CR>
nnoremap <Leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workLeader_folders()))<CR>
nnoremap <Leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <Leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <Leader>ac <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <Leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <Leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <Leader>[g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <Leader>]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <Leader>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <Leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
