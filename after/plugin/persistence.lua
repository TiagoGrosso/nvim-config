require("persistence").setup({
	options = {
		"globals",
	},
	pre_save = function()
		vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
	end,
})

-- Restore session on start
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
	callback = function()
		if vim.fn.getcwd() ~= vim.env.HOME then
			require("persistence").load()
		end
	end,
	nested = true,
})
