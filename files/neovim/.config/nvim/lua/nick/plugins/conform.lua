local function get_black_command()
	local venv_black = vim.fn.findfile(".venv/bin/black", ".;")
	if venv_black ~= "" then
		return venv_black
	end
	return "black"
end

require("conform").setup({
	formatters_by_ft = {
		sh = { "shfmt" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		lua = { "stylua" },
		cucumber = { "reformat-gherkin" },
		json = { "prettier" },
		markdown = { "prettier" },
		css = { "css_lsp" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters = {
		shfmt = {
			append_args = { "--indent", "2" },
		},
		black = {
			command = get_black_command,
		},
	},
})
