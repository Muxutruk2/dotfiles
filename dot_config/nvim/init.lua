require("config.lazy")

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indenting
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true, silent = true })

-- Tab stuff
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.number = true
vim.opt.relativenumber = true

vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = true })

-- Buffer keybindngs
function ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match('^user') or name:match('^plugins') or name:match('^settings') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.fn.stdpath('config') .. '/init.lua')
  print("Config reloaded!")
end

vim.keymap.set("n", "<leader>rr", ReloadConfig, { desc = "Reload Neovim config" })

-- keymap("n", "<leader>bb", "<cmd>e #<cr>", opts)         -- switch to the last buffer
-- keymap("n", "<leader>bd", "<cmd>bd<cr>", opts)          -- delete current buffer
-- keymap("n", "<leader>bn", "<cmd>bnext<cr>", opts)       -- next buffer
-- keymap("n", "<leader>bp", "<cmd>bprevious<cr>", opts)   -- previous buffer
-- keymap("n", "<leader>bl", "<cmd>ls<cr>:b<Space>", opts) -- list buffers and allow choosing one
-- keymap("n", "<leader>bw", "<cmd>update<cr>", opts)      -- write current buffer
-- keymap("n", "<leader>ba", "<cmd>bufdo bd<cr>", opts)    -- close all buffers
-- keymap("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", opts)  -- close all except current buffer
-- keymap("n", "<leader>br", "<cmd>edit!<cr>", opts)       -- reload current buffer
