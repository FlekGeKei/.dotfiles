local colors = require("mocha")

local terminal = "kitty"
local fileManager = terminal .. " yazi"
local menu = "PATH=${PATH}:${HOME}/.local/bin bemenu-run -H 25"

hl.monitor({
  output = "eDP-1",
  mode = "preferred",
  position = "auto",
  scale = "1",
})

hl.env("QT_QPA_PLATFORM", "wayland;xbc")
hl.env("XCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("GTK_USE_PORTAL", "1")
hl.env("GDK_DEBUG", "portals")
hl.env("SSH_AUTH_SOCK", "/run/user/1000/gnupg/S.gpg-agent.ssh")
hl.env("SSH_AGENT_PID", "")

hl.on("hyprland.start", function()
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme \"BreezeX-RosePine-Linux\"")
  hl.exec_cmd("uwsm-app -- hyprpaper")
  hl.exec_cmd("uwsm-app -- udiskie -s -A --menu-update-workaround")
  hl.exec_cmd("uwsm-app -- wl-paste --type text --watch cliphist store")
  hl.exec_cmd("uwsm-app -- wl-paste --type image --watch cliphist store")
  hl.exec_cmd("uwsm-app -- /usr/bin/noisetorch -i -s alsa_input.pci-0000_00_1f.3.analog-stereo -t 95")
	hl.exec_cmd("uwsm-app -- keepassxc", { workspace = "6 silent" })
	hl.exec_cmd("hyprpm reload")
  hl.exec_cmd("kitty", { workspace = "1" })
end)

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 2,
    border_size = 1,
    col = {
      active_border = colors.sapphire,
      inactive_border = colors.surface0,
    },
    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },
  decoration = {
    rounding = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(" .. colors.surface2Alpha .. "ee)",
    },
    blur = {
      enabled = true,
      size = 8,
      passes = 2,
      vibrancy = 0.1696,
    },
  },
  ecosystem = {
    no_update_news = true,
  },
  animations = {
    enabled = true,
  },
  dwindle = {
    preserve_split = true, -- You probably want this
  },
  master = {
    new_status = "master",
  },
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },
  input = {
    kb_layout = "us,ru",
    --kb_variant = lang
    --kb_model =
    kb_options = "grp:caps_toggle, compose:ralt",
    --kb_rules =
    follow_mouse = 1,
    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    force_no_accel = true,
    accel_profile = "flat",
    touchpad = {
			natural_scroll = false,
			disable_while_typing = false,
    },
  },
  gestures = {
    workspace_swipe_invert = false,
    workspace_swipe_distance = 200,
    workspace_swipe_forever = true,
  },
})

-- "Smart gaps"
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager, { workspace = "unset" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker | wl-copy"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/.cache/screen.png && cjxl ~/.cache/screen.png ~/Pictures/Screenshots/screen-$(date +%s).jxl && wl-copy < ~/.cache/screen.png && rm ~/.cache/screen.png"))
hl.bind("Print", hl.dsp.exec_cmd("grim ~/.cache/screen.png && cjxl ~/.cache/screen.png ~/Pictures/Screenshots/screen-$(date +%s).jxl && wl-copy < ~/.cache/screen.png && rm ~/.cache/screen.png"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | bemenu -H 25 | cliphist decode | wl-copy"))

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))

hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))

for i = 1, 10 do
  local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Global shortcuts
hl.bind("SUPER + F10", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
hl.bind("SUPER + F12", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
hl.bind(mainMod .. "+ M", hl.dsp.send_shortcut({ mods = "CTRL + SHIFT", key = "M", window = "class:^(discord)$" }))

-- Submaps
hl.bind("ALT + r", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  hl.bind("ALT + l", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
  hl.bind("ALT + h", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
  hl.bind("ALT + k", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
  hl.bind("ALT + j", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })

  hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

require("hyprland_plugins")
require("hyprland_window_rules")
