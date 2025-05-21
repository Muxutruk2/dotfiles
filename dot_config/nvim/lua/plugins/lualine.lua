return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
    sections = {
      lualine_a = { { 'mode', right_padding = 2 } },
      lualine_b = {
        { 'branch', icon = '', left_padding = 2 },
        { 'diff', symbols = { added = ' ', modified = '柳', removed = ' ' }, colored = true, right_padding = 2 },
        { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = ' ', warn = ' ', info = ' ' }, colored = true },
      },
      lualine_c = { { 'filename', file_status = true, path = 1, shorting_target = 40 } },
      lualine_x = {
        { 'encoding',   fmt = string.upper,  left_padding = 2 },
        { 'fileformat', icons_enabled = true },
        { 'filetype',   icon_only = true,    padding = { left = 1, right = 1 } },
        {
          function()
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
              return ''
            end
            local names = {}
            for _, client in pairs(clients) do
              table.insert(names, client.name)
            end
            return ' [' .. table.concat(names, ', ') .. ']'
          end,
          cond = function()
            return #vim.lsp.get_clients() > 0
          end,
          color = { fg = '#a9b1d6', gui = 'bold' },
          left_padding = 1,
        },
      },
      lualine_y = { { 'progress', right_padding = 2 } },
      lualine_z = { { 'location', left_padding = 2 } },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
