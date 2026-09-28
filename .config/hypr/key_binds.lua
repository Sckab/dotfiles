local calc =
	"rofi -show calc -modi calc -no-show-match -no-sort -theme ~/.config/rofi/calc-theme.rasi"
local terminal = "ghostty"
local file_manager = "dolphin"
local menu = "rofi -show drun"
local code_editor = "ghostty -e nvim"
local emoji_picker = "rofi -modi emoji -show emoji -emoji-format '{emoji} - {name}'"

hl.bind("print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SUPER + print", hl.dsp.exec_cmd("hyprshot -m output"))

hl.bind("ALT + space", hl.dsp.exec_cmd(calc))
hl.bind("SUPER + SHIFT + l", hl.dsp.exec_cmd("hyprlock"))

hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + s", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + s", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + CTRL + h", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + CTRL + j", hl.dsp.exec_cmd("~/.config/scripts/go_first_workspace.sh"))
hl.bind("SUPER + CTRL + k", hl.dsp.exec_cmd("~/.config/scripts/go_last_workspace.sh"))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl s 10%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl s 10%-"),
	{ locked = true, repeating = true }
)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + C", hl.dsp.window.kill())
hl.bind("SUPER + G", hl.dsp.exec_cmd("gthumb"))
hl.bind("SUPER + plus", hl.dsp.exec_cmd("~/.config/scripts/calc-launcher.sh"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + w", hl.dsp.exec_cmd(emoji_picker))
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd("ghostty -e btop"))
hl.bind("SUPER + CTRL + N", hl.dsp.exec_cmd("ghostty --title=nmrs-tui -e 'nmrs-tui'"))
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
