local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'MesloLGM Nerd Font Mono'
config.color_scheme = 'GitHub Dark'

return config
