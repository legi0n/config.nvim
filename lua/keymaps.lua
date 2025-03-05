-- [[ Global Keymaps ]]
-- See `:help vim.keymap.set()` for more details.

-- Plugin Management (Lazy.nvim)
vim.keymap.set("n", "<leader>ph", ":Lazy<CR>", { desc = "[P]lugins [H]ome" })
vim.keymap.set("n", "<leader>pu", ":Lazy update<CR>", { desc = "[P]lugins [U]pdate" })
vim.keymap.set("n", "<leader>ps", ":Lazy sync<CR>", { desc = "[P]lugins [S]ync" })

-- Mason Management
vim.keymap.set("n", "<leader>pmh", ":Mason<CR>", { desc = "[P]lugins [M]ason [H]ome" })
vim.keymap.set("n", "<leader>pmi", ":MasonInstall<CR>", { desc = "[P]lugins [M]ason [I]nstall" })
vim.keymap.set("n", "<leader>pmu", ":MasonUpdate<CR>", { desc = "[P]lugins [M]ason [U]pdate" })

-- Buffer Navigation
vim.keymap.set("n", "<leader>be", ":Ex<CR>", { desc = "[B]uffer [E]xplorer (Netrw)" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "[B]uffer [P]revious" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "[B]uffer [D]elete" })

-- Window Navigation
-- Use CTRL + hjkl to move between split windows
-- See `:help wincmd` for available window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Toggles
vim.keymap.set("n", "<leader>tr", ":set relativenumber!<CR>", { desc = "[T]oggle [R]elative Number" })

-- Terminal Mode
-- Easier way to exit terminal mode (alternative to <C-\><C-n>)
-- NOTE: May not work in all terminal emulators or tmux setups.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Search and Highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Disable Arrow Keys
-- Discourage arrow key movement in normal mode
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
