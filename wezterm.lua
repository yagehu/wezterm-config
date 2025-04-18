local wezterm = require 'wezterm'
local config = wezterm.config_builder()

if wezterm.target_triple == "aarch64-apple-darwin" then
  nu = "/opt/homebrew/bin/nu"
elseif wezterm.target_triple == "x86_64-apple-darwin" then
  nu = "/usr/local/bin/nu"
end

config.default_prog = { nu }
config.font = wezterm.font "Fira Code"
config.font_size = 16
config.color_scheme = 'Catppuccin Latte'
config.window_background_opacity = 0.95

return config

