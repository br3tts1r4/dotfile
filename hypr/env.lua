-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Hyprland Environment Variables --
-- hl.env("HYPRLAND_TRACE", "1") -- Enables more verbose logging.
-- hl.env("HYPRLAND_NO_RT", "1") -- Disables realtime priority setting by Hyprland.
-- hl.env("HYPRLAND_NO_SD_NOTIFY", "1") -- If systemd, disables the sd_notify calls.
-- hl.env("HYPRLAND_NO_SD_VARS", "1") -- Disables management of variables in systemd and dbus activation environments.
-- hl.env("HYPRLAND_CONFIG", "/path/to/hyprland.lua") -- Specifies where you want your Hyprland configuration.

-- XDG Specifications --
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt Variables --
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1") -- Enables automatic scaling, based on the monitor’s pixel
hl.env("QT_QPA_PLATFORM", "wayland;xcb") -- Tell Qt applications to use the Wayland backend, and fall back to X11 if Wayland is unavailable
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1") -- Disables window decorations on Qt applications
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct") --  Tells Qt based applications to pick your theme from qt5ct, use with Kvantum.

-- NVIDIA Specific --
-- To force GBM as a backend, set the following environment variables:
-- hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- hl.env("LIBVA_DRIVER_NAME", "nvidia") -- Hardware acceleration on NVIDIA GPUs