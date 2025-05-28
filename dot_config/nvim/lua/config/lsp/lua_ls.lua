local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
      -- Start the Lua language server
      vim.lsp.start({
        name = "lua_ls",
        cmd = { "lua-language-server" },
        root_dir = vim.fn.getcwd(),
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
                "${3rd}/luv/library",
                "${3rd}/busted/library",
              },
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Auto format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = 0,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  })
end

return M
