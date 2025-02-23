-- [[ legi0n's Neovim config ]]
-- Inspired by kickstart.nvim.
-- See: https://github.com/nvim-lua/kickstart.nvim

-- Leader Key Configuration
-- Must be set before loading any plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Font Configuration
vim.g.have_nerd_font = true -- Set to true if using a Nerd Font

-- Load Core Settings
require 'core.options' -- Load options.lua
require 'core.keymaps' -- Load keymaps.lua

-- Plugins
-- To check the current status of your plugins, run :Lazy
-- You can press `?` in the menu for help. Use `:q` to close the window
-- To update plugins, run :Lazy update

-- Install `lazy.nvim` (Plugin Manager)
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins with a link (or a github repo: 'owner/repo' link).
require('lazy').setup {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    'mg979/vim-visual-multi', -- Enable multi-cursor support for simultaneous editing of multiple locations in your file.
    {
        'folke/tokyonight.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        init = function()
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
            vim.cmd.colorscheme 'tokyonight-night'

            -- You can configure highlights by doing something like:
            vim.cmd.hi 'Comment gui=none'
        end,
    },
    {
        'folke/todo-comments.nvim', -- Highlight todo, notes, etc in comments
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    require 'plugins.cmp',
    require 'plugins.conform',
    require 'plugins.lspconfig',
    require 'plugins.mini',
    require 'plugins.neo-tree',
    require 'plugins.telescope',
    require 'plugins.treesitter',
    require 'plugins.which-key',
}

-- Modeline
-- See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
