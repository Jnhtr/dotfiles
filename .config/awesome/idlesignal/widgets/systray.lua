local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local systray = wibox.widget {
    {
        {
            widget = wibox.widget.systray(),
            base_size = beautiful.systray_size,
        },
        widget = wibox.container.margin,
        top = beautiful.systray_margin_top or dpi(10),
        bottom = beautiful.systray_margin_bot or dpi(10),
        left = beautiful.systray_margin_left or dpi(-10),
        right = beautiful.systray_margin_right or dpi(-2),
    },
    widget=wibox.container.background,
}

return systray
