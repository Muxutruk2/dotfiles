return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    -- Disable auto-installation of parsers
    auto_install = false,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

