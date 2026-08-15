-- #######################################################################################
-- HYPRLAND CONFIG (Lua)
-- #######################################################################################
--
-- This is a modular Hyprland config, mirroring the old hyprland.conf layout.
-- The original hyprlang files are preserved in ./conf-backup/
--
-- Since Hyprland 0.55 the config lives in ~/.config/hypr/hyprland.lua and is
-- loaded INSTEAD of hyprland.conf. See https://wiki.hypr.land/Configuring/Start/

-- Modular config: each section is a separate file, sourced with require().
-- was: source = $HOME/.config/hypr/monitors.conf   (and the other .conf files)
require("monitors")
require("colors")
require("decorations")
require("animations")
require("keybinds")
require("windowrules")

-------------------
-- AUTOSTART     --
-------------------
-- was: exec-once = ...
-- hl.on("hyprland.start") preserves the run-once-per-session behavior.
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("/usr/libexec/kf6/polkit-kde-authentication-agent-1")
    hl.exec_cmd([[bash -c 'hyprpaper & sleep 1; wp=$(find ~/Pictures/catppuccin-wallpapers -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1); hyprctl hyprpaper preload "$wp"; hyprctl hyprpaper wallpaper ",$wp"']])
    hl.exec_cmd("~/.config/hypr/Scripts/start_clipboard.sh")
end)

-------------------------------
-- ENVIRONMENT VARIABLES     --
-------------------------------
-- was: env = QT_QPA_PLATFORMTHEME,kde / env = XCURSOR_SIZE,24 ...
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
-- LOOK AND FEEL     --
-----------------------
-- was: general { ... }, dwindle { ... }, master { ... }, misc { ... }
-- (border colors live in colors.lua)
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        resize_on_border = false,
        allow_tearing    = false,

        layout = "dwindle",
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper  = 1,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },
})

---------------
-- INPUT     --
---------------
-- was: input { ... }, gesture = 3, horizontal, workspace, device { ... }
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- Per-device input config
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})