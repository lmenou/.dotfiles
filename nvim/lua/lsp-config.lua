-- Set menu for completion
vim.o.completeopt="menuone,noselect"

--[[ Avoid the Pattern no found in statusbar
== set shortmess+=c
--]]
vim.opt.shortmess:append('c')

-- Language server themselves
servers = { "jedi_language_server", "texlab" }
local lsp=require('lspconfig')
for _, server in ipairs(servers) do
  lsp[server].setup{ on_attach = on_attach }
end

--[[ Disable diagnostic globally
Set this to an empty function to handle this
Best to use quickfix list
--]]
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end


-- Set option for completion
require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = false;
    tags = false;
    snippets_nvim = false;
    vsnip = false;
    ultisnips = false;
    treesitter = true;
  };
}
