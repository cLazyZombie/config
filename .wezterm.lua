local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font('MesloLGM Nerd Font Mono', {weight='Bold'})
config.font_size = 12.0
config.freetype_load_target = "Normal"

-- set theme
local theme = wezterm.color.get_builtin_schemes()['GitHub Dark']
theme.background = '#24292e'
theme.foreground = '#C9D1D9'
config.color_schemes = {['MyTheme'] = theme}
config.color_scheme = 'MyTheme'

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.set_environment_variables = {}
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- Use OSC 7 as per the above example
  config.set_environment_variables['prompt'] =
  '$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m '
  -- use a more ls-like output format for dir
  config.set_environment_variables['DIRCMD'] = '/d'
  config.default_prog = { 'cmd.exe', '/s', '/k', "C:\\Users\\jojongguk\\config\\windows.bat" }
  -- And inject clink into the command prompt
  -- config.default_prog =
  --   { 'cmd.exe', '/s', '/k', 'clink', 'inject', '-q' }
  config.font_size = 10.0
end

return config
