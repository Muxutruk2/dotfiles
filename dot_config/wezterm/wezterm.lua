local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Gruvbox Dark (Gogh)"

-- and finally, return the configuration to wezterm
return config
