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
    inverse = true, 
    contrast = "hard", 
    overrides = {},
    dim_inactive = false,
  },
}
