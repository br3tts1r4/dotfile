-- =============================================================================
-- HYPRLAND CONFIGURATION (Modern Lua Syntax)
-- Optimized for Lenovo ThinkPad E14 Gen 7 (AMD)
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. Hardware & Environment Initialization
-- -----------------------------------------------------------------------------
hl.env("LIBVA_DRIVER_NAME", "radeonsi")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- -----------------------------------------------------------------------------
-- 2. Monitor Setup & Screen Scaling
-- -----------------------------------------------------------------------------
hl.monitor({
    name = "eDP-1",
    res = "preferred",
    pos = "auto",
    scale = "1.25"
})

hl.monitor({
    name = ",",
    res = "preferred",
    pos = "auto",
    scale = "1"
})

-- -----------------------------------------------------------------------------
-- 3. Automatic Startup Daemons
-- -----------------------------------------------------------------------------
hl.exec({
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
    "systemctl --user start hyprpolkitagent"
    -- Note: hyprlauncher removed here since it is not installed in your minimal core base
})

-- -----------------------------------------------------------------------------
-- 4. Inputs & Trackpad Sensitivity
-- -----------------------------------------------------------------------------
hl.input({
    kb_layout = "us",
    follow_mouse = 1,
    sensitivity = 0, 

    touchpad = {
        natural_scroll = true,       
        tap_to_click = true,         
        disable_while_typing = true, 
    }
})

-- -----------------------------------------------------------------------------
-- 5. Look & Feel (Clean Professional Minimalist)
-- -----------------------------------------------------------------------------
hl.general({
    gaps_in = 4,              
    gaps_out = 8,              
    border_size = 2,
    col_active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg", 
    col_inactive_border = "rgba(595959aa)",
    layout = "dwindle",       
})

hl.decoration({
    rounding = 6,              
    blur = {
        enabled = false,      
    },
    shadow = {
        enabled = false,     
    }
})

hl.animations({
    enabled = true,           
    bezier = { "myBezier", "0.05, 0.9, 0.1, 1.05" },
    -- Fixed duplicate key overriding issue by nesting rules cleanly inside an array block
    rules = {
        { "windows", "1, 5, myBezier" },
        { "workspaces", "1, 4, default" }
    }
})

-- -----------------------------------------------------------------------------
-- 6. Core Keybindings
-- -----------------------------------------------------------------------------
-- Application Execution Shortcuts
hl.bind("n", "SUPER", "Q", hl.dsp.exec_cmd("kitty"))              
-- Replaced unavailable hyprlauncher with a fallback minimal system runner via kitty
hl.bind("n", "SUPER", "R", hl.dsp.exec_cmd("kitty --class=launcher -e sh -c 'compgen -c | sort -u | fzf | xargs -r hyprctl dispatch exec'"))
hl.bind("n", "SUPER", "C", hl.dsp.close_window())                  
hl.bind("n", "SUPER", "M", hl.dsp.exit())                         
hl.bind("n", "SUPER", "V", hl.dsp.toggle_floating())              

-- Focus Movement Keybindings (Vim keys)
hl.bind("n", "SUPER", "h", hl.dsp.move_focus("l"))
hl.bind("n", "SUPER", "l", hl.dsp.move_focus("r"))
hl.bind("n", "SUPER", "k", hl.dsp.move_focus("u"))
hl.bind("n", "SUPER", "j", hl.dsp.move_focus("d"))

-- Workspace Switching Shortcuts (Super + [1-5])
for i = 1, 5 do
    hl.bind("n", "SUPER", tostring(i), hl.dsp.workspace(tostring(i)))
    hl.bind("n", "SUPER_SHIFT", tostring(i), hl.dsp.move_to_workspace(tostring(i)))
end

-- -----------------------------------------------------------------------------
-- 7. ThinkPad Hardware Functional Keys (Fn)
-- -----------------------------------------------------------------------------
-- Audio Control (Using modern PipeWire paths via wpctl)
hl.bind("l", "XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("le", "XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("le", "XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))

-- Backlight Control (Requires brightnessctl package installed via pacman)
hl.bind("le", "XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("le", "XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
