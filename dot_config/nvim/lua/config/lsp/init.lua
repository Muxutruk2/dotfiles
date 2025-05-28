local M = {}

-- List files to ignore (without extension)
local ignore = {
	-- example: ["rust-analyzer"] = true,
}

-- Helper to strip .lua extension from filename
local function strip_extension(filename)
	return filename:match("(.+)%.lua$")
end

-- Load all modules in the current directory except ignored
function M.setup()
	local uv = vim.loop
	local lsp_path = debug.getinfo(1).source:match("@?(.*/)")

	-- Get list of files in directory
	local files = {}
	local fd = uv.fs_scandir(lsp_path)
	if not fd then
		vim.notify("Failed to scan lsp config directory: " .. lsp_path, vim.log.levels.ERROR)
		return
	end

	while true do
		local name, type = uv.fs_scandir_next(fd)
		if not name then
			break
		end
		if type == "file" and name:sub(-4) == ".lua" and name ~= "init.lua" then
			local modname = strip_extension(name)
			if not ignore[modname] then
				table.insert(files, modname)
			end
		end
	end

	-- Require each module and call setup if it exists
	for _, mod in ipairs(files) do
		local ok, module = pcall(require, "config.lsp." .. mod)
		if not ok then
			vim.notify("Failed to load LSP config: " .. mod, vim.log.levels.ERROR)
		elseif type(module.setup) == "function" then
			module.setup()
		end
	end
end

return M
