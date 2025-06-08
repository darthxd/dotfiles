-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 100
config.initial_rows = 30

config.enable_tab_bar = false

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

-- or, changing the font size and color scheme.
config.font_size = 12
config.font = wezterm.font("CommitMono", { weight = "Regular"}) 
config.colors = {
    foreground = '#d5d5d5',
    background = '#161616',
    cursor_bg = '#2d5fff',
    cursor_fg = '#161616',
    cursor_border = '#2d5fff',
    selection_fg = '121212',
    selection_bg = '#b0b0b0',
    split = '#ec144c',
    ansi = {
      '#121212',
      '#2d5fff',
      '#00ff77',
      '#ffffff',
      '#b0b0b0',
      '#7a7a7a',
      '#787878',
      '#d5d5d5',
    },
    brights = {
      '#737373',
      '#2d5fff',
      '#2d5fff',
      '#fdfdfd',
      '#bebebe',
      '#939393',
      '#919191',
      '#f5f5f5',
    },
}

-- Finally, return the configuration to wezterm:
return config
