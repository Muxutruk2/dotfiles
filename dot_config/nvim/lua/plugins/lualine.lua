-- ~/.config/nvim/lua/plugins/lualine.lua
-- Lualine setup

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- Ensures it loads lazily
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true, -- Show icons in the statusline
        theme = "gruvbox", -- Theme for the statusline (you can replace it with other themes)
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "dashboard", "NvimTree", "Outline" }, -- Disabled filetypes
        globalstatus = false, -- Global status line (can be true for a single statusline in the bottom)
      },
      sections = {
        lualine_a = { "mode" }, -- Show current mode (normal, insert, etc.)
        lualine_b = {
          "branch", -- Git branch
          "diff", -- Git diff status (added, modified, removed)
          "diagnostics", -- Show diagnostics (errors, warnings, etc.)
        },
        lualine_c = {
          {
            "filename", -- Current file name
            path = 1, -- Display relative path (0 for full path)
          },
          {
            "filetype", -- File type (e.g., Python, Lua, etc.)
            colored = true, -- Make the file type colorized
          },
        },
        lualine_x = {
          "encoding", -- File encoding
          "fileformat", -- File format (LF, CRLF, etc.)
          "filetype", -- File type
        },
        lualine_y = {
          "progress", -- Current position in file (line/column)
        },
        lualine_z = { "location" }, -- Show current location (line and column)
      },
      extensions = { "fugitive", "nvim-tree", "quickfix" }, -- Enable extensions (e.g., fugitive for git, quickfix for diagnostics)
    })
  end,
}
