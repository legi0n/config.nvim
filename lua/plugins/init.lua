return {
    {
        "folke/tokyonight.nvim",
        priority = 1000, -- Ensure this loads before all other startup plugins
        init = function()
            vim.cmd.colorscheme "tokyonight-night"
            vim.cmd.hi "Comment gui=none"
        end,
    },
    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    { "williamboman/mason.nvim", opts = {} },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "hrsh7th/cmp-nvim-lsp",
            { "j-hui/fidget.nvim", opts = {} },
        },
        config = function()
            require "plugins.config.lspconfig"
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- Load when entering Insert mode
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                build = function()
                    if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
                        return
                    end
                    return "make install_jsregexp"
                end,
                dependencies = {
                    {
                        "rafamadriz/friendly-snippets",
                        config = function()
                            require("luasnip.loaders.from_vscode").lazy_load()
                        end,
                    },
                },
            },
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            require "plugins.config.cmp"
        end,
    },
    {
        "stevearc/conform.nvim",
        dependencies = { "williamboman/mason.nvim" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format { async = true, lsp_format = "fallback" }
                end,
                mode = { "n", "v" },
                desc = "[C]ode [F]ormat",
            },
        },
        opts = function()
            return require "plugins.config.conform"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Runs :TSUpdate to install or update parsers
        main = "nvim-treesitter.configs", -- Sets main module to use for options
        opts = function()
            return require "plugins.config.treesitter"
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui", -- UI for DAP
            "nvim-neotest/nvim-nio", -- Neotest integration
            "williamboman/mason.nvim", -- For managing installations
            "jay-babu/mason-nvim-dap.nvim", -- DAP integration with Mason
        },
        config = function()
            require "plugins.config.dap"
        end,
    },
    { -- Automatically add closing tags for HTML and JSX
        "windwp/nvim-ts-autotag",
        opts = {},
    },
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.move").setup() -- Move any selection in any direction
            local statusline = require "mini.statusline"
            statusline.setup { use_icons = vim.g.have_nerd_font }
            statusline.section_location = function()
                return "%2l:%-2v"
            end
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x", -- Use a specific branch for stability
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        config = function()
            require "plugins.config.telescope"
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2", -- Use the latest v2 branch
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require "plugins.config.harpoon"
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        cmd = "Neotree",
        keys = {
            { "<leader>tt", ":Neotree toggle<CR>", desc = "[T]oggle Neo[T]ree", silent = true },
        },
        opts = {
            close_if_last_window = true,
        },
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>tu", vim.cmd.UndotreeToggle, desc = "[T]oggle [U]ndotree", silent = true },
        },
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1 -- Auto-focus undotree window
        end,
    },
    "tpope/vim-fugitive", -- A Git wrapper so awesome, it should be illegall
    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            return require "plugins.config.gitsigns"
        end,
    },
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "mg979/vim-visual-multi", -- Multi-cursor support
    { "numToStr/Comment.nvim", opts = {} }, -- Better comments
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        opts = function()
            return require "plugins.config.whichkey"
        end,
    },
}
