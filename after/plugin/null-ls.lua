local null_ls = require("null-ls")

null_ls.setup({
	sources = {},
})

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq", "prettierd", "google-java-format" },
	handlers = {},
})
