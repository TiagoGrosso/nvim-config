-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    -- Finder
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    -- Theme
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.cmd("colorscheme catppuccin")
        end,
    })
    -- Syntax highlighting and others
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    -- Undo history
    use("mbbill/undotree")
    -- Git stuff
    use("tpope/vim-fugitive")
    -- Easier LSP interactions
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },

            -- Utils
            { "j-hui/fidget.nvim" },
        },
    })
    -- aka null-ls -> use LSP for more functionality like diagnostics
    use("nvimtools/none-ls.nvim")
    -- lsp-zero <-> null-ls bridge
    use("jay-babu/mason-null-ls.nvim")
    -- Test framework
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rcasia/neotest-java",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-jest",
        },
    })
    -- Surround stuff
    use("tpope/vim-surround")
    -- Help commenting out stuff
    use("tpope/vim-commentary")
    -- Highlight yanked text
    use("machakann/vim-highlightedyank")
    -- Git gutter and other sings
    use("lewis6991/gitsigns.nvim")
    -- UI Component Library
    use("MunifTanjim/nui.nvim")
    -- Popup command line
    use("VonHeikemen/fine-cmdline.nvim")
    -- Notiication API
    use("rcarriga/nvim-notify")
    -- File Explorer
    use("nvim-tree/nvim-tree.lua")
    -- Extra icons
    use("nvim-tree/nvim-web-devicons")
    -- Auto close parenthesis, etc
    use("cohama/lexima.vim")
    -- Tabs
    use("romgrk/barbar.nvim")
    -- Persist session on exit
    use("folke/persistence.nvim")
    -- Debug
    use("jay-babu/mason-nvim-dap.nvim")
    use({
        "mfussenegger/nvim-dap",
        requires = {
            { "nvim-neotest/nvim-nio" },
            { "rcarriga/nvim-dap-ui" },
            { "mxsdev/nvim-dap-vscode-js" },
        },
    })
end)
