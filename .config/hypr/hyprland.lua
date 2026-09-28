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

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & hypridle & hyprsysteminfo & hyprpaper & hyprpm reload")
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
hl.env("XCURSOR_THEME", "HyprBibataModernClassicSVG")
hl.env("XCURSOR_SIZE", "24")

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

	plugin = {
		-- hyprbars = {
		-- 	bar_height = 25,
		-- 	on_double_click = "hyprctl dispatch fullscreen 1",
		-- 	bar_color = "#181616",
		--
		-- 	col = {
		-- 		text = "#76946A",
		-- 	},
		-- },
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -1,
})

hl.window_rule({
	match = { title = "nmrs.tui" },
	float = true,
	size = "1200 800",
	center = true,
})
hl.layer_rule({
	name = "no-anim-for-selection",
	match = { namespace = "selection" },
	no_anim = true,
})

-- require("plugins")
