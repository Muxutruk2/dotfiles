return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				dark = "mocha",
			},
			transparent_background = true,
			show_end_of_buffer = true, -- show the ~ at the end of the buffer
			term_colors = false,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			-- integrations = {
			--   cmp = true,
			--   gitsigns = true,
			--   nvimtree = true,
			treesitter = true,
			telescope = true,
			which_key = true,
			lualine = true,
			--   mason = true,
			--   indent_blankline = {
			--     enabled = true,
			--     scope_color = "lavender", -- catppuccin color (eg. "lavender") or nil
			--     colored_indent_levels = false,
			--   },
			--   native_lsp = {
			--     enabled = true,
			--     underlines = {
			--       errors = { "undercurl" },
			--       hints = { "undercurl" },
			--       warnings = { "undercurl" },
			--       information = { "undercurl" },
			--     },
			--   },
			-- },
		})

		-- Set colorscheme
		vim.cmd.colorscheme "catppuccin"
	end,
}
