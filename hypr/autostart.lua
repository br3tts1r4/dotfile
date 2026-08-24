-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Set path config
local waybar = os.getenv("HOME") .. "/.config/waybar/launch.sh"

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
  hl.exec_cmd(waybar)
  hl.exec_cmd("hyprpaper")
  --   hl.exec_cmd(terminal)
  --   hl.exec_cmd("nm-applet")
  --   hl.exec_cmd("waybar & hyprpaper & firefox")
end)
