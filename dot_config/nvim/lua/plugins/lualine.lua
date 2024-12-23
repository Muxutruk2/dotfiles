-- ~/.config/nvim/lua/plugins/lualine.lua
-- Lualine setup

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- Ensures it loads lazily
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = {
          function()
            return "😄"
          end,
        },
        -- You can add other sections or customize them as needed
      },
    })
  end,
}
