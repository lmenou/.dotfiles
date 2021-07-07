--[[ TODO:
 Configure properly windows for hover and
 signature help. Move Maps to Lua
--]]
-- Set menu for completion
vim.o.completeopt="menuone,noselect"

--[[ Avoid the Pattern no found in statusbar
--== set shortmess+=c
--]]
vim.opt.shortmess:append('c')

-- Ways of showing the completion
-- TODO: Verify if it works
vim.g.completion_matching_strategy_list="exact, substring, fuzzy"

-- Configuration compe
require'compe'.setup {
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
    treesitter = true;
    vsnip = false;
    ultisnips = false;
    luasnip = false;
  };
}
