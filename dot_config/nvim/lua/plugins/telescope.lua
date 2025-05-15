return {
	'nvim-telescope/telescope.nvim',
	lazy = false,
	tag = '0.1.8',
	keys = {
		{ "<leader>ff", desc = "Find files" },
		{ "<leader>fg", desc = "Live grep" },
		{ "<leader>fb", desc = "Buffers" },
		{ "<leader>fh", desc = "Help tags" },
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		'folke/which-key.nvim',
	},
	config = function()
		local telescope = require('telescope')
		local builtin = require('telescope.builtin')
		local wk = require('which-key')

		telescope.setup({})

		vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
	end
}
