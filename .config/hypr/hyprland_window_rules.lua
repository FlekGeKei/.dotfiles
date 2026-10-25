hl.window_rule({
  match = {
		xwayland = true,
  },
	no_blur = true,
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
    initial_class = "^(org.keepassxc.KeePassXC)$",
    initial_title = "^(.*)(KeePassXC)$",
  },
  workspace = "6",
})
hl.window_rule({
  name = "keepassxc-unlock",
  match = {
    class = "^(org.keepassxc.KeePassXC)$",
    title = "^(Unlock Database - KeePassXC)$",
  },
  float = true,
	workspace = "unset",
})
hl.window_rule({
  name = "keepassxc-float",
  match = {
    class = "^(org.keepassxc.KeePassXC)$",
    title = "^(KeePassXC -)(.*)$",
  },
  float = true,
	workspace = "unset",
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
  name = "pavucontrol",
  match = {
    class = "^(pavucontrol-qt)$",
  },
  float = true,
  size = "(monitor_w*0.43) (monitor_h*0.3703703703703704)",
  move = "((monitor_w*0.5668)) ((monitor_h*0.028999999999999998))",
})

hl.window_rule({
  name = "file-picker",
  match = {
    title = "^(.*)(Open Files)(.*)$",
  },
  float = true,
})
hl.window_rule({
  name = "termfilechooser",
  match = {
    title = "^(termfilechooser)$",
  },
	workspace = "unset",
  float = true,
	stay_focused = true,
})
hl.window_rule({
  name = "zenity",
  match = {
    class = "^(zenity)$",
  },
  float = true,
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
  },
  workspace = "10",
  fullscreen = true,
})

hl.window_rule({
  name = "steam-proton-wayland",
  match = {
		xdg_tag = "proton-game"
  },
  workspace = "10",
	no_blur = true,
})
hl.window_rule({
  name = "steam-proton-wayland-titanfall2",
	match = {
		class = "titanfall2.exe",
		title = "Titanfall 2"
	},
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

hl.window_rule({
  name = "pz",
  match = {
    class = "Project Zomboid",
  },
  float = true,
	workspace = "10",
})
