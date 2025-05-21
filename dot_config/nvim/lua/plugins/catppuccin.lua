return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        treesitter = true,
        telescope = true,
        lsp_trouble = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
