-- ~/.config/nvim/lua/plugins/mason.lua
-- Mason setup

return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
  },
  require("mason").setup({
    install_root_dir = vim.fn.stdpath("data") .. "/mason",
  }),
}
