require("telescope").setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
        },
    },
}

-- Load the installed extensions (FZF and UI Select)
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- Telescope built-in picker keymaps
local builtin = require "telescope.builtin"

-- Set up key mappings for various search actions
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", function()
    local is_git_repo = vim.fn.system "git rev-parse --is-inside-work-tree 2>/dev/null" == "true\n"
    if is_git_repo then
        builtin.git_files()
    else
        print "Not inside a Git repository"
    end
end, { desc = "[F]ind [G]it Files" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent Files" })
vim.keymap.set("n", "<leader>fG", builtin.live_grep, { desc = "[F]ind with [G]rep" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord under cursor" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp tags" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]ind [T]elescope commands" })
vim.keymap.set("n", "<leader>fp", builtin.resume, { desc = "[F]ind [P]revious search (Resume)" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })

-- Fuzzy search in the current buffer with a customized theme
vim.keymap.set("n", "<leader>fs", function()
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = "[F]uzzy search in current [S]ession (buffer)" })

-- Search live grep in open files
vim.keymap.set("n", "<leader>fo", function()
    builtin.live_grep {
        grep_open_files = true,
        prompt_title = "Find in [O]pen Files",
    }
end, { desc = "[F]ind in [O]pen files" })

-- Shortcut for searching Neovim configuration files
vim.keymap.set("n", "<leader>fn", function()
    builtin.find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "[F]ind [N]eovim config files" })
