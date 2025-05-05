local wezterm = require("wezterm")

local config = wezterm.config_builder()

local hyperlinks = require("hyperlinks")
hyperlinks.setup()

-- color_scheme
config.color_scheme = "Catppuccin Mocha"

local colors = {
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}

-- Window
config.window_close_confirmation = "AlwaysPrompt"

config.window_padding = {
	left = 10,
	right = 10,
	top = 5,
	bottom = 5,
}
config.max_fps = 75

config.scrollback_lines = 10000

-- Program
config.default_prog = { "fish" }

-- Font
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 12.0
config.adjust_window_size_when_changing_font_size = false

-- Color Scheme
config.window_background_gradient = {
	orientation = "Vertical",
	colors = {
		"#1E1E2E",
		"#181825",
	},
	interpolation = "Linear",
	blend = "Oklab",
	noise = 20,
}

config.window_background_opacity = 0.9

-- Lauch Menu
local launch_menu = {}

table.insert(launch_menu, {
	label = "TMUX",
	args = { "tmux", "new", "-As0" },
})

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})
end

config.launch_menu = launch_menu

-- Tab Bar
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 50

wezterm.on("format-tab-title", function(tab, tabs, _panes, _config, hover, _max_width)
	local tab_index = tab.tab_index + 1
	local title = tab.active_pane.title

	if tab.tab_title and #tab.tab_title > 0 then
		title = tab.tab_title
	end

	local function format_tab(index, tab_title, bg, fg) -- Redefined title
		return {
			{ Background = { Color = fg } },
			{ Foreground = { Color = bg } },
			{ Text = " " .. index .. " " },
			{ Background = { Color = bg } },
			{ Foreground = { Color = fg } },
			{ Text = " " .. tab_title .. "  " },
			{ Background = { Color = colors.base } },
			{ Background = { Color = colors.base } },
			{ Text = " " },
		}
	end

	if tab.is_active then
		return format_tab(tab_index, title, colors.surface1, colors.flamingo)
	else
		return format_tab(tab_index, title, colors.surface0, colors.subtext0)
	end
end)

-- Keybindings
-- Leader key: CTRL+a
config.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

-- Tmux-style keybindings
config.keys = {
	-- Launcher under ALT+a
	{ key = "a", mods = "ALT", action = wezterm.action.ShowLauncher },

	-- Pane management
	{ key = "$", mods = "LEADER|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "%", mods = "LEADER|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

	-- Pane resizing
	{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },

	-- Tabs
	{ key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
}

for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
