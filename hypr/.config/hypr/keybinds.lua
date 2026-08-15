-- Keybinding configuration
-- was: $mainMod = SUPER, $terminal = kitty, ...
local mainMod      = "SUPER"
local terminal     = "kitty"
local fileManager  = "dolphin --platformtheme kde"
local menu         = "rofi -show drun"

-- Applications
-- was: bind = $mainMod, Return, exec, $terminal ...
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))
hl.bind("SUPER + A",            hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + W",      hl.dsp.exec_cmd("systemsettings kcm_networkmanagement"))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd("systemsettings kcm_bluetooth"))

-- Window management
-- was: killactive / togglefloating / layoutmsg, togglesplit
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Focus movement
-- was: movefocus, l/r/u/d
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspace switching and moving windows to workspaces
-- was: 20 bind lines for $mainMod [1-0] and $mainMod SHIFT [1-0]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Workspace navigation
-- was: ALT, TAB / $mainMod, N / $mainMod SHIFT, N
hl.bind("ALT + TAB",                hl.dsp.exec_cmd("~/.config/hypr/Scripts/cycle_workspaces.sh"))
hl.bind(mainMod .. " + N",          hl.dsp.exec_cmd("~/.config/hypr/Scripts/movetonewworkspace.sh"))
hl.bind(mainMod .. " + SHIFT + N",  hl.dsp.exec_cmd("~/.config/hypr/Scripts/create_and_switch_workspace.sh"))

-- Mouse workspace scrolling
-- was: bind = $mainMod, mouse_down, workspace, e+1
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Window resizing
-- was: bindm = $mainMod, mouse:272, movewindow
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Power and system
-- was: ALT, 4 / $mainMod, M / $mainMod, P / $mainMod, S
hl.bind("ALT + 4",            hl.dsp.exec_cmd("~/.config/hypr/Scripts/shutdown_in_5s.sh"))
hl.bind(mainMod .. " + M",    hl.dsp.exec_cmd("~/.config/hypr/Scripts/exit_hyprland.sh"))
hl.bind(mainMod .. " + P",    hl.dsp.exec_cmd("~/.config/hypr/Scripts/power_menu.sh"))
hl.bind(mainMod .. " + S",    hl.dsp.exec_cmd("~/.config/hypr/Scripts/suspend_prompt.sh"))

-- Screenshots
-- was: bind = , Print / SHIFT, Print
hl.bind("Print",           hl.dsp.exec_cmd("~/.config/hypr/Scripts/screenshot.sh"))
hl.bind("SHIFT + Print",   hl.dsp.exec_cmd("~/.config/hypr/Scripts/screenshot_to_clipboard.sh"))

-- Wallpaper
-- was: bind = $mainMod, R, exec, ...
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/hypr/Scripts/hyprpaper_random_next.sh"))

-- Clipboard
-- was: # bind = $mainMod, Y, exec, ...
-- hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("~/.config/hypr/Scripts/cliphist_menu_copy.sh"))

-- Utilities
-- was: # bind = SUPER, L, exec, hyprlock
-- hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("xdg-open obsidian://daily"))

-- Media controls (laptop multimedia keys)
-- was: bindel = , XF86AudioRaiseVolume, ...  (locked + repeating)
hl.bind("XF86AudioRaiseVolume",   hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",          hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",       hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Keyboard brightness controls (SUPER+Shift+Up/Down)
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Keyboard volume controls (SUPER+Shift+Right/Left)
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })

-- Playback controls
-- was: bindl = , XF86AudioNext, ...  (locked)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })