-- ~/.config/nvim/lua/plugins/markdown.lua
-- Markdown configuration

return {
	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	},

	-- Better syntax highlighting
	{
		"plasticboy/vim-markdown",
		dependencies = { "godlygeek/tabular" },
		ft = { "markdown" },
		config = function()
			vim.g.vim_markdown_folding_disabled = 1
			vim.g.vim_markdown_toc_autofit = 1
			vim.g.vim_markdown_frontmatter = 1
		end,
	},

	-- Markdown Table Formatting
	{
		"dhruvasagar/vim-table-mode",
		ft = { "markdown" },
		cmd = { "TableModeEnable", "TableModeToggle" },
	},

	-- Table of Contents generator
	{
		"mzlogin/vim-markdown-toc",
		ft = { "markdown" },
		cmd = { "GenTocGFM", "GenTocRedcarpet", "GenTocGitLab" },
	},

	-- Conceal and prettify Markdown
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("headlines").setup()
		end,
	},

	-- Better Markdown editing experience
	{
		"jakewvincent/mkdnflow.nvim",
		ft = { "markdown" },
		config = function()
			require("mkdnflow").setup({})
		end,
	},
}
