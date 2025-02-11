-- https://github.com/folke/which-key.nvim

return {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Trigger when Neovim starts up
    opts = {
        -- Delay between pressing a key and opening which-key (in milliseconds)
        -- This setting is independent of vim.opt.timeoutlen
        delay = 0,

        -- Icons for keybindings. Set to true if you have a Nerd Font installed
        icons = {
            -- Enable mappings icons if Nerd Font is available
            mappings = vim.g.have_nerd_font,

            -- If you have a Nerd Font, you can set icons for keys
            -- Otherwise, we define a fallback string table for key symbols
            keys = vim.g.have_nerd_font and {} or {
                Up = '<Up> ',
                Down = '<Down> ',
                Left = '<Left> ',
                Right = '<Right> ',
                C = '<C-…> ',
                M = '<M-…> ',
                D = '<D-…> ',
                S = '<S-…> ',
                CR = '<CR> ',
                Esc = '<Esc> ',
                ScrollWheelDown = '<ScrollWheelDown> ',
                ScrollWheelUp = '<ScrollWheelUp> ',
                NL = '<NL> ',
                BS = '<BS> ',
                Space = '<Space> ',
                Tab = '<Tab> ',
                F1 = '<F1>',
                F2 = '<F2>',
                F3 = '<F3>',
                F4 = '<F4>',
                F5 = '<F5>',
                F6 = '<F6>',
                F7 = '<F7>',
                F8 = '<F8>',
                F9 = '<F9>',
                F10 = '<F10>',
                F11 = '<F11>',
                F12 = '<F12>',
            },
        },

        -- Document existing key chains with custom groups and commands
        -- You can define your own key groups and document them for quick access
        spec = {
            { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } }, -- Code-related keybindings
            { '<leader>d', group = '[D]ocument' }, -- Document-related keybindings
            { '<leader>r', group = '[R]ename' }, -- Rename keybindings
            { '<leader>s', group = '[S]earch' }, -- Search keybindings
            { '<leader>w', group = '[W]orkspace' }, -- Workspace keybindings
            { '<leader>t', group = '[T]oggle' }, -- Toggle-related keybindings
            { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Git-related keybindings
        },
    },
}
