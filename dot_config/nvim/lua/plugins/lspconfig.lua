-- ~/.config/nvim/lua/plugins/lspconfig.lua
-- LSP setup

return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            lua_ls = {},
            rust_analyzer = {},
            pylsp = {
                settings = {
                    pylsp = {
                        plugins = {
                            pylint = {
                                enabled = true,
                                executable = "pylint",         -- optional if pylint is in PATH
                            },
                            pycodestyle = { enabled = false }, -- optional, avoids duplicate linting
                            mccabe = { enabled = false },
                            pyflakes = { enabled = false },
                        },
                    },
                },
            }
        },
    },
}
