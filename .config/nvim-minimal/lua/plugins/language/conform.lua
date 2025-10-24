return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
			},
			formatter_bin_paths = { vim.fn.stdpath("data") .. "/mason/bin" },
			formatters_opts = {
				stylua = {
					column_width = 80,
					indent_width = 4,
					break_table_items = true,
				},
			},
		})

		local function format()
			conform.format({ async = true, lsp_format = "fallback" })
		end

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = format,
			desc = "Format before save",
		})

		vim.api.nvim_create_autocmd("TextChanged", {
			callback = function()
				if vim.v.event and vim.v.event.operator == "put" then
					format()
				end
			end,
			desc = "Format on paste",
		})
	end,
}
