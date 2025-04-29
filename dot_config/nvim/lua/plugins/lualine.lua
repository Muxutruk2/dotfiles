-- ~/.config/nvim/lua/plugins/lualine.lua
-- Lualine setup

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "catppuccin/nvim", -- Ensure this is installed
  },
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Set the Catppuccin flavor
    })

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "catppuccin", -- Use Catppuccin theme
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
        globalstatus = false,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          { "filename", path = 1 },
          { "filetype", colored = true },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "fugitive", "nvim-tree", "quickfix" },
    })
  end,
}
