require("hyprland_plugins")
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

hl.on("hyprland.start", function()
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme \"BreezeX-RosePine-Linux\"")
  hl.exec_cmd("uwsm-app -- waybar")
  hl.exec_cmd("uwsm-app -- hyprpaper")
  hl.exec_cmd("uwsm-app -- udiskie -s -A --menu-update-workaround")
  hl.exec_cmd("uwsm-app -- wl-paste --type text --watch cliphist store")
  hl.exec_cmd("uwsm-app -- wl-paste --type image --watch cliphist store")
  hl.exec_cmd("uwsm-app -- /usr/bin/noisetorch -i -s alsa_input.pci-0000_00_1f.3.analog-stereo -t 95")
  hl.exec_cmd("kitty", { workspace = "1" })
end)

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 2,
    border_size = 1,
    col = {
      active_border = colors.red,
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

hl.env("QT_QPA_PLATFORM", "wayland;xbc")
hl.env("GTK_THEME", "catppuccin-mocha-red-standard+default")
hl.env("XCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")

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
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker | wl-copy"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/.cache/screen.png && cjxl ~/.cache/screen.png ~/Pictures/Screenshots/screen-$(date +%s).jxl && wl-copy < ~/.cache/screen.png && rm ~/.cache/screen.png"))
hl.bind("Print", hl.dsp.exec_cmd("grim ~/.cache/screen.png && cjxl ~/.cache/screen.png ~/Pictures/Screenshots/screen-$(date +%s).jxl && wl-copy < ~/.cache/screen.png && rm ~/.cache/screen.png"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | bemenu -H 25 | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.local/bin/hprw"))

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

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

hl.window_rule({
  name = "suppress-maximize-events",
  match = {
    class = ".*",
  },
  -- Ignore maximize requests from all apps. You'll probably like this.
  suppress_event = "maximize",
})

hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  -- Fix some dragging issues with XWayland
  no_focus = true,
})

hl.window_rule({
  name = "move-hyprland-run",
  match = {
    class = "hyprland-run",
  },
  move = "20 monitor_h-120",
  float = true,
})

hl.window_rule({
  name = "kitty",
  match = {
    class = "^(kitty)$",
  },
  workspace = "1",
})

hl.window_rule({
  name = "waybar",
  match = {
    title = "^()$",
    class = "^(waybar)$",
  },
  stay_focused = true,
  min_size = "1 1",
})

hl.window_rule({
  name = "megasync",
  match = {
    class = "^(nz.co.mega.megasync)$",
  },
  float = true,
})

hl.window_rule({
  name = "megasync-1",
  match = {
    title = "^(MEGAsync)$",
    class = "^(nz.co.mega.megasync)$",
  },
  size = "402 564",
  no_blur = true,
  rounding = 16,
})

hl.window_rule({
  name = "discord",
  match = {
    class = "^(discord)$",
  },
  float = true,
})

hl.window_rule({
  name = "discord",
  match = {
    class = "^(discord)$",
    title = "^(.*)(Discord)$",
  },
  workspace = "8",
  float = false,
})

hl.window_rule({
  name = "keepassxc",
  match = {
    title = "^(KeePassXC -)(.*)$",
  },
  float = true,
})

hl.window_rule({
  name = "keepassxc-1",
  match = {
    initial_class = "^(org.keepassxc.KeePassXC)$",
    initial_title = "^(.*)(KeePassXC)$",
  },
  workspace = "6",
})

hl.window_rule({
  name = "thunderbird",
  match = {
    class = "^(org.mozilla.Thunderbird)$",
  },
  float = true,
  workspace = "4",
})

hl.window_rule({
  name = "thunderbird-1",
  match = {
    initial_class = "^(org.mozilla.Thunderbird)$",
    initial_title = "^(.*)(Mozilla Thunderbird)$",
  },
  float = false,
})

