local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful").get()
local dpi = require("beautiful.xresources").apply_dpi

-- import widgets
-- local alsa = require("custom.widgets.alsa")
-- local pulse = require("custom.widgets.pulse")
local systray = require("idlesignal.widgets.systray")
local mpd = require("idlesignal.widgets.mpd")
-- local powermenu = require("custom.widgets.powermenu")

function On_screen_connect(s)
    -- Systray workaround:
    -- Problem: The systray can only be on one screen but the widget would still get drawn with its margins, but without any icons.
    -- Solution: By assigning it to a local(to the screen) variable, we avoid rendering an empty widget, and with it, the default margins
    if s.index == 1 then s.systray = systray end

    -- Tags
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        layout = {layout = wibox.layout.fixed.horizontal},
        widget_template = {
                {
                    {
                        {
                            id = 'text_role',
                            widget = wibox.widget.textbox
                        },
                        layout = wibox.layout.align.horizontal
                    },
                    left = dpi(2),
                    right = dpi(2),
                    bottom = dpi(0),
                    top = dpi(0),
                    widget = wibox.container.margin
                },
                widget = wibox.container.margin,
                left = beautiful.taglist_margin_left,
                right = beautiful.taglist_margin_right
            }
    }

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = wibox.widget {
            awful.widget.layoutbox(s),
            margins = dpi(7),
            widget = wibox.container.margin
    }

    s.mylayoutbox:buttons(awful.util.table.join(awful.button({}, 1, function()
        awful.layout.inc(1)
    end), --                           awful.button({}, 2, function () awful.layout.set( layouts[1] ) end),
    awful.button({}, 3, function()
        awful.layout.inc(-1)
    end), awful.button({}, 4, function()
        awful.layout.inc(1)
    end), awful.button({}, 5, function()
        awful.layout.inc(-1)
    end)))

    -- Create a tasklist widget
    -- s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        layout = {
            layout = wibox.layout.fixed.horizontal
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.

        widget_template = {
            {
                forced_height = dpi(3),
                id = 'background_role',
                widget = wibox.container.background
            },
            {
                {
                    {
                        id = 'clienticon',
                        awful.widget.clienticon,
                        margins = beautiful.tasklist_icon_margins or dpi(5),
                        widget = wibox.container.margin
                    },
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox
                    },
                    layout = wibox.layout.align.horizontal
                },
                right = beautiful.tasklist_item_margins_right or dpi(5),
                left = beautiful.tasklist_item_margins_left or dpi(5),
                widget = wibox.container.margin
            },
            layout = wibox.layout.align.vertical
        }
    }

    -- Create the wibox
    s.mywibox = awful.wibar({
        type = 'dock',
        position = "top",
        screen = s,
        height = beautiful.bar_height,
        bg = beautiful.bg_normal,
        fg = beautiful.fg_normal
    })

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.align.horizontal,
            s.mylayoutbox,
            {
                {
                    s.mytaglist,
                    widget = wibox.container.background,
                    bg = beautiful.bg_shaded,
                    shape = gears.shape.octogon
                },
                widget = wibox.container.margin,
                top = dpi(5),
                bottom = dpi(5),
            }
            -- s.mytaglist
            -- s.mypromptbox,
        },
        {
            s.mytasklist, -- Middle widget
            expand = "none",
            layout = wibox.layout.align.horizontal
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = beautiful.widget_spacing,
            -- pulse,
            mpd,
            clock,
            s.systray,
            -- powermenu,
        }
    }
end

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    On_screen_connect(s)
end)
