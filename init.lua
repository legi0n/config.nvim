-- [[ Neovim config ]]

-- Leader Key Configuration
-- Must be set before loading any plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Font Configuration
vim.g.have_nerd_font = true -- Set to true if using a Nerd Font

-- Core Configuration
require "options"
require "keymaps"

-- Plugins
-- To check the current status of your plugins, run :Lazy
-- You can press `?` in the menu for help. Use `:q` to close the window
-- To update plugins, run :Lazy update

-- Install `lazy.nvim` (Plugin Manager)
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Load Plugins
require("lazy").setup { { import = "plugins" } }