hl.window_rule({
  name = "file-picker",
  match = {
    title = "$(Open Files)$",
  },
  float = true,
})

hl.window_rule({
  name = "blueman",
  match = {
    initial_class = "^(blueman-manager)$",
    initial_title = "^(Bluetooth Devices)$",
  },
  float = true,
  size = "(monitor_w*-0.5) (monitor_h*0.5)",
  move = "((monitor_w*1.02)) ((monitor_h*0.03))",
})

hl.window_rule({
  name = "pwvucontrol",
  match = {
    class = "^(com.saivert.pwvucontrol)$",
    title = "^(Pipewire Volume Control)$",
  },
  float = true,
  size = "(monitor_w*0.43) (monitor_h*0.3703703703703704)",
  move = "((monitor_w*0.5668)) ((monitor_h*0.028999999999999998))",
})

hl.window_rule({
  name = "pavucontrol",
  match = {
    class = "^(org.pulseaudio.pavucontrol)$",
  },
  float = true,
  size = "(monitor_w*0.43) (monitor_h*0.3703703703703704)",
  move = "((monitor_w*0.5668)) ((monitor_h*0.028999999999999998))",
})

hl.window_rule({
  name = "furryfox",
  match = {
    class = "^(waterfox)(.*)$",
  },
  workspace = "2",
})

hl.window_rule({
  name = "furryfox-1",
  match = {
    class = "^(waterfox)$",
    title = "^(.*)",
  },
  float = true,
})

hl.window_rule({
  name = "furryfox-2",
  match = {
    class = "^(waterfox)$",
    title = "^(.*)(Waterfox)(.*)",
  },
  float = false,
})

hl.window_rule({
  name = "furryfox-3",
  match = {
    class = "^(waterfox)$",
    title = "^(Picture-in-Picture)$",
  },
  float = true,
  pin = true,
  move = "((monitor_w*0.653)) ((monitor_h*0.65))",
})

hl.window_rule({
  name = "kleopatra",
  match = {
    class = "^(org.kde.kleopatra)$",
  },
  workspace = "6",
})

hl.window_rule({
  name = "gimp",
  match = {
    class = "^(gimp)$",
  },
  workspace = "5",
})

hl.window_rule({
  name = "gimp-export-as",
  match = {
    title = "^(Export Image as)(.*)$",
  },
  float = true,
})

hl.window_rule({
  name = "krita",
  match = {
    class = "^(krita)$",
  },
  workspace = "5",
})

hl.window_rule({
  name = "blender",
  match = {
    class = "^(blender)$",
  },
  workspace = "5",
})

hl.window_rule({
  name = "qbittorrent",
  match = {
    class = "^(org.qbittorrent.qBittorrent)$",
    title = "^(.*)$",
  },
  float = true,
})

hl.window_rule({
  name = "qbittorrent-1",
  match = {
    class = "^(org.qbittorrent.qBittorrent)$",
    title = "^(qBittorrent )(.*)$",
  },
  workspace = "7",
  float = false,
})

hl.window_rule({
  name = "imv",
  match = {
    class = "^(imv)$",
    title = "^(imv)(.*)$",
  },
  float = true,
})

hl.window_rule({
  name = "davinci-fusion-reactor",
  match = {
    class = "^(resolve)$",
    initial_title = "^(.*)(Reactor)$",
  },
  float = true,
})

hl.window_rule({
  name = "davinci-dialog",
  match = {
    class = "^(resolve)$",
    initial_title = "^(Dialog)$",
  },
  stay_focused = true,
})

hl.window_rule({
  name = "davinci-clip-info",
  match = {
    class = "^(resolve)$",
    title = "^(Clip Info)$",
  },
  stay_focused = true,
  decorate = false,
  no_blur = true,
})

hl.window_rule({
  name = "davinci-normalize-audio",
  match = {
    class = "^(resolve)$",
    title = "^(Normalize Audio Levels)$",
  },
  stay_focused = true,
  decorate = false,
  no_blur = true,
})

