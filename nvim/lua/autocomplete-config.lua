-- Set menu for completion
vim.o.completeopt="menuone,noselect"

--[[ Avoid the Pattern no found in statusbar
== set shortmess+=c
]]
vim.opt.shortmess:append('c')

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
    nvim_lsp = false;
    nvim_lua = true;
    spell = false;
    tags = true;
    vsnip = false;
    ultisnips = false;
    treesitter = false;
  };
}

