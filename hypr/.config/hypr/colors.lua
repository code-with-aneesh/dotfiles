-- Color scheme - Catppuccin Mocha
-- was: col.active_border / col.inactive_border / col.shadow
-- Gradient borders use a colors + angle table in Lua.
-- The shadow color lives at decoration.shadow.color (set in decorations.lua).
hl.config({
    general = {
        col = {
            active_border = {
                colors = { "rgba(cba6f7ee)", "rgba(89b4faee)" },
                angle  = 45,
            },
            inactive_border = "rgba(45475aaa)",
        },
    },
})