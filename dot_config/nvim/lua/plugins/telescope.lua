return {
  "nvim-telescope/telescope.nvim",
  requires = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
          n = {
            ["q"] = actions.close,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },
    }

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
    keymap("n", "<leader><space>", "<cmd>Telescope find_files<cr>", opts)
    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
  end,
}
