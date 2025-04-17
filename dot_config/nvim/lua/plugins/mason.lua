-- ~/.config/nvim/lua/plugins/mason.lua
-- Mason setup

return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
        },
    },
    require("mason").setup({
        install_root_dir = vim.fn.stdpath("data") .. "/mason",
    }),
}
