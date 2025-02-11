-- https://github.com/nvim-telescope/telescope.nvim

return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter', -- Trigger when Neovim starts up
    branch = '0.1.x', -- Use a specific branch for stability
    dependencies = {
        'nvim-lua/plenary.nvim', -- Required dependency for Telescope

        -- Telescope FZF Native for faster searching (only install if 'make' is available)
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make', -- Build step required for FZF native
            cond = function()
                return vim.fn.executable 'make' == 1 -- Only load if 'make' is available
            end,
        },

        -- Telescope UI Select for a better selection UI
        { 'nvim-telescope/telescope-ui-select.nvim' },

        -- Required for prettier icons, only enable if Nerd Font is available
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
        -- Set up Telescope configuration
        require('telescope').setup {
            extensions = {
                ['ui-select'] = {
                    -- Use a dropdown theme for the UI Select extension
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        -- Load the installed extensions (FZF and UI Select)
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        -- Telescope built-in picker keymaps
        local builtin = require 'telescope.builtin'

        -- Set up key mappings for various search actions
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

        -- Fuzzy search in the current buffer with a customized theme
        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10, -- Transparent window
                previewer = false, -- Disable the preview
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- Search live grep in open files
        vim.keymap.set('n', '<leader>s/', function()
            builtin.live_grep {
                grep_open_files = true, -- Limit to open files
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = '[S]earch [/] in Open Files' })

        -- Shortcut for searching Neovim configuration files
        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
    end,
}
