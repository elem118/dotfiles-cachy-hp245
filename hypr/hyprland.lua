---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
terminal = "kitty"
fileManager = "yazi"
guiFileManager = "nautilus"
menu = "hyprlauncher"
browser = "firefox"

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

require("elemconf/monitors")
require("elemconf/launch")
require("elemconf/envvar")
require("elemconf/animation")
require("elemconf/inputrules")
require("elemconf/keybinds")
require("elemconf/windowrules")
