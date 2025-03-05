return {
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
            Up = "<Up> ",
            Down = "<Down> ",
            Left = "<Left> ",
            Right = "<Right> ",
            C = "<C-…> ",
            M = "<M-…> ",
            D = "<D-…> ",
            S = "<S-…> ",
            CR = "<CR> ",
            Esc = "<Esc> ",
            ScrollWheelDown = "<ScrollWheelDown> ",
            ScrollWheelUp = "<ScrollWheelUp> ",
            NL = "<NL> ",
            BS = "<BS> ",
            Space = "<Space> ",
            Tab = "<Tab> ",
            F1 = "<F1>",
            F2 = "<F2>",
            F3 = "<F3>",
            F4 = "<F4>",
            F5 = "<F5>",
            F6 = "<F6>",
            F7 = "<F7>",
            F8 = "<F8>",
            F9 = "<F9>",
            F10 = "<F10>",
            F11 = "<F11>",
            F12 = "<F12>",
        },
    },

    -- Document existing key chains with custom groups and commands
    -- You can define your own key groups and document them for quick access
    spec = {
        { "<leader>b", group = "[B]uffer" },
        { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
        { "<leader>d", group = "[D]ebug" },
        { "<leader>f", group = "[F]ind" },
        { "<leader>g", group = "[G]it", mode = { "n", "v" } },
        { "<leader>h", group = "[H]arpoon" },
        { "<leader>l", group = "[L]SP" },
        { "<leader>p", group = "[P]lugin Manager (Lazy)" },
        { "<leader>t", group = "[T]oggle" },
    },
}
