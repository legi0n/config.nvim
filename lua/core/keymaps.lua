-- [[ Keymaps ]]
-- See `:help vim.keymap.set()` for more details.

-- File Explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open Netrw file explorer' })

-- Search and Highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Terminal Mode
-- Easier way to exit terminal mode (alternative to <C-\><C-n>)
-- NOTE: May not work in all terminal emulators or tmux setups.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window Navigation
-- Use CTRL + hjkl to move between split windows
-- See `:help wincmd` for available window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Disable Arrow Keys
-- Discourage arrow key movement in normal mode
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
