-- ~/.config/nvim/lua/plugins/init.lua
-- Load plugin configuration files

return {
  require("plugins.colorscheme"),
  require("plugins.gitsigns"),
  require("plugins.telescope"),
  require("plugins.lspconfig"),
  require("plugins.treesitter"),
  require("plugins.lualine"),
  require("plugins.trouble"),
  require("plugins.mason"),
}