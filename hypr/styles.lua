-----------------------
---- STYLES ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Variables/
hl.config({
  general = {
    gaps_in          = 3,
    gaps_out         = 6,

    border_size      = 1,

    col              = {
      -- Modern slate-violet to soft blue gradient
      active_border   = { colors = { "rgba(89b4faee)", "rgba(cba6f7ee)" }, angle = 45 },
      inactive_border = "rgba(1e1e2eaa)",
    },

    -- Enable border drag for easier floating window management
    resize_on_border = false,
    allow_tearing    = false,

    layout           = "dwindle",
  },

  decoration = {
    -- Softly rounded corners
    rounding         = 10,
    rounding_power   = 2.0,

    -- Subtle visual hierarchy for active vs inactive focus
    active_opacity   = 1.0,
    inactive_opacity = 0.92,

    -- Modern floating shadow with wide diffusion
    shadow           = {
      enabled      = true,
      range        = 20,
      render_power = 4,
      sharp        = false,
      offset       = "0, 4",
      color        = "rgba(00000044)", -- Soft dark drop shadow
      color_inactive = "rgba(00000022)",
    },

    -- Smooth dual-kawase blur for background glass effect
    blur             = {
      enabled           = true,
      size              = 6,
      passes            = 3,
      new_optimizations = true,
      ignore_opacity    = true,
      vibrancy          = 0.2,
      vibrancy_darkness = 0.5,
    },
  },

  -- Fast, smooth animation curves
  animations = {
    enabled   = true,
    bezier    = {
      { name = "md3_decel",  args = { 0.05, 0.7, 0.1, 1.0 } },
      { name = "workspace",  args = { 0.3, 0.8, 0.1, 1.0 } },
    },
    animation = {
      { name = "windows",     enabled = 1, speed = 6,   curve = "md3_decel" },
      { name = "windowsOut",  enabled = 1, speed = 4.5, curve = "md3_decel" },
      { name = "border",      enabled = 1, speed = 15,  curve = "default" },
      { name = "fade",        enabled = 1, speed = 6,   curve = "default" },
      { name = "workspaces",  enabled = 1, speed = 7.5, curve = "workspace", style = "slide" },
    },
  },
})