local M = {}

-- Simple root directory finder: looks upward for Cargo.toml, rust-project.json, or .git
local function find_root_dir()
  local cwd = vim.fn.getcwd()
  local function exists(filename)
    return vim.fn.empty(vim.fn.glob(vim.fn.escape(filename, ' '))) == 0
  end

  local function path_join(...)
    return table.concat({...}, "/")
  end

  -- Check current directory and parents up to root
  local dir = cwd
  while dir ~= "/" do
    if exists(path_join(dir, "Cargo.toml")) then
      return dir
    elseif exists(path_join(dir, "rust-project.json")) then
      return dir
    elseif exists(path_join(dir, ".git")) then
      return dir
    end
    dir = vim.fn.fnamemodify(dir, ":h")  -- go one level up
  end

  return cwd  -- fallback to cwd if no root found
end

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
      vim.lsp.start({
        name = "rust_analyzer",
        cmd = { "rust-analyzer" },
        root_dir = find_root_dir(),
        settings = {
          ["rust-analyzer"] = {
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
