-- ~/.config/nvim/lua/plugins/lspconfig.lua
-- LSP setup

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {},
      jdtls = {},
    },
  },
}
