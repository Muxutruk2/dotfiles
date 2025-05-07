-- ~/.config/nvim/lua/plugins/lspconfig.lua
-- LSP setup

return {
  {
    "williamboman/mason.nvim",
    enabled = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- prevent LazyVim from auto-configuring any servers
      servers = {},
      setup = {},
    },
  },
}