hl.window_rule({
  name = "davinci-loading",
  match = {
    class = "^(resolve)$",
    title = "^(resolve)$",
  },
  stay_focused = true,
  decorate = false,
  no_blur = true,
})

hl.window_rule({
  name = "steam-friends",
  match = {
    class = "^(steam)$",
    title = "^(Friends List)$",
  },
  size = "(monitor_w*0.2) (monitor_h*0.75)",
  move = "((monitor_w*0.4)) ((monitor_h*0.13657407407407407))",
})

hl.window_rule({
  name = "steam-0",
  match = {
    title = "^()$",
    class = "^(steam)$",
  },
  stay_focused = false,
  min_size = "1 1",
  decorate = false,
  no_blur = true,
})

hl.window_rule({
  name = "steam-1",
  match = {
    class = "^(steam)$",
    title = "^(.*)$",
  },
  float = true,
})

hl.window_rule({
  name = "steam-notifications",
  match = {
    class = "^(steam)$",
    title = "^(notificationtoasts)(.*)(desktop)$",
  },
  pin = true,
})

hl.window_rule({
  name = "steam-2",
  match = {
    initial_class = "^(steam)$",
    initial_title = "^(Steam)$",
  },
  float = false,
  workspace = "9",
})

hl.window_rule({
  name = "steam-proton",
  match = {
    class = "^(steam_app_)(.*)$",
    title = "^(.*)$",
  },
  workspace = "10",
  fullscreen = true,
})

hl.window_rule({
  name = "steam-pick-game",
  match = {
    class = "^(Steam)",
    title = "^(Pick game to add)$",
  },
  float = true,
})

hl.window_rule({
  name = "paradox-launcher",
  match = {
    class = "^(paradox-launcher-v2)$",
  },
  float = true,
  size = "1280 670",
})

hl.window_rule({
  name = "paradox-launcher-1",
  match = {
    initial_class = "^(paradox-launcher-v2)$",
  },
  workspace = "10",
})

hl.window_rule({
  name = "cities-skylines",
  match = {
    class = "^(Cities.x64)$",
  },
  workspace = "10",
})

hl.window_rule({
  name = "hoi4",
  match = {
    class = "^(hoi4)$",
  },
  workspace = "10",
})

hl.window_rule({
  name = "prismlauncher",
  match = {
    class = "^(org.prismlauncher.PrismLauncher)$",
    title = "^(.*)( Prism Launcher)(.*)$",
  },
  float = true,
})

hl.window_rule({
  name = "prismlauncher-1",
  match = {
    class = "^(org.prismlauncher.PrismLauncher)$",
    title = "^(Prism Launcher )(.*)$",
  },
  workspace = "9",
})

hl.window_rule({
  name = "minecraft",
  match = {
    initial_class = "^(.*)(Minecraft)(.*)$",
    initial_title = "^(.*)(Minecraft)(.*)$",
  },
  workspace = "10",
  maximize = true,
})

hl.window_rule({
  name = "minecraft-crmc",
  match = {
    initial_class = "^(.*)(Cleanroom)(.*)$",
    initial_title = "^(.*)(Cleanroom)(.*)$",
  },
  workspace = "10",
  maximize = true,
})

hl.window_rule({
  name = "heroic",
  match = {
    class = "^(heroic)$",
  },
  workspace = "9",
})

hl.window_rule({
  name = "factorio",
  match = {
    class = "^(factorio)$",
  },
  workspace = "10",
})

hl.window_rule({
  name = "vintage-story",
  match = {
    title = "^(Vintage Story)$",
  },
  workspace = "10",
})

hl.window_rule({
  name = "godot",
  match = {
    class = "^(Godot)$",
  },
  workspace = "5",
})

hl.window_rule({
  name = "xdg-portal",
  match = {
    class = "^(xdg-desktop-portal-)(.*)$",
  },
  float = true,
})
