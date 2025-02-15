local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "<leader>E", function()
		vim.diagnostic.goto_prev()
	end, opts)
end)

local cmp_lsp = require("cmp_nvim_lsp")
local capabilities =
	vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

require("fidget").setup({})
require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"svelte",
		"denols",
		"tailwindcss",
		"html",
		"cssls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		["lua_ls"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
						},
					},
				},
			})
		end,
		["denols"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.denols.setup({
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deno.lock"),
			})
		end,
		["ts_ls"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				root_dir = lspconfig.util.root_pattern("package.json"),
				single_file_support = false,
			})
		end,
	},
})

-- tailwind-tools sets up the tailwind lsp, so don't put in above
require("tailwind-tools").setup({
	-- your configuration
})
