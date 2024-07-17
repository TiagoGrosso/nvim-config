

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use ({
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    })
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},

            -- Utils
            {'j-hui/fidget.nvim'},
        }
    }
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            'rcasia/neotest-java',
            'marilari88/neotest-vitest',
            'nvim-neotest/neotest-jest'
        }
    }
    use('tpope/vim-surround')
    use('tpope/vim-commentary')
    use('machakann/vim-highlightedyank')
    use('airblade/vim-gitgutter')
    use('MunifTanjim/nui.nvim')
    use('VonHeikemen/fine-cmdline.nvim')

end)
