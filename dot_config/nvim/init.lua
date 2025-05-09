-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.o.background = "dark"
vim.cmd.colorscheme("catppuccin-mocha")

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({})

lspconfig.pylsp.setup({})
