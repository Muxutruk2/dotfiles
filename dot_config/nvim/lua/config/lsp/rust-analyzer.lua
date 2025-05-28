local M = {}

-- Utility to find all Cargo.toml files under ~/Programming/rust
local function find_linked_projects()
    local linked_projects = {}
    local scan = vim.loop.fs_scandir(vim.fn.expand("~/Programming/rust"))
    if not scan then
        return linked_projects
    end

    local function traverse(path)
        local handle = vim.loop.fs_scandir(path)
        if not handle then return end

        while true do
            local name, type = vim.loop.fs_scandir_next(handle)
            if not name then break end
            local full_path = path .. "/" .. name

            if type == "file" and name == "Cargo.toml" then
                table.insert(linked_projects, full_path)
            elseif type == "directory" then
                traverse(full_path)
            end
        end
    end

    traverse(vim.fn.expand("~/Programming/rust"))
    return linked_projects
end

function M.setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function()
            local capabilities = vim.tbl_deep_extend(
                "force",
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )

            vim.lsp.start({
                name = "rust_analyzer",
                cmd = { "rust-analyzer" },
                root_dir = vim.fn.getcwd(), -- fallback default
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        linkedProjects = find_linked_projects(),
                        cargo = {
                            allFeatures = true,
                        },
                        checkOnSave = {
                            command = "clippy",
                        },
                        diagnostics = {
                            enable = true,
                            disabled = { "unresolved-proc-macro" },
                        },
                        procMacro = {
                            enable = true,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end,
    })
end

return M
