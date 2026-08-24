------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List connected outputs, modes and descriptions: hyprctl monitors all

-- Fallback rule. An empty output matches any monitor that has no rule of its
-- own below, so this covers the built-in panel and anything hot-plugged.
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = "1.2",
})

-- External 32" 4K display. Scale 1.5 gives a 2560x1440 logical workspace.
-- Set output to the name from `hyprctl monitors all` (usually DP-1 or HDMI-A-1).
-- Matching on the description instead survives swapping ports, e.g.
--   output = "desc:Dell Inc. DELL U3223QE"
hl.monitor({
	output = "DP-2",
	mode = "preferred",
	position = "auto",
	scale = "1.2",
})
