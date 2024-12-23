-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- Gruvbox configuration

return {
  "ellisonleao/gruvbox.nvim",
  config = true,
  opts = {
    transparent_mode = true,
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines, and errors
    contrast = "hard", -- can be "hard", "soft", or empty string
    overrides = {},
    dim_inactive = false,
    palette_overrides = {
      background = "#1c1f26",
    },
  },
}
