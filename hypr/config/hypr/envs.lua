-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("GDK_SCALE", GDK_SCALE)

hl.env("LIBVA_DRIVER_NAME", "nvidia") -- nvidia things
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia") -- nvidia things
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto") -- electron/cef apps flickering fix
-- hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland") -- deprecated as i know
hl.env("NVD_BACKEND", "direct") -- VA-API hardware video acceleration

-- hl.env("WLR_NO_HARDWARE_CURSORS", "1") -- mouse boundries fix

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
-- hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
-- hl.env("QT_QPA_PLATFORMTHEME", "xdgdesktopportal")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_STYLE_OVERRIDE", "Darkly")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- hl.env("ELECTRON_ENABLE_FEATURES", "MiddleClickAutoscroll") -- middle click scroll for electron
--QT_QPA_PLATFORMTHEME=xdgdesktopportal
