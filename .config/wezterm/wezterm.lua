local wezterm = require 'wezterm';
return {
  window_decorations = "NONE",
  enable_tab_bar = false,
  font = wezterm.font("JetBrainsMono Nerd Font"),
  window_padding = {
      left = 5,
      right = 5,
      top = 5
  },
    colors = {
        background = "#16161c",
        foreground = "#fdf0ed",
        cursor_bg = "#fab795",
        cursor_fg = "#16161c",
        cursor_border = "#fab795",
        ansi = {
            "#232530",
            "#E95678",
            "#29d398",
            "#fab795",
            "#26bbd9",
            "#ee64ae",
            "#59e3e3",
            "#fadad1"
        },
        brights = {
            "#2e303e",
            "#ec6a88",
            "#3fdaa4",
            "#fbc3a7",
            "#3fc6de",
            "#f075b7",
            "#6be6e6",
            "#fdf0ed"
        }
    }
}

