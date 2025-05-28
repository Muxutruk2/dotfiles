vim.g.mapleader = " "

require("config.lazy")

require("config.lsp").setup()

-- Colorscheme
vim.cmd([[colorscheme catppuccin-mocha]])

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Highlight current line
vim.opt.cursorline = true

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Tab and indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Case-insensitive searching unless \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always show sign column
vim.opt.signcolumn = "yes"

-- Better completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Set scroll offset
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
