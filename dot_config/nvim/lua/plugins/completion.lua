return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        window = {
            completion = {
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                col_offset = -3,
                side_padding = 1,
                max_width = 60,
                max_height = 15,
            },
            documentation = {
                border = "rounded",
                max_width = 80,
                max_height = 20,
            },
        },

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup(
                {
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                        ["<Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                    }),
                    window = {
                        completion = {
                            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                            col_offset = -3,
                            side_padding = 1,
                            max_width = 60,
                            max_height = 15,
                        },
                        documentation = {
                            border = "rounded",
                            max_width = 80,
                            max_height = 20,
                        },
                    },
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "path" },
                        { name = "buffer" },
                    }),
                    sorting = {
                        priority_weight = 2,
                        comparators = {
                            cmp.config.compare.offset,
                            cmp.config.compare.exact,
                            cmp.config.compare.score,
                            cmp.config.compare.recently_used,
                            cmp.config.compare.locality,
                            cmp.config.compare.kind,
                            cmp.config.compare.sort_text,
                            cmp.config.compare.length,
                            cmp.config.compare.order,
                        },
                    },
                },

                -- Cmdline completions
                cmp.setup.cmdline("/", {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = "buffer" },
                    },
                }),

                cmp.setup.cmdline(":", {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                        { name = "path" },
                    }, {
                        { name = "cmdline" },
                    }),
                })
            )
        end,
    },
}
