return {
	{
		"saghen/blink.cmp",

		version = "1.*",

		build = "cargo build --release",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "super-tab" },

			signature = { enabled = true },

			appearance = {
				nerd_font_variant = "normal",
			},

			cmdline = {
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true } },
			},

			completion = {
				menu = {
					draw = {
						columns = {
							{ "kind_icon", "label" },
							{ "kind" },
						},
					},
				},

				documentation = {
					auto_show = true,
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
