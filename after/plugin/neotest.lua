require("neotest").setup({
	adapters = {
		require("neotest-vitest"),
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			cwd = function(_)
				return vim.fn.getcwd()
			end,
		}),
	},
})
