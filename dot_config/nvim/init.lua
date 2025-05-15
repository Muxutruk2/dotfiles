vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = { 'unnamed', 'unnamedplus' }

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.number = true         -- Show the absolute line number on the current line

require("config.lazy")

require("luasnip.loaders.from_vscode").lazy_load()

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffer keybindings under <leader>b
map("n", "<leader>bb", "<cmd>buffer #<CR>", { desc = "Switch to last buffer", unpack(opts) })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete current buffer", unpack(opts) })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer", unpack(opts) })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer", unpack(opts) })
map("n", "<leader>bl", "<cmd>ls<CR>", { desc = "List buffers", unpack(opts) })
map("n", "<leader>bw", "<cmd>update<CR>", { desc = "Write buffer", unpack(opts) })

-- Optionally: Close all buffers except current
map("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Only keep current buffer", unpack(opts) })
