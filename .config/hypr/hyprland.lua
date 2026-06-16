require("animations")
require("key_binds")

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@144",
	position = "auto",
	scale = 1,
})
hl.monitor({
	output = "HDMI-A-2",
	mode = "1920x1080@100",
	position = "0x-410,1",
	scale = 1,
	transform = 1,
})

local terminal = "ghostty"
local file_manager = "dolphin"
local menu = "rofi -show drun"
local code_editor = "ghostty -e nvim"
local emoji_picker = "rofi -modi emoji -show emoji -emoji-format '{emoji} - {name}'"

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & swaync & hypridle & hyprsysteminfo & hyprpaper")
	hl.exec_cmd(
		"hyprswitch init --show-title --size-factor 4.5 --workspaces-per-row 6 --custom-css ~/.config/hyprswitch/style.css"
	)
	hl.exec_cmd("hyprshell run")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("~/.config/scripts/rgb-start.sh")
	hl.exec_cmd("~/.config/scripts/fix-clock.sh")
	hl.exec_cmd("~/.watch-zshrc.sh")
end)

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("HYPRCURSOR_THEME", "HyprBibataModernClassicSVG")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 2,

		col = {
			active_border = "rgb(76946a)",
			inactive_border = "rgb(181616)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 15,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		blur = {
			enabled = true,
			size = 16,
			passes = 4,
			new_optimizations = true,
			ignore_opacity = false,
			xray = true,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	input = {
		kb_layout = "it",
		kb_variant = "",
		kb_model = "",
		kb_options = "compose:rctrl",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = -0.8,
	},

	cursor = {
		default_monitor = "HDMI-A-1",
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -1,
})

hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + C", hl.dsp.window.kill())
hl.bind("SUPER + G", hl.dsp.exec_cmd("gthumb"))
hl.bind("SUPER + plus", hl.dsp.exec_cmd("~/.config/scripts/calc-launcher.sh"))
hl.bind("SUPER + F", hl.dsp.exec_cmd("~/.config/scripts/toggle_fullscreen.sh"))
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + w", hl.dsp.exec_cmd(emoji_picker))
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd("ghostty -e btop"))
hl.bind("SUPER + CTRL + E", hl.dsp.exec_cmd("emacs"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("steam"))
hl.bind("SUPER + CTRL + D", hl.dsp.exec_cmd("discord"))
hl.bind("SUPER + CTRL + Z", hl.dsp.exec_cmd("chromium"))
hl.bind("SUPER + CTRL + F", hl.dsp.window.float())
hl.bind("SUPER + CTRL + V", hl.dsp.exec_cmd(code_editor))
hl.bind("SUPER + CTRL + A", hl.dsp.exec_cmd("/opt/Aonsoku/aonsoku"))
hl.bind("SUPER + CTRL + P", hl.dsp.exec_cmd("~/.config/scripts/powershell.sh"))
hl.bind("SUPER + CTRL + M", hl.dsp.exec_cmd("~/.config/virt-manager-launcher.sh &"))
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("hyprswitch gui --mod-key super_l --key tab"))
