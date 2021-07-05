-- [[TODO:
-- Swapping etc can be fun !!
-- ]]
-- Enable highlight in nvim-treesitter

-- Tree-Sitter config
require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true,
    disable = {},
  }, 

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Leader>gn",
      node_incremental = "<Leader>gnn",
      scope_incremental = "<Leader>gnc",
      node_decremental = "<Leader>gnp",
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
