-- ~/.config/nvim/lua/plugins/gitsigns.lua
-- GitSigns setup

return {
  "gitsigns.nvim",
  opts = {
    setup = function()
      require("gitsigns").setup({
        signs = {
          add = { hl = "GitSignsAdd", text = "▋" },
          change = { hl = "GitSignsChange", text = "▋" },
          delete = { hl = "GitSignsDelete", text = "▋" },
          topdelete = { hl = "GitSignsDelete", text = "▔" },
          changedelete = { hl = "GitSignsChange", text = "▋" },
        },
      })
    end,
  },
}
