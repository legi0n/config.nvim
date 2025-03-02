-- [[ Keymaps ]]
-- See `:help vim.keymap.set()` for more details.

-- Plugin Management (Lazy.nvim)
vim.keymap.set('n', '<leader>pl', ':Lazy<CR>', { desc = '[P]lugins [L]azy Home' })
vim.keymap.set('n', '<leader>pu', ':Lazy update<CR>', { desc = '[P]lugins [U]pdate' })
vim.keymap.set('n', '<leader>ps', ':Lazy sync<CR>', { desc = '[P]lugins [S]ync' })

-- Mason Plugin Management
vim.keymap.set('n', '<leader>pm', ':Mason<CR>', { desc = '[P]lugins [M]ason Management' })
vim.keymap.set('n', '<leader>pi', ':MasonInstall<CR>', { desc = '[P]lugins [I]nstall Server' })
vim.keymap.set('n', '<leader>pu', ':MasonUpdate<CR>', { desc = '[P]lugins [U]pdate Mason' })

-- Buffer Navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = '[B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = '[B]uffer [P]revious' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = '[B]uffer [D]elete' })

-- Disable Arrow Keys
-- Discourage arrow key movement in normal mode
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')

-- Window Navigation
-- Use CTRL + hjkl to move between split windows
-- See `:help wincmd` for available window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Toggles
vim.keymap.set('n', '<leader>tn', ':set number!<CR>', { desc = '[T]oggle [N]umber' })
vim.keymap.set('n', '<leader>tr', ':set relativenumber!<CR>', { desc = '[T]oggle [R]elative Number' })

-- Terminal Mode
-- Easier way to exit terminal mode (alternative to <C-\><C-n>)
-- NOTE: May not work in all terminal emulators or tmux setups.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- File Explorer (Netrw)
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = 'Open Netrw file explorer' })

-- Search and Highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
