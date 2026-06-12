-- =============================================================================
-- HYPRLAND CONFIGURATION (Modern Lua Syntax)
-- Optimized for Lenovo ThinkPad E14 Gen 7 (AMD)
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. Hardware & Environment Initialization
-- -----------------------------------------------------------------------------
-- Direct VA-API video decoding entirely to the open-source AMD Radeon driver
hl.env("LIBVA_DRIVER_NAME", "radeonsi")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- -----------------------------------------------------------------------------
-- 2. Monitor Setup & Screen Scaling
-- -----------------------------------------------------------------------------
-- Configures the internal ThinkPad panel (eDP-1) with a comfortable 1.25x scaling factor
hl.monitor("eDP-1", "preferred", "auto", "1.25")
-- Fallback rule to handle hot-plugging external 1080p or 4K monitors smoothly
hl.monitor(",", "preferred", "auto", "1")

-- -----------------------------------------------------------------------------
-- 3. Automatic Startup Daemons
-- -----------------------------------------------------------------------------
-- Export session data to systemd so screen sharing portals initialize cleanly
hl.exec_once("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
-- Start your authorization agent for admin/root password prompts
hl.exec_once("systemctl --user start hyprpolkitagent")
-- Pre-cache your first-party application menu background service
hl.exec_once("hyprlauncher -d")

-- -----------------------------------------------------------------------------
-- 4. Inputs & Trackpad Sensitivity
-- -----------------------------------------------------------------------------
hl.input({
    kb_layout = "us",
    follow_mouse = 1,
    sensitivity = 0, -- Keep mouse acceleration neutral (-1.0 to 1.0)

    touchpad = {
        natural_scroll = true,       -- True multi-touch scrolling direction
        tap_to_click = true,         -- No heavy physical button clicks required
        disable_while_typing = true, -- Prevents cursor jumps while compiling/writing code
    }
})

-- -----------------------------------------------------------------------------
-- 5. Look & Feel (Clean Professional Minimalist)
-- -----------------------------------------------------------------------------
hl.general({
    gaps_in = 4,              -- Tight, space-conscious inner gaps between windows
    gaps_out = 8,             -- Outer workspace border padding
    border_size = 2,
    col_active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg", -- Subtle cyan gradient
    col_inactive_border = "rgba(595959aa)",
    layout = "dwindle",       -- Traditional dynamic layout tiling scheme
})

hl.decoration({
    rounding = 6,             -- Crisp, slightly rounded frame corners
    blur = {
        enabled = false,      -- Bypassed to save background battery processing power
    },
    shadow = {
        enabled = false,     -- Clean flat visual appearance
    }
})

hl.animations({
    enabled = true,           -- Snappy transitions without feeling sluggish
    bezier = { "myBezier", "0.05, 0.9, 0.1, 1.05" },
    animation = { "windows", "1, 5, myBezier" },
    animation = { "workspaces", "1, 4, default" },
})

-- -----------------------------------------------------------------------------
-- 6. Core Keybindings
-- -----------------------------------------------------------------------------
-- Application Execution Shortcuts
hl.bind("n", "SUPER", "Q", hl.dsp.exec_cmd("kitty"))              -- Spawn terminal
hl.bind("n", "SUPER", "R", hl.dsp.exec_cmd("hyprlauncher"))       -- Toggle App Menu
hl.bind("n", "SUPER", "C", hl.dsp.close_window())                 -- Close focused frame
hl.bind("n", "SUPER", "M", hl.dsp.exit())                         -- Force logout session
hl.bind("n", "SUPER", "V", hl.dsp.toggle_floating())              -- Put window in floating mode

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
-- Audio Control (Using modern PipeWire paths)
hl.bind("l", "XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("le", "XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("le", "XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))

-- Backlight Control (Requires brightnessctl package)
hl.bind("le", "XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("le", "XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
