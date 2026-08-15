-- Window rules configuration

-- Ignore maximize requests from apps
-- was: windowrule { name = suppress-maximize-events, match:class = .*, suppress_event = maximize }
hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },

    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
-- was: windowrule { name = fix-xwayland-drags, match:class/title/xwayland/float/fullscreen/pin ... }
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})