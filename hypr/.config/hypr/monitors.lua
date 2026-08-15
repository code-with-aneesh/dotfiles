-- Monitor configuration
-- was: monitor=,preferred,auto,1.33
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1.33,
})

-- was: monitor=HDMI-A-1,3840x2160@60,auto,2.5
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "3840x2160@60",
    position = "auto",
    scale    = 2.5,
})

-- was: xwayland { force_zero_scaling = true }
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})