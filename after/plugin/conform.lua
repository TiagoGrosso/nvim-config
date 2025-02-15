require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "deno_fmt", "prettier", stop_after_first = true },
		html = { "deno_fmt", "prettier", stop_after_first = true },
		javascript = { "deno_fmt", "prettier", stop_after_first = true },
		typescript = { "deno_fmt", "prettier", stop_after_first = true },
		json = { "deno_fmt", "prettier", stop_after_first = true },
		jsonc = { "deno_fmt", "prettier", stop_after_first = true },
		javascriptreact = { "deno_fmt", "prettier", stop_after_first = true },
		typescriptreact = { "deno_fmt", "prettier", stop_after_first = true },
		markdown = { "deno_fmt", "prettier", stop_after_first = true },
	},
	format_on_save = {
		enabled = true,
		timeout_ms = 2000,
		lsp_fallback = true,
	},
})
