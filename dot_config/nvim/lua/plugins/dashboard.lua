return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = "hyper",
            config = {
                center = {
                    { icon = "  ", desc = "Find File", action = "Telescope find_files", key = "f" },
                    { icon = "  ", desc = "Recent Files", action = "Telescope oldfiles", key = "r" },
                    { icon = "  ", desc = "Find Word", action = "Telescope live_grep", key = "w" },
                    { icon = "  ", desc = "Bookmarks", action = "Telescope marks", key = "b" },
                    { icon = "  ", desc = "Quit", action = "qa", key = "q" },
                },
                footer = { "Welcome to Neovim with LazyVim!" },
            },
        })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
