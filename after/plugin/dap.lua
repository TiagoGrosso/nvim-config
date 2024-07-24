local dap = require("dap")
local dapui = require("dapui")

-- Add listeners to automatically open and close dapui
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end

require("mason-nvim-dap").setup({
    ensure_installed = { "js" },
})

require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "8123",
    executable = {
        command = "node",
        args = { "/home/tiagogrosso/.local/share/nvim/mason/bin/js_debug_adapter", "${port}" },
    },
}
-- add configuration for typescript and javascript
for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
        {
            request = "attach",
            name = "Deno attach",
            type = "pwa-node",
            sourceMaps = true,
            cwd = "${workspaceFolder}/src",
        },
        {
            request = "launch",
            name = "Deno launch",
            type = "pwa-node",
            program = "${file}",
            cwd = "${workspaceFolder}/src",
            runtimeExecutable = "/home/linuxbrew/.linuxbrew/bin/deno",
            runtimeArgs = { "run", "-A", "--inspect-wait" },
            attachSimplePort = 9229,
        },
        {
            request = "launch",
            name = "Deno test launch",
            type = "pwa-node",
            program = "${file}",
            cwd = "${workspaceFolder}/src",
            runtimeExecutable = "/home/linuxbrew/.linuxbrew/bin/deno",
            runtimeArgs = { "test", "-A", "--inspect-wait" },
            attachSimplePort = 9229,
        },
    }
end

-- mappings
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>do", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>dt", dap.terminate)
