-- [[ Options ]]
-- See :help vim.opt and :help option-list for more details.

-- UI Settings
vim.opt.number = true -- Show absolute line numbers
-- vim.opt.relativenumber = true   -- Uncomment to enable relative line numbers
vim.opt.cursorline = true -- Highlight the current line
vim.opt.signcolumn = 'yes' -- Keep signcolumn visible
vim.opt.scrolloff = 10 -- Keep 10 lines of context above/below cursor

-- Enable mouse support (useful for resizing splits, etc.)
vim.opt.mouse = 'a'

-- Don't show mode in command line (status line already provides this info)
vim.opt.showmode = false

-- Configure how whitespace characters are displayed
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Editing and Formatting
vim.opt.breakindent = true -- Enable break indent for better readability
vim.opt.tabstop = 4 -- Number of spaces per tab
vim.opt.softtabstop = 4 -- Number of spaces per tab while editing
vim.opt.shiftwidth = 4 -- Number of spaces for indentation
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Clipboard
-- Sync clipboard between OS and Neovim (delayed to improve startup time)
-- Remove this setting if you want an independent clipboard.
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Searching
vim.opt.ignorecase = true -- Case-insensitive search...
vim.opt.smartcase = true -- ...unless uppercase is used in the query
vim.opt.inccommand = 'split' -- Show live preview of substitutions

-- Splits and Windows
vim.opt.splitright = true -- Open vertical splits to the right
vim.opt.splitbelow = true -- Open horizontal splits below

-- Performance Tweaks
vim.opt.updatetime = 250 -- Reduce time before swapfile writes (faster UI)
vim.opt.timeoutlen = 300 -- Reduce time for mapped sequence wait time

-- Undo and History
vim.opt.undofile = true -- Enable persistent undo
