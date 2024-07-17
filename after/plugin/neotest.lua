require("neotest").setup({
    adapters = {
        require("neotest-java")({
            ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
            junit_jar = nil,
            -- default: .local/share/nvim/neotest-java/junit-platform-console-standalone-[version].jar
        }),
        require("neotest-vitest"),
        require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(_)
                return vim.fn.getcwd()
            end,
        }),
    }
})
