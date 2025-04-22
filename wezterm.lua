local wezterm = require 'wezterm'
local config = wezterm.config_builder()

if wezterm.target_triple == "aarch64-apple-darwin" then
  nu = "/opt/homebrew/bin/nu"
elseif wezterm.target_triple == "x86_64-apple-darwin" then
  nu = "/usr/local/bin/nu"
else
  nu = "nu"
end

config.default_prog = { nu }
config.font = wezterm.font "Fira Code"
config.font_size = 16
config.color_scheme = 'Catppuccin Latte'
config.window_background_opacity = 0.9

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = "NONE",
    action = wezterm.action.ScrollByLine(-1),
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = "NONE",
    action = wezterm.action.ScrollByLine(1),
  },
}

config.ssh_domains = {
  {
    name = "blaster",
    remote_address = "blaster.cs.uga.edu",
    -- The username to use on the remote host
    -- username = 'huyage',
  },
}

config.leader = { key = "a", mods = "CTRL" }
config.keys = {
  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "a",
    mods = "LEADER|CTRL",
    action = wezterm.action.SendKey { key = "a", mods = "CTRL" },
  },
  {
    key = "H",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize { "Left", 5 },
  },
  {
    key = "J",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize { "Down", 5 },
  },
  {
    key = "K",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize { "Up", 5 }
  },
  {
    key = "L",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize { "Right", 5 },
  },
}

return config

