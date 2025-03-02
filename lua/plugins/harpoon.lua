-- https://github.com/ThePrimeagen/harpoon

return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2', -- Use the latest v2 branch
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Required dependency
    config = function()
        local harpoon = require 'harpoon'

        harpoon.setup {}

        -- Keybindings
        vim.keymap.set('n', '<leader>ha', function()
            harpoon:list():add()
        end, { desc = '[H]arpoon [A]dd file' })

        vim.keymap.set('n', '<leader>hm', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = '[H]arpoon [M]enu' })

        vim.keymap.set('n', '<leader>hn', function()
            harpoon:list():next()
        end, { desc = '[H]arpoon [N]ext file' })

        vim.keymap.set('n', '<leader>hp', function()
            harpoon:list():prev()
        end, { desc = '[H]arpoon [P]revious file' })

        vim.keymap.set('n', '<leader>hr', function()
            harpoon:list():remove()
        end, { desc = '[H]arpoon [R]emove file' })
    end,
}
