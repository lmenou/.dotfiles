-- [[TODO:
-- Swapping etc can be fun !!
-- ]]
-- Enable highlight in nvim-treesitter

-- Tree-Sitter config
require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  }, 

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true,
    disable = {},
  },

  ensure_installed = {
    "python",
    "latex",
    "bibtex",
    "c",
    "comment",
    "query",
    "json",
    "lua",
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
