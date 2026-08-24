---------------------
---- MY PROGRAMS ----
---------------------

-- Set path config
local rofi_config = os.getenv("HOME") .. "/.config/rofi/theme.rasi"

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi -config " .. rofi_config .. " -show drun -show-icons"
-- local menu        = "hyprlauncher" -- Default launcher

---------------------
---- KEYBINDINGS ----
---------------------
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

-- Hyprland Close
hl.bind(mainMod .. " + SHIFT + Delete",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Terminal
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(terminal))
-- Launcher
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
-- File Manager
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(fileManager))

-- Tile Cycle Selection (next&prev)
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ direction = "l" }))
-- Tile Float 
hl.bind(mainMod .. " + Q", hl.dsp.window.float({ action = "toggle" }))
-- Tile Minimise
hl.bind(mainMod .. " + Z", hl.dsp.window.pseudo())
-- Tile Split (only dwindle)
hl.bind(mainMod .. " + I", hl.dsp.layout("togglesplit"))
-- Tile Close
local closeWindowBind = hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
-- Tile Full Screen
-- Fullscreen (0: true fullscreen, 1: maximize keeping status bars/gaps visible)
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Tile Switching Default
-- hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
-- hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
-- hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Tile Switching (Vim keys)
-- Move active tile Left, Down, Up, Right using H, J, K, L
hl.bind(mainMod .. " + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.window.move({ direction = "r" }))

-- Default Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
